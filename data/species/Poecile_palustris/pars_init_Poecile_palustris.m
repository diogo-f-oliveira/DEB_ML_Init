function [par, metaPar, txtPar] = pars_init_Poecile_palustris(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.2854;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.5;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.023729;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.9383;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 522.3295;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.020971;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7329.8387;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.074e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 2.621e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.309e-13;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 9.699e+02; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_MO05 = 3.2287;  free.f_MO05 = 1;   units.f_MO05 = '-';       label.f_MO05 = 'scaled functional response for tW_MO data at 05 d'; 
par.f_MO09 = 2.0481;  free.f_MO09 = 1;   units.f_MO09 = '-';       label.f_MO09 = 'scaled functional response for tW_MO data at 09 d'; 
par.f_MO15 = 0.021783;  free.f_MO15 = 1;   units.f_MO15 = '-';       label.f_MO15 = 'scaled functional response for tW_MO data at 15 d'; 
par.f_MY05 = 3.1501;  free.f_MY05 = 1;   units.f_MY05 = '-';       label.f_MY05 = 'scaled functional response for tW_MY data at 05 d'; 
par.f_MY09 = 1.8277;  free.f_MY09 = 1;   units.f_MY09 = '-';       label.f_MY09 = 'scaled functional response for tW_MY data at 09 d'; 
par.f_MY15 = 0.014451;  free.f_MY15 = 1;   units.f_MY15 = '-';       label.f_MY15 = 'scaled functional response for tW_MY data at 15 d'; 
par.f_TO05 = 3.2218;  free.f_TO05 = 1;   units.f_TO05 = '-';       label.f_TO05 = 'scaled functional response for tW_TO data at 05 d'; 
par.f_TO09 = 2.0725;  free.f_TO09 = 1;   units.f_TO09 = '-';       label.f_TO09 = 'scaled functional response for tW_TO data at 09 d'; 
par.f_TO15 = 0.24549;  free.f_TO15 = 1;   units.f_TO15 = '-';       label.f_TO15 = 'scaled functional response for tW_TO data at 15 d'; 
par.f_TY05 = 3.0955;  free.f_TY05 = 1;   units.f_TY05 = '-';       label.f_TY05 = 'scaled functional response for tW_TY data at 05 d'; 
par.f_TY09 = 1.6579;  free.f_TY09 = 1;   units.f_TY09 = '-';       label.f_TY09 = 'scaled functional response for tW_TY data at 09 d'; 
par.f_TY15 = 0.38258;  free.f_TY15 = 1;   units.f_TY15 = '-';       label.f_TY15 = 'scaled functional response for tW_TY data at 15 d'; 
par.t_R = 365;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
