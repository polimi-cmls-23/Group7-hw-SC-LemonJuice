SynthDef(\grain_synth, {
	|
	sample1,
    sample2,
	gain1 = 0.5,
    gain2 = 0.5,
	pitch1 = 0,
	pitch2 = 0,
	volume = 1,
	pitch = 0,
	pan = 0,
	out,
	maxGrains = 512,
	grainenv = -1,    //Envelope: triangle
	grainfreq = 80,
	graindur = 0.020,
	grainrand = 0
	|
	        var pitch_ratio = midiratio(pitch);
	        var ratio1 = midiratio(pitch1);  // Frequency shifting of signal 1
	        var ratio2 = midiratio(pitch2); // Frequency shifting of signal 2

			Out.ar(bus: out,
		         channelsArray:
		            Limiter.ar(
		         	in: PitchShift.ar(                   // Frequency shifting of the mixed signal
				            in: GrainIn.ar(2,                         // 2 channels
		         				Impulse.kr(freq: grainfreq),  //   Clock signal for the granulizer
		         				dur: graindur,
		         				in: PitchShift.ar(            // SAMPLE 1
		         					in: BufRd.ar(1, sample1,
		         						    Phasor.ar(0, BufRateScale.ir(sample1),
								            0, BufFrames.ir(sample1),0))*gain1,
						    	     windowSize: 1,
						             pitchRatio: ratio1 + WhiteNoise.ar(grainrand) )
					       	         +
					       	         PitchShift.ar(            // SAMPLE 2
		         					 in: BufRd.ar(1, sample2,
		         						    Phasor.ar(0, BufRateScale.ir(sample2),
									        0, BufFrames.ir(sample2),0))*gain2,
						     	    windowSize: 1,
							pitchRatio: ratio2 + WhiteNoise.ar(grainrand) ),
			                maxGrains: maxGrains,
		         			pan: 0,
				         	envbufnum: grainenv)*volume,  //
         				windowSize: 1,
		         		pitchRatio: pitch_ratio),
			       level: 4/5;)
	      )
}).add;

