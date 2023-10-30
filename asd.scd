{ Pan2.ar(PinkNoise.ar(0.2), SinOsc.kr(0.5)) }.play;

{ Pan2.ar(PinkNoise.ar(0.2), -1) }.play; // slightly to the left

{ Pan2.ar(PinkNoise.ar(0.2), 1) }.play; // slightly to the left

// { PinkNoise.ar(0.2) + SinOsc.ar(440, 0, 0.2) + Saw.ar(660, 0.2) }.play;

{Saw.ar(660, 0.2)}.play

{SinOsc.ar(660, 0.2)}.play



{SquareOsc.ar(660, 0.2)}.play



(
var a, b;
a = Prand([1, 2, 3]);    // repeat twice
b = a.asStream;
6.do({ b.next.postln; });
)


(
a = Pbind(\x, Pseq([1, 2, 3]), \y, Prand([100, 300, 200], inf), \zzz, 99);
x = a.asStream;
)

x.next(()); // pass in an event ()
x.next(());
x.next(());
x.next(());

Pbind(\freq, Prand([300, 200, 600, 800], inf), \dur, 0.1).play;
Pbind(\freq, Prand([300, 200, 600, 800, 900, 1000], inf), \dur, Prand([0.1, 0.3], inf)).play;

Pbind(\freq, Prand([1, 1.2, 2, 2.5, 3, 4], inf) * 200, \dur, 0.1).play;

{
// Ellipse function to compute distance from the center
~f = { |a, b, t| a * b / sqrt((b * cos(t))**2 + (a * sin(t))**2) };

// Parameters for the ellipse
~a = 1;  // semi-major axis
~b = 1;  // semi-minor axis

// Using your suggested method for generating t values
~x = 16; // number of subdivisions
~t_values = Array.newClear(~x);

16.do { |i|
    ~t_values[i] = pi / 2 * (i / (~x - 1));
};

// Compute distances based on the ellipse function
~distances = ~t_values.collect { |t| ~f.value(~a, ~b, t) };

~distances.postln;
}

