function [par, metaPar, txtPar] = pars_init_Buteo_jamaicensis(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 4.2032;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor for females'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.031553;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.94393;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 706.6301;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.028806;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7322.0002;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 3.743e+03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 8.720e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 9.415e-13;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.001;      free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 3.414e+04; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_05 = 4.9904;   free.f1_05 = 1;   units.f1_05 = '-';        label.f1_05 = 'scaled functional response for tW1 data at 05 d'; 
par.f1_15 = 2.4925;   free.f1_15 = 1;   units.f1_15 = '-';        label.f1_15 = 'scaled functional response for tW1 data at 15 d'; 
par.f1_25 = 1.1061;   free.f1_25 = 1;   units.f1_25 = '-';        label.f1_25 = 'scaled functional response for tW1 data at 25 d'; 
par.f2_05 = 4.3743;   free.f2_05 = 1;   units.f2_05 = '-';        label.f2_05 = 'scaled functional response for tW2 data at 05 d'; 
par.f2_15 = 2.5833;   free.f2_15 = 1;   units.f2_15 = '-';        label.f2_15 = 'scaled functional response for tW2 data at 15 d'; 
par.f2_25 = 1.1412;   free.f2_25 = 1;   units.f2_25 = '-';        label.f2_25 = 'scaled functional response for tW2 data at 25 d'; 
par.f3_05 = 3.9253;   free.f3_05 = 1;   units.f3_05 = '-';        label.f3_05 = 'scaled functional response for tW3 data at 05 d'; 
par.f3_15 = 2.659;    free.f3_15 = 1;   units.f3_15 = '-';        label.f3_15 = 'scaled functional response for tW3 data at 15 d'; 
par.f3_25 = 0.8231;   free.f3_25 = 1;   units.f3_25 = '-';        label.f3_25 = 'scaled functional response for tW3 data at 25 d'; 
par.t_R = 730;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 
par.z_m = 4.0214;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
