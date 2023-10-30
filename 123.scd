// Rhythm-Experiment for sambalike patterns. The goal are cyclic patterns with elliptical time behavior.

// Masterclock is a LFSaw that's bent exponentially with the "swing"-argument.
// swing = 1 is linear. Zero and negative values lead to funny behavior.

// The masterclock is chopped with the "div"-argument in shorter parts for each instrument.
// If div=0 strange stuff happens when going back to other values.
// Negative values for "div" invert the envelopes for kick and snare.
// Behaves symmetrical around the offbeat. div=2 stays linear.

// The raw clock-signals control the instruments. More organic than classic triggers and envelopes, but strange sometimes.

// Default volumes of instruments are high for saturation and distortion.

(
SynthDef(\polyswingsym,{

	arg
	kickv=1500, frqkick=45, deckick=16, pkick=4, bwkick=0.01, divkick=1,
	snrv1=40, decsnr=15, frqsnr=222, divsnr=2,
	hhv=50, divhh=3,
	tmv=44, frqtm=135, bwtm=0.05, divtm=8,
	clvv=40, divclv=4,
	wdv=30, frqwd=850, divwd=5,
	speed=1, swing=1.5, amp=0.5, out=0;

	var sig, master, trig1, trig2, trig3, trig4, trig5, trig6, kick,snr1,hh,tm,clv,wd;

	master=(((LFSaw.ar(speed,pi,1,0).neg**(swing))+1)/2);

	trig1 = (master%(1/divkick))*divkick;
	trig2 = (master%(1/divsnr))*divsnr;
	trig3 = (master%(1/divhh))*divhh;
	trig4 = (master%(1/divtm))*divtm;
	trig5 = (master%(1/divclv))*divclv;
	trig6 = (master%(1/divwd))*divwd;

	kick= Resonz.ar(trig1,frqkick*((trig1**deckick*pkick)+1),bwkick,kickv);
	snr1=  (Resonz.ar(trig2,frqsnr,0.02,4)+WhiteNoise.ar(0.01)+Dust2.ar(123,0.01))*(trig2**decsnr).tanh*snrv1;
	hh= RHPF.ar(Mix.new(Resonz.ar(trig3,Array.linrand(11,4000,6500),0.0005)),2400,0.4,hhv);
	tm= Resonz.ar(trig4,frqtm,bwtm,tmv);
	clv= HPF.ar(Mix.new(Resonz.ar(trig5,Array.linrand(9,500,3500),0.01,clvv)),700);
	wd= Resonz.ar(trig6,frqwd,0.04,wdv);

	// sig = kick+snr1+hh+tm+clv+wd;
	sig = kick+snr1;

	Out.ar(out,LeakDC.ar(sig!2).tanh*amp);
}).add;
)

y=Synth(\polyswingsym)
y.free

// Parameters main
y.set(\swing,3);
y.set(\speed,1);
y.set(\amp,0.5);

// Volumes
y.set(\kickv,1500);
y.set(\snrv1, 40);
y.set(\hhv,50);
y.set(\tmv,44);
y.set(\clvv,40);
y.set(\wdv,40);

// Divisors
y.set(\divkick,1);
y.set(\divsnr,2);
y.set(\divhh,3);
y.set(\divtm,6);
y.set(\divclv,4);
y.set(\divwd,5);

// Parameters Kick
y.set(\deckick,16);
y.set(\frqkick,45);
y.set(\bwkick,0.01);
y.set(\pkick,3);

// Parameters Snare
y.set(\decsnr,6);
y.set(\frqsnr,222);

// Parameters Tom
y.set(\frqtm,135);
y.set(\bwtm,0.06);


// Parameters Woodblock
y.set(\frqwd,850);