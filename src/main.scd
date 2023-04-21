s.boot;

~project_dir = thisProcess.nowExecutingPath.dirname.dirname;
~ui_path = ~project_dir +/+ "src/gui.scd";
~core_path = ~project_dir +/+ "src/core.scd";

// 13 samples
~bikeGears= Buffer.read(s,~project_dir +/+ 'res/samples/Bike Gears.wav');
~bloopyNooper= Buffer.read(s,~project_dir +/+ 'res/samples/Bloopy Nooper.wav');
~brokenPottery= Buffer.read(s,~project_dir +/+ 'res/samples/Broken Pottery.wav');
~chordDrop= Buffer.read(s,~project_dir +/+ 'res/samples/Chord Drop.wav');
~geigerKalimba= Buffer.read(s,~project_dir +/+ 'res/samples/Geiger Kalimba.wav');
~harshFeedback= Buffer.read(s,~project_dir +/+ 'res/samples/Harsh Feedback.wav');
~harshGesture= Buffer.read(s,~project_dir +/+ 'res/samples/Harsh Gesture.wav');
~hullBreach= Buffer.read(s,~project_dir +/+ 'res/samples/Hull Breach.wav');
~lofiCut= Buffer.read(s,~project_dir +/+ 'res/samples/Lofi-cut.wav');
~lowFormant= Buffer.read(s,~project_dir +/+ 'res/samples/Low Formanted.wav');
~octavedVoices= Buffer.read(s,~project_dir +/+ 'res/samples/Octaved Voices.wav');
~pebbleRain= Buffer.read(s,~project_dir +/+ 'res/samples/Pebble Rain.wav');
~supermarket= Buffer.read(s,~project_dir +/+ 'res/samples/Supermarket Robot.wav');

~core_path.load;

~ui_path.load;

