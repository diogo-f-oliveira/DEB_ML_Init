function [par, metaPar, txtPar] = pars_init_Ornithorhynchus_anatinus(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 8.1478;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor for females'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.076013;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.99866;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 196.0714;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7803.5267;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.442e+00; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 6.748e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.042e-17;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.1;        free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 5.026e+03; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at weaning'; 
par.del_M = 0.18902;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.fB_005 = 8.6452;  free.fB_005 = 1;   units.fB_005 = '-';       label.fB_005 = 'scaled functional response pre-weaning for tW_B data at 05 d'; 
par.fB_025 = 5.2522;  free.fB_025 = 1;   units.fB_025 = '-';       label.fB_025 = 'scaled functional response pre-weaning for tW_B data at 25 d'; 
par.fB_050 = 1.1382;  free.fB_050 = 1;   units.fB_050 = '-';       label.fB_050 = 'scaled functional response for tW_B data at 050 d'; 
par.fB_100 = 0.7552;  free.fB_100 = 1;   units.fB_100 = '-';       label.fB_100 = 'scaled functional response for tW_B data at 100 d'; 
par.fB_200 = 1.0021;  free.fB_200 = 1;   units.fB_200 = '-';       label.fB_200 = 'scaled functional response for tW_B data at 200 dx'; 
par.fY_005 = 6.386;   free.fY_005 = 1;   units.fY_005 = '-';       label.fY_005 = 'scaled functional response for tW_Y data at 005 d'; 
par.fY_025 = 4.3613;  free.fY_025 = 1;   units.fY_025 = '-';       label.fY_025 = 'scaled functional response for tW_Y data at 025 d'; 
par.fY_050 = 0.24244;  free.fY_050 = 1;   units.fY_050 = '-';       label.fY_050 = 'scaled functional response pre-weaning for tW_Y data at 050 d'; 
par.fY_100 = 0.92698;  free.fY_100 = 1;   units.fY_100 = '-';       label.fY_100 = 'scaled functional response pre-weaning for tW_Y data at 100 d'; 
par.fY_200 = 0.70252;  free.fY_200 = 1;   units.fY_200 = '-';       label.fY_200 = 'scaled functional response pre-weaning for tW_Y data at 200 d'; 
par.t_0 = 28.7724;    free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development'; 
par.z_m = 9.4979;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor  for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
