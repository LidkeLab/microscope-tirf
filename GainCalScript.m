%% Gain Calibration

T=MIC_TIRF()

%% Check intensity

median(focus(:))


%%
clc

LampPowerRange=(0:9)*32/9


T.LampObj.gui
T.CameraObj.gui

T.CameraObj.ROI=[513 1536 513 1536]
T.CameraObj.DisplayZoom=.5
T.CameraObj.DefectCorrection=1
T.CameraObj.ScanMode=1

T.CameraObj.ExpTime_Sequence=.01
T.CameraObj.SequenceLength=1000

Params=[]
MeanLevel=[]
VarLevel=[]
for ii=1:length(LampPowerRange)

    T.LampObj.setPower(LampPowerRange(ii))
    T.LampObj.on()
    pause(10)
    
    
    T.CameraObj.start_sequence();
    
    MeanLevel=cat(3,MeanLevel,mean(T.CameraObj.Data,3));
    VarLevel=cat(3,VarLevel,var(single(T.CameraObj.Data),[],3));
end

Params.MeanLevel=MeanLevel
Params.VarLevel=VarLevel

%% LSQ Fit
Beta = NaN(size(MeanLevel, 1), size(MeanLevel, 2), 2); % [:, :, 1] is ls offset, [:, :, 2] is ls slope
for ii = 1:size(MeanLevel, 1)
    disp(ii)
    for jj = 1:size(MeanLevel, 2)
        Beta(ii, jj, 1:2) = smi_stat.leastSquaresFit(...
            squeeze(MeanLevel(ii, jj, :)), squeeze(VarLevel(ii, jj, :)), ...
            1 ./ squeeze(VarLevel(ii, jj, :)));
    end
end
dipshow(Beta(:, :, 2))
figure; histogram(Beta(:, :, 2))

Params.CCDVar=VarLevel(:,:,1);
Params.CCDGain=Beta(:,:,2);
Params.CCDOffset=MeanLevel(:,:,1);

%% Save

TIRFDIR='Y:\sCMOS Calibrations\TIRF'

DT=smi_helpers.genTimeString()

FN=fullfile(TIRFDIR, ['GainCalibration-' DT])

[Attributes, Data, Children]=T.exportState()
MIC_TIRFObj.Children=Children

Params.CameraObj.ROI=T.CameraObj.ROI

save(FN,'Params','MIC_TIRFObj')





















