/*
        _   _         _                   _           _              _      _          _
       /\_\/\_\ _    / /\                /\ \        /\_\           /\ \   /\ \    _ / /\
      / / / / //\_\ / /  \              /  \ \      / / /  _       /  \ \  \ \ \  /_/ / /
     /\ \/ \ \/ / // / /\ \            / /\ \ \    / / /  /\_\    / /\ \ \  \ \ \ \___\/
    /  \____\__/ // / /\ \ \          / / /\ \_\  / / /__/ / /   / / /\ \ \ / / /  \ \ \
   / /\/________// / /  \ \ \        / / /_/ / / / /\_____/ /   / / /  \ \_\\ \ \   \_\ \
  / / /\/_// / // / /___/ /\ \      / / /__\/ / / /\_______/   / / /   / / / \ \ \  / / /
 / / /    / / // / /_____/ /\ \    / / /_____/ / / /\ \ \     / / /   / / /   \ \ \/ / /
/ / /    / / // /_________/\ \ \  / / /\ \ \  / / /  \ \ \   / / /___/ / /     \ \ \/ /
\/_/    / / // / /_       __\ \_\/ / /  \ \ \/ / /    \ \ \ / / /____\/ /       \ \  /
        \/_/ \_\___\     /____/_/\/_/    \_\/\/_/      \_\_\\/_________/         \_\/
          _             _       _    _                    _          _
        /\ \           / /\    / /\ / /\                 /\ \       /\ \     _
       /  \ \         / / /   / / // /  \                \ \ \     /  \ \   /\_\
      / /\ \ \       / /_/   / / // / /\ \               /\ \_\   / /\ \ \_/ / /
     / / /\ \ \     / /\ \__/ / // / /\ \ \             / /\/_/  / / /\ \___/ /
    / / /  \ \_\   / /\ \___\/ // / /  \ \ \           / / /    / / /  \/____/
   / / /    \/_/  / / /\/___/ // / /___/ /\ \         / / /    / / /    / / /
  / / /          / / /   / / // / /_____/ /\ \       / / /    / / /    / / /
 / / /________  / / /   / / // /_________/\ \ \  ___/ / /__  / / /    / / /
/ / /_________\/ / /   / / // / /_       __\ \_\/\__\/_/___\/ / /    / / /
\/____________/\/_/    \/_/ \_\___\     /____/_/\/_________/\/_/     \/_/
        _   _         _                _            _             _           _           _
       /\_\/\_\ _    / /\             /\ \         /\ \     _    /\ \        / /\        / /\
      / / / / //\_\ / /  \           /  \ \____   /  \ \   /\_\ /  \ \      / /  \      / /  \
     /\ \/ \ \/ / // / /\ \         / /\ \_____\ / /\ \ \_/ / // /\ \ \    / / /\ \__  / / /\ \__
    /  \____\__/ // / /\ \ \       / / /\/___  // / /\ \___/ // / /\ \_\  / / /\ \___\/ / /\ \___\
   / /\/________// / /  \ \ \     / / /   / / // / /  \/____// /_/_ \/_/  \ \ \ \/___/\ \ \ \/___/
  / / /\/_// / // / /___/ /\ \   / / /   / / // / /    / / // /____/\      \ \ \       \ \ \
 / / /    / / // / /_____/ /\ \ / / /   / / // / /    / / // /\____\/  _    \ \ \  _    \ \ \
/ / /    / / // /_________/\ \ \\ \ \__/ / // / /    / / // / /______ /_/\__/ / / /_/\__/ / /
\/_/    / / // / /_       __\ \_\\ \___\/ // / /    / / // / /_______\\ \/___/ /  \ \/___/ /
        \/_/ \_\___\     /____/_/ \/_____/ \/_/     \/_/ \/__________/ \_____\/    \_____\/


Markov Chain Madness.
Assignment 4, Option 1b; CPSC 431 at Yale University.
By Leonardo von Mutius.


This file contains the executable code to generate an experimental, stochastic composition entitled "Markov Chain Madness a la Mutius." Evaluating the block below will generate 3 sections: first, a straight-time percussion groove; then, an elliptical-time percussion groove; then, an elliptical-time percussion groove with a harmony layer.

The SynthDefs I used here were inspired by Brazilian samba music. The .wav files needed to execute this file are located in the same directory as the current file (MarkovChainMadness.scd) and were obtained from Splice. The SynthDefs are \surdo, \tamborim, \pandeiro, \cuica, \apito, \chocalho.

*/


/*

  ___          _           _         ___ _         _
 | __|_ ____ _| |_  _ __ _| |_ ___  | _ ) |___  __| |__
 | _|\ V / _` | | || / _` |  _/ -_) | _ \ / _ \/ _| / /
 |___|\_/\__,_|_|\_,_\__,_|\__\___| |___/_\___/\__|_\_\
  ___      _            _
 | _ ) ___| |_____ __ _| |
 | _ \/ -_) / _ \ V  V /_|
 |___/\___|_\___/\_/\_/(_)


(EVALUATE THE BLOCK BELOW TO RUN THE PROGRAM.)

*/

(
// Boot the server
// s.boot;

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

,------.,--.   ,--.   ,--.,------. ,--------.,--. ,-----.  ,---.  ,--.
|  .---'|  |   |  |   |  ||  .--. ''--.  .--'|  |'  .--./ /  O  \ |  |
|  `--, |  |   |  |   |  ||  '--' |   |  |   |  ||  |    |  .-.  ||  |
|  `---.|  '--.|  '--.|  ||  | --'    |  |   |  |'  '--'\|  | |  ||  '--.
`------'`-----'`-----'`--'`--'        `--'   `--' `-----'`--' `--'`-----'
                                 ,---.
,--------.,--.,--.   ,--.,------.|   |
'--.  .--'|  ||   `.'   ||  .---'|  .'
   |  |   |  ||  |'.'|  ||  `--, |  |
   |  |   |  ||  |   |  ||  `---.`--'
   `--'   `--'`--'   `--'`------'.--.
                                 '--'

This secti of the project contains the functions, variables, and logic used to "ellipticalize" certain musical parameters. Ellipticalization is used to control _____ In section 2, for each instrument, we generate a rhythmic sequence whose parameters are shaped by an ellipse (e.g. the )

I originally attempted to implement this (as well as the instruments) as classes, but it appeared to be far too difficult and not very portable to do so in SC3.

In retrospect, I am certain there is a far more natural (and far, far easier) way to achieve this effect in SC3 by multiplying SinOsc's together (or other wave shapes) and using the result as a control rate for various parameters. However, this was a fun learning experience, and I'm happy with the result!

*/

// Function: ~ellipse_radius, an implementation of the polar equation of an ellipse.
// Returns: the distance from the center of an ellipse to its boundary at angle t (the radius at angle t). The ellipse has semi-major axis a, and semi-minor axis b.
// Called by: ~ellipticalize
~ellipse_radius = {
	| a = 1.25, // semi-major axis of the ellipse
	b = 1, // semi-minor axis of the ellipse
	t | // an angle t in radians
	(a * b) / ((b * cos(t)).squared + (a * sin(t)).squared).sqrt};

// Function: ~ellipticalize
// Returns: a list of length x. The values are normalized to be within a range of size k (between 1 - k/2 and 1 + k/2). When plotted, the values form the countour of a semi-ellipse (i.e. one half of an ellipse).

// Called by: any Pbind. Each item of the list is used as a multiplier for a parameter in a Pseq (e.g duration or amplitude). A neat feature of this function is that the mean of output approaches 1 as a approaches b, so the ellipticalization shouldn't diverge too far off from when the difference between a and b is small.

// This function was incredibly painstaking to work out.

~ellipticalize = {
	| a = 1.25, // semi-major axis of the ellipse
	b = 1, // semi-minor axis of the ellipse
	n = 16, // number of items (e.g. subdivisions) in the Pseq
	k = 0.5, // normalization range
	concave_up = true | // the output (a semi-ellipse) is concave up if true, & concave down if false

	// Initialization
    var distances, normalized_distances;
	var t_values = Array.newClear(n); // an array that will be populated by n t-values (angles), which will be used to calculate radii
	var divisor = 1 / k; // Variables used in normalization
	var vertical_transformation = (1 - (k / 2)); // Variables used in normalization


	// Logic for orienting the semi-ellipse as concave up vs concave down
	if(concave_up, {
		n.do { |i|
			t_values[i] = (((pi * (i + 1)) / n) );
		};
	}, {
		n.do { |i|
			t_values[i] = (((pi * (i + 1)) / n) + (pi / 2));
		};
	});

    // Compute distances from the center to edge of the ellipse, along the range of t
    distances = t_values.collect { |t| ~ellipse_radius.value(a, b, t) };

	// Print statement for debugging
	// distances.postln;

    normalized_distances = distances.collect { | d | ((d - b) / (a - b)) / divisor + vertical_transformation };
	// Print statement for debugging
	// normalized_distances.postln;

	// The output
    normalized_distances;
};

// Testing
~ellipticalize.value;  // Execute the function and post the result
~ellipticalize.value(a: 1.5, concave_up: false);
// ~ellipticalize.value(a: 5);
// ~results = ~ellipticalize.value;
// ~total = ~results.sum;
// ~average = ~results.mean;
// ~total.postln;
// ~average.postln;


/*
   ___    _   _    ___     ___     ___
  / __|  | | | |  | _ \   |   \   / _ \
  \__ \  | |_| |  |   /   | |) | | (_) |
  |___/   \___/   |_|_\   |___/   \___/
_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'

The surdo is the only instrument whose parameters are neither stochastic nor ellipticalized. It will always play on 1 and 3.

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

//Surdo Markov Chain Logic (not really stochastic, just implemented as such for consistency)
~surdo_state_space = [\play,\rest];
~surdo_start_state = \play;
~surdo_transition_model = Dictionary.newFrom(List[\play, [0, 1], \rest, [1, 0]]);
~surdo_sequence = List[~surdo_start_state];
50.do {|i|
	~surdo_sequence.add(~surdo_state_space.wchoose(~surdo_transition_model[~surdo_sequence[i]]));
};

~surdo_routine = Routine({
	~surdo_sequence.do({|item|
		if (item == \play) {
			Synth(\surdo);  // Play the Surdo sound
		};
		1.wait;
	})
});


~surdo_routine.reset.play(~clock);

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


// Tamborim parameters
~tamborim_subdivision = 16.0;
~tamborim_duration = 4.0 / ~subdivision;


// Here, we stochastically generate 25 arrays and collect them inside ~tamborim_durations. Each array contains an "ellipticalized" sequence of durations to be used in a Pbind.
~num_arrays = 25
~tamborim_durations = Array.newClear(~num_arrays);

~num_arrays.do {
	~tamborim_durations.add([1])}

		~tamborim_durations.value;


		~ellipticalize.value(
			n: ~tamborim_subdivision,
			// Stochastically determines normalization range
			k: (0.3.bilinrand + 0.5),
			// Stochasically determines semi-ellipse orientation
			concave_up: [true, true, true, true, false].choose).collect { |val| val * 0.5 })
}


~tamborim_durations.value;



		)

)

	20.do {(0.3.bilinrand + 0.5).postln}

(~ellipticalize.value(n: 16, k: rr)).collect { |val| val * 0.25 };
~tamborim_amplitude = (~ellipticalize.value(n: 16, k: rrand(0.25, 0.75))).collect { |val| val * 0.5 };

~test = ~ellipsize_results.collect { |val| val * 0.25 };
~ellipsize_results.value.postln;
~test.postln;

20.do({ (((1.5.sum3rand) + 1.5) / 2).postln; });    // quasi-gaussian, bell-shaped.


0.25.rand(0.5);


20.do({ 1.0.sum3rand.postln; });    // quasi-gaussian, bell-shaped.

1.0.linrand     // probability decreases linearly from 0 to <number>.

/*y = Routine({
	Pbind(
    \instrument, \tamborim,
    \pitch, Pseq([1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0], 2),
	\dur, Pseq(~test, 2)).play;


	})
});*/

)
~tamborim_p1 = Pbind(
    \instrument, \tamborim,
    \pitch, Pseq([0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], 2),
	\dur, Pseq(~tamborim_durations, 2),
	\amp, Pseq(~tamborim_amplitude, 2));

~tamborim_p1.play;

~tamborim_p2 = Pbind(
    \instrument, \tamborim,
    \pitch, Pseq([1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0], 2),
	\dur, Pseq(~tamborim_durations, 2),
	\amp, Pseq(~tamborim_amplitude, 2));


~tamborim_p2.play;



Pdef(\tamborim_p1,
	Pbind(
		\instrument, \tamborim,
		\pitch, Pseq([1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0], 2),
		\dur, Pseq(~test, 2)))

Pdef(\tamborim_p1).play;

Pdef(\tamborim_p1,
    Pbind(
        \instrument, \tamborim,
        \pitch, Pseq([1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0], 2),
        \dur, Pseq(~test, 2)
    )
);

Pdef(\tamborim_p1).source.postln;  // This should print the Pbind definition
Pdef(\tamborim_p1);


Pdef(\tamborim_p1).play(~clock);




	// \dur, ~ellipsize_results.collect { |val| 0.25 * val })).play;

Synth(\surdo);
Synth(\tambori

{
~subdivision = 16.0;
~duration = 4.0 / ~subdivision;
~ellipsize_results = ~ellipsize.value(~subdivision);


Pdef(\tamborim_p1,
	var subdivision = 16;
    var duration = 4 / subdivision;
	var ellipsize_results = ~ellipsize.value(subdivision);
{
    Pbind(
        \instrument, \tamborim,
        \pitch, Pseq([1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0], 2),
        \dur, ~ellipsize.value(subdivision).collect { |val| duration * val })}).play;

}

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










