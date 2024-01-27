/*

      ___           ___                         ___                       ___
     /\  \         /\  \                       /\  \                     /|  |
    |::\  \       /::\  \         ___         /::\  \       ___         |:|  |
    |:|:\  \     /:/\:\  \       /\__\       /:/\:\__\     /\__\        |:|  |
  __|:|\:\  \   /:/ /::\  \     /:/  /      /:/ /:/  /    /:/__/      __|:|__|
 /::::|_\:\__\ /:/_/:/\:\__\   /:/__/      /:/_/:/__/___ /::\  \     /::::\__\_____
 \:\~~\  \/__/ \:\/:/  \/__/  /::\  \      \:\/:::::/  / \/\:\  \__  ~~~~\::::/___/
  \:\  \        \::/__/      /:/\:\  \      \::/~~/~~~~   ~~\:\/\__\     |:|~~|
   \:\  \        \:\  \      \/__\:\  \      \:\~~\          \::/  /     |:|  |
    \:\__\        \:\__\          \:\__\      \:\__\         /:/  /      |:|__|
     \/__/         \/__/           \/__/       \/__/         \/__/       |/__/
                    ___           ___                         ___
     _____         /\__\         /\  \                       /\__\
    /::\  \       /:/ _/_       /::\  \         ___         /:/ _/_
   /:/\:\  \     /:/ /\__\     /:/\:\  \       /\__\       /:/ /\  \
  /:/ /::\__\   /:/ /:/ _/_   /:/ /::\  \     /:/  /      /:/ /::\  \
 /:/_/:/\:|__| /:/_/:/ /\__\ /:/_/:/\:\__\   /:/__/      /:/_/:/\:\__\
 \:\/:/ /:/  / \:\/:/ /:/  / \:\/:/  \/__/  /::\  \      \:\/:/ /:/  /
  \::/_/:/  /   \::/_/:/  /   \::/__/      /:/\:\  \      \::/ /:/  /
   \:\/:/  /     \:\/:/  /     \:\  \      \/__\:\  \      \/_/:/  /
    \::/  /       \::/  /       \:\__\          \:\__\       /:/  /
     \/__/         \/__/         \/__/           \/__/       \/__/


Matrix Beats.
Project 1; CPSC 431 at Yale University.
By Leonardo von Mutius.

Make your own custom beats and apply transformations!

,--.,--.  ,--. ,---. ,--------.,------. ,--. ,--. ,-----.,--------.,--. ,-----. ,--.  ,--. ,---.
|  ||  ,'.|  |'   .-''--.  .--'|  .--. '|  | |  |'  .--./'--.  .--'|  |'  .-.  '|  ,'.|  |'   .-'
|  ||  |' '  |`.  `-.   |  |   |  '--'.'|  | |  ||  |       |  |   |  ||  | |  ||  |' '  |`.  `-.
|  ||  | `   |.-'    |  |  |   |  |\  \ '  '-'  ''  '--'\   |  |   |  |'  '-'  '|  | `   |.-'    |
`--'`--'  `--'`-----'   `--'   `--' '--' `-----'  `-----'   `--'   `--' `-----' `--'  `--'`-----'

Table of Contents

1) Instruments Overview
2) Rhythms Overview
3) Transformations Overview
2) How to Play

<----INSTRUMENTS OVERVIEW------>
There are 4 instruments: kick, snare, hi-hat, and wurlitzer. Each instrument can play a number of different samples ("notes"), which are represented by symbols.

The KICK has 3 notes:
\o --> soft attack
\O --> medium attack
\X --> hard attack

The SNARE has 3 notes:
\o --> ghost note
\O --> hard attack
\X --> rim shot


The HI-HAT has 2 notes:
\o --> closed-hat attack
\X --> open-hat attack


The WURLITZER has ten notes:
\zero,
\one,
...,
\nine.

Each one of these "notes" are distinct, one-shot, chordal wurlitzer flourishes of different lengths and in different keys. They are meant to be grouped creatively and daringly, with little regard for traditional Western harmonic rules.


<----RHYTHMS OVERVIEW------>

The available durations for notes and rests are:
\sixteenthTriplet
\sixteenth
\eighthTriplet
\eighth
\quarterTriplet
\quarter
\half
\whole

<----TRANSFORMATIONS OVERVIEW------>
The available transformations for each instrument are:
\forward
\backward
\shifted
\inverted
Any permutation of the above

Please note that each transformation must be specified as an array, e.g. [\forward] or [\backward, \shifted]


<----HOW TO PLAY------>
In order to play, the user must specify all required musical information (or uncomment one of the preset beats) in the *USER INPUT* section, then evaluate the code block.


**Globally, the user must specify:**
- the tempo (in BPM)
- whether the eighth notes should be swung (~swing = true/false)
- the *SWING PERCENTAGE*. Namely, this is the ratio of the lengths of the downbeat eighth note to the upbeat eighth note. The minimum swing percentage is 50%, which indicates completely even eighth notes. ~66% indicates that the downbeat eighth takes up 2/3 of the duration of a quarter note, while the upbeat eighth takes 1/3; 80% means that the downbeat eighth takes 4/5 of the duration of a quarter note, while the upbeat eighth takes 1/5; and so on. Consider listening to *PRESET #2* for an example of a swung rhythm. Have fun experimenting with the swing percentages!


**For each instrument, and for each measure, the user must specify:**
- a sequence of notes (specified above)
- a sequence of corresponding note durations (specified above)
- a sequence of transformations (specified above)


**Rules**
- Each instrument must have note, duration, & accent specifications for exactly 2 measures (these sequences are represented by arrays).
- The durations of all measures for all instruments must be the same, though they need not be in 4/4. (We define the duration of a measure as the sum of all durations in that measure, e.g. 4 quarter notes sums to 4). Namely, the user specifies the meter implicitly, rather than explicitly, based on the duration of the measures.
- The number of transformations must be the same for all instruments.


 .----------------.  .----------------.  .----------------.  .----------------.
| .--------------. || .--------------. || .--------------. || .--------------. |
| | _____  _____ | || |    _______   | || |  _________   | || |  _______     | |
| ||_   _||_   _|| || |   /  ___  |  | || | |_   ___  |  | || | |_   __ \    | |
| |  | |    | |  | || |  |  (__ \_|  | || |   | |_  \_|  | || |   | |__) |   | |
| |  | '    ' |  | || |   '.___`-.   | || |   |  _|  _   | || |   |  __ /    | |
| |   \ `--' /   | || |  |`\____) |  | || |  _| |___/ |  | || |  _| |  \ \_  | |
| |    `.__.'    | || |  |_______.'  | || | |_________|  | || | |____| |___| | |
| |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'
 .----------------.  .-----------------. .----------------.  .----------------.  .----------------.
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |     _____    | || | ____  _____  | || |   ______     | || | _____  _____ | || |  _________   | |
| |    |_   _|   | || ||_   \|_   _| | || |  |_   __ \   | || ||_   _||_   _|| || | |  _   _  |  | |
| |      | |     | || |  |   \ | |   | || |    | |__) |  | || |  | |    | |  | || | |_/ | | \_|  | |
| |      | |     | || |  | |\ \| |   | || |    |  ___/   | || |  | '    ' |  | || |     | |      | |
| |     _| |_    | || | _| |_\   |_  | || |   _| |_      | || |   \ `--' /   | || |    _| |_     | |
| |    |_____|   | || ||_____|\____| | || |  |_____|     | || |    `.__.'    | || |   |_____|    | |
| |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'



I have provided two presets for user delectation.
- Preset #1: Pocket Beat. Funky and fresh.
- Preset #2: Swung 8ths. Let's swing these PERCENTAGES, baby!

To play a preset, the user must uncomment the preset (and comment the rest of the *USER INPUT* section), then evaluate the code block.


*/

$ sclang VON_MUTIUS-ASSIGNMENT-3.scd

(
s.waitForBoot( {


/*
                                          _
 _____ _____ _____ _____ _____ _____    _| | |_ ___   _
|  _  | __  |   __|   __|   __|_   _|  |_     _|_  | |_|
|   __|    -|   __|__   |   __| | |    |_     _|_| |_ _
|__|  |__|__|_____|_____|_____| |_|      |_|_| |_____|_|

   __                                                              __
  / /_____ _____ _____ _____ _____ _____    _____ _____ _____ _____\ \
 / /|  _  |     |     |  |  |   __|_   _|  | __  |   __|  _  |_   _|\ \
< < |   __|  |  |   --|    -|   __| | |    | __ -|   __|     | | |   > >
 \ \|__|  |_____|_____|__|__|_____| |_|    |_____|_____|__|__| |_|  / /
  \_\                                                              /_/


Preset #1: Pocket Beat.
Try evaluating the code block below to hear a good ol' fashioned Pocket Beat.

*/


/*

  _______   ____  ___  ___   __
 / ___/ /  / __ \/ _ )/ _ | / /
/ (_ / /__/ /_/ / _  / __ |/ /__
\___/____/\____/____/_/ |_/____/_________________  ____
  / _ \/ _ | / _ \/ _ | /  |/  / __/_  __/ __/ _ \/ __/
 / ___/ __ |/ , _/ __ |/ /|_/ / _/  / / / _// , _/\ \
/_/  /_/ |_/_/|_/_/ |_/_/  /_/___/ /_/ /___/_/|_/___/


*/


~bpm = 120;
~clock = TempoClock(~bpm/60.0);
~swing = false;
~swingPercentage = 1/2; // Do not need to specify since ~swing == false


/*
   __ _____________ __
  / //_/  _/ ___/ //_/
 / ,< _/ // /__/ ,<
/_/|_/___/\___/_/|_|

*/


~kickM1Notes = [
	\O,
	\r,
	\r, \O,
	\r, \o
];

~kickM1Durations = [
	\quarter,
	\quarter,
	\eighth, \eighth,
	\eighth, \eighth
]; // Duration == 4


~kickM2Notes = [
	\O,
	\r,
	\r, \r, \o,
	\r, \o, \r
];

~kickM2Durations = [
	\quarter,
	\quarter,
	\sixteenth, \sixteenth, \eighth,
	\sixteenth, \sixteenth, \eighth
];


~kickTransformations = [
	[\backward],
	[\backward],
	[\shifted, \backward],
	[\inverted]
];


/*
   _____  _____   ___  ____
  / __/ |/ / _ | / _ \/ __/
 _\ \/    / __ |/ , _/ _/
/___/_/|_/_/ |_/_/|_/___/

*/


~snareM1Notes = [
	\r, \o, \r, \r,
	\O, \r, \r, \o,
	\r, \o, \r, \r,
	\O, \r, \r, \o
];

~snareM1Durations = [
	\sixteenth, \sixteenth, \sixteenth, \sixteenth,
	\sixteenth, \sixteenth, \sixteenth, \sixteenth,
	\sixteenth, \sixteenth, \sixteenth, \sixteenth,
	\sixteenth, \sixteenth, \sixteenth, \sixteenth,
];

~snareM2Notes = [
	\r, \o, \r, \r,
	\O, \r, \r, \o,
	\r, \o, \r, \r,
	\O, \r, \r, \o
];

~snareM2Durations = [
	\sixteenth, \sixteenth, \sixteenth, \sixteenth,
	\sixteenth, \sixteenth, \sixteenth, \sixteenth,
	\sixteenth, \sixteenth, \sixteenth, \sixteenth,
	\sixteenth, \sixteenth, \sixteenth, \sixteenth,
];


~snareTransformations = [
	[\forward],
	[\backward, \shifted],
	[\shifted],
	[\inverted, \backward, \shifted]
];


/*
   __ ______    __ _____ ______
  / // /  _/___/ // / _ /_  __/
 / _  // //___/ _  / __ |/ /
/_//_/___/   /_//_/_/ |_/_/

*/


~hihatM1Notes = [
	\o, \r, \X,
	\o, \r, \o, \r,
	\o, \r, \X,
	\o, \r, \o, \r,
];

~hihatM1Durations = [
	\sixteenth, \sixteenth, \eighth,
	\sixteenth, \sixteenth, \sixteenth, \sixteenth,
	\sixteenth, \sixteenth, \eighth,
	\sixteenth, \sixteenth, \sixteenth, \sixteenth
];

~hihatM2Notes = ~hihatM1Notes;

~hihatM2Durations = ~hihatM1Durations;

~hihatTransformations = ~kickTransformations;

/*
  _      ____  _____  __   ______________  _______
 | | /| / / / / / _ \/ /  /  _/_  __/_  / / __/ _ \
 | |/ |/ / /_/ / , _/ /___/ /  / /   / /_/ _// , _/
 |__/|__/\____/_/|_/____/___/ /_/   /___/___/_/|_|

*/

~wurliM1Notes = [
	\seven,
	\r, \eight,
	\r,
	\r,
];

~wurliM1Durations = [
	\quarter,
	\eighth, \eighth,
	\quarter,
	\quarter,
];

~wurliM2Notes = [
	\four,
	\r, \eight,
	\r,
	\r
];

~wurliM2Durations = ~wurliM1Durations;

~wurliTransformations = ~kickTransformations;


// <<COMMENT ENDS HERE>>

/*
 (    (         (
 )\ ) )\ )      )\ )       *   )     _ _       )
(()/((()/( (   (()/( (   ` )  /(   _| | |_  ( /(
 /(_))/(_)))\   /(_)))\   ( )(_)) |_  .  _| )(_))
(_)) (_)) ((_) (_)) ((_) (_(_())  |_     _|((_)  _
| _ \| _ \| __|/ __|| __||_   _|    |_|_|  |_  )(_)
|  _/|   /| _| \__ \| _|   | |              / /  _
|(|  |_|_\|___||___/|___|  )_|             /___|(_)      (
 )\ )  (  (             ( /(  (        (         )    )  )\ )
(()/(  )\))(   '    (   )\()) )\ )     )\ (   ( /( ( /( (()/(
 /(_))((_)()\ )     )\ ((_)\ (()/(    ((_))\  )\()))\()) /(_))
(_))  _(())\_)() _ ((_) _((_) /(_))_    _((_)(_))/((_)\ (_))
/ __| \ \((_)/ /| | | || \| |(_)) __|  ( _ ) | |_ | |(_)/ __|
\__ \  \ \/\/ / | |_| || .` |  | (_ |  / _ \ |  _|| ' \ \__ \
|___/   \_/\_/   \___/ |_|\_|   \___|  \___/  \__||_||_||___/



Preset #2: Swung 8ths.
Uncomment the code block below to hear a fire swung funk beat! Try experimenting with the swing percentages.

*/

// <<COMMENT STARTS HERE>>
/*

~bpm = 140;
~clock = TempoClock(~bpm/60.0);
~swing = true;
~swingPercentage = 2/3;

// Some fun swing percentages (you must reevaluate the entire code block):
// ~swingPercentage = 6/7;
// ~swingPercentage = 0.8;


/*
   __ _____________ __
  / //_/  _/ ___/ //_/
 / ,< _/ // /__/ ,<
/_/|_/___/\___/_/|_|

*/


~kickM1Notes = [
	\X,
	\r, \O,
	\r,
	\r, \O
];

~kickM1Durations = [
	\quarter,
	\eighth,\eighth,
	\quarter,
	\eighth, \eighth
];


~kickM2Notes = [
	\r, \o,
	\O, \r,
	\r, \r,
	\r, \o
];

~kickM2Durations = [
	\eighth, \eighth,
	\eighth, \eighth,
	\eighth, \eighth,
	\eighth, \eighth
];


~kickTransformations = [
	[\backward],
	[\backward],
	[\shifted, \backward],
	[\inverted]
];


/*
   _____  _____   ___  ____
  / __/ |/ / _ | / _ \/ __/
 _\ \/    / __ |/ , _/ _/
/___/_/|_/_/ |_/_/|_/___/

*/


~snareM1Notes = [
	\r,
	\X
];

~snareM1Durations = [
	\half,
	\half
];

~snareM2Notes = ~snareM1Notes;

~snareM2Durations = ~snareM1Durations;


~snareTransformations = [
	[\forward],
	[\backward, \shifted],
	[\shifted],
	[\inverted, \backward, \shifted]
];


/*
   __ ______    __ _____ ______
  / // /  _/___/ // / _ /_  __/
 / _  // //___/ _  / __ |/ /
/_//_/___/   /_//_/_/ |_/_/

*/


~hihatM1Notes = [
	\o, \o,
	\o, \o,
	\o, \o,
	\o, \o
];

~hihatM1Durations = [
	\eighth, \eighth,
	\eighth, \eighth,
	\eighth, \eighth,
	\eighth, \eighth,
];

~hihatM2Notes = [
[
	\o, \o,
	\o, \o,
	\o, \o,
	\o, \o
],
[
	\o, \o,
	\X, \X,
	\o, \o,
	\o, \o
	]].choose;

~hihatM2Durations = ~hihatM1Durations;

~hihatTransformations = ~kickTransformations;

/*
  _      ____  _____  __   ______________  _______
 | | /| / / / / / _ \/ /  /  _/_  __/_  / / __/ _ \
 | |/ |/ / /_/ / , _/ /___/ /  / /   / /_/ _// , _/
 |__/|__/\____/_/|_/____/___/ /_/   /___/___/_/|_|

*/

~wurliM1Notes = [
	\four,
	\r, \three,
	\r,
	\r,
];

~wurliM1Durations = [
	\quarter,
	\eighth, \eighth,
	\quarter,
	\quarter,
];

~wurliM2Notes = [
	\r, \six,
	\r,
	\eight,
	\r
];

~wurliM2Durations = [
	\eighth, \eighth,
	\quarter,
	\quarter,
	\quarter,
];

~wurliTransformations = [
		[\forward],
		[\backward],
		[\shifted],
		[\backward]
];


// <<COMMENT ENDS HERE>>
*/

/*

      (               )     )
   (  )\ )   (     ( /(  ( /(
 ( )\(()/(   )\    )\()) )\())
 )((_)/(_)|(((_)( ((_)\|((_)\
((_)_(_))  )\ _ )\ _((_)_ ((_)
 | _ ) |   (_)_\(_) \| | |/ /
 | _ \ |__  / _ \ | .` | ' <
 (___(____|/_/ \_\|_|\_|_|\_\
 )\ ))\ )   (      *   )
(()/(()/(   )\   ` )  /((
 /(_))(_)|(((_)(  ( )(_))\
(_))(_))  )\ _ )\(_(_()|(_)
/ __| |   (_)_\(_)_   _| __|
\__ \ |__  / _ \   | | | _|
|___/____|/_/ \_\  |_| |___|


Uncomment and fill in the code below to generate your own Matrix Beat.

*/

/*
~bpm = 0;
~clock = TempoClock(~bpm/60);
~swing = false;
~swingPercentage = 1/2;

~kickM1Notes = [];
~kickM1Durations = [];

~kickM2Notes = [];
~kickM2Durations = [];

~snareM1Notes = [];
~snareM1Durations = [];

~snareM2Notes = [];
~snareM2Durations = [];

~hihatM1Notes = [];
~hihatM1Durations = [];

~hihatM2Notes = [];
~hihatM2Durations = [];

~wurliM1Notes = [];
~wurliM1Durations = [];

~wurliM2Notes = [];
~wurliM2Durations = [];
*/


/*
 ___   __    _  _______  _______  ______    __   __  __   __  _______  __    _  _______  _______
|   | |  |  | ||       ||       ||    _ |  |  | |  ||  |_|  ||       ||  |  | ||       ||       |
|   | |   |_| ||  _____||_     _||   | ||  |  | |  ||       ||    ___||   |_| ||_     _||  _____|
|   | |       || |_____   |   |  |   |_||_ |  |_|  ||       ||   |___ |       |  |   |  | |_____
|   | |  _    ||_____  |  |   |  |    __  ||       ||       ||    ___||  _    |  |   |  |_____  |
|   | | | |   | _____| |  |   |  |   |  | ||       || ||_|| ||   |___ | | |   |  |   |   _____| |
|___| |_|  |__||_______|  |___|  |___|  |_||_______||_|   |_||_______||_|  |__|  |___|  |_______|


In this section of the code, for each instrument, we:
- Load in samples from the project directory into buffers
- Generate custom SynthDefs

All samples were obtained legally through the Splice platform.
The sample pack(s) used in the current version of the project are:
-  `Jazzfeezy x Platinum Club - That 70's Psych Pack`.
-  `Pocket Drums with Corey Fonville`


*/

// Boilerplate code to allow accessing files (samples) through relative paths
thisProcess.platform.recordingsDir = thisProcess.nowExecutingPath.dirname;

/*

  _  _____ ___ _  ___
 | |/ /_ _/ __| |/ / |
 | ' < | | (__| ' <|_|
 |_|\_\___\___|_|\_(_)


*/


// Initialize an array of with the sample file names
~kickNames = [
    "kick_one_shot_dry_soft",
    "kick_one_shot_dry_medium",
	"kick_one_shot_dry_hard",
];

// Load samples into an array of buffers
~kickBuffers = ~kickNames.collect { |name| Buffer.read(s, thisProcess.nowExecutingPath.dirname ++ "/JPC_TSP_" ++ name ++ ".wav") };

/*
Initialize SynthDef
Features:
- `pitch` indexes ~kick to access different samples
- `amp` is the base amplitude parameter
- `ampMult` is a hard-coded multiplier that exaggerates the amplitude difference between samples.
The objective is to make ghost notes quieter and hard attacks louder.
*/

SynthDef(\kick, { |out = 0, pitch = 0, amp = 0.5, rate = 1.0|
	var pitchInt, ampMult, bufnum, sig;
    pitchInt = pitch.round; // Discretize the pitch
	ampMult = Select.kr(pitchInt > 1, [1, 1.5]); // make hard attack louder
    bufnum = Select.kr(pitchInt, ~kickBuffers);
    sig = PlayBuf.ar(2, bufnum, rate, loop: 0) * amp * ampMult;
    Out.ar(out, sig);
}).add;


// Testing
// Synth(\kick, [\pitch, 0]);
// Synth(\kick, [\pitch, 1]);
// Synth(\kick, [\pitch, 2]);


/*

  ___ _  _   _   ___ ___ _
 / __| \| | /_\ | _ \ __| |
 \__ \ .` |/ _ \|   / _||_|
 |___/_|\_/_/ \_\_|_\___(_)


*/


// Snare file names
~snareNames = [
    "snare_one_shot_dry_soft",
    "snare_one_shot_fat_hard",
	"snare_hit_rim_chill_close"
];

~snareBuffers = ~snareNames.collect { |name| Buffer.read(s, thisProcess.nowExecutingPath.dirname ++ "/JPC_TSP_" ++ name ++ ".wav") };


SynthDef(\snare, { |out = 0, pitch = 0, amp = 0.5, rate = 1.0|
    var pitchInt, bufnum, sig, ampMult;
    pitchInt = pitch.round;

	ampMult = Select.kr(pitchInt > 0, [0.5, 1]); // Decreases amplitude if ghost note, increases otherwise

    bufnum = Select.kr(pitchInt, ~snareBuffers); // Select the corret buffer

    sig = PlayBuf.ar(2, bufnum, rate, loop: 0) * amp * ampMult;
    Out.ar(out, sig);
}).add;

// Testing
// Synth(\snare, [\pitch, 0]);
// Synth(\snare, [\pitch, 1]);
// Synth(\snare, [\pitch, 2]);


/*

  _  _ ___    _  _   _ _____ _
 | || |_ _|__| || | /_\_   _| |
 | __ || |___| __ |/ _ \| | |_|
 |_||_|___|  |_||_/_/ \_\_| (_)


*/


// Hi-hat file names
~hihatNames = [
    "hihat_one_shot_dry_medium",
    "hihat_one_shot_dry_open"
];

~hihatBuffers = ~hihatNames.collect { |name| Buffer.read(s, thisProcess.nowExecutingPath.dirname ++ "/JPC_TSP_" ++ name ++ ".wav") };

SynthDef(\hihat, { |out = 0, pitch = 0, amp = 1, rate = 1.0 |
	var pitchInt, bufnum, sig, ampMult;
	amp = 0.03;
	pitchInt = pitch.round;
	bufnum = Select.kr(pitch, ~hihatBuffers);
	sig = PlayBuf.ar(2, bufnum, rate, doneAction: 2) * amp;
	Out.ar(out, sig);
}).add;

//Testing
// Synth(\hihat, [\pitch, 0]);
// Synth(\hihat, [\pitch, 1]);


/*

 __      ___   _ ___ _    ___ _____ _______ ___ _
 \ \    / / | | | _ \ |  |_ _|_   _|_  / __| _ \ |
  \ \/\/ /| |_| |   / |__ | |  | |  / /| _||   /_|
   \_/\_/  \___/|_|_\____|___| |_| /___|___|_|_(_)


*/


// Initialize an array of Wurlitzer file names
~wurliNames = [
	"wurlitzer_one_shot_bellbottom_A#min", //0
    "wurlitzer_one_shot_bitterend_Fmaj", //1
    "wurlitzer_one_shot_Daisy_Cmin", //2
    "wurlitzer_one_shot_flowerchild_Fmin", //3
    "wurlitzer_one_shot_groovy_F#min", //4
    "wurlitzer_one_shot_leather_Emin", //5
    "wurlitzer_one_shot_linen_C#maj", //6
    "wurlitzer_one_shot_mildhigh_F#min", //7
    "wurlitzer_one_shot_peace_Emaj", //8
    "wurlitzer_one_shot_venus_A#min" //9
];

// Build an array of Wurlitzer sample buffers
~wurliBuffers = ~wurliNames.collect { |name| Buffer.read(s, thisProcess.nowExecutingPath.dirname ++ "/JPC_TSP_" ++ name ++ ".wav") };

// Define the Wurlitzer SynthDef
SynthDef(\wurlitzer, { |out = 0, pitch = 0, amp = 0.5, rate = 1.0|
	var pitchInt, bufnum, sig;
	amp = 0.5;
	pitchInt = pitch.round; // Discretize the pitch
	bufnum = Select.kr(pitchInt, ~wurliBuffers);
	sig = PlayBuf.ar(2, bufnum, rate, loop: 0, doneAction: 2) * amp;
   Out.ar(out, sig);
}).add;

//Testing
// Synth(\wurlitzer, [\pitch, 0]);
// Synth(\wurlitzer, [\pitch, 1]);
// Synth(\wurlitzer, [\pitch, 2]);
// Synth(\wurlitzer, [\pitch, 3]);
// Synth(\wurlitzer, [\pitch, 4]);
// Synth(\wurlitzer, [\pitch, 5]);
// Synth(\wurlitzer, [\pitch, 6]);
// Synth(\wurlitzer, [\pitch, 7]);
// Synth(\wurlitzer, [\pitch, 8]);
// Synth(\wurlitzer, [\pitch, 9]);


/*
 __   __  _______  ___      _______  _______  ______
|  | |  ||       ||   |    |       ||       ||    _ |
|  |_|  ||    ___||   |    |    _  ||    ___||   | ||
|       ||   |___ |   |    |   |_| ||   |___ |   |_||_
|       ||    ___||   |___ |    ___||    ___||    __  |
|   _   ||   |___ |       ||   |    |   |___ |   |  | |
|__| |__||_______||_______||___|    |_______||___|  |_|
 _______  __   __  __    _  _______  _______  ___   _______  __    _  _______
|       ||  | |  ||  |  | ||       ||       ||   | |       ||  |  | ||       |
|    ___||  | |  ||   |_| ||       ||_     _||   | |   _   ||   |_| ||  _____|
|   |___ |  |_|  ||       ||       |  |   |  |   | |  | |  ||       || |_____
|    ___||       ||  _    ||      _|  |   |  |   | |  |_|  ||  _    ||_____  |
|   |    |       || | |   ||     |_   |   |  |   | |       || | |   | _____| |
|___|    |_______||_|  |__||_______|  |___|  |___| |_______||_|  |__||_______|


You probably don't need to read this.


  ___ ___ ___  ___  ___
 | __| _ \ _ \/ _ \| _ \
 | _||   /   / (_) |   /
 |___|_|_\_|_\\___/|_|_\____ _  _  ___
  / __| || | __/ __| |/ /_ _| \| |/ __|
 | (__| __ | _| (__| ' < | || .` | (_ |
  \___|_||_|___\___|_|\_\___|_|\_|\___|


Error checking logic.

*/

~clockNilErrorCheck = {
		if (~clock == nil,
			{throw("\t{ErrorChecking} Error: You have not specified inputs correctly. If this is your first time using the program, please read the instructions and uncomment one of the presets.")});
	};

// Check that all measures have the same durations.
~measureSizeDiscrepancyErrorCheck = {
	var rawArray, numberArray, val;

	rawArray = [
			~kickM1Durations,
			~kickM2Durations,
			~snareM1Durations,
			~snareM2Durations,
			~hihatM1Durations,
			~hihatM2Durations,
			~wurliM1Durations,
			~wurliM2Durations
	];

	numberArray = Array.fill(8, 0);

	rawArray.do { |array, i|
			val = ~convertDurations.value(array);
			numberArray[i] = val.sum;
		};

	val = numberArray[0];

	numberArray.do { |i|
			if((numberArray[i] != val),
				{throw("\t{ErrorChecking} Error: Input size discrepancy. The following array has a different total duration than its predecessor(s): " ++ rawArray[i])});
		};

		"\t{ErrorChecking} Success: No size discrepancy between all duration arrays.".postln;
};

~transformationSizeDiscrepancyErrorCheck = {
	var rawArray, val;

	rawArray = [
			~kickTransformations,
			~snareTransformations,
			~hihatTransformations,
			~wurliTransformations
	];

	val = ~kickTransformations.size;
	rawArray.size.do { |i|
			if((rawArray[i].size != val),
				{throw("\t{ErrorChecking} Error: Input size discrepany. The following array has a different total duration than its predecessor(s): " ++ rawArray[i])});
		};

		"\t{ErrorChecking} Success: No size discrepancy between all transformation arrays.".postln;
};

// Debugging:
// ~measureSizeDiscrepancyErrorCheck.value;

// Check that `notes` array and `durations` array have the same size.
~sizeDiscrepancyErrorCheck = { |notes, durations, instrument|
	if(notes.size != durations.size,
		{throw("\t{ErrorChecking} Error: Input size discrepany. Notes array and durations array are not of the same size.")})};


/*

  _  _  ___ _____ ___
 | \| |/ _ \_   _| __|
 | .` | (_) || | | _|
 |_|\_|\___/_|_|_|___|____ ___  ___ ___ ___  _  _
  / __/ _ \| \| \ \ / / __| _ \/ __|_ _/ _ \| \| |
 | (_| (_) | .` |\ V /| _||   /\__ \| | (_) | .` |
  \___\___/|_|\_|_\_/_|___|_|_\|___/___\___/|_|\_|
 | |  / _ \ / __|_ _/ __|
 | |_| (_) | (_ || | (__
 |____\___/ \___|___\___|


Logic for converting abstracted, symbolic representation of notes into numbers that the computer can understand.

*/


// Convert kick symbols into numeric pitch representation to index the correct buffers
~convertKick = { |sequence, instrument|
	var pitchArray, pitch;
	pitchArray = Array.newClear(sequence.size);
	sequence.do{ |symbol, i|
		switch(symbol,
			\o, {pitch = 0;},
			\O, {pitch = 1;},
			\X, {pitch = 2;},
			\r, {pitch = \rest},
			{ throw("Unknown symbol `" ++ symbol ++ "`specified for instrument " ++ instrument ++ ". Please check your spelling.")}
		);
		pitchArray.put(i, pitch);
	};
	pitchArray;
};

// Convert snare symbols into numeric pitch representation to index the correct buffers
~convertSnare = { |sequence, instrument|
	var pitchArray, pitch;
	pitchArray = Array.newClear(sequence.size);
	sequence.do{ |symbol, i|
		switch(symbol,
			\o, {pitch = 0;},
			\O, {pitch = 1;},
			\X, {pitch = 2;},
			\r, {pitch = \rest},
			{ throw("Unknown symbol `" ++ symbol ++ "`specified for instrument " ++ instrument ++ ". Please check your spelling.")}
		);
		pitchArray.put(i, pitch);
	};
	pitchArray;
};

// Convert hihat symbols into numeric pitch representation to index the correct buffers
~convertHiHat = { |sequence, instrument|
	var pitchArray, pitch;
	pitchArray = Array.newClear(sequence.size);
	sequence.do{ |symbol, i|
		switch(symbol,
			\o, {pitch = 0;},
			\X, {pitch = 1;},
			\r, {pitch = \rest},
			{ throw("Unknown symbol `" ++ symbol ++ "`specified for instrument " ++ instrument ++ ". Please check your spelling.")}
		);
		pitchArray.put(i, pitch);
	};
	pitchArray;
};

// Convert wurlitzer symbols into numeric pitch representation to index the correct buffers
~convertWurli= { |sequence, instrument|
	var pitchArray, pitch;
	pitchArray = Array.newClear(sequence.size);
	sequence.do{ |symbol, i|
		switch(symbol,
			\zero, {pitch = 0;},
			\one, {pitch = 1;},
			\two, {pitch = 2;},
			\three, {pitch = 3;},
			\four, {pitch = 4;},
			\five, {pitch = 5;},
			\six, {pitch = 6;},
			\seven, {pitch = 7;},
			\eight, {pitch = 8;},
			\nine, {pitch = 9;},
			\r, {pitch = \rest},
			{ throw("Unknown symbol `" ++ symbol ++ "`specified for instrument " ++ instrument ++ ". Please check your spelling.")}
		);
		pitchArray.put(i, pitch);
	};
	pitchArray;
};

/*
FUNCTION: ~convertNotes
Input:
- an array of unpitched notes (`notes`), e.g. [\O, \r, \o, \O]
- the name of a SynthDef (`instrument`), e.g. \kick

Output:
- An array where the note symbols have been translated into discrete pitch values used to index the buffer array.
*/

~convertNotes = { |notes, instrument|
	var notesNumbers;

	switch(instrument,
		\kick, {notesNumbers = ~convertKick.value(notes, instrument);},
		\snare, {notesNumbers = ~convertSnare.value(notes, instrument);},
		\hihat, {notesNumbers = ~convertHiHat.value(notes, instrument);},
		\wurlitzer, {notesNumbers = ~convertWurli.value(notes, instrument);});

		// ("\t{~convertNotes}: notesNumbers = " ++ notesNumbers).postln;
	notesNumbers;
};


/*

  ___  _   _ ___    _ _____ ___ ___  _  _
 |   \| | | | _ \  /_\_   _|_ _/ _ \| \| |
 | |) | |_| |   / / _ \| |  | | (_) | .` |
 |___/ \___/|_|_\/_/ \_\_| |___\___/|_|\_|_  _  _
  / __/ _ \| \| \ \ / / __| _ \/ __|_ _/ _ \| \| |
 | (_| (_) | .` |\ V /| _||   /\__ \| | (_) | .` |
  \___\___/|_|\_|_\_/_|___|_|_\|___/___\___/|_|\_|
 | |  / _ \ / __|_ _/ __|
 | |_| (_) | (_ || | (__
 |____\___/ \___|___\___|


Logic for converting abstracted, symbolic representation of note durations into numbers that the computer can understand.

*/

// Convert duration symbols into numbers
~convertDurations = { |durations|

	~numericDurationsArray = Array.newClear(durations.size);

	// Debugging
	// ("numericDurationsArray = " ++ ~numericDurationsArray).postln;
	// ("durations =  " ++ durations).postln;
	// ("About to iterate over `durations` array.".postln;);

	durations.do { |symbol, i|
		switch(symbol,
			\sixteenthTriplet, {~numericDurationsArray.put(i, (2 / 3 / 4));},
			\sixteenth, {~numericDurationsArray.put(i, (1/4));},
			\eighthTriplet, {~numericDurationsArray.put(i, (2 / 3 / 2));},
			\eighth, {~numericDurationsArray.put(i, (1/2));},
			\quarterTriplet, {~numericDurationsArray.put(i, (2 / 3));},
			\quarter, {~numericDurationsArray.put(i, 1);},
			\half, {~numericDurationsArray.put(i, 2);},
			\whole, {~numericDurationsArray.put(i, 4);},
			{ throw("Unknown duration `" ++ symbol ++ "` specified. Please check your spelling.")}
	)};

	// ("Iteration finished.".postln;);
	// ("\t{~convertDurations}: durationsNumbers = " ++ ~numericDurationsArray).postln;
	~numericDurationsArray;
};


/*
FUNCTION: ~applySwingPercentages
Input:
- an array of duration symbols (`durationsSymbols`)
- an array of numeric duration values (`durationsNumbers`)
- a value for swingPercentage, 0.5 ≤ swing Percentage < 1.0 (`swingPercentage`)
Output:
- an array of numeric duration values with swing values

*/
~applySwingPercentage = {
	| durationsSymbols, durationsNumbers, swingPercentage |
	var size, durationsCopy, swingBooleanArray, currentSubdivision;

	size = durationsSymbols.size;
	durationsCopy = durationsNumbers.copy;
	swingBooleanArray = Array.fill(size, { false });
	currentSubdivision = 0;

	// "*************".postln;
	// Create a boolean array to determine which rhythms must be swung. Then, alter the values accordingly.
	durationsNumbers.do { |value, i|

		// Calculate subdivision (1, e, &, +) to determine which notes to swing
		currentSubdivision = currentSubdivision - currentSubdivision.floor;

		// Debugging
		// ("currentSubdivision at iteration " ++ i ++ " is " ++ currentSubdivision).postln;


		// Fill in swingBooleanArray, which determines which notes to swing
		if (durationsSymbols[i] == \eighth) {
			if (currentSubdivision == 0) {swingBooleanArray[i] = true };
			if (currentSubdivision == 0.5
				&& swingBooleanArray[i - 1] == true) {swingBooleanArray[i] = true};
		};


		if (durationsSymbols[i] == \sixteenth) {
			if (currentSubdivision == 0.5
				&& swingBooleanArray[i - 1] == true) {swingBooleanArray[i] = true};
			if (currentSubdivision == 0.75
				&& swingBooleanArray[i - 1] == true) {swingBooleanArray[i] = true};
		};

		// Change the note values of swung notes
		if (swingBooleanArray[i] == true
			&& durationsSymbols[i] == \eighth) {
			if (currentSubdivision == 0) {durationsCopy[i] = swingPercentage};
				if (currentSubdivision == 0.5) {durationsCopy[i] = (1 - swingPercentage)};
		};

		if (swingBooleanArray[i] == true
				&& durationsSymbols[i] == \sixteenth) {durationsCopy[i] = ((1 - swingPercentage) / 2)};

		currentSubdivision = currentSubdivision + durationsNumbers[i];

	};


	// ("\t{~applySwingPercentage}: " ++ durationsCopy).postln;
	durationsCopy;
};


/*

  _____ ___    _   _  _ ___ ___ ___  ___ __  __   _ _____ ___ ___  _  _
 |_   _| _ \  /_\ | \| / __| __/ _ \| _ \  \/  | /_\_   _|_ _/ _ \| \| |
   | | |   / / _ \| .` \__ \ _| (_) |   / |\/| |/ _ \| |  | | (_) | .` |
   |_| |_|_\/_/_\_\_|\_|___/_| \___/|_|_\_|  |_/_/ \_\_| |___\___/|_|\_|
  / __/ _ \| \| \ \ / / __| _ \/ __|_ _/ _ \| \| |
 | (_| (_) | .` |\ V /| _||   /\__ \| | (_) | .` |
  \___\___/|_|\_|_\_/_|___|_|_\|___/___\___/|_|\_|
 | |  / _ \ / __|_ _/ __|
 | |_| (_) | (_ || | (__
 |____\___/ \___|___\___|

*/

// Logic for creating the inversion transformation
~invert = { |sequence|
    var result = [];
    var len = sequence.size;
    var midIndex = len.div(2);
    var leftIndex, rightIndex;

    // Determine left and right indices based on sequence length
    if(len % 2 == 0) {
        leftIndex = midIndex - 1;
        rightIndex = midIndex;
    } {
        leftIndex = midIndex - 1;
        rightIndex = midIndex + 1;
        result = result.add(sequence[midIndex]); // Add middle for odd length
    };

    // Perform alternating inversion
    (len.div(2)).do { |i|
        if(leftIndex >= 0) {
            result = result.add(sequence[leftIndex]);
            leftIndex = leftIndex - 1;
        };
        if(rightIndex < sequence.size) {
            result = result.add(sequence[rightIndex]);
            rightIndex = rightIndex + 1;
        };
    };

    result;
};

// Logic for applying transformations to a sequence (notes or durations) according to an inputted transformation specification
~applyTransformations = { |transformations, sequence, shiftAmount = 2|
    transformations.do { |transformation|
        switch(transformation,
            \backward, { sequence = sequence.reverse },
            \shifted, { sequence = sequence.rotate(shiftAmount) },
            \forward, { /* do nothing */ },
			\inverted, { sequence = ~invert.value(sequence) }
        );
    };
    sequence;
};


/*

  ___  _ _____ _____ ___ ___ _  _     __  __   _   _  _____ _  _  ___
 | _ \/_\_   _|_   _| __| _ \ \| |___|  \/  | /_\ | |/ /_ _| \| |/ __|
 |  _/ _ \| |   | | | _||   / .` |___| |\/| |/ _ \| ' < | || .` | (_ |
 |_|/_/ \_\_|   |_| |___|_|_\_|\_|   |_|  |_/_/ \_\_|\_\___|_|\_|\___|

Logic for creating and transforming Pbinds.


FUNCTION: ~convertSequencesToPattern
Input:
- a sequence of notes (`notes`). The sequence of notes is an array which specifies the order of samples and rests to be played. Different characters map to different samples in each instrument. e.g. [\O, \r, \o, \O] maps to medium attack, rest, soft attack, and medium attack, respectively, on the kick drum.

- a sequence of durations (`durations`). The sequence of durations is an an array which specifies the note value of each corresponding sample in `notes`. e.g. [\quarter, \quarter, \eighth, \eighth]

- the name of a SynthDef (`instrument`). `instrument` should be a symbol for the appropriate instrument. e.g. \kick

Output:
- a Pbind

Explanation: At a high level, this function takes an input of symbol arrays and de-abstracts them into something the computer can understand. Namely, `sequence` and `durations` are abstractions for the actual sequences of buffers and durations,respectively, and this function translates these abstractions into meaningful numbers.

*/


~convertSequencesToPattern = { |notes, durations, instrument, transformations = nil, swing = false, swingPercentage = (1/2) |
	var notesNumbers, durationsNumbers;


	// Check that `notes` and `duration` are arrays of the same size
	~sizeDiscrepancyErrorCheck.value(notes, durations, instrument);

	// convert notes from abstracted symbols into nunmbers
	notesNumbers = ~convertNotes.value(notes, instrument);

	// convert durations from abstracted symbols into numbers
	durationsNumbers = ~convertDurations.value(durations);

	// Generate transformations if needed
	if((transformations != nil), {
		notesNumbers = ~applyTransformations.value(transformations, notesNumbers);
		durationsNumbers = ~applyTransformations.value(transformations, durationsNumbers);
	});

	// Apply calculations for swing percentages if needed
	if (swing == true,
	{durationsNumbers = ~applySwingPercentage.value(durations, durationsNumbers, swingPercentage)});

	Pbind(
		\instrument, instrument,
		\pitch, Pseq(notesNumbers, 1),
		\dur, Pseq(durationsNumbers, 1));
};


/*

   ____ ___  _   _ _____ ____   ___  _
  / ___/ _ \| \ | |_   _|  _ \ / _ \| |
 | |  | | | |  \| | | | | |_) | | | | |
 | |__| |_| | |\  | | | |  _ <| |_| | |___
  \____\___/|_| \_| |_| |_| \_\\___/|_____|


In this section, the program
- runs error-checking
- builds Pbinds for all instruments
- builds routines for all instruments
- executes the routines

*/

/*******
*SET-UP*
*******/

"<< SETTING UP >>".postln;
~clockNilErrorCheck.value();
~measureSizeDiscrepancyErrorCheck.value();
~transformationSizeDiscrepancyErrorCheck.value();

/******
*KICK*
*****/

"<< NOW LOADING: KICK >>".postln;

// Build measure 1 (no transformations)
~kickM1 = ~convertSequencesToPattern.value(~kickM1Notes, ~kickM1Durations, \kick, nil, ~swing, ~swingPercentage);

// Build measure 2 (no transformations)
~kickM2 = ~convertSequencesToPattern.value(~kickM2Notes, ~kickM2Durations, \kick, nil, ~swing, ~swingPercentage);

// Concatenate measures 1 & 2 to form the Head
~kickHead = Pseq([~kickM1, ~kickM2], 1);

// Initialize an empty array to store transformations
~kickTransformArray = Array.fill(~kickTransformations.size * 2);

// Generate transformation measures
~kickTransformations.size.do { |i|
		var temp1, temp2, transformation;

		transformation = ~kickTransformations[i];
		temp1 = ~convertSequencesToPattern.value(~kickM1Notes, ~kickM1Durations, \kick, nil, transformation, ~swing, ~swingPercentage);
		temp2 = ~convertSequencesToPattern.value(~kickM2Notes, ~kickM2Durations, \kick, nil, transformation, ~swing, ~swingPercentage);

	~kickTransformArray[(2 * i)] = temp1;
	~kickTransformArray[(2 * i) + 1] = temp2;

};

// Build the routine
~kickRoutine = Routine({

	~kickHead.play(~clock);
	8.wait;
	~kickHead.play(~clock);
	8.wait;

	~kickTransformArray.size.do { |i|
			~kickTransformArray[i].play(~clock);
			4.wait;
		};

	~kickHead.play(~clock);
	8.wait;
	~kickHead.play(~clock);
	8.wait;

});

/*******
*SNARE*
******/

"<< NOW LOADING: SNARE >>".postln;



// Build measure 1 (no transformations)
~snareM1 = ~convertSequencesToPattern.value(~snareM1Notes, ~snareM1Durations, \snare, nil, ~swing, ~swingPercentage);

// Build measure 2 (no transformations)
~snareM2 = ~convertSequencesToPattern.value(~snareM2Notes, ~snareM2Durations, \snare, nil, ~swing, ~swingPercentage);

// Concatenate measures 1 & 2 to form the Head
~snareHead = Pseq([~snareM1, ~snareM2], 1);

// Initialize an empty array to store transformations
~snareTransformArray = Array.fill(~snareTransformations.size * 2);

// Generate transformation measures
~snareTransformations.size.do { |i|
		var temp1, temp2, transformation;

		transformation = ~snareTransformations[i];
		temp1 = ~convertSequencesToPattern.value(~snareM1Notes, ~snareM1Durations, \snare, transformation, ~swing, ~swingPercentage);
		temp2 = ~convertSequencesToPattern.value(~snareM2Notes, ~snareM2Durations, \snare, transformation, ~swing, ~swingPercentage);

	~snareTransformArray[(2 * i)] = temp1;
	~snareTransformArray[(2 * i) + 1] = temp2;

};

// Build the routine
~snareRoutine = Routine({
	~snareHead.play(~clock);
	8.wait;
	~snareHead.play(~clock);
	8.wait;

	~snareTransformArray.size.do { |i|
			~snareTransformArray[i].play(~clock);
			4.wait;
	};

	~snareHead.play(~clock);
	8.wait;
	~snareHead.play(~clock);
	8.wait;
});

/*******
*HIHAT*
******/

"<< NOW LOADING: HIHAT >>".postln;
~hihatM1 = ~convertSequencesToPattern.value(~hihatM1Notes, ~hihatM1Durations, \hihat, nil, ~swing, ~swingPercentage);

~hihatM2 = ~convertSequencesToPattern.value(~hihatM2Notes, ~hihatM2Durations, \hihat, nil, ~swing, ~swingPercentage);

~hihatHead = Pseq([~hihatM1, ~hihatM2], 1);

~hihatTransformArray = [];

~hihatTransformArray = Array.fill(~hihatTransformations.size * 2);

~hihatTransformations.size.do { |i|
		var temp1, temp2, transformation;

		transformation = ~hihatTransformations[i];
		temp1 = ~convertSequencesToPattern.value(~hihatM1Notes, ~hihatM1Durations, \hihat, transformation, ~swing, ~swingPercentage);
		temp2 = ~convertSequencesToPattern.value(~hihatM2Notes, ~hihatM2Durations, \hihat, transformation, ~swing, ~swingPercentage);

	~hihatTransformArray[(2 * i)] = temp1;
	~hihatTransformArray[(2 * i) + 1] = temp2;

};

~hihatRoutine = Routine({
	~hihatHead.play(~clock);
	8.wait;
	~hihatHead.play(~clock);
	8.wait;

	~hihatTransformArray.size.do { |i|
		~hihatTransformArray[i].play(~clock);
		4.wait;
	};
	~hihatHead.play(~clock);
	8.wait;
	~hihatHead.play(~clock);
	8.wait;
});

/***********
*WURLITZER*
**********/

"<< NOW LOADING: WURLITZER >>".postln;
~wurliM1 = ~convertSequencesToPattern.value(~wurliM1Notes, ~wurliM1Durations, \wurlitzer, nil, ~swing, ~swingPercentage);

~wurliM2 = ~convertSequencesToPattern.value(~wurliM2Notes, ~wurliM2Durations, \wurlitzer, nil, ~swing, ~swingPercentage);

~wurliHead = Pseq([~wurliM1, ~wurliM2], 1);

~wurliTransformArray = [];

~wurliTransformArray = [];

~wurliTransformArray = Array.fill(~wurliTransformations.size * 2);

~wurliTransformations.size.do { |i|
		var temp1, temp2, transformation;

		transformation = ~wurliTransformations[i];
		temp1 = ~convertSequencesToPattern.value(~wurliM1Notes, ~wurliM1Durations, \wurlitzer, transformation, ~swing, ~swingPercentage);
		temp2 = ~convertSequencesToPattern.value(~wurliM2Notes, ~wurliM2Durations, \wurlitzer, transformation, ~swing, ~swingPercentage);

	~wurliTransformArray[(2 * i)] = temp1;
	~wurliTransformArray[(2 * i) + 1] = temp2;

};

~wurliRoutine = Routine({
	~wurliHead.play(~clock);
	8.wait;
	~wurliHead.play(~clock);
	8.wait;

	~wurliTransformArray.size.do { |i|
		~wurliTransformArray[i].play(~clock);
		4.wait;
	};

	~wurliHead.play(~clock);
	8.wait;
	~wurliHead.play(~clock);
	8.wait;
});

/*********
*CONTROL*
********/

// Control routine used to post updates to the post window throughout playback.
~controlRoutine = Routine({
	var dice;

	"<< NOW PLAYING: HEAD >>".postln;
	8.wait;

	8.wait;
	~kickTransformations.size.do { |i|
		("<< NOW PLAYING: TRANSFORMATION #" ++ (i + 1) ++ " >>").postln;

		8.wait;
	};

	"<< NOW PLAYING: HEAD >>".postln;
	8.wait;

	dice = [0, 1, 2, 3, 4, 5, 6].choose;
		if (dice == 0, {"<< BRING US HOME! >>".postln;});

	8.wait;

"<< THANKS FOR PLAYING >>".postln;
s.freeAll;
});

"<< LET'S GROOVE >>".postln;
s.freeAll;

~dice = [0, 1].choose;
if (~dice == 0, {
"""
 __   __   ________   _______    ________  ___   __    ___
/_/\\ /_/\\ /_______/\\/_______/\\  /_______/\\/__/\\ /__/\\ /__/\\
\\:\\ \\\\ \\ \\__.::._\\/\\:::  _  \\ \\ \\__.::._\\/\\::\\_\\\\  \\ \\\\::\\ \\
 \\:\\ \\\\ \\ \\  \\::\\ \\  \\::(_)  \\/_   \\::\\ \\  \\:. \`-\\  \\ \\\\:_\\/
  \\:\\_/.:\\ \\ _\\::\\ \\__\\::  _  \\ \\  _\\::\\ \\__\\:. _   \\ \\ \\
   \\ ..::/ //__\\::\\__/\\\\::(_)  \\ \\/__\\::\\__/\\\\. \`-\\  \\ \\ \\
 ___\\___/_(_\\________\\/_\\_______\\/\\________\\/ \\__\\/ \\__\\/
/_____/\\ /_/\\/_/\\ /________/\\
\\:::_ \\ \\\\\\:\\ \\:\\ \\\\__.::.__\\/
 \\:\\ \\ \\ \\\\\\:\\ \\:\\ \\  \\::\\ \\   ___   ___   ___
  \\:\\ \\ \\ \\\\\\:\\ \\:\\ \\  \\::\\ \\ /__/\\ /__/\\ /__/\\
   \\:\\_\\ \\ \\\\\\:\\_\\:\\ \\  \\::\\ \\\\::\\ \\\\::\\ \\\\::\\ \\
    \\_____\\/ \\______\\/   \\__\\/ \\:_\\/ \\:_\\/ \\:_\\/

""".postln;},
{
"""

,--.   ,--.,--.,-----.  ,--.,--.  ,--.,--.
 \\  `.'  / |  ||  |) /_ |  ||  ,'.|  ||  |
  \\     /  |  ||  .-.  \\|  ||  |' '  |`-'
   \\   /   |  ||  '--' /|  ||  | `   |
    `-'    `--'`------' `--'`--'  `--'
 ,-----. ,--. ,--.,--------.
'  .-.  '|  | |  |'--.  .--'
|  | |  ||  | |  |   |  |
'  '-'  ''  '-'  '   |  |.--..--..--.
 `-----'  `-----'    `--''--''--''--'

""".postln;
});

// Play routines
~kickRoutine.play(~clock);
~snareRoutine.play(~clock);
~hihatRoutine.play(~clock);
~wurliRoutine.play(~clock);
~controlRoutine.play(~clock);
})
)