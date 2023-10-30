(
// Load samples
thisProcess.platform.recordingsDir = thisProcess.nowExecutingPath.dirname;
~surdo = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "surdo.wav");
~tamborim_hi = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "tamborim_hi.wav");
~tamborim_low = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "tamborim_low.wav");
~pandeiro_1 = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "pandeiro_hard.wav");
~pandeiro_2 = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "pandeiro_jiggle.wav");

// Set BPM
~bpm = 85;
~clock = TempoClock(~bpm/60.0);


/*
   ___    _   _    ___     ___     ___
  / __|  | | | |  | _ \   |   \   / _ \
  \__ \  | |_| |  |   /   | |) | | (_) |
  |___/   \___/   |_|_\   |___/   \___/
_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
*/

// Surdo SynthDef
SynthDef(\surdo, { |out = 0, pitch = 0, amp = 0.5|
	var bufnum = Select.kr(pitch, [~surdo]);
    var sig = PlayBuf.ar(2, bufnum, loop: 0) * amp;
    Out.ar(out, sig);
}).add;

// Surdo Pattern 1
Pdef(\surdo_pattern, Pbind(
    \instrument, \surdo,
	\pitch, Pseq([0], 1),
    \dur, 0.25
));

//Surdo Markov Chain Logic
~surdo_state_space = [\play,\rest];
~surdo_start_state = \play;
~surdo_transition_model = Dictionary.newFrom(List[\play, [0, 1], \rest, [1, 0]]);
~surdo_sequence = List[~surdo_start_state];
50.do {|i|
	~surdo_sequence.add(~surdo_state_space.wchoose(~surdo_transition_model[~surdo_sequence[i]]));
};

// "Surdo sequence = ".postln ++ ~surdo_sequence;
// ~convert = Dictionary.newFrom(List[\play, \surdo_pattern]);
r = Routine({
	~melody.do({|item|
		if (item == \play) {
			Synth(\surdo);  // Play the Surdo sound
		};
		1.wait;  // Wait for half a beat
	})
});

r.play(~clock);

)


(
// Define an ellipse function
f = { |a, b, t| a * b / sqrt((b*cos(t))**2 + (a*sin(t))**2) };

// Parameters for the ellipse
a = 1;  // semi-major axis
b = 0.25;  // semi-minor axis

// Generate a sequence of t values from 0 to 2pi
~t_values = (0, 0.1 .. 2 * pi);

// Compute durations based on the ellipse function
~durations = ~t_values.collect { |t| f.value(a, b, t) };

// Normalize durations to make the effect subtle
~baseDuration = 0.2;
~scaleFactor = 0.05;
~normalizedDurations = ~durations.collect { |dur| ~baseDuration + dur*~scaleFactor };



Pbind(
    \instrument, \default,
    \dur, Pseq(~normalizedDurations, inf),  // Using normalized durations
    \amp, 0.8,
    \freq, Pseq([440, 660, 880, 660], inf)
).play;


~ellipsize = { | a, b |



// Ellipse function to compute distance from the center
~r_t = { |a = 1, b = 1, t| (a * b) / ((b * cos(t)).squared + (a * sin(t)).squared).sqrt};

// Parameters for the ellipse
~a = 1.25;  // semi-major axis
~b = 1;  // semi-minor axis

~x = 16; // number of subdivisions
~t_values = Array.newClear(~x);
~t_values.value;

~x.do { |i|
	~t_values[i] = ((pi * (i + 1)) / ~x);
};

// Compute distances based on the ellipse function
~distances = ~t_values.collect { |t| ~r_t.value(~a, ~b, t) };
~distances.postln;

~normalized_distances = ~distances.collect { | d | ((d - ~b) / (~a - ~b)) / 5 + 0.9};
~normalized_distances.postln;
}.postln;

~ellipsize.postln;


// Function: ~ellipse_radius
// Returns: the radius of an ellipse with semi-major axis a, semi-minor axis b, at an angle t
// Called by: ~ellipsize
~ellipse_radius = { | a = 1.25, // semi-major axis of the ellipse
	                  b = 1, // semi-minor axis of the ellipse
	                  t | // an angle t in radians
	(a * b) / ((b * cos(t)).squared + (a * sin(t)).squared).sqrt};

// Function: ~ellipsize
// Returns: a list of length x. The values are normalized to be in the range 0.9 to 1.1, and they map to the countour of half of an ellipse
// Called by: any Pbind. Each item of the list is used as a multiplier to the duration of each element in a Pseq. A neat feature of this function is that the mean of output is roughly 1, so the Pbind should stay roughly within the meter.
// This function was incredibly painstaking to work out.
~ellipsize = { | a = 1.25, // semi-major axis of the ellipse
	             b = 1, // semi-minor axis of the ellipse
	             x = 16 | // number of subdivisions in the Pseq
    var t_values = Array.newClear(x);
    var distances, normalized_distances;

    x.do { |i|
		t_values[i] = (((pi * (i + 1)) / x) + (pi / 2));
    };

    // Compute distances based on the ellipse function
    distances = t_values.collect { |t| ~ellipse_radius.value(a, b, t) };
    distances.postln;

    normalized_distances = distances.collect { | d | ((d - b) / (a - b)) / 5 + 0.9 };
    normalized_distances.postln;

    normalized_distances // Returning this as an output of the function
};

~ellipsize.value.postln;  // Execute the function and post the result
~results = ~ellipsize.value;

~total = ~results.sum;
~average = ~results.mean;

~total.postln;  // This will post the total sum of the values
~average.postln;  // This will post the average of the values


/*
  _____    ___   __  __    ___     ___     ___     ___   __  __
 |_   _|  /   \ |  \/  |  | _ )   / _ \   | _ \   |_ _| |  \/  |
   | |    | - | | |\/| |  | _ \  | (_) |  |   /    | |  | |\/| |
  _|_|_   |_|_| |_|__|_|  |___/   \___/   |_|_\   |___| |_|__|_|
_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
*/

// Tamborim SynthDef
SynthDef(\tamborim, { |out = 0, pitch = 0, amp = 0.5|
    var bufnum = Select.kr(pitch, [~tamborim_low, ~tamborim_hi]);
    var sig = PlayBuf.ar(2, bufnum, loop: 0) * amp;
    Out.ar(out, sig);
}).add;

Pdef(\tamborim_p1, {
    var subdivision = 16;
    var duration = 4 / subdivision;
    Pbind(
        \instrument, \tamborim,
        \pitch, Pseq([1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0], 2),
        \dur, ~ellipsize.value(subdivision).collect { |val| duration * val })}).play(~clock);


Pbind(
	var subdivision = 16;
	var duration = 4 / subdivsion;
	\instrument, \tamborim,
	\pitch, Pseq([1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0], 2),
	\dur, ~ellipsize(x = subdivision).value.collect { |val| duration * }).play(~clock);



// Pandeiro SynthDef
SynthDef(\pandeiro, { |out = 0, pitch = 0, amp = 0.5|
    var bufnum = Select.kr(pitch, [~pandeiro_1, ~pandeiro_2]);
    var sig = PlayBuf.ar(2, bufnum, loop: 0) * amp;
    Out.ar(out, sig);
}).add;

// Tamborim Markov Chain setup
~pset_tamborim = [\play1, \play2, \play3, \play4, \rest];
~current_tamborim = \play1;  // Start with play1 state

// Weights for tamborim states
~weights_tamborim = Dictionary.newFrom([
	\play1, [\play2],
	\play2, [\play3],
	\play3, [\play4],
	\play4, [0.5, 0.5], // 50% chance for play1 and 50% for rest
	\rest, [0.75, 0.25]  // 75% rest, 25% play1
]);

// Create a list of tamborim states
~melody_tamborim = List[~current_tamborim];

// Generate tamborim sequence using Markov Chain
50.do {|i|
	~melody_tamborim.add(~pset_tamborim.wchoose(~weights_tamborim[~melody_tamborim[i]]));
};

"Melody Tamborim = ".postln ++ ~melody_tamborim;

// Convert Markov Chain states to musical actions for tamborim
~convert_tamborim = Dictionary.newFrom([
	\play1, \tamborim_pattern,
	\play2, Rest(0.5),
	\play3, Rest(0.5),
	\play4, Rest(0.5),
	\rest, Rest(0.5)
]);

// Create a routine to play the generated Tamborim melody
r_tamborim = Routine({
	~melody_tamborim.do({|item|
		if (item == \play1) {
			Synth(\tamborim, [\pitch, 0]);  // Play the tamborim sound
		};
		0.5.wait;  // Wait for half a beat
	})
});

// Finally, play both routines together
fork {
	r.play;
	r_tamborim.play;
}










