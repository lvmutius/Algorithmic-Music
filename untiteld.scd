(
SynthDef(\simpleSynth, {
    arg freq=440, amp=0.5, gate=1, decay=0.5, pan=0;
    var env, sig;
    env = EnvGen.kr(Env.perc(0.01, decay), gate, doneAction:2);
    sig = SinOsc.ar(freq) * env * amp;
    sig = Pan2.ar(sig, pan);
    Out.ar(0, sig);
}).add;
)

(
~songRoutine = Routine({

    // Section 1: Slowly ascending melody
    Pbind(
        \instrument, \simpleSynth,
        \freq, Pseq([440, 466.16, 493.88, 523.25], inf),
        \amp, Pseq([0.4, 0.5, 0.6, 0.7], inf),
        \dur, Pseq([0.5, 0.5, 0.5, 0.5], inf),
        \pan, Pseq([-0.5, 0.5], inf)
    ).play;

    15.wait;

    // Section 2: Descending melody
    Pbind(
        \instrument, \simpleSynth,
        \freq, Pseq([880, 830.61, 783.99, 739.99], inf),
        \amp, Pseq([0.4, 0.5, 0.6, 0.7], inf),
        \dur, Pseq([0.5, 0.5, 0.5, 0.5], inf),
        \pan, Pseq([-0.5, 0.5], inf)
    ).play;

    15.wait;

    // Section 3: Rhythmic pattern
    Pbind(
        \instrument, \simpleSynth,
        \freq, Pseq([660, 622.25, 587.33, 554.37], inf),
        \amp, Pseq([0.4, 0.5, 0.6, 0.7], inf),
        \dur, Pseq([0.25, 0.5, 0.25, 0.5], inf),
        \pan, Pseq([-0.5, 0.5], inf)
    ).play;

    15.wait;
});
)


~songRoutine.play;
