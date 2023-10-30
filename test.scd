MyClass {
    var message;

    // This is the correct constructor syntax
    init { arg msg="Default Message";
        message = msg;
    }

    printMessage {
        "Message: %".format(message).postln;
    }
}


(
var obj = MyClass.new("Hello, SuperCollider!");
obj.printMessage;
)



// Recompile the class library
s.recompile;

// Add the current directory to the include paths
thisProcess.nowExecutingPath.dirname.addToClassPath;

// Recompile the class library
s.recompile;


// Load samples
(
thisProcess.platform.recordingsDir = thisProcess.nowExecutingPath.dirname;
~surdo = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "surdo.wav");
~tamborim_hi = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "tamborim_hi.wav");
~tamborim_low = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "tamborim_low.wav");

surdo = Percussion.new(\surdo, [~surdo]);
tamborim = Percussion.new(\tamborim, [~tamborim_hi, ~tamborim_low]);

// Define patterns for each percussion
surdo.patterns[\basic] = Pbind(
    \instrument, \surdo,
    \pitch, Pseq([0], inf),
    \dur, 0.25
);

tamborim.patterns[\alternating] = Pbind(
    \instrument, \tamborim,
    \pitch, Pseq([0, 1], inf),
    \dur, 0.5
);

// Example of usage
(
surdo.transition_model = Dictionary.newFrom(List[\play, [0, 1], \rest, [1, 0]]);
surdo.generateSequence(50);
surdo.playPattern(\basic);

tamborim.transition_model = Dictionary.newFrom(List[\play, [0.5, 0.5], \rest, [0.5, 0.5]]);
tamborim.generateSequence(50);
tamborim.playPattern(\alternating);
)

