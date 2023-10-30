Percussion {
    var name, buffers, patterns;
    var state_space, start_state, sequence, transition_model;

    // Constructor
    init { |name_arg, buffers_arg|
        name = name_arg;
        buffers = buffers_arg;

        // Initialize patterns dictionary
        patterns = ();

        // Create SynthDef
        this.make_synth_def;

        // Default values
        state_space = [\play, \rest];
        start_state = \play;
        sequence = List[start_state];
        transition_model = Dictionary.new;
    }

    make_synth_def {
    SynthDef(name, { |out=0, pitch=0, amp=0.5|
        var bufnum = Select.kr(pitch, buffers);
        var sig = PlayBuf.ar(2, bufnum, loop: 0) * amp;
        Out.ar(out, sig);
    }).add;
	}



    // Method to generate sequences
    generate_sequence { |num|
        num.do { |i|
            sequence = sequence.add(state_space.wchoose(transition_model[sequence[i]]));
        };
    }

    // Method to play a given pattern
    play_pattern { |pattern_name|
        patterns[pattern_name].play;
    }

    // Getters and Setters
    get_state_space { ^state_space; }
    set_state_space { |value| state_space = value; }
    get_start_state { ^start_state; }
    set_start_state { |value| start_state = value; }
    get_transition_model { ^transition_model; }
    set_transition_model { |value| transition_model = value; }
}