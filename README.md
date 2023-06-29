# Texas TriValve
<center><img src="/Images/Figure_Summary.png" width="90%" ></center>

## Requirements
* To run Texas TriValve 1.0 models you will need Abaqus with a linked FORTRAN compiler.
* To view the augmented reality models you will need a smartphone compatible with [model-viewer](https://modelviewer.dev/). Click [here](https://softtissuebiomechanicslab.github.io/EngWithCompModels.html) or scan the QR code below to begin. 

<center><img src="/Images/Paper_AR_Instructions.png" width="90%" ></center>

## Code Description
We provide Abaqus input files used to run simulations of the healthy, diseased, and repaired tricuspid valve. For additional details on simulation settings and element choices please refer to the main text. This repository includes the following input files: 

* Healthy_QuasiStatic.inp
  * Healthy tricuspid valve modeled from end-diastole to end-systole.
* Healthy_Dynamic.inp
  * Healthy tricuspid valve model running over one cardiac cycle i.e from end-diastole to end-diastole.
* Diseased_QuasiStatic.inp
  * Regurgitant tricuspid valve model loaded to pathological pressures at end-systole.
* Annuloplasty_QuasiStatic.inp
  * Regurgitant tricuspid valve model repaired via annuloplasty, loaded to pathological pressures at end-systole.
* Clipping_QuasiStatic.inp
  * Regurgitant tricuspid valve model repaired via clip-based repair, loaded to pathological pressures at end-systole.

Additionally, we provide a user defined material model (Leaflet_Material.f) that must be used to successfully run the input files listed above. We recommend all models be run in double precision.

## References
If you find this repository useful for your research, please cite the following work:
```
@article{Mathur2022_TTV,
author = {Mathur, Mrudang and Meador, William D. and Malinowski, Marcin and Jazwiec, Tomasz and Timek, Tomasz A. and Rausch, Manuel K.},
doi = {10.1007/s00366-022-01659-w},
isbn = {0123456789},
issn = {0177-0667},
journal = {Engineering with Computers},
keywords = {Annuloplasty,Precision medicine,Predictive simulation,Repair,Transcatheter},
month = {may},
publisher = {Springer London},
title = {{Texas TriValve 1.0 : a reverse-engineered, open model of the human tricuspid valve}},
url = {https://link.springer.com/10.1007/s00366-022-01659-w},
year = {2022}
}


```


This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg
