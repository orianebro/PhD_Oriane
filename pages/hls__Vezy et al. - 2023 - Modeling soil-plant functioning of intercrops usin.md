file:: [Vezy et al. - 2023 - Modeling soil-plant functioning of intercrops usin.pdf](file://C:\Users\cheriere\Zotero/storage/STSXN6K5/Vezy et al. - 2023 - Modeling soil-plant functioning of intercrops usin.pdf)
file-path:: file://C:\Users\cheriere\Zotero/storage/STSXN6K5/Vezy et al. - 2023 - Modeling soil-plant functioning of intercrops usin.pdf

- ## 1 Introduction
- Soil-crop models are critical in understanding these interactions in dynamics during the **whole growing season**
  ls-type:: annotation
  hl-page:: 1
  hl-color:: green
  id:: 655db308-e089-4589-9bea-8319e6798628
  hl-stamp:: 1700645829333
- **formalism** = the structure and mathematical representation necessary for designing a model
  hl-page:: 1
  ls-type:: annotation
  id:: 655db31c-18c6-4e0c-9410-e4e5c32c37af
  hl-color:: green
- the difficulty of designing generic and simple new formalisms that consider the **dynamic interactions between plants** for all processes while maintaining a **few, easily measurable parameters** (e.g. crop height is easy to measure, number of leaves and their angles are not) and a **fast computation time**
  hl-page:: 2
  ls-type:: annotation
  id:: 655dbd6e-2151-4415-b207-90fbce5eddc6
  hl-color:: green
- STICS. This model generally performs correctly compared to observations
  ls-type:: annotation
  hl-page:: 2
  hl-color:: yellow
  id:: 655dbe2f-3508-4380-9f41-afd9083e2971
	- grain yield nRMSE13–21% in Kherif et al. 2022
	  ls-type:: annotation
	  hl-page:: 2
	  hl-color:: yellow
	  id:: 655dbe35-607c-41de-b4a0-cc668ee1ffbd
- several inconsistencies
  ls-type:: annotation
  hl-page:: 2
  hl-color:: yellow
  id:: 655dbe4b-b312-4f9b-8c79-bed3f1a9cdf1
	- overestimate N uptake
	  ls-type:: annotation
	  hl-page:: 2
	  hl-color:: yellow
	  id:: 655dbe58-beee-405d-8c28-6465072de626
	- difficulties in computing light competition related to poor simulation of plant height
	  ls-type:: annotation
	  hl-page:: 2
	  hl-color:: yellow
	  id:: 655dbe64-7e2c-4482-9af1-4366f75f4028
	- discrepancies between observations and simulations for STICS using a database from works published by Bedoussac (2009) and Bedoussac and Justes (2010)
	  ls-type:: annotation
	  hl-page:: 2
	  hl-color:: yellow
	  id:: 655dbe8e-943a-4892-92c7-32eb7ad7a031
		- computation of Leaf Area Index (LAI), aerial and belowground biomass, N acquisition, and light interception using the radiative transfer option, a formalism published two decades ago(Brisson et al. 2004)
		  ls-type:: annotation
		  hl-page:: 2
		  hl-color:: yellow
		  id:: 655dbecf-263b-4fc8-b3f9-e8bc3d8eddec
- the **formalisms** had to be **generic, simple, and robust** in order to be able to simulate widely diversified cropping systems
  hl-page:: 3
  ls-type:: annotation
  id:: 655dc156-ec27-456b-b867-6aa4667e09d7
  hl-color:: green
- the **number of parameters** had to be **minimal** with parameters **derived from sole-crop data** without the need for any re-calibration to simulate intercrops
  hl-page:: 3
  ls-type:: annotation
  id:: 655dc44a-86f5-4261-9a45-2388f9acee6f
  hl-color:: green
	- This method assumes that there is either no significant influence of the other crop on a given process, and the model explicitly simulates those interspecific interactions, including trait plasticity such as enhanced shoot elongation growth or root exploration in the soil.
	  ls-type:: annotation
	  hl-page:: 3
	  hl-color:: green
	  id:: 655dc4cb-01a3-4677-9ffa-5c1e6834b680
	- **plant-plant interspecific interactions** and the **balance between dynamic competition and complementarity** are **emerging properties** of the STICS model functioning
	  hl-page:: 3
	  ls-type:: annotation
	  id:: 655dc4ea-c5da-4f0e-94bd-0a47a1f4e654
	  hl-color:: yellow
- the formalisms implemented in STICS had to generate a **similar or lower range of error for bi-specific intercrops** compared to sole crops, as defined by the error assessment proposed by Coucheney et al. (2015)
  ls-type:: annotation
  hl-page:: 3
  hl-color:: green
  id:: 655dc51a-0e56-49bd-a883-efe2125f79b1
  hl-stamp:: 1700644196306
	- to ensure the formalisms could be used for in silico comparisons of species mixtures or management, for example by calculating their land equivalent ratio (LER) as shown by Launay et al. (2009)
	  ls-type:: annotation
	  hl-page:: 3
	  hl-color:: green
	  id:: 655dc5c0-a348-4396-b2e7-9a9100eda638
-
- ## 2 Material and methods
- ### 2.1 General description of the STICS soil-crop model
- The STICS model is a **dynamic 1D soil-crop model** that combines crop development, growth and yield formation with the carbon, N, energy, and water cycles of the soilcrop system (Brisson et al. 1998, 2003, 2008; Beaudoin et al. 2023).
  ls-type:: annotation
  hl-page:: 3
  hl-color:: yellow
  id:: 655dcacf-86ff-4ab2-af7e-2f0061e38ff1
- The model runs at a **daily time-step** using input data related to climate, crop species, soil, agricultural management, and the state of the system at initialization, such as the water and N content of each soil layer.
  ls-type:: annotation
  hl-page:: 3
  hl-color:: yellow
  id:: 655dcadf-1f81-4db7-bf7e-fc9f6d290fca
- The crop is represented as a set of organs with a given development stage, biomass, and N content.
  ls-type:: annotation
  hl-page:: 3
  hl-color:: yellow
  id:: 655dcaf7-4398-496e-a374-52a775ce363e
- The **biomass growth** is mainly driven by **light interception** as a function of leaf area index with a big leaf approach, while **crop development** is driven by **thermal time** corrected by vernalization and photoperiodic effects.
  hl-page:: 3
  ls-type:: annotation
  id:: 655dcb1b-6239-437b-8eb7-f62ae7545dda
  hl-color:: yellow
	- The **big leaf approach** uses the so-called Beer-Lambert law of light extinction coupled with a radiation use efficiency.
	  ls-type:: annotation
	  hl-page:: 3
	  hl-color:: green
	  id:: 655dcb81-3a5f-4eee-bd60-3e1adf0d79ff
	  hl-stamp:: 1700645812783
- **Stress** effects from frost, insufficient supply of N or water, and root anoxia can all potentially affect development, leaf area, growth, and yield.
  ls-type:: annotation
  hl-page:: 3
  hl-color:: yellow
  id:: 655dcb99-b089-4d42-9d21-5e52d9736bb7
- Both crop species are simulated sequentially **starting the first day from the a priori dominant one** (i.e. the usually taller one in sole crop conditions) and then dynamically computing dominance during the crop cycle **based on crop height**.
  hl-page:: 3
  ls-type:: annotation
  id:: 655dcbfe-92d8-48b6-9b70-d7454d56d1d6
  hl-color:: yellow
-
- ### 2.2 Modifications to the model
- #### 2.2.1 Radiative transfer
- **2.5D projection** of the crop with homogeneous structure within the row
  ls-type:: annotation
  hl-page:: 3
  hl-color:: yellow
  id:: 655dcdc7-0db0-47e3-a50a-710c3be7fc47
- The crop leaf area density is represented using a geometric primitive (a rectangle or an up- or down-facing triangle) projected onto the 2D vertical plane, and the light interception computation is performed considering this shape re-projected in 3D along the crop row, e.g. the rectangle is used as a hexahedral volume to represent the whole row
  ls-type:: annotation
  hl-page:: 3
  hl-color:: yellow
  id:: 655dce5d-07d3-4b21-801e-73db174be25b
- using only the transmitted light as a medium
  ls-type:: annotation
  hl-page:: 4
  hl-color:: yellow
  id:: 655dcea3-1cb8-4b23-aa1d-86f38a3932a0
- **without any explicit knowledge of the shape of the other crop**
  ls-type:: annotation
  hl-page:: 4
  hl-color:: yellow
  id:: 655dce8a-8c6a-4926-92e1-90d2249f2eef
	- relative independence between the shapes of both crops
	  ls-type:: annotation
	  hl-page:: 4
	  hl-color:: yellow
	  id:: 655dd024-3b63-476d-b568-c3d791cd79e9
-
- #### 2.2.2 Beer‑Lambert law of light extinction
- a simpler approach to account for intercrops with well-mixed canopies : the Beer-Lambert law of light extinction in plant canopies adapted for intercropping (Keating and Carberry 1993) by considering the leaf area index and extinction coefficients of both crops
  hl-page:: 4
  ls-type:: annotation
  id:: 655dd04b-983a-4414-8160-03c7bf481ca9
  hl-color:: yellow
-
- #### 2.2.3 Plant density effect
- the intraspecific competition for light interception and growth is computed using a density effect (S_D), to represent the intra-row competition
  ls-type:: annotation
  hl-page:: 4
  hl-color:: yellow
  id:: 655dd0eb-be21-41fc-99c1-fa5288f83e39
- The same algorithm, but using twice the intercrop plant density to use the same parameters determined on sole crops
  hl-page:: 4
  ls-type:: annotation
  id:: 655dd142-3a73-4194-a0ff-10270177b762
  hl-color:: yellow
-
- #### 2.2.4 Plant traits and dimensions