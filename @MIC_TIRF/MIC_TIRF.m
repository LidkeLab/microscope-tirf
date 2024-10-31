classdef MIC_TIRF<mic.abstract
%TIRF Instrument Class for the TIRF Microscope
% Sets up the lower level instruments.
% The basis for all higher level functionality.

properties (SetAccess=protected)
    InstrumentName='TIRF'
end

properties (Hidden)
    StartGUI=false
end

properties
    % Hardware objects
    CameraObj;      % Andor Camera
    StageObj;       % MCL Nano Drive
    Laser405;       % CrystaLaser 405
    Laser488;       % NewPort Laser 488
    Laser561;       % CoherentLaser 561
    Laser642;       % TCubeLaserDiode 642
    LampObj;        % IX71 Lamp
end

methods
    function obj = MIC_TIRF()
        %TIRF Construct an instance of this class
        % Initialize hardware objects

        % Camera
        fprintf('Initializing Camera\n')
        obj.CameraObj=mic.camera.HamamatsuCamera();
        obj.CameraObj.ReturnType='matlab';
        obj.CameraObj.DisplayZoom=4;
        % Stage
        fprintf('Initializing Stage\n')
        obj.StageObj=mic.stage3D.MCLNanoDrive();
        % Lasers
        fprintf('Initializing 405 laser\n')
        obj.Laser405 = mic.lightsource.CrystaLaser405('Dev1','ao1','Port0/Line3');
     
        fprintf('Initializing 488 laser\n')
        obj.Laser488=mic.lightsource.TIRFLaser488();
     
        fprintf('Initializing 561 laser\n')
        obj.Laser561 = mic.lightsource.CoherentLaser561('COM4');
     
        fprintf('Initializing 642 laser\n')
        obj.Laser642 = mic_.lightsource.CubeLaserDiode('64838719','Power',80,182.5,1);
      
        % Lamp
        fprintf('Initializing lamp\n')
        obj.LampObj=mic.lightsource.IX71Lamp('Dev1','ao3','Port0/Line12');

        obj.gui();
    end

    function gui(obj)

    end

    function [Attributes, Data, Children]=exportState(obj)
        %Exports All Relevent Non-Transient Properties as Attributes
        %and Data. Both Attributes and Data must be a single-depth
        %structure (No structures of structures). Children is a structure that
        %contains Objects with the results of their export states.
        %
        %The Children structure of a top level object would
        %then look like the following example:
        %
        %Children.LampObj.Attributes.Power
        %Children.LampObj.Data
        %Children.LampObj.Children
        %Children.LaserObj.Attributes.Power
        %Children.LaserObj.Attributes.IsOn
        %Children.LaserObj.Data
        %Children.LaserObj.Children.ShutterObj.Attributes.IsOpen
        %Children.LaserObj.Children.ShutterObj.Data
        %Children.LaserObj.Children.ShutterObj.Children
        
        [Children.Camera.Attributes,Children.Camera.Data,Children.Camera.Children]=...
                obj.CameraObj.exportState();
            
            [Children.Stage.Attributes,Children.Stage.Data,Children.Stage.Children]=...
                obj.StageObj.exportState();
            
            [Children.Laser405.Attributes,Children.Laser405.Data,Children.Laser405.Children]=...
                obj.Laser405.exportState();
            
            [Children.Laser488.Attributes,Children.Laser488.Data,Children.Laser488.Children]=...
                obj.Laser488.exportState();
            
            [Children.Laser561.Attributes,Children.Laser561.Data,Children.Laser561.Children]=...
                obj.Laser561.exportState();
            
            [Children.Laser642.Attributes,Children.Laser642.Data,Children.Laser642.Children]=...
                obj.Laser642.exportState();
            
            [Children.Lamp.Attributes,Children.Lamp.Data,Children.Lamp.Children]=...
                obj.LampObj.exportState();
            
            Data=[];
            
            Attributes=[];
            
    end
end

methods (Static=true)
    function Success=funcTest()
        
        Success=true;
    end


end


end

