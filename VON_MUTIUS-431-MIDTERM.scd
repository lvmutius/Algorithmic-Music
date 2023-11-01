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

This file contains the executable code to generate an experimental, stochastic composition entitled "Markov da Mangueira." Evaluating the block below will stochastically generate a fresh realization of "Markov da Mangueira."

The compositition has 3 sections, divided in 3 subsections:
Section 1A: Surdo, Pandeiro, Tamborim (non-elliptical note durations)
Section 1B: Surdo, Pandeiro, Tamborim, Repinique, Cuíca (non-elliptical note durations)

Section 2A: Surdo, Pandeiro, Tamborim (elliptical note durations)
Section 2B: Surdo, Pandeiro, Tamborim, Repinique, Cuíca (elliptical note durations)

Section 3A: Surdo, Pandeiro, Tamborim (VERY elliptical note durations)
Section 3B: Surdo, Pandeiro, Tamborim, Repinique, Cuíca (VERY elliptical note durations)

T
The .wav files needed to execute this file are located in the same directory as the current file (MarkovChainMadness.scd) and were obtained from Splice. The SynthDefs are \surdo, \pandeiro, \tamborim, \repinique and \cuica.


  ___          _           _         ___ _         _
 | __|_ ____ _| |_  _ __ _| |_ ___  | _ ) |___  __| |__
 | _|\ V / _` | | || / _` |  _/ -_) | _ \ / _ \/ _| / /
 |___|\_/\__,_|_|\_,_\__,_|\__\___| |___/_\___/\__|_\_\
  ___      _            _
 | _ ) ___| |_____ __ _| |
 | _ \/ -_) / _ \ V  V /_|
 |___/\___|_\___/\_/\_/(_)


***************************************************************
* EVALUATE THE BLOCK BELOW TO LISTEN TO "MARKOV DA MANGUEIRA" *
***************************************************************

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

~repinique_low = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "repinique_low.wav");
~repinique_hi1 = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "repinique_hi1.wav");
~repinique_hi2 = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "repinique_hi2.wav");
~repinique_double = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "repinique_double.wav");

~cuica_low = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "cuica_low.wav");
~cuica_hi = Buffer.read(s, thisProcess.nowExecutingPath.dirname +/+ "cuica_hi.wav");


// Set BPM
~bpm = 86;
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

******************
*ELLIPTICAL TIME!*
******************

This section of the project contains the functions, variables, and logic ultimately used to "ellipticalize" certain musical parameters. By "ellipticalization," I mean that the musical parameter will oscillate in the shape of a semi-ellipse (i.e. one-half on an ellipse)——essentially, we're applying a semi-ellipse-shaped LFO to the parameter. (Example: Consider a Pbind where the amplitude is shaped by a concave-up semi-ellipse. The pattern would get gradually get louder, then peak, then get gradually quieter).

In this project, ellipticalization happens stochastically in all 3 sections. Every time a Pbind is triggered at runtime, the shape of the semi-ellipse (for every parameter that is ellipticalized) is stochastically determined from a list of pre-generated semi-ellipses, which were also stochastically generated. In effect, this means that everytime the program is run, a brand new composition is created!

I originally attempted to implement ellipticalization as a class, but it appeared to be far too difficult and not very portable to do so in SC3. The same applies for the instruments; I tried to make an Instrument class in order to increase code reusability, but I did not succeed in doing so.

In retrospect, I am certain there is a far more natural (and far, far easier) way to achieve this ellipticalization effect in SC3 by multiplying SinOsc's together (or other wave shapes) and using the result as a control rate for various parameters. However, this was a fun learning experience, and I'm happy with the result!

*/


// *************
// * FUNCTIONS *
// *************
//
// Function: ~ellipse_radius, an implementation of the polar equation of an ellipse.
// Returns: the distance from the center of an ellipse to its boundary at angle t (the radius at angle t). The ellipse has semi-major axis a, and semi-minor axis b.
// Called by: ~ellipticalize
~ellipse_radius = {
	| a = 1.25, // semi-major axis of the ellipse
	b = 1, // semi-minor axis of the ellipse
	t | // an angle t in radians
	(a * b) / ((b * cos(t)).squared + (a * sin(t)).squared).sqrt};

// Function: ~ellipticalize
// Returns: a list of length n. The values are normalized to be within a range of size k (between 1 - k/2 and 1 + k/2). When plotted, the values form the countour of a semi-ellipse.

// Called by: any Pbind, indirectly. Each item of the list is used as the value for the parameter of a note in a Pseq (e.g duration or amplitude). A neat feature of this function is that the mean of the outputted list approaches 1 as a approaches b. As a result, the "ellipticalized" rhythms shouldn't diverge too far off from the meter when the difference between a and b is small. Instead, the sounds should speed up or slow down WITHIN the meter but without falling OUT of the meter.

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

	// Calculate normalized distances
    normalized_distances = distances.collect { | d | ((d - b) / (a - b)) / divisor + vertical_transformation};

	// Print statement for debugging
	// normalized_distances.postln;

	// The output
    normalized_distances;
};


// ********************
// * GLOBAL VARIABLES *
// ********************
//
// Here, we stochastically generate 6 arrays, where each array is composed of 25 sub-arrays. Each sub-array // contains a sequence of n values that form the contour of a semi-ellipse.
~num_arrays = 25;
~semiellipses_dur = Array.newClear(~num_arrays);
~semiellipses_dur_tamborim = Array.newClear(~num_arrays);
~semiellipses_dur_xtreme = Array.newClear(~num_arrays);
~semiellipses_dur_32nd = Array.newClear(~num_arrays);
~semiellipses_amp = Array.newClear(~num_arrays);
~semiellipses_pan = Array.newClear(~num_arrays);


~num_arrays.do { |i|
	~semiellipses_dur[i] = ~ellipticalize.value(
		// Stochastically determines normalization range to a random value betwen 0.2 and 0.4
		k: (0.1.bilinrand + 0.3),
		// Stochasically determines semi-ellipse orientation
		concave_up: [true, true, true, false, false].choose).collect { |val| val * 0.25 };

	~semiellipses_dur_tamborim[i] = ~ellipticalize.value(
		// Stochastically determines normalization range to a random value betwen 0.2 and 0.5
		k: (0.1.bilinrand + 0.3),
		// Stochasically determines semi-ellipse orientation
		concave_up: [true, false].choose).collect { |val| val * 0.25 };

	~semiellipses_dur_xtreme[i] = ~ellipticalize.value(
		// Stochastically determines normalization range to a random value betwen 0.2 and 0.5
		k: (0.3.bilinrand + 0.6),
		a: 1.75,
		// Stochasically determines semi-ellipse orientation
		concave_up: [true, false].choose).collect { |val| val * 0.25 };

	~semiellipses_dur_32nd[i] = ~ellipticalize.value(
		// Stochastically determines normalization range to a random value betwen 0.1 and 0.3
		k: (0.1.bilinrand + 0.2),
		// Stochasically determines semi-ellipse orientation
		concave_up: [true, true, true, false, false].choose).collect { |val| val * 0.125 };

	~semiellipses_amp[i] = ~ellipticalize.value(
		// Stochastically determines normalization range to a random value betwen 0.25 and 0.75
		k: (0.2.bilinrand + 0.5),
		// Stochasically determines semi-ellipse orientation
		concave_up: [true, false].choose).collect { |val| val * 0.5 };

	~semiellipses_pan[i] = ~ellipticalize.value(
		// Stochastically determines normalization range to a random value betwen 0.25 and 0.75
		k: (1.0.rand2),
		// Stochasically determines semi-ellipse orientation
		concave_up: [true, false].choose).collect { |val| val - 1 };
};

/*

   ___    _   _    ___     ___     ___
  / __|  | | | |  | _ \   |   \   / _ \
  \__ \  | |_| |  |   /   | |) | | (_) |
  |___/   \___/   |_|_\   |___/   \___/
_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'


**********
* SURDO  *
**********


The surdo is the only instrument whose parameters are neither stochastic nor ellipticalized. It presides over beats 1 and 3.

*/


// ************
// * SYNTHDEF *
// ************
SynthDef(\surdo, { |out = 0, pitch = 0, amp = 0.5|
	var bufnum = Select.kr(pitch, [~surdo]);
    var sig = PlayBuf.ar(2, bufnum, loop: 0) * amp;
    Out.ar(out, sig);
}).add;


// ****************
// * MARKOV CHAIN *
// ****************
//
// This Markov Chain is actually not stochastic. I just implemented it as such for practice, as well as for consistency with the other instruments.
~surdo_state_space = [\play,\rest];
~surdo_start_state = \play;
~surdo_transition_model = Dictionary.newFrom(List[\play, [0, 1], \rest, [1, 0]]);


// ***********
// *SEQUENCES*
// ***********
//
// Generate Sequence 1
~surdo_sequence_1 = List[~surdo_start_state];

(~bpm / 2).do {|i|
	~surdo_sequence_1.add(~surdo_state_space.wchoose(~surdo_transition_model[~surdo_sequence_1[i]]));
};

// ***********
// * ROUTINE *
// ***********
//
// The surdo's routine is very simple since it stays constant throughout.
~surdo_routine = Routine({
	// Pick-up measure
	4.wait;

	// Loop through 3 sections
	3.do {
		[~surdo_sequence_1, ~surdo_sequence_1].do({ |seq|
			seq.do({ |item|
				if (item == \play) {
					Pbind(
						\instrument, \surdo,
						\pitch, Pseq([0], 1),
						\dur, 1,
						\amp, 1.4
					).play(~clock);

				};
				1.wait;
			});
			8.wait});
	}
});


/*

    ___    ___    _  _     ___     ___     ___     ___     ___
   | _ \  /   \  | \| |   |   \   | __|   |_ _|   | _ \   / _ \
   |  _/  | - |  | .` |   | |) |  | _|     | |    |   /  | (_) |
  _|_|_   |_|_|  |_|\_|   |___/   |___|   |___|   |_|_\   \___/
_| """ |_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'


************
* PANDEIRO *
************


The pandeiro is the next layer of the groove. Unlike the surdo, the pandeiro's rhythmic presence is stochastically determined. Its parameters are also ellipticalized (stochastically).

*/


// ************
// * SYNTHDEF *
// ************
//
// Define SynthDef
SynthDef(\pandeiro, { |out = 0, pitch = 0, amp = 0.5|
    var bufnum = Select.kr(pitch, [~pandeiro_low, ~pandeiro_med, ~pandeiro_slap]);
    var sig = PlayBuf.ar(2, bufnum, loop: 0) * amp;
    Out.ar(out, sig);
}).add;


// ****************
// * MARKOV CHAIN *
// ****************
//
// Unlike the surdo, which has only 1 "play" state and 1 "rest" state, the pandeiro has multiple "play" states. This is to account for the fact that each state in the Markov chain only lasts 1 beat, but the Pbinds played by the pandeiro last multiple beats (and are triggered at the \play1 state). Transitioning between multiple play states deterministically in succession prevents the pandeiro Pbind from being re-triggered before it is done playing.
~pandeiro_state_space = [\play1, \play2, \play3, \play4, \rest1];
~pandeiro_start_state = \play1;
~pandeiro_transition_model = Dictionary.newFrom(
	List[\play1, [0, 1, 0, 0, 0],
		\play2, [0, 0, 1, 0, 0],
		\play3, [0, 0, 0, 1, 0],
		\play4, [0.67, 0, 0, 0, 0.33],
		\rest1, [0.25, 0, 0, 0, 0.75]]);


// *************
// * SEQUENCES *
// *************
//
// Generate Sequence 1
~pandeiro_sequence_1 = List[~pandeiro_start_state];
(~bpm / 2).do { |i|
	~pandeiro_sequence_1.add(~pandeiro_state_space.wchoose(~pandeiro_transition_model[~pandeiro_sequence_1[i]]));
};

// Generate Sequence 2
 ~pandeiro_sequence_2 = List[~pandeiro_start_state];
(~bpm / 2).do { |i|
~pandeiro_sequence_2.add(~pandeiro_state_space.wchoose(~pandeiro_transition_model[~pandeiro_sequence_2[i]]));
};


// ***********
// * ROUTINE *
// ***********
//
// The pandeiro's routine is divided in 3 sections, each one constituted of two subsections (and 1 sequence per sub-section). Sections 2 & 3 are variations on Section 1, featuring different parameters being ellipticalized as well as different rhythms.
~pandeiro_routine = Routine({
	// Pick-up measure
	4.wait;

	// Section 1A & 1B
	[~pandeiro_sequence_1, ~pandeiro_sequence_2].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				Pbind(
					\instrument, \pandeiro,
					\pitch, Pseq([1, 2, 0, 2, 1, 2, 0, 2, 1, 2, 0, 2, 1, 2, 0, 2], 1),
					\dur, 0.25,
					\amp, Pseq(~semiellipses_dur.choose, 1)).play(~clock);
			};
			1.wait;
		});
		8.wait;
	});

	// Section 2
	[~pandeiro_sequence_2, ~pandeiro_sequence_1].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				Pbind(
					\instrument, \pandeiro,
					\pitch, Pseq([1, 2, 0, 2, 1, 2, 0, 2, 1, 2, 0, 2, 1, 2, 0, 2], 1),
					\dur, Pseq(~semiellipses_dur.choose, 1),
					\amp, Pseq(~semiellipses_amp.choose, 1)).play(~clock);
			};
			1.wait;
		});
		8.wait;
	});

	//Section 3
	[~pandeiro_sequence_2, ~pandeiro_sequence_1].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				Pbind(
					\instrument, \pandeiro,
					\pitch, Pseq([2, 3, 1, 3, 2, 3, 1, 3, 2, 3, 1, 3, 2, 3, 1, 3], 1),
					\dur, Pseq(~semiellipses_dur_xtreme.choose, 1),
					\amp, Pseq(~semiellipses_pan.choose, 1)).play(~clock);
			};
			1.wait;
		});
		8.wait;
	});
});


/*

  _____    ___   __  __    ___     ___     ___     ___   __  __
 |_   _|  /   \ |  \/  |  | _ )   / _ \   | _ \   |_ _| |  \/  |
   | |    | - | | |\/| |  | _ \  | (_) |  |   /    | |  | |\/| |
  _|_|_   |_|_| |_|__|_|  |___/   \___/   |_|_\   |___| |_|__|_|
_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'


**********
*TAMBORIM*
**********


The tamborim is the next layer of the groove. The mechanics of the tamborim in this piece are virtually identical to that of the pandeiro, though the rhythms and Markov transition model are different.

*/


// ************
// * SYNTHDEF *
// ************
SynthDef(\tamborim, { |out = 0, pitch = 0, amp = 0.5|
    var bufnum = Select.kr(pitch, [~tamborim_low, ~tamborim_hi, ~tamborim_low2, ~tamborim_hi2]);
    var sig = PlayBuf.ar(2, bufnum, loop: 0) * amp;
    Out.ar(out, sig);
}).add;


// ****************
// * MARKOV CHAIN *
// ****************
~tamborim_state_space = [\play1, \play2, \play3, \play4, \rest1, \rest2, \rest3];
~tamborim_start_state = \rest1;
~tamborim_transition_model = Dictionary.newFrom(
	List[\play1, [0, 1, 0, 0, 0, 0, 0],
		\play2, [0, 0, 1, 0, 0, 0, 0],
		\play3, [0, 0, 0, 1, 0, 0, 0],
		\play4, [0.67, 0, 0, 0, 0.33, 0, 0],
		\rest1, [0.33, 0, 0, 0, 0.0, 0.33, 0.34],
		\rest2, [0.3, 0, 0, 0, 0.0, 0.2, 0.5],
		\rest3, [0.80, 0, 0, 0, 0, 0, 0.1]]);


// *************
// * SEQUENCES *
// *************
//
// Create Sequence 1
~tamborim_sequence_1 = List[~tamborim_start_state];
(~bpm / 2).do { |i|
~tamborim_sequence_1.add(~tamborim_state_space.wchoose(~tamborim_transition_model[~tamborim_sequence_1[i]]));
};

// Create Sequence 2
~tamborim_sequence_2 = List[~tamborim_start_state];
(~bpm / 2).do { |i|
~tamborim_sequence_2.add(~tamborim_state_space.wchoose(~tamborim_transition_model[~tamborim_sequence_2[i]]));
};


// ***********
// * ROUTINE *
// ***********
//
// The tamborim's routine, like the pandeiro's, is divided in 3 sections, each constituted of 2 sub-sections. Sections 2 & 3 are variations on Section 1, featuring different parameters being ellipticalized as well as different rhythms.
~tamborim_routine = Routine({
	// Pick-up measure
	4.wait;
	// Section 1
	[~tamborim_sequence_1, ~tamborim_sequence_2].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				Pbind(
					\instrument, \tamborim,
					\pitch, Pseq([1, 0, 1, 0, \rest, 1, 0, 0, 1, 0, 1, 0, \rest, 1, 0, 0], 1),
					\dur, 0.25,
					\amp, Pseq(~semiellipses_amp.choose, 1)).play(~clock);
			};
			1.wait;
		});
		8.wait;
	});


	// Section 2
	[~tamborim_sequence_2, ~tamborim_sequence_1].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				Pbind(
					\instrument, \tamborim,
					\pitch, Pseq([3, 2, 3, 2, \rest, 3, 2, 2, 3, 2, 3, 2, \rest, 3, 2, 2], 1),
					\dur, Pseq(~semiellipses_dur_tamborim.choose, 1),
					\amp, Pseq(~semiellipses_amp.choose, 1)).play(~clock);
			};
			1.wait;
		});
		8.wait;
	});

	// Section 3
	[~tamborim_sequence_2, ~tamborim_sequence_1].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				Pbind(
					\instrument, \tamborim,
					\pitch, Pseq([1, 0, 1, 0, \rest, 1, 0, 0, 1, 0, 1, 0, \rest, 1, 0, 0], 1),
					\dur, Pseq(~semiellipses_dur_xtreme.choose, 1),
					\amp, Pseq(~semiellipses_pan.choose, 1)).play(~clock);
			};
			1.wait;
		});
		8.wait;
	});
});


/*
   ___     ___      ___    ___    _  _     ___    ___     _   _    ___
  | _ \   | __|    | _ \  |_ _|  | \| |   |_ _|  / _ \   | | | |  | __|
  |   /   | _|     |  _/   | |   | .` |    | |  | (_) |  | |_| |  | _|
  |_|_\   |___|   _|_|_   |___|  |_|\_|   |___|  \__\_\   \___/   |___|
_|"""""|_|"""""|_| """ |_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'


*************
* REPINIQUE *
*************


The repinique is a very unique instrument. First of all, it has additional responsibilities compared to the other instruments: the repinique plays the "chamada", a line used to signal the start of the composition AND to transition between the 6 sub-sections.

However, the real kicker is its Markov chain. The Markovian assumption states that the probability of moving to the next state depends only on the present state and not on how the system arrived at that state; thus far, every instrument's state has been a function of its own previous state. However, the repinique's transition model takes into account the *previous state of other instruments!* This creates a layering effect, where the repinique will only join the fray when the surdo, pandeiro, and tamborim are currently playing. Although the repinique is a "leader" instrument in the sense that it signals the beginning and end of the composition, as well as the transition between sections, it is otherwise always listening for other instruments before joining in. The repinique is also tacet for the first half of every section.——Talk about balance of powers!

*/


// ************
// * SYNTHDEF *
// ************
//
// Define SynthDef
SynthDef(\repinique, { |out = 0, pitch = 0, amp = 0.5|
    var bufnum = Select.kr(pitch, [~repinique_low, ~repinique_hi1, ~repinique_hi2, ~repinique_double]);
    var sig = PlayBuf.ar(2, bufnum, loop: 0) * amp;
    Out.ar(out, sig);
}).add;


// ****************
// * MARKOV CHAIN *
// ****************
//
// Markov Chain Logic
~repinique_state_space = [\play1, \play2, \rest1];
~repinique_start_state = \rest1;
~repinique_transition_model_a = Dictionary.newFrom(
	List[\play1, [0, 1, 0],
		\play2, [0, 0, 1],
		\rest1, [0, 0, 1]]);
~repinique_transition_model_b = Dictionary.newFrom(
	List[\play1, [0, 1, 0],
		\play2, [1, 0, 0],
		\rest1, [1, 0, 0]]);


// *************
// * SEQUENCES *
// *************
//
// Create Sequence 1
~repinique_sequence_1 = List[~repinique_start_state];
(~bpm / 2).do { |i|

	if (((~pandeiro_sequence_1[i] == \play1) ||
		(~pandeiro_sequence_1[i] == \play2) ||
		(~pandeiro_sequence_1[i] == \play3)) &&
	((~tamborim_sequence_1[i] == \play1) ||
		(~tamborim_sequence_1[i] == \play2) ||
		(~tamborim_sequence_1[i] == \play3)))
	{ ~repinique_sequence_1.add(~repinique_state_space.wchoose(~repinique_transition_model_b[~repinique_sequence_1[i]]));
	} {
		~repinique_sequence_1.add(~repinique_state_space.wchoose(~repinique_transition_model_a[~repinique_sequence_1[i]]));
	}
};

// Create Sequence 2
~repinique_sequence_2 = List[~repinique_start_state];
(~bpm / 2).do { |i|

	if (((~pandeiro_sequence_2[i] == \play1) ||
		(~pandeiro_sequence_2[i] == \play2) ||
		(~pandeiro_sequence_2[i] == \play3)) &&
	((~tamborim_sequence_2[i] == \play1) ||
		(~tamborim_sequence_2[i] == \play2) ||
		(~tamborim_sequence_2[i] == \play3)))
	{ ~repinique_sequence_2.add(~repinique_state_space.wchoose(~repinique_transition_model_b[~repinique_sequence_2[i]]));
	} {
		~repinique_sequence_2.add(~repinique_state_space.wchoose(~repinique_transition_model_a[~repinique_sequence_2[i]]));
	}
};

// Create Sequence 3, with only rests
~repinique_sequence_3 = List[~repinique_start_state];
(~bpm / 2).do {~repinique_sequence_3.add(~repinique_start_state)};


// ***********
// * ROUTINE *
// ***********
~repinique_routine = Routine({
	// Pick-up measure
	Pbind(
		\instrument, \repinique,
		\pitch, Pseq([3, 0, 1, 1, \rest, 1, \rest, 1, 1, 0, 1, 0, 1, \rest, \rest, \rest], 1),
		\dur, 0.25,
		\amp, [0.1, 0.05, 0.2, 0.05, 0.2, 0.3, 0.25, 0.2, 0.2, 0.01, 0.2, 0.01, 0.2, 0.2, 0.2]).play(~clock);

	4.wait;

	// Section 1
	[~repinique_sequence_3, ~repinique_sequence_2].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				Pbind(
					\instrument, \repinique,
					\pitch, Pseq([0, 1, 2, 1, 0, 1, 2, 1], 1),
					\dur, 0.25,
					\amp, Pseq(~semiellipses_amp.choose, 1)).play(~clock);
			};
			1.wait;
		});
		4.wait;
		s.freeAll;
		// End of subsection
		Pbind(
			\instrument, \repinique,
			\pitch, Pseq([3, 0, 1, 1, \rest, 1, \rest, 1, 1, 0, 1, 0, 1, \rest, \rest, \rest], 1),
			\dur, 0.25,
			\amp, [0.1, 0.05, 0.2, 0.05, 0.2, 0.3, 0.25, 0.2, 0.2, 0.01, 0.2, 0.01, 0.2, 0.2, 0.2]).play(~clock);
		4.wait;

	});

	// Section 2 (tacet)
	[~repinique_sequence_3, ~repinique_sequence_1].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				Pbind(
					\instrument, \repinique,
					\pitch, Pseq([0, 1, 2, 1, 0, 1, 2, 1], 1),
					\dur, Pseq(~semiellipses_dur.choose, 1),
					\amp, Pseq(~semiellipses_amp.choose, 1)).play(~clock);
			};
			1.wait;
		});
		4.wait;
		s.freeAll;
		// End of subsection
		Pbind(
			\instrument, \repinique,
			\pitch, Pseq([3, 0, 1, 1, \rest, 1, \rest, 1, 1, 0, 1, 0, 1, \rest, \rest, \rest], 1),
			\dur, 0.25,
			\amp, [0.1, 0.05, 0.2, 0.05, 0.2, 0.3, 0.25, 0.2, 0.2, 0.01, 0.2, 0.01, 0.2, 0.2, 0.2]).play(~clock);
		4.wait;
	});

	// Section 3
	[~repinique_sequence_3, ~repinique_sequence_1].do({ |seq|
		seq.do({ |item|
			if (item == \play1) {
				Pbind(
					\instrument, \repinique,
					\pitch, Pseq([0, 1, 2, 1, 0, 1, 2, 1], 1),
					\dur, Pseq(~semiellipses_dur_xtreme.choose, 1),
					\amp, Pseq(~semiellipses_amp.choose, 1)).play(~clock);
			};
			1.wait;
		});
		6.wait;
		Pbind(
			\instrument, \repinique,
			\pitch, Pseq([3, 0, 1, 1, \rest, 1, \rest, 1, 1, \rest, \rest, \rest], 1),
			\dur, 0.25,
			\amp, [0.1, 0.05, 0.2, 0.05, 0.2, 0.3, 0.25, 0.2, 0.2, 0.01, 0.2, 0.01]).play(~clock);
		Pbind(
			\instrument, \surdo,
			\pitch, Pseq([\rest, \rest, \rest, \rest, \rest, 0, 0, \rest], 1),
			\dur, 0.5,
			\amp, 1.5).play(~clock);
	});
});

/*
                     //
   ___    _   _    ___     ___     ___
  / __|  | | | |  |_ _|   / __|   /   \
 | (__   | |_| |   | |   | (__    | - |
  \___|   \___/   |___|   \___|   |_|_|
_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'


*********
* CUÍCA *
*********


The cuíca is the final instrument of the ensemble. It is unique because it operates at the 32nd-note subdivision. Like the repinique, the cuíca's state transitions are dependent on whether the other instruments are playing. However, it's transition model is a bit more probabilistic than the repinique's. Additionally, whenever the cuíca reaches \play1, it randomly picks between 1 of 2 Pbinds.

*/

// ************
// * SYNTHDEF *
// ************

// Define SynthDef
SynthDef(\cuica, { |out = 0, pitch = 0, amp = 0.5|
    var bufnum = Select.kr(pitch, [~cuica_low, ~cuica_hi]);
    var sig = PlayBuf.ar(2, bufnum, loop: 0) * amp;
    Out.ar(out, sig);
}).add;

~cuica_p1 = Pbind(
	\instrument, \cuica,
	\pitch, Pseq([1, \rest, \rest, 0, \rest, \rest, 1, \rest, \rest, 1, \rest, \rest, 0, \rest, \rest, \rest], 1),
	\dur, Pseq(~semiellipses_dur_32nd.choose, 1),
	\amp, Pseq(~semiellipses_amp.choose, 1));

~cuica_p2 = Pbind(
	\instrument, \cuica,
	\pitch, Pseq([1, \rest, \rest, 0, \rest, \rest, 1, \rest, \rest, 1, \rest, \rest, 1, \rest, \rest, \rest], 1),
	\dur, Pseq(~semiellipses_dur_32nd.choose, 1),
	\amp, Pseq(~semiellipses_amp.choose, 1));

// ****************
// * MARKOV CHAIN *
// ****************
//
~cuica_state_space = [\play1, \play2, \rest1];
~cuica_start_state = \rest1;
~cuica_transition_model_a = Dictionary.newFrom(
    List[\play1, [0, 1, 0],
        \play2, [0.25, 0.10, 0.65],
        \rest1, [0.1, 0, 0.9]]);
~cuica_transition_model_b = Dictionary.newFrom(
    List[\play1, [0, 1, 0],
        \play2, [1, 0, 0],
        \rest1, [1, 0, 0]]);


// *************
// * SEQUENCES *
// *************
//
// Create Sequence 1
~cuica_sequence_1 = List[~cuica_start_state];
(~bpm / 2).do { |i|

	if (((~pandeiro_sequence_1[i] == \play1) ||
		(~pandeiro_sequence_1[i] == \play2) ||
		(~pandeiro_sequence_1[i] == \play3)) &&
	((~tamborim_sequence_1[i] == \play1) ||
		(~tamborim_sequence_1[i] == \play2) ||
		(~tamborim_sequence_1[i] == \play3)) &&
	(~repinique_sequence_1[i] != \rest1))
    { ~cuica_sequence_1.add(~cuica_state_space.wchoose(~cuica_transition_model_b[~cuica_sequence_1[i]]));
    } {
        ~cuica_sequence_1.add(~cuica_state_space.wchoose(~cuica_transition_model_a[~cuica_sequence_1[i]]));
    }
};

// Create Sequence 2
~cuica_sequence_2 = List[~cuica_start_state];
(~bpm / 2).do { |i|

	if (((~pandeiro_sequence_2[i] == \play1) ||
		(~pandeiro_sequence_2[i] == \play2) ||
		(~pandeiro_sequence_2[i] == \play3)) &&
	((~tamborim_sequence_2[i] == \play1) ||
		(~tamborim_sequence_2[i] == \play2) ||
		(~tamborim_sequence_2[i] == \play3)) &&
	(~repinique_sequence_2[i] != \rest1))
    { ~cuica_sequence_2.add(~cuica_state_space.wchoose(~cuica_transition_model_b[~cuica_sequence_2[i]]));
    } {
        ~cuica_sequence_2.add(~cuica_state_space.wchoose(~cuica_transition_model_a[~cuica_sequence_2[i]]));
    }
};

// Create Sequence 3, with only rests (tacet sequence)
~cuica_sequence_3 = List[~cuica_start_state];
(~bpm / 2).do {~cuica_sequence_3.add(~cuica_start_state)};


// ***********
// * ROUTINE *
// ***********
~cuica_routine = Routine({
    // Pick-up measure
    4.wait;

    // Section 1
    [~cuica_sequence_3, ~cuica_sequence_2].do({ |seq|
        seq.do({ |item|
            if (item == \play1) {
				[~cuica_p1, ~cuica_p2].choose.play(~clock);
            };
            1.wait;
        });
        8.wait;

    });

    // Section 2
    [~cuica_sequence_3, ~cuica_sequence_1].do({ |seq|
        seq.do({ |item|
            if (item == \play1) {
				[~cuica_p1, ~cuica_p2].choose.play(~clock);
            };
            1.wait;
        });
        8.wait;
    });

	// Section 3
    [~cuica_sequence_3, ~cuica_sequence_1].do({ |seq|
        seq.do({ |item|
            if (item == \play1) {
				[~cuica_p1, ~cuica_p2].choose.play(~clock);

            };
            1.wait;
        });
        8.wait;
    });
});


/*

 ,-----. ,-----. ,--.  ,--.,--------.,------.  ,-----. ,--.
'  .--./'  .-.  '|  ,'.|  |'--.  .--'|  .--. ''  .-.  '|  |
|  |    |  | |  ||  |' '  |   |  |   |  '--'.'|  | |  ||  |
'  '--'\'  '-'  '|  | `   |   |  |   |  |\  \ '  '-'  '|  '--.
 `-----' `-----' `--'  `--'   `--'   `--' '--' `-----' `-----'


***********
* CONTROL *
***********


The control routine is responsible for posting useful information to the post window, as well as for freeing nodes at the end of each subsection.

*/

// ***********
// * ROUTINE *
// ***********
~control_routine = Routine({
	"Playing now!".postln;

	// Pick-up measure
	4.wait;

	// Section 2
	"Playing Section 1A!".postln;
	44.wait;
	4.wait;
	s.freeAll;
	4.wait;
	"Playing Section 1B!".postln;
	44.wait;
	4.wait;
	s.freeAll;
	4.wait;

	// Section 2
	"Playing Section 2A!".postln;
	44.wait;
	4.wait;
	s.freeAll;
	4.wait;
	"Playing Section 2B!".postln;
	44.wait;
	4.wait;
	s.freeAll;
	4.wait;

	// Section 3
	"Playing Section 3A!".postln;
	44.wait;
	4.wait;
	s.freeAll;
	4.wait;
	"Playing Section 3B!".postln;
	44.wait;
	6.wait;
	4.wait;
	s.freeAll;
	"Fim!".postln;
});

(

// Useful information
"*************\n**SEQUENCES**\n*************".postln;

"\t * SURDO".postln;
("\t\t 1) " ++ ~surdo_sequence_1.asString).postln;

"\t * PANDEIRO".postln;
("\t\t 1) " ++ ~pandeiro_sequence_1.asString).postln;
("\t\t 2) " ++ ~pandeiro_sequence_2.asString).postln;

"\t * TAMBORIM".postln;
("\t\t 1) " ++ ~tamborim_sequence_1.asString).postln;
("\t\t 2) " ++ ~tamborim_sequence_2.asString).postln;

"\t * REPINIQUE".postln;
("\t\t 1) " ++ ~repinique_sequence_1.asString).postln;
("\t\t 2) " ++ ~repinique_sequence_2.asString).postln;

"\t * CUÍCA".postln;
("\t\t 1) " ++ ~cuica_sequence_1.asString).postln;
("\t\t 2) " ++ ~cuica_sequence_2.asString).postln;


// Execute routines (86 bpm)
~surdo_routine.play(~clock);
~pandeiro_routine.play(~clock);
~tamborim_routine.play(~clock);
~repinique_routine.play(~clock);
~cuica_routine.play(~clock);
~control_routine.play(~clock);
)
)

s.meter;










