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
	- grain yield nRMSE13–21% in Kherif et al. (2022) [[@The first calibration and evaluation of the STICS soil-crop model on chickpea-based intercropping system under Mediterranean conditions]]
	  hl-page:: 2
	  ls-type:: annotation
	  id:: 655dbe35-607c-41de-b4a0-cc668ee1ffbd
	  hl-color:: yellow
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
		- computation of Leaf Area Index (LAI), aerial and belowground biomass, N acquisition, and light interception using the radiative transfer option, a formalism published two decades ago (Brisson et al. 2004)
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
	- to ensure the formalisms could be used for in silico comparisons of species mixtures or management, for example by calculating their land equivalent ratio (LER) as shown by Launay et al. (2009) [[@Exploring options for managing strategies for pea–barley intercropping using a modeling approach]]
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
- with the assumption that both crop canopies are homogeneous along the row, and that one of the two crops is dominant over the other in terms of height
  ls-type:: annotation
  hl-page:: 5
  hl-color:: yellow
  id:: 6565ca66-043f-41ab-a34a-00039583cbd3
-
- #### 2.2.2 Beer‑Lambert law of light extinction
- a simpler approach to account **for intercrops with well-mixed canopies** : the **Beer-Lambert law of light extinction** in plant canopies adapted for intercropping (Keating and Carberry 1993) by considering the leaf area index and extinction coefficients of both crops
  hl-page:: 4
  ls-type:: annotation
  id:: 655dd04b-983a-4414-8160-03c7bf481ca9
  hl-color:: yellow
-
- #### 2.2.3 Plant density effect
- the intraspecific competition for light interception and growth is computed using a **density effect** (S_D), to represent the **intra-row competition**
  hl-page:: 4
  ls-type:: annotation
  id:: 655dd0eb-be21-41fc-99c1-fa5288f83e39
  hl-color:: yellow
- The same algorithm, but using twice the intercrop plant density to use the same parameters determined on sole crops
  hl-page:: 4
  ls-type:: annotation
  id:: 655dd142-3a73-4194-a0ff-10270177b762
  hl-color:: yellow
-
- #### 2.2.4 Plant traits and dimensions
- The height of the crop canopy significantly influences the competition for light capture between the two species
  ls-type:: annotation
  hl-page:: 4
  hl-color:: yellow
  id:: 655dd370-9ca1-4549-8efd-bca24639809c
  hl-stamp:: 1700656200124
- The crop canopy height was computed using the LAI for sole crops
  ls-type:: annotation
  hl-page:: 4
  hl-color:: yellow
  id:: 655dd3ae-9e66-4a5d-ad1f-980c1514cd55
- new formalism that computes **plant height** using **crop phasic development** instead (Gou et al., 2017 [[@Simulating potential growth in a relay-strip intercropping system: Model description, calibration and testing]]; Berghuijs et al., 2020 [[@Identification of species traits enhancing yield in wheat-faba bean intercropping: development and sensitivity analysis of a minimalist mixture model]]) + the addition of the **effect of stresses**
  hl-page:: 4
  ls-type:: annotation
  id:: 655dd448-3eb5-453a-b979-258687717dba
  hl-color:: yellow
- The height of a crop can also be **up- or down-regulated in response to stresses**, such as light competition with another species, drought, root anoxia, low N availability, and frost. The **resulting integrated effect** arising from those individual stresses is computed as the **minimum of all down-regulating effects**, and the **up-regulating effect (i.e. the shoot elongation) separately**, which are both applied to the daily height increment.
  hl-page:: 4
  ls-type:: annotation
  id:: 655ddd40-566c-4fa1-835a-ab5a4b311888
  hl-color:: yellow
- The magnitude of the elongation of the crop height can theoretically change with the associated species depending on light quantity and quality, e.g. a proxy of the photomorphogenetic effect.
  ls-type:: annotation
  hl-page:: 4
  hl-color:: yellow
  id:: 655df2b5-ef40-4efa-91b4-e82a5d8cf422
	- However, the type of response, i.e. shade avoidant or shade tolerant, remains stable based on the plant species.
	  ls-type:: annotation
	  hl-page:: 4
	  hl-color:: yellow
	  id:: 655df2be-9ab6-49fd-9a91-09a94365bc99
	- formalism that elongates the stem of the plant based on the relative surface of the plant that is shaded and a parameter of maximum elongation effect when the species is fully shaded.
	  ls-type:: annotation
	  hl-page:: 4
	  hl-color:: yellow
	  id:: 655df310-efb2-4340-84e8-86745801f2fb
-
- #### 2.2.5 Nitrogen demand
- The **N uptake of the crop depends on its N demand, N availability in the soil layers, and root exploration** (computed using the rooting depth and the root length density along the soil profile)
  hl-page:: 4
  ls-type:: annotation
  id:: 655df443-2e0e-4747-8ff8-e65c0dac578f
  hl-color:: yellow
- The **N requirements** are computed using a **dilution curve** that relates the crop **aboveground biomass** to its **N concentration** (Corre-Hellou et al. 2009 [[@Adaptation of the STICS intercrop model to simulate crop growth and N accumulation in pea–barley intercrops]])
  hl-page:: 4
  ls-type:: annotation
  id:: 655df576-d1d5-4cc5-9058-6504c8754520
  hl-color:: yellow
	- _Hypothesis_ : leaves have a higher N content compared to other organs, and as the plant/crop grows, the proportion of leaves compared to structural organs (e.g. straw) decreases, thereby diluting the N content in the aboveground biomass (Justes et al. 1994).
	  hl-page:: 4
	  ls-type:: annotation
	  id:: 655df60c-8a03-4a59-af16-0d8e9e949e8c
	  hl-color:: yellow
- For intercrops, we use the **total biomass of the intercrop** as a proxy for the equivalent biomass in sole crop, as proposed by Louarn et al. (2021), to use the same parameter values than in sole crops.
  hl-page:: 4
  ls-type:: annotation
  id:: 655df770-58da-4ff9-8a71-dea91a2ae760
  hl-color:: yellow
	- This modification helps avoiding an underestimation of the N status of crops simulated in intercrops, as shown by Corre-Hellou et al. (2009) [[@Adaptation of the STICS intercrop model to simulate crop growth and N accumulation in pea–barley intercrops]].
	  hl-page:: 4
	  ls-type:: annotation
	  id:: 655dfa48-93ba-4d88-97ab-e8aaeee96065
	  hl-color:: yellow
	- unless both development and biomass of the two crops are largely different (Louarn et al. 2021).
	  ls-type:: annotation
	  hl-page:: 5
	  hl-color:: yellow
	  id:: 655dfaea-5740-493f-aba3-70bf42517ce6
-
- #### 2.2.6 Water and nitrogen competition and complementarity
- The **competition and/or complementarity processes for water and N dynamic budgets** are mainly determined by the **roots, their biomass, and density in the soil layers** (1-cm layers).
  hl-page:: 5
  ls-type:: annotation
  id:: 655dfedc-d38e-4b4b-8a3b-b0f7d0907d9b
  hl-color:: yellow
- As for a sole crop, the root development and growth of each species in the intercrop depends on species–specific parameters, thermal time of soil temperature, several potential stresses, such as anoxia, drought, soil properties (high bulk density), frost, or low N content, and potentially a trophic linked production depending on the simulation option (Brisson et al.2004, 2008).
  ls-type:: annotation
  hl-page:: 5
  hl-color:: yellow
  id:: 655e1454-d318-4da6-985e-564c0e9fdff3
- we introduced a **down-regulating effect of intra-specific plant density on the root length growth rate**
  hl-page:: 5
  ls-type:: annotation
  id:: 655e14e4-2d08-4bfa-a8cc-036a00600ecf
  hl-color:: yellow
-
- #### 2.2.7 Microclimate
- the taller species can **decrease the wind** experienced by the smaller one
  ls-type:: annotation
  hl-page:: 5
  hl-color:: yellow
  id:: 655e15db-0fdf-44a4-aa75-bfd2da615655
- It can also **increase air humidity** and regulate the **local temperature**
  hl-page:: 5
  ls-type:: annotation
  id:: 655e15ea-cdab-48ff-97ae-db684c734c4e
  hl-color:: yellow
- modifying the **daily and cumulative thermal time**
  hl-page:: 5
  ls-type:: annotation
  id:: 655e15ff-80a0-475c-89c7-ed6880ad0829
  hl-color:: yellow
- a **resistive approach** already implemented, first presented in Brisson et al. (2004) and adapted from Shuttleworth and Wallace (1985).
  hl-page:: 5
  ls-type:: annotation
  id:: 655e1619-f7b6-4bab-bc96-72b50a306642
  hl-color:: yellow
-
- ### 2.3 Spatial designs that theoretically define the validity domain of STICS
- STICS is conceptually able to simulate intercropping in **alternate rows** (each species in a different row, inter-row set to distance between rows of the same species) and **mixed within-row** (inter-row set to distance between each row).
  hl-page:: 5
  ls-type:: annotation
  id:: 6565c91c-de3c-438e-b14a-2c8ecdd240da
  hl-color:: yellow
- STICS is also able to simulate **relay intercropping** in alternate rows—or with the second crop sown in the inter-row of the first crop— where the two species are not sown, neither harvested, at the same time
  ls-type:: annotation
  hl-page:: 5
  hl-color:: yellow
  id:: 6565cae1-ed2e-4fdc-b46c-78b10c676710
- **root systems** are assumed **homogeneously distributed along the horizontal soil layers** (i.e. the distribution of roots is uniform inside each horizontal soil layer of 1 cm)
  hl-page:: 5
  ls-type:: annotation
  id:: 6565cb32-b993-4d35-aed6-bf86a0a7f085
  hl-color:: yellow
- shoots forming a **canopy** that is at least **homogeneously distributed in the row**
  hl-page:: 5
  ls-type:: annotation
  id:: 6565e431-5429-4ef7-8f58-d83a71d764d1
  hl-color:: yellow
- **shoots interacting for light capture**, either mixed or with a significant or large dominance between the two species, the **dominance** may change over time.
  hl-page:: 5
  ls-type:: annotation
  id:: 6565e4f6-35bf-42cd-a79c-9211c8cf726f
  hl-color:: yellow
-
- ### 2.4 Methodology for the calibration and evaluation of STICS
- #### 2.4.1 Parameter calibration
- an automatic calibration was performed based on the recommendations of Guillaume et al. (2011), Buis et al. (2011), and Ruget et al. (2002) on the most influential parameters following the same procedure consisting of 15 steps of calibration for 25 parameters optimized over 13 variables
  ls-type:: annotation
  hl-page:: 5
  hl-color:: yellow
  id:: 6565e5fc-e896-48c2-b5af-5cd169375cae
- The parameters were first optimized using the BeerLambert law of extinction for the light interception, and then using the radiative transfer option, because the latter can fall back to the Beer-Lambert law whenever the plant height of the two species are close, and by doing so, the light extinction parameter of the Beer-Lambert law is used.
  ls-type:: annotation
  hl-page:: 5
  hl-color:: yellow
  id:: 6565e661-1bd9-4648-9559-4ae7ecff1b8d
- The parameters were optimized using the standard workflow proposed by the “CroptimizeR” R package (Buis et al. 2023) with the Nelder–Mead simplex algorithm (Nelder and Mead 1965) and seven repetitions with different initial parameter values to better sample the range of values while reducing the risk of converging to a local minimum.
  hl-page:: 5
  ls-type:: annotation
  id:: 6565e6a9-1e98-4653-b01c-e6d589bf7411
  hl-color:: yellow
- Analyses of the estimated against initial values were performed to investigate whether the initial values had any impact on the optimized value.
  ls-type:: annotation
  hl-page:: 6
  hl-color:: yellow
  id:: 6565e716-167f-4c68-a2d6-787dfb6bdf00
-
- #### 2.4.2 Parameters calibrated for intercrops
- The formalisms implemented only need two parameters to be calibrated in the case of the radiative transfer option for the simulation of bi-specific intercrops:
  ls-type:: annotation
  hl-page:: 6
  hl-color:: yellow
  id:: 6565e9ca-f68b-4988-8e94-cb8b65810e0a
- (i) a threshold for the difference in crop height defining a dominance effect from one crop over the other, i.e. the model falls back to the computation of Beer-Lambert below this value
  ls-type:: annotation
  hl-page:: 6
  hl-color:: yellow
  id:: 6565e9d2-35e4-4000-b131-3367cc3512c4
- (ii) an elongation effect due to shading for the dominated crop (but no elongation due to shading for the intercrops tested)
  hl-page:: 6
  ls-type:: annotation
  id:: 6565e9db-dec3-4134-9989-dfde596c220c
  hl-color:: yellow
-
- #### 2.4.3 Combination of strategies to evaluate the new formalisms in STICS
- First, the model formalisms were evaluated on sole crops, as “**self-intercrop**,” using the new version of STICS to compare with the same formalisms in both setups, including the corrections made in the code.
  hl-page:: 6
  ls-type:: annotation
  id:: 6565ec30-e2f9-46b6-8712-8d673f23ebbb
  hl-color:: yellow
	- Another objective of this analysis was to investigate whether there is an **effect of the order** each plant is computed in the sequence
	  ls-type:: annotation
	  hl-page:: 6
	  hl-color:: yellow
	  id:: 6565ec87-d001-4e25-838b-3b4c9937428d
- Second, we used data from two crops either grown as **sole crops or intercropped** and simulated both cases to evaluate the ability of STICS to reproduce the **interspecific interactions** as well as the **intraspecific interactions**.
  hl-page:: 6
  ls-type:: annotation
  id:: 6565ed58-64d2-4150-96ad-1a5bfde4da14
  hl-color:: yellow
- Third, we evaluated the model using **experimental data of bispecific intercrops** with contrasting species mixtures and spatial heterogeneity, at contrasting sites, to investigate its **potential genericity** and the **domain of validity** of STICS for intercropping systems.
  hl-page:: 6
  ls-type:: annotation
  id:: 6565ed92-7ea4-481a-9f6a-ac2185f2795f
  hl-color:: yellow
-
- ### 2.5 Dataset
- #### 2.5.1 Sites and experiments
	- Fig. 2
	  ls-type:: annotation
	  hl-page:: 8
	  hl-color:: yellow
	  id:: 6565f8b6-5679-4092-b758-25ba241b2022
- #### 2.5.2 Measurements and calculations
-
- ## 3 Results and discussion
- ### 3.1 Intraspecific interactions
- The “self-intercrop” simulations were close to the regular sole-crop simulations for all variables and all crops
  ls-type:: annotation
  hl-page:: 8
  hl-color:: yellow
  id:: 6565f734-b2ae-4e78-9bef-73db0f716dda
- STICS has a consistent behavior in the simulation of both sole crops simulated as usual and as “self-intercrops”
  hl-page:: 8
  ls-type:: annotation
  id:: 6565f74f-b097-4c0a-b96a-b064dfa372a1
  hl-color:: yellow
-
- ### 3.2 Interspecific interactions
- **calibrate** the model on **solecrop** data only and let the model simulate the **intercrop** plant-plant interactions **without any re-calibration** of the parameters
  hl-page:: 8
  ls-type:: annotation
  id:: 6565f7fe-ddd0-4748-be5e-07ead12d4f54
  hl-color:: yellow
	- to simulate interspecific interactions and possible plant plasticity resulting from calculations as an emerging property
	  hl-page:: 9
	  ls-type:: annotation
	  id:: 6565f840-f589-4909-9ae3-9855553c26c5
	  hl-color:: yellow
- Sole-crop and intercrop simulation results were compared to observations for each individual species to investigate whether STICS simulates species behavior from sole crop to intercrop
  ls-type:: annotation
  hl-page:: 9
  hl-color:: yellow
  id:: 6565f881-7ce7-4792-af7e-804cc4cf158e
- In sole crops, the simulations were close to the observations for all variables tested
  ls-type:: annotation
  hl-page:: 9
  hl-color:: yellow
  id:: 6565f88e-ddb7-4f14-aa5e-e067f871157b
- highlight the ability of the model to simulate facilitation for N between the two species
  ls-type:: annotation
  hl-page:: 10
  hl-color:: yellow
  id:: 6566124e-38d4-4938-9b5e-ce05b09b9fc6
- Legume species typically exhibit lower competitiveness for soil mineral N uptake when compared to cereal crops
  ls-type:: annotation
  hl-page:: 10
  hl-color:: green
  id:: 6566125a-d974-42f7-8cd2-ef0ca8edc4ca
- This characteristic enables cereal crops to achieve a superior N nutrition status per plant, initiating a positive feedback loop. As crop biomass increases, there is enhanced root exploration in the soil, resulting in greater N uptake (Bedoussac and Justes 2010).
  ls-type:: annotation
  hl-page:: 11
  hl-color:: yellow
  id:: 65661275-84f0-48ab-9aa6-55eb190edd77
- During their first development phases, legume crops may experience an increase in the number of nodules due to the soil nitrate concentration that drops off as a result of the greater competition for N uptake by the cereal crop, which also stimulates N2 fixation rate (Bedoussac and Justes2010).
  ls-type:: annotation
  hl-page:: 11
  hl-color:: yellow
  id:: 65661355-b766-4872-b93e-168dfdc89a44
- This niche complementarity for N sources between cereal and legume crops is an important property of this type of intercropping
  ls-type:: annotation
  hl-page:: 11
  hl-color:: yellow
  id:: 65661456-88f2-43cb-9c4e-53b91666883b
- an increase in N acquisition in wheat crops thanks to a higher competitiveness that forced the pea to increase its NDFA
  ls-type:: annotation
  hl-page:: 11
  hl-color:: yellow
  id:: 6566151f-793c-42fa-8a23-a92e8ed375ee
	- This effect comes from a higher competition from the wheat to soil mineral-N, but is described as a facilitation process for the intercrop because it leads to a higher overall N content in the intercrop canopy compared to the cereal sole crop, and to an over-yielding illustrated by an LER significantly above one (Justes et al. 2021).
	  ls-type:: annotation
	  hl-page:: 11
	  hl-color:: yellow
	  id:: 6566177a-beab-41bc-8c68-07a53d8fdd4f
- Our simulation results reflect a particularly interesting emergent property of STICS that is able to simulate this niche complementarity for N without any explicit formalism sensu stricto, and with equations that require no recalibration or new specific implementation procedure.
  ls-type:: annotation
  hl-page:: 11
  hl-color:: yellow
  id:: 65661da9-bf8c-426d-ada4-a83c28907773
- This is precisely what we seek in soil-crop models, i.e. implementing simple and generic formalisms that once coupled make the model able to dynamically simulate the functioning of more complex systems thanks to emerging properties arising from the process’s interaction.
  ls-type:: annotation
  hl-page:: 11
  hl-color:: green
  id:: 65661db7-8751-479d-84e7-c04d55bfad6c
- This approach has also proven useful in studies on nutrient stress (Bouain et al. 2019), periodic patterns in plant development (Mathieu et al. 2008; Vezy et al. 2020), environnemental impact on plant architecture(Eschenbach 2005), and even population and community dynamics predicted from individual-based algorithms (Hammond and Niklas 2009)
  ls-type:: annotation
  hl-page:: 11
  hl-color:: yellow
  id:: 65661e1f-5123-4b2d-89b6-6ce24dfb1f50
- Numerous studies have found that plant architecture is influenced by the type of species mixture (Liu et al. 2017). 
  ls-type:: annotation
  hl-page:: 11
  hl-color:: yellow
  id:: 65661e32-06bb-45da-85c1-3f3c480bc399
	- In STICS, we do not implement such behavior explicitly except for the shoot elongation, which was not found significant in the field observations of our data base
	  ls-type:: annotation
	  hl-page:: 11
	  hl-color:: yellow
	  id:: 65661e4c-935e-431a-9867-1df3b2c68d2d
- Accordingly, simulations for durum wheat were consistent for situations where the crop was dominant (associated with pea) and dominated (associated with faba bean, see Fig. 5)
  ls-type:: annotation
  hl-page:: 11
  hl-color:: yellow
  id:: 65661f78-a7f7-4c5c-aac1-1c2cf119a8cd
- Such results may indicate another possible emergent property of STICS, showing that plant plasticity in the field may also act as a buffer to such behavioral changes when considering plants at the community scale instead of the plant scale.
  ls-type:: annotation
  hl-page:: 11
  hl-color:: yellow
  id:: 65661f98-e98a-4b2f-9121-fa381e4de427
	- In other words, the heterogeneity in architectural traits of the dominant crop could help reduce the elongation effect of the dominated crop, and the intensity of the elongation effect of the dominated crop could also be uneven between individuals.
	  ls-type:: annotation
	  hl-page:: 11
	  hl-color:: yellow
	  id:: 65661fd5-879f-4425-9523-a2fff3b2134a
- These plasticity effects of both crops could then reduce the overall effect of plant elongation at the intercrop scale, which could be the reason why no significant effect was measured at this scale in our database, and in the end alleviate the need for changes in parameter values in the model (Louarn et al. 2020).
  ls-type:: annotation
  hl-page:: 11
  hl-color:: yellow
  id:: 6566f756-974c-4050-8b4c-9429d1b01663
-
- ### 3.3 Genericity of the formalisms: simulation of contrasted intercrops
- The simulation results indicated that the model **failed to replicate the highest values for LAI, N acquired, and N fixation**.
  ls-type:: annotation
  hl-page:: 11
  hl-color:: yellow
  id:: 6566f9c0-7abc-4cc7-ada8-f5dd5e23ef35
	- This discrepancy can be attributed to the **calibration** of the model using a **sole crop** dataset where **such values were not observed**
	  hl-page:: 11
	  ls-type:: annotation
	  id:: 6566f9d1-b3a9-4ccf-94a8-253fc02bc6b2
	  hl-color:: yellow
	- This issue could be rectified in future studies by using a **larger training dataset** encompassing a wider range of observed values.
	  hl-page:: 11
	  ls-type:: annotation
	  id:: 6566f9dd-f3f2-4b63-98e1-ffedebd67e95
	  hl-color:: yellow
- the evaluation indicated a **modeling efficiency (EF)** equal to or higher than 0.71 for all variables considered dynamically throughout the growing season; this indicates correct performances per se and also in comparison to what is widely published for crop models for classical sole crops.
  ls-type:: annotation
  hl-page:: 12
  hl-color:: yellow
  id:: 65671231-be8f-417e-8302-bf715aa3e5d0
- The simulated variables were all assessed as “very good” **using the method of Coucheney et al.** (2015), except for NDFA and N acquired that were classified as “good”
  ls-type:: annotation
  hl-page:: 12
  hl-color:: yellow
  id:: 65671244-8f1e-47e2-8c77-23c47f5e8c6a
- STICS was also evaluated at critical crop growth stages, which produces a better evaluation of its capability to reproduce the system behavior and dynamic processes at crucial stages and over time.
  ls-type:: annotation
  hl-page:: 12
  hl-color:: yellow
  id:: 656714fa-634f-41a5-93df-a8a1f3bf6f61
- STICS could also satisfactorily reproduce crop functioning for all variables, with an EF above 0.5, except for the N content in the grains at harvest that showed lower efficiency
  ls-type:: annotation
  hl-page:: 12
  hl-color:: yellow
  id:: 65671503-bcd8-4b43-947b-b84bacaf2292
- The N acquisition is the variable that usually presents the highest modeling error for soil-crop models, a behavior that was recognized in previous versions of the model (Coucheney et al. 2015).
  ls-type:: annotation
  hl-page:: 12
  hl-color:: green
  id:: 65671529-5c60-4422-889d-a982c1d1f52e
	- This variable is one of the most complex to simulate because it depends on many processes that interact throughout the crop development cycle in intercrop systems (Bedoussac and Justes 2010).
	  ls-type:: annotation
	  hl-page:: 12
	  hl-color:: green
	  id:: 6567158b-5ed6-473f-aca9-6988c0e93d42
- It is also worth noting that it presented a low bias of 0.13%, which is still encouraging.
  ls-type:: annotation
  hl-page:: 12
  hl-color:: yellow
  id:: 6567159d-fefc-473b-8e2d-793dcdd26820
- sunflower biomass was overestimated
  ls-type:: annotation
  hl-page:: 12
  hl-color:: yellow
  id:: 656715c2-08de-40ff-ad12-5bbbbcf311c8
- A good surprise was that STICS was able to correctly simulate the performance of intercrop in terms of the partial LER calculated from the output variables simulated, with an EF of 0.78, an nRMSE of21%, and a bias close to zero.
  ls-type:: annotation
  hl-page:: 13
  hl-color:: yellow
  id:: 656717a2-0c1a-4ddf-a1df-f6c3701f6050
- the model’s ability to effectively simulate the trends between various species associations and spatial designs of intercropping systems, coupled with its low bias when compared to observations, indicates that it is already suitable for conducting reliable intercomparisons of different agricultural systems and scenario analyses
  ls-type:: annotation
  hl-page:: 14
  hl-color:: yellow
  id:: 65672ced-3f09-4e84-9629-dbad4e014c1c
- These findings suggest that our current formalism for simulating N concentration in grain needs to be improved for simulating the process of N assimilates transfer to grains in intercropping.
  ls-type:: annotation
  hl-page:: 14
  hl-color:: yellow
  id:: 6567349c-6e75-4d41-880a-8a35fbc3e8a9
- STICS was able to reproduce with high accuracy the grain yield and the partial LER and total LER, which were calculated using simulated variables. This accuracy is crucial when employing the model as a tool to study new systems computationally, such as intercropping systems versus traditional sole crops.
  ls-type:: annotation
  hl-page:: 14
  hl-color:: yellow
  id:: 65673a8f-345c-4f64-aff2-3d8fc014c5ad
- Additionally, the model proves valuable in estimating output variables that are not directly measured in field experiments, particularly environmental outputs like drainage (Tournebize et al. 2004), NO3 leaching (Schnebelen et al. 2004; Constantin et al. 2012; Jégo et al. 2012), emissions of CO 2 (Wattenbach et al. 2010) and N 2 O (Plaza-Bonilla et al. 2018), and organic C content in the soil (Justes et al. 2009; Levavasseur et al. 2021).
  ls-type:: annotation
  hl-page:: 14
  hl-color:: yellow
  id:: 65673a98-8b0c-48e3-be01-9dd4c35049be
- It should be noted that the formalisms proposed and implemented in this study, and more generally STICS, were only calibrated on sole crops and applied with sole crop parameter values on intercrop simulations, the hypothesis being that STICS should simulate all interactions directly rather than adding or tuning parameters.
  hl-page:: 14
  ls-type:: annotation
  id:: 65673aba-1744-45b8-b56a-27937f46f9be
  hl-color:: yellow
- Of all the new formalisms implemented in STICS, one stands out particularly for its relevance and accuracy, yet of a relative simplicity: the computation of plant height using the phasic development of the crop based on the thermal time corrected by (i) vernalization and photoperiodic effects,(ii) abiotic stresses on stem elongation rate, and (iii) shading on etiolation of plants in intercropping.
  ls-type:: annotation
  hl-page:: 15
  hl-color:: yellow
  id:: 65673e1b-2a30-48c5-ab39-a0d1b6d0a752
	- generic enough to provide accurate simulations for both sole crops and intercrops using the parameter values optimized on sole crops
	  ls-type:: annotation
	  hl-page:: 15
	  hl-color:: yellow
	  id:: 65673e39-8943-4507-bf6d-9a84d83a1695
	- plant height was repeatedly identified as one of the most important factors for intercrop simulation because of its role in determining competition for light (Corre-Hellou et al. 2009; Launay et al. 2009; Berghuijs et al. 2021)
	  ls-type:: annotation
	  hl-page:: 15
	  hl-color:: green
	  id:: 65673e4f-881c-42ed-acab-7fb10935c78c