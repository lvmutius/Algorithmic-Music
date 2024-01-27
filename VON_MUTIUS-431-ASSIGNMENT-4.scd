(
s.waitForBoot { (
~currentState = nil;

// An event to store the MIDI note numbers for the roots of the keys we are using
~rootNoteMIDI = (c: 60,
	d: 62,
	g: 67);


// An event to store chord progressions, which are arrays of chords arrays
~chordProgressions = (
	\c: [[0, 4, 7, 12], [0, 5, 9], [2, 7, 11], [4, 7, 12]],
	\g: [[-8, -5, 0], [-7, -3, 0], [-5, -1, 2], [-5, 0, 4]],
	\d: [[0, 4, 7, 12], [0, 5, 9], [2, 7, 11], [4, 7, 12]],
	\c2g: [[0, 4, 7, 12], [0, 5, 9], [2, 7, 11], [0, 4, 9], [0, 2, 6, 9]],
	\c2d: [[0, 4, 7], [-1, 4, 7], [-3, 1, 4, 7], [-3, 2, 6, 9]],
	\g2c: [[-5, 0, 4], [-3, 0, 5], [-5, -2, 0, 4]],
	\g2d: [[-8, -5, 0], [-7, -3, 0], [-5, -1, 2], [-3, 0, 4], [-3, 0, 2, 6], [-5, -1, 2, 7]],
	\d2c: [[0, 4, 7, 12], [2, 5, 9], [2, 5, 7, 11], [0, 4, 9, 12], [0, 5, 9], [2, 5, 10], [0, 3, 5, 9], [-2, 2, 5, 10]],
	\d2g: [[0, 4, 7, 12], [0, 5, 9, 12], [0, 4, 7, 10], [0, 5, 9]]

);


~playChords = { |chordProgression, rootMIDINote = 60, tempo = 1|
    var scale = (0..11);  // Chromatic scale

    var chords = chordProgression.collect { |chord|
        chord.collect { |semitone| rootMIDINote + semitone }
    };

    Pbind(
        \instrument, \default,
        \midinote, Pseq(chords.collect({ |chord| chord.asArray }), 1),
        \dur, tempo
    ).play;
};


~mealyMachine = { |symbol|
    switch(
        symbol,
        \generate_c, {
            (~currentState == 'CMajor' || ~currentState.isNil).if(
                {
                    ~currentState = 'CMajor';
                    ~playChords.value(~chordProgressions[\c], ~rootNoteMIDI[\c]);
                },
				{ "\nError: Must be in C Major to generate a C major chord progression.\n The current state is: " ++  ~currentState.postln }
            )
        },
        \modulate_c, {
            (~currentState == 'GMajor').if(
                {
                    ~currentState = 'CMajor';
                    ~playChords.value(~chordProgressions[\g2c], ~rootNoteMIDI[\g]);
                },
                { (~currentState == 'DMajor').if(
                    {
                        ~currentState = 'CMajor';
                        ~playChords.value(~chordProgressions[\d2c], ~rootNoteMIDI[\d]);
                    },
                    { "\nError: Can only modulate to C from G or D. The current state is: " ++ ~currentState.postln }
                  )
                }
            )
        },
        \generate_g, {
            (~currentState == 'GMajor' || ~currentState.isNil).if(
                {
                    ~currentState = 'GMajor';
                    ~playChords.value(~chordProgressions[\g], ~rootNoteMIDI[\g]);
                },
                { "\nError: Must be in G Major to generate a G major chord progression.\n The current state is: " ++  ~currentState.postln }
            )
        },
        \modulate_g, {
            (~currentState == 'CMajor').if(
                {
                    ~currentState = 'GMajor';
                    ~playChords.value(~chordProgressions[\c2g], ~rootNoteMIDI[\c]);
                },
                { (~currentState == 'DMajor').if(
                    {
                        ~currentState = 'GMajor';
                        ~playChords.value(~chordProgressions[\d2g], ~rootNoteMIDI[\d]);
                    },
                    { "\nError: Can only modulate to G from C or D. The current state is: " ++ ~currentState.postln }
                  )
                }
            )
        },
        \generate_d, {
            (~currentState == 'DMajor' || ~currentState.isNil).if(
                {
                    ~currentState = 'DMajor';
                    ~playChords.value(~chordProgressions[\d], ~rootNoteMIDI[\d]);
                },
                { "\nError: Must be in D Major to generate a D major chord progression.\n The current state is: " ++  ~currentState.postln }
            )
        },
        \modulate_d, {
            (~currentState == 'GMajor').if(
                {
                    ~currentState = 'DMajor';
                    ~playChords.value(~chordProgressions[\g2d], ~rootNoteMIDI[\g]);
                },
                { (~currentState == 'CMajor').if(
                    {
                        ~currentState = 'DMajor';
                        ~playChords.value(~chordProgressions[\c2d], ~rootNoteMIDI[\c]);
                    },
                    { "\nError: Can only modulate to D from G or C. The current state is: " ++ ~currentState.postln }
                  )
                }
            )
        }
    );
};


)};
)



//Test cases
~mealyMachine.value(\generate_c);
~mealyMachine.value(\modulate_g);
~mealyMachine.value(\generate_g);
~mealyMachine.value(\modulate_c);
~mealyMachine.value(\generate_c);

~mealyMachine.value(\generate_c);
~mealyMachine.value(\modulate_d);
~mealyMachine.value(\generate_d);
~mealyMachine.value(\modulate_c);
~mealyMachine.value(\generate_c);

~mealyMachine.value(\generate_d);
~mealyMachine.value(\modulate_g);
~mealyMachine.value(\generate_g);
~mealyMachine.value(\modulate_d);


