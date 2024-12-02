# microscope-tirf
## Total Internal Reflectance Fluorescence Microscope
Total Internal Reflectance Fluorescence (TIRF) microscope is custom-built off an IX71 inverted microscope frame, capable of simultaneous epi-fluorescence detection in 4 different color channels spanning the visible wavelength range. Samples can be excited using a choice of 4 different laser lines that are fed into the microscope using optical fibers. Fluorescent images of the sample are acquired using an electron-multiplying charge-coupled device (EMCCD) camera, making it ideal for low signal application like single-molecule imaging. This microscope is also equipped with a xyz piezo stage for cell locating and brighfield registration. The instrument controls and image acquisition are computer controlled using custom-written software in MATLAB. 
```
MIC_TIRF_SRcollect();
```
MIC_TIRF_SRcollect() is a super resolution data collection software. The object of data collection calls MIC classes for Andor EMCCD camera, MCL NanoDrive stage, 405 nm CrystaLaser, 488 nm SpectaPhysics Laser, 561 nm Coherent Laser, 642 nm Thorlabs TCube Laser Diode, halogen lamp attached to microscope and the registration class Reg3DTrans.

The MIC_TIRF_SRcollect() class requires Matlab 2014b or higher and works with Matlab Instrument Control (MIC) classes [matlab-instrument-control](https://github.com/LidkeLab/matlab-instrument-control/tree/main)

## Equipment List
### Microscope body
- Olympus IX71 Microscope Base.
- MadCityLabs Nano-LPS100, XYZ piezo stage, travel 100 $\mathrm{\mu m}$.
### Objective
- Olympus APO N 100X oil Immersion, NA 1.49, WD 0.1 mm, FN 22.
### Camera
- Hamamatsu C11440-22CU, sCMOS camera, 2048x2048 pixels, pixel size 6.5 $\mathrm{\mu m}$.
### Illumination
- Crystal Laser, DL-405-010-O, 405 nm laser, 10 mW.
- Thorlabs, HL6366DG, 642 nm laser, 80 mW.
- Newport Spectra Physics, PC15108, 488 nm laser, 100 mW.
- Coherent Sapphire, 561-100 CW CDRH, 561 nm laser, 100 mW.
### Other equipments
- National Instrument, PCIe-6323, DAQ card.
### Filters
- Semrock, Di01-R405/488/561/635-25x36, quad-band dichroic mirror.
- Semrock, FF01-446/523/600/677-25, quad-band band pass filter.
- Semrock, FF01-685/40-25, band pass filter.
- Semrock, FF01-525/30-25, band pass filter.

### Citation:
[Fazel, M., Wester, M.J., Schodt, D.J. et al., "High-precision estimation of emitter positions using Bayesian grouping of localizations", Nat Commun 13, 7152 (2022)](https://doi.org/10.1038/s41467-022-34894-2)