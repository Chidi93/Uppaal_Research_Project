# cps_smc
Each folder contains the .xml file with the running example specification and its related query.q file.

The normal folder contains the vanilla running example whereas the attack folders contain the running example targeted by a specific attack.
See article for further information.

Requirements: UPPAAL 4.1.19
Usage:
Within UPPAAL
-open the .xml file (e.g. cps_smc.xml)
-import the query.q file to verify the related properties

AUXILIARY MATERIAL:
 - analysis_scrpit.py contains code to run several analysis 
   e.g. parametric properties []_[0,M_ATTACK] ( safe )
 USAGE:
  - analysis_scrpit.py contains a simple guide
