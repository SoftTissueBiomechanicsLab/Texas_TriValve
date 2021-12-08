# Texas TriValve
<center><img src="/Images/Figure_Summary.png" width="90%" ></center>

## Requirements
* To run Texas TriValve 1.0 models you will need a FORTRAN compiler linked to your installation of Abaqus. 
* To view the augmented reality models you will need a smartphone compatible with [model-viewer](https://modelviewer.dev/). Click [here](https://softtissuebiomechanicslab.github.io/EngWithCompModels.html) or scan the QR code below to begin. 

<center><img src="/Images/Paper_AR_Instructions.png" width="90%" ></center>

## Code Description
We provide Abaqus input files for the following simulation cases: 

* Control_QuasiStatic.inp - Healthy tricuspid valve modeled from end-diastole to end-systole.
* Control_Dynamic.inp - Healthy tricuspid valve model running over one cardiac cycle i.e from end-diastole to end-diastole.
* FTR_QuasiStatic.inp - Regurgitant tricuspid valve model loaded to pathological pressures at end-diastole.
* Annuloplasty_QuasiStatic.inp - Regurgitant tricuspid valve model repaired via annuloplasty, loaded to pathological pressures at end-diastole.
* Clipping_QuasiStatic.inp - Regurgitant tricuspid valve model repaired via clip-based repair, loaded to pathological pressures at end-diastole.

Additionally, we provide a user defined material model (Leaflet_Material.f) that must be used to successfully run 
