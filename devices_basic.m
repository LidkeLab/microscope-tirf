%% Camera

Cam=mic.camera.HamamatsuCamera()
Cam.gui()

%center 512
Cam.ROI=[769 1280 769 1280]

%center 256
Cam.ROI=[897 1152 897 1152]

%upper left 512
Cam.ROI=[513 1024 513 1024]

%upper right 512
Cam.ROI=[1025 1536 513 1024]

%lower left 512
Cam.ROI=[513 1024 1025 1536]

%lower right 512
Cam.ROI=[1025 1536 1025 1536]



%% Lamp

Lamp=mic.lightsource.IX71Lamp('Dev1','ao3','Port0/Line12')
Lamp.gui()

%% Stage
Stage=mic.stage3D.MCLNanoDrive();
Stage.gui()

%% Lasers

% fprintf('Initializing 405 laser\n')
% Laser405 = mic.lightsource.CrystaLaser405('Dev1','ao1','Port0/Line3');

% 
fprintf('Initializing 488 laser\n')
Laser488=mic.lightsource.TIRFLaser488();
Laser488.gui()

% 
% fprintf('Initializing 561 laser\n')
% Laser561 = mic.lightsource.CoherentLaser561('COM4');

% 
fprintf('Initializing 642 laser\n')
Laser642 = mic.lightsource.TCubeLaserDiode('64838719','Power',80,182.5,1);
Laser642.gui()


