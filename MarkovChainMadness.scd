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

The SynthDefs I used here were inspired by Brazilian samba music. The .wav files needed to execute this file are located in the same directory as the current file (MarkovChainMadness.scd) and were obtained from Splice. The SynthDefs are \surdo, \pandeiro, \tamborim, \agogo, and \cuica.


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
~pandeiro_low = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "pandeiro_low.wav");
~pandeiro_med = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "pandeiro_med.wav");
~pandeiro_slap = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "pandeiro_slap.wav");
~tamborim_low = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "tamborim_low.wav");
~tamborim_hi = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "tamborim_hi.wav");
~tamborim_low2 = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "tamborim_low2.wav");
~tamborim_hi2 = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "tamborim_hi2.wav");
~agogo_low = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "agogo_low.wav");
~agogo_med = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "agogo_med.wav");
~agogo_hi = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "agogo_hi.wav");
~cuica_low = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "cuica_low.wav");
~cuica_hi = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "cuica_hi.wav");


// Set BPM
~bpm = 86;
~clock = TempoClock(~bpm/60.0);

// ~quarter = (1.0 / ~bpm) * (60);
// ~eighth = (1.0 / ~bpm) * (60)/2;
// ~sixteenth = (1.0 / ~bpm) * (60 / 4);


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

*ELLIPTICAL TIME!*
This section of the project contains the functions, variables, and logic used to "ellipticalize" certain musical parameters. Ellipticalization is used to control _____ In section 2, for each instrument, we generate a rhythmic sequence whose parameters are shaped by an ellipse (e.g. the )

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

// Called by: any Pbind, indirectly. Each item of the list is used as a multiplier for a parameter in a Pseq (e.g duration or amplitude). A neat feature of this function is that the mean of output approaches 1 as a approaches b, so the "ellipticalized" rhythms shouldn't diverge too far off from the meter when the difference between a and b is small.

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

    normalized_distances = distances.collect { | d | ((d - b) / (a - b)) / divisor + vertical_transformation};
	// Print statement for debugging
	// normalized_distances.postln;

	// The output
    normalized_distances;
};


// Semi-Ellipsis Generation
// Here, we stochastically generate 25 arrays, where each array contains a sequence of values that form the contour of a semi-ellipse. These values can be used as multipliers in a Pbind. We collect these arrays inside ~semiellipses_dur, ~semiellipses_pan, and ~semiellipses_pan.
~num_arrays = 25;
~semiellipses_dur = Array.newClear(~num_arrays);
~semiellipses_dur_agogo = Array.newClear(~num_arrays);
~semiellipses_amp = Array.newClear(~num_arrays);
~semiellipses_pan = Array.newClear(~num_arrays);

~num_arrays.do { |i|
	~semiellipses_dur[i] = ~ellipticalize.value(
		// Stochastically determines normalization range to a random value betwen 0.2 and 0.8
		k: (0.1.bilinrand + 0.5),
		// Stochasically determines semi-ellipse orientation
		concave_up: [true, true, false].choose).collect { |val| val * 0.25 };

	~semiellipses_dur_agogo[i] = ~ellipticalize.value(
		// Stochastically determines normalization range to a random value betwen 0.1 and 0.2
		k: (0.1.bilinrand + 0.2),
		// Stochasically determines semi-ellipse orientation
		concave_up: [true, true, true, false].choose).collect { |val| val * 0.125 };


	~semiellipses_amp[i] = ~ellipticalize.value(
		// Stochastically determines normalization range to a random value betwen 0.25 and 0.75
		k: (0.2.bilinrand + 0.5),
		// Stochasically determines semi-ellipse orientation
		concave_up: [true, true, false].choose).collect { |val| val * 0.5 };

	~semiellipses_pan[i] = ~ellipticalize.value(
		k: 1,
		// Stochasically determines semi-ellipse orientation
		concave_up: [true, true, false].choose).collect { |val| val - 1};

};


/*
   ___    _   _    ___     ___     ___
  / __|  | | | |  | _ \   |   \   / _ \
  \__ \  | |_| |  |   /   | |) | | (_) |
  |___/   \___/   |_|_\   |___/   \___/
_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
)

*SURDO*
The surdo is the only instrument whose parameters are neither stochastic nor ellipticalized. It will always play on 1 and 3.

*/

// Define SynthDef
SynthDef(\surdo, { |out = 0, pitch = 0, amp = 0.5|
	var bufnum = Select.kr(pitch, [~surdo]);
    var sig = PlayBuf.ar(2, bufnum, loop: 0) * amp;
    Out.ar(out, sig);
}).add;

// Define rhythmic sequences
Pdef(\surdo_p1, Pbind(
    \instrument, \surdo,
	\pitch, Pseq([0], 1),
	\dur, 1,
	\amp, 1.4
));

// Define Markov Chain Logic (This Markov Chain is not stochastic. I just implemented it as such for practice, as well as for consistency with the other instruments)
~surdo_state_space = [\play,\rest];
~surdo_start_state = \play;
~surdo_transition_model = Dictionary.newFrom(List[\play, [0, 1], \rest, [1, 0]]);

// Generate Sequence 1
~surdo_sequence_1 = List[~surdo_start_state];

(~bpm / 2).do {|i|
	~surdo_sequence_1.add(~surdo_state_space.wchoose(~surdo_transition_model[~surdo_sequence_1[i]]));
	// ~surdo_sequence_1[i].postln;
};


// Prepare Routine
// Each instrument has its own unique routine, and this composition is divided in 3 distinct sections (per the project requirements). However, the surdo stays constant throughout the whole piece, which is why there is only 1 sequence in this routine.
~surdo_routine = Routine({
	// Chain together all the sequences
	[~surdo_sequence_1, ~surdo_sequence_1, ~surdo_sequence_1, ~surdo_sequence_1, ~surdo_sequence_1, ~surdo_sequence_1].do({ |seq|
		seq.do({ |item|
			if (item == \play) {
				Pdef(\surdo_p1).play(~clock);
			};
			1.wait;
		});
		3.wait;
	});
});


/*
    ___    ___    _  _     ___     ___     ___     ___     ___
   | _ \  /   \  | \| |   |   \   | __|   |_ _|   | _ \   / _ \
   |  _/  | - |  | .` |   | |) |  | _|     | |    |   /  | (_) |
  _|_|_   |_|_|  |_|\_|   |___/   |___|   |___|   |_|_\   \___/
_| """ |_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'


*PANDEIRO*
The pandeiro is the next layer of the groove. Here, we begin introducing stochasticity.
Much of the code for pandeiro has been reused from surdo (and later for the remaining instruments) because I did not succeed in creating an Instrument class.

*/

// Define SynthDef
SynthDef(\pandeiro, { |out = 0, pitch = 0, amp = 0.5|
    var bufnum = Select.kr(pitch, [~pandeiro_low, ~pandeiro_med, ~pandeiro_slap]);
    var sig = PlayBuf.ar(2, bufnum, loop: 0) * amp;
    Out.ar(out, sig);
}).add;
)

// Define rhythmic sequences
// (I was getting a bizarre bug where this Pdef would not sound if they key value was \pandeiro_a. I was befuddled.)
Pdef(\pandeiro_pattern_a,
	Pbind(
		\instrument, \pandeiro,
		\pitch, Pseq([1, 2, 0, 2, 1, 2, 0, 2, 1, 2, 0, 2, 1, 2, 0, 2], 1),
		\dur, 0.25,
		\amp, Pseq(~semiellipses_pan.choose, 1))
);


Pdef(\pandeiro_b,
	Pbind(
		\instrument, \pandeiro,
		\pitch, Pseq([2, 3, 1, 3, 2, 3, 1, 3, 2, 3, 1, 3, 2, 3, 1, 3], 1),
		\dur, Pseq(~semiellipses_dur.choose, 1),
		\amp, Pseq(~semiellipses_pan.choose, 1))
);


// Define Markov Chain Logic
// The reason there are multiple "play" states is that the Pdef lasts 4 beats, but each state in the Markov chain only lasts 1 beat. The Pdef is triggered at the \play1 state, and we must move through play2, play3, and play4 to ensure the entire Pdef can be played before potentially getting triggered again.
~pandeiro_state_space = [\play1, \play2, \play3, \play4, \rest1];
~pandeiro_start_state = \play1;
~pandeiro_transition_model = Dictionary.newFrom(
	List[\play1, [0, 1, 0, 0, 0],
		\play2, [0, 0, 1, 0, 0],
		\play3, [0, 0, 0, 1, 0],
		\play4, [0.67, 0, 0, 0, 0.33],
		\rest1, [0.75, 0, 0, 0, 0.25]]);

// Generate Sequence 1
 ~pandeiro_sequence_1 = List[~pandeiro_start_state];
(~bpm / 2).do { |i|
	~pandeiro_sequence_1.add(~pandeiro_state_space.wchoose(~pandeiro_transition_model[~pandeiro_sequence_1[i]]));
	// ~pandeiro_sequence_1[i].postln;
};

// Genereate Sequence 2
 ~pandeiro_sequence_2 = List[~pandeiro_start_state];
(~bpm / 2).do { |i|
~pandeiro_sequence_2.add(~pandeiro_state_space.wchoose(~pandeiro_transition_model[~pandeiro_sequence_2[i]]));
	// ~pandeiro_sequence_2[i].postln;
};


// Prepare Routine
// Each instrument has their own unique routine, divided in 3 distinct sections (per the project requirements).
/*~pandeiro_routine = Routine({

	// Section 1
	[~pandeiro_sequence_1, ~pandeiro_sequence_2].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				Pdef(\pandeiro_a).play(~clock);
			};
			1.wait;
		});
		3.wait;
	});

	// Section 2
	[~pandeiro_sequence_2, ~pandeiro_sequence_1].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				Pdef(\pandeiro_a).play(~clock);
			};
			1.wait;
		});
		3.wait;
	});

		//Section 3
	[~pandeiro_sequence_2, ~pandeiro_sequence_1].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				Pdef(\pandeiro_b).play(~clock);
			};
			1.wait;
		});
		3.wait;
	});
});*/

// ~pandeiro_routine = Routine({
// 	// Section 1
// 	[~tamborim_sequence_1, ~tamborim_sequence_2].do({ |seq|
// 		seq.do({ |item|
// 			if (item == \play1) {
// 				Pdef(\tamborim_a).play(~clock);
// 			};
// 			1.wait;
// 		});
// 		3.wait;
// 	});
//
// 	// // Section 2
// 	// [~tamborim_sequence_2, ~tamborim_sequence_1].do({ |seq|
// 	// 	seq.do({ |item|
// 	// 		if (item == \play1) {
// 	// 			Pdef(\tamborim_b).play(~clock);
// 	// 		};
// 	// 		1.wait;
// 	// 	});
// 	// 	3.wait;
// 	// });
// 	//
// 	// // Section 3
// 	// [~tamborim_sequence_2, ~tamborim_sequence_1].do({ |seq|
// 	// 	seq.do({ |item|
// 	// 		if (item == \play1) {
// 	// 			Pdef(\tamborim_b).play(~clock);
// 	// 		};
// 	// 		1.wait;
// 	// 	});
// 	// 	3.wait;
// 	// });
// });
//
)
/*
  _____    ___   __  __    ___     ___     ___     ___   __  __
 |_   _|  /   \ |  \/  |  | _ )   / _ \   | _ \   |_ _| |  \/  |
   | |    | - | | |\/| |  | _ \  | (_) |  |   /    | |  | |\/| |
  _|_|_   |_|_| |_|__|_|  |___/   \___/   |_|_\   |___| |_|__|_|
_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'

*TAMBORIM*
The pandeiro is another layer of the groove. The mechanics of the tamborim in this piece are very similar to that of the pandeiro.
*/

// Define SynthDef
SynthDef(\tamborim, { |out = 0, pitch = 0, amp = 0.5|
    var bufnum = Select.kr(pitch, [~tamborim_low, ~tamborim_hi, ~tamborim_low2, ~tamborim_hi2]);
    var sig = PlayBuf.ar(2, bufnum, loop: 0) * amp;
    Out.ar(out, sig);
}).add;


// Define rhythmic sequences
Pdef(\tamborim_a,
		Pbind(
			\instrument, \tamborim,
			\pitch, Pseq([1, 0, 1, 0, \rest, 1, 0, 0, 1, 0, 1, 0, \rest, 1, 0, 0], 1),
			\dur, 0.25,
			\amp, Pseq(~semiellipses_amp.choose, 1))
);

Pdef(\tamborim_b,
		Pbind(
			\instrument, \tamborim,
			\pitch, Pseq([3, 2, 3, 2, \rest, 3, 2, 2, 3, 2, 3, 2, \rest, 3, 2, 2], 1),
			\dur, Pseq(~semiellipses_dur.choose, 1),
			\amp, Pseq(~semiellipses_pan.choose, 1))
);


// Markov Chain Logic
~tamborim_state_space = [\play1, \play2, \play3, \play4, \rest1, \rest2, \rest3];
~tamborim_start_state = \rest1;
~tamborim_transition_model = Dictionary.newFrom(
	List[\play1, [0, 1, 0, 0, 0, 0, 0],
		\play2, [0, 0, 1, 0, 0, 0, 0],
		\play3, [0, 0, 0, 1, 0, 0, 0],
		\play4, [0.5, 0, 0, 0, 0.5, 0, 0],
		\rest1, [0.4, 0, 0, 0, 0.0, 0.3, 0.3],
		\rest2, [0.3, 0, 0, 0, 0.0, 0.2, 0.5],
		\rest3, [0.80, 0, 0, 0, 0, 0, 0.1]]);


// Create Sequence 1
 ~tamborim_sequence_1 = List[~tamborim_start_state];
(~bpm / 2).do { |i|
	~tamborim_sequence_1.add(~tamborim_state_space.wchoose(~tamborim_transition_model[~tamborim_sequence_1[i]]));
	// ~tamborim_sequence_1[i].postln;
};


// Create Sequence 2
 ~tamborim_sequence_2 = List[~tamborim_start_state];
(~bpm / 2).do { |i|
~tamborim_sequence_2.add(~tamborim_state_space.wchoose(~tamborim_transition_model[~tamborim_sequence_2[i]]));
	// ~tamborim_sequence_2[i].postln;
};


// Prepare Routine
// Each instrument has their own unique routine, divided in 3 distinct sections (per the project requirements).
~tamborim_routine = Routine({
	// Section 1
	[~tamborim_sequence_1, ~tamborim_sequence_2].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				Pdef(\tamborim_a).play(~clock);
			};
			1.wait;
		});
		3.wait;
	});

	// Section 2
	[~tamborim_sequence_2, ~tamborim_sequence_1].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				Pdef(\tamborim_b).play(~clock);
			};
			1.wait;
		});
		3.wait;
	});

	// Section 3
	[~tamborim_sequence_2, ~tamborim_sequence_1].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				Pdef(\tamborim_b).play(~clock);
			};
			1.wait;
		});
		3.wait;
	});
});



~clock = TempoClock(~bpm/60.0);
~surdo_routine.play(~clock);
~pandeiro_routine.play(~clock);
// ~tamborim_routine.play(~clock);
~pandeiro_sequence_1.value.postln;
)

/*
   ___     ___     ___     ___     ___
  /   \   / __|   / _ \   / __|   / _ \
  | - |  | (_ |  | (_) | | (_ |  | (_) |
  |_|_|   \___|   \___/   \___|   \___/
_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'


*AGOGÔ*

The agogô bells introduce two neat new features. First, they are rhythmically operating at the 32nd-note level. Second, they have two different transition model dictionaries. The reason for this is that the design of the agogo bells is such that they are *MUCH* more likely to enter the fray if both the pandeiro and the tamborim are already playing.

The Markovian assumption states that the future state of a system depends only on the current state and not on the sequence of states that preceded it. Thus far, we have treated every instrument as its own system with its own Markov chain. However, the agogô bells are different in that their future state is also dependent on the current state of the other Markov chains! In this sense, this composition is just one enormous Markov chain, where each state lasts 1 beat and is the aggregate of the states of each instrument.

*/

	// Agogo SynthDef
SynthDef(\agogo, { |out = 0, pitch = 0, amp = 0.5|
    var bufnum = Select.kr(pitch, [~agogo_low, ~agogo_med, ~agogo_hi]);
    var sig = PlayBuf.ar(2, bufnum, loop: 0) * amp;
    Out.ar(out, sig);
}).add;

// Define rhythmic sequences
Pdef(\agogo_a,
		Pbind(
			\instrument, \agogo,
			\pitch, Pseq([2, \rest, \rest, 0, \rest, \rest, 2, \rest, \rest, 2, \rest, \rest, 0, \rest, 0, \rest], 1),
			\dur, 0.125,
			\amp, Pseq(~semiellipses_amp.choose, 1))
);

Pdef(\agogo_b,
		Pbind(
			\instrument, \agogo,
			\pitch, Pseq([1, 1, \rest, 1, \rest, 0, 1, \rest, 2, \rest, \rest, \rest, \rest, \rest, \rest, \rest], 1),
			\dur, 0.125,
			\amp, Pseq(~semiellipses_pan.choose, 1))
);

// Create array that we will later use .choose on for stochastic music-making
~agogo_ab = [Pdef(\agogo_a), Pdef(\agogo_a), Pdef(\agogo_a), Pdef(\agogo_a), Pdef(\agogo_b)];

Pdef(\agogo_c,
		Pbind(
			\instrument, \agogo,
			\pitch, Pseq([1, 1, \rest, 1, \rest, 0, 1, \rest, 3, 2, 3, 2, \rest, 3, 2, 2], 1),
			\dur, Pseq(~semiellipses_dur_agogo.choose, 1),
			\amp, Pseq(~semiellipses_pan.choose, 1))
);

Pdef(\agogo_d,
		Pbind(
			\instrument, \agogo,
			\pitch, Pseq([1, 1, \rest, 1, \rest, 0, 1, \rest, 2, \rest, \rest, \rest, \rest, \rest, \rest, \rest], 1),
			\dur, Pseq(~semiellipses_dur_agogo.choose, 1),
			\amp, Pseq(~semiellipses_pan.choose, 1))
);

~agogo_cd = [Pdef(\agogo_c), Pdef(\agogo_d)];


// Markov Chain Logic
~agogo_state_space = [\play1, \play2, \rest1];
~agogo_start_state = \rest1;
~agogo_transition_model_a = Dictionary.newFrom(
		List[\play1, [0, 1, 0],
			\play2, [0, 0, 1],
			\rest1, [0.05, 0, 0.95]
	]);

~agogo_transition_model_b = Dictionary.newFrom(
		List[\play1, [0, 1, 0],
			\play2, [0.67, 0, 0.33],
			\rest1, [0.4, 0, 0.6]
	]);


// Create Sequence 1
 ~agogo_sequence_1 = List[~agogo_start_state];
(~bpm / 2).do { |i|

		if (~pandeiro_sequence_1[i] != \rest1 &&
			~tamborim_sequence_1[i] != \rest1 &&
			~tamborim_sequence_1[i] != \rest2 &&
		~tamborim_sequence_1[i] != \rest3)
		{
			~agogo_sequence_1.add(~agogo_state_space.wchoose(~agogo_transition_model_b[~agogo_sequence_1[i]]));
		} {
			~agogo_sequence_1.add(~agogo_state_space.wchoose(~agogo_transition_model_a[~agogo_sequence_1[i]]));
		}
};

// Create Sequence 2
~agogo_sequence_2 = List[~agogo_start_state];
(~bpm / 2).do { |i|

		if (~pandeiro_sequence_1[i] != \rest1 &&
			~tamborim_sequence_1[i] != \rest1 &&
			~tamborim_sequence_1[i] != \rest2 &&
		~tamborim_sequence_1[i] != \rest3)
		{
			~agogo_sequence_2.add(~agogo_state_space.wchoose(~agogo_transition_model_b[~agogo_sequence_2[i]]));
		} {
			~agogo_sequence_2.add(~agogo_state_space.wchoose(~agogo_transition_model_a[~agogo_sequence_2[i]]));
		}
};

// Prepare Routine
~agogo_routine = Routine({
	// Section 1
	[~agogo_sequence_1, ~agogo_sequence_2].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				~agogo_ab.choose.play(~clock);
				};
			1.wait;
		});
		3.wait;
	});

	// Section 2
	[~agogo_sequence_2, ~agogo_sequence_1].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				~agogo_cd.choose.play(~clock);
			};
			1.wait;
		});
		3.wait;
	});

	// Section 3
	[~agogo_sequence_2, ~agogo_sequence_1].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				~agogo_cd.choose.play(~clock);
			};
			1.wait;
		});
		3.wait;
	});
});




~clock = TempoClock(~bpm/60.0);
~surdo_routine.play(~clock);
~pandeiro_routine.play(~clock);
~tamborim_routine.play(~clock);
~agogo_routine.play(~clock);



s.meter;










