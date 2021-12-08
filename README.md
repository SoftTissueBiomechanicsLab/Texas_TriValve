# Texas TriValve
<center><img src="/Images/Figure_Summary.png" width="90%" ></center>

## Requirements
* To run Texas TriValve 1.0 models you will need Abaqus with a linked FORTRAN compiler.
* To view the augmented reality models you will need a smartphone compatible with [model-viewer](https://modelviewer.dev/). Click [here](https://softtissuebiomechanicslab.github.io/EngWithCompModels.html) or scan the QR code below to begin. 

<center><img src="/Images/Paper_AR_Instructions.png" width="90%" ></center>

## Code Description
We provide Abaqus input files used to run simulations of the healthy, diseased, and repaired tricuspid valve. For additional details on simulation settings and element choices please refer to the main text. This repository includes the following input files: 

* Control_QuasiStatic.inp
  * Healthy tricuspid valve modeled from end-diastole to end-systole.
* Control_Dynamic.inp
  * Healthy tricuspid valve model running over one cardiac cycle i.e from end-diastole to end-diastole.
* FTR_QuasiStatic.inp
  * Regurgitant tricuspid valve model loaded to pathological pressures at end-diastole.
* Annuloplasty_QuasiStatic.inp
  * Regurgitant tricuspid valve model repaired via annuloplasty, loaded to pathological pressures at end-diastole.
* Clipping_QuasiStatic.inp
  * Regurgitant tricuspid valve model repaired via clip-based repair, loaded to pathological pressures at end-diastole.

Additionally, we provide a user defined material model (Leaflet_Material.f) that must be used to successfully run the input files listed above.

Shield: [![CC BY 4.0][cc-by-shield]][cc-by]

This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg
