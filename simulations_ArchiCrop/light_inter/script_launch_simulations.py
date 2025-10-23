from __future__ import annotations

from openalea.archicrop.simulation import (
    complete_archi_params,
    LHS_param_sampling,
    simulate_with_filters
)
from openalea.archicrop.light_it import light_interception
from openalea.archicrop.stics_io import get_stics_data


def run_simulations(archi_params: dict, 
             tec_file: str, plant_file: str, dynamics_file: str, weather_file: str, 
             n_samples: int = 100, seed: int = 42, 
             light_inter: bool = True, zenith: bool = False, save_scenes: bool = False):

    # Retrieve STICS management and senescence parameters
    sowing_density, daily_dynamics, lifespan, lifespan_early = get_stics_data(
        file_tec_xml=tec_file,  # Path to the STICS management XML file
        file_plt_xml=plant_file,  # Path to the STICS plant XML file
        stics_output_file=dynamics_file  # Path to the STICS output file
    )

    # Complete the architecture parameters with values from daily dynamics.
    archi_params = complete_archi_params(archi_params=archi_params, daily_dynamics=daily_dynamics, lifespan=lifespan, lifespan_early=lifespan_early)
    
    # Sampling parameters using Latin Hypercube Sampling
    param_sets = LHS_param_sampling(archi_params=archi_params, n_samples=n_samples, seed=seed)

    # Simulate plant growth with fitting parameters
    fit_params, non_fit_params, realized_la, realized_h, mtgs = simulate_with_filters(
        param_sets=param_sets, 
        daily_dynamics=daily_dynamics,
        error_LA=0.05,
        error_height=0.05, 
        opt_filter_pot_growth=True,
        opt_filter_realized_growth=True
    ) 

    # If light_inter is True, compute light interception on plants with fitting parameters
    if light_inter:
        nrj_per_plant = light_interception(
            weather_file=weather_file,  # Path to the weather file
            daily_dynamics=daily_dynamics,  
            sowing_density=sowing_density,  
            mtgs=mtgs,  
            zenith=zenith,  
            save_scenes=save_scenes
        )
    else:
        nrj_per_plant = None

    return fit_params, non_fit_params, realized_la, realized_h, nrj_per_plant

