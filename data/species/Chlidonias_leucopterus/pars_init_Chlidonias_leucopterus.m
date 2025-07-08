function [par, metaPar, txtPar] = pars_init_Chlidonias_leucopterus(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.972;        free.z     = 1;   units.z = '-';            label.z = 'zoom factor for females'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.029727;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.98136;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 807.1873;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.032918;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7320.801;   free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.475e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 2.047e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.012e-12;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.001;      free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 8.170e+02; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_06 = 1.5786;   free.f1_06 = 1;   units.f1_06 = '-';        label.f1_06 = 'scaled functional response for tW1 data at 06 d'; 
par.f1_09 = 1.5836;   free.f1_09 = 1;   units.f1_09 = '-';        label.f1_09 = 'scaled functional response for tW1 data at 09 d'; 
par.f1_12 = 3.5999;   free.f1_12 = 1;   units.f1_12 = '-';        label.f1_12 = 'scaled functional response for tW1 data at 12 d'; 
par.f1_15 = 0.017373;  free.f1_15 = 1;   units.f1_15 = '-';        label.f1_15 = 'scaled functional response for tW1 data at 15 d'; 
par.f1_18 = 1.515;    free.f1_18 = 1;   units.f1_18 = '-';        label.f1_18 = 'scaled functional response for tW1 data at 18 d'; 
par.f1_21 = 0.19923;  free.f1_21 = 1;   units.f1_21 = '-';        label.f1_21 = 'scaled functional response for tW1 data at 21 d'; 
par.f1_24 = 0.76064;  free.f1_24 = 1;   units.f1_24 = '-';        label.f1_24 = 'scaled functional response for tW1 data at 24 d'; 
par.f1_27 = 0.79855;  free.f1_27 = 1;   units.f1_27 = '-';        label.f1_27 = 'scaled functional response for tW1 data at 27 d'; 
par.f2_06 = 1.7276;   free.f2_06 = 1;   units.f2_06 = '-';        label.f2_06 = 'scaled functional response for tW2 data at 06 d'; 
par.f2_09 = 3.3342;   free.f2_09 = 1;   units.f2_09 = '-';        label.f2_09 = 'scaled functional response for tW2 data at 09 d'; 
par.f2_12 = 1.8621;   free.f2_12 = 1;   units.f2_12 = '-';        label.f2_12 = 'scaled functional response for tW2 data at 12 d'; 
par.f2_15 = 0.44114;  free.f2_15 = 1;   units.f2_15 = '-';        label.f2_15 = 'scaled functional response for tW2 data at 15 d'; 
par.f2_18 = 1.3184;   free.f2_18 = 1;   units.f2_18 = '-';        label.f2_18 = 'scaled functional response for tW2 data at 18 d'; 
par.f2_21 = 0.63785;  free.f2_21 = 1;   units.f2_21 = '-';        label.f2_21 = 'scaled functional response for tW2 data at 21 d'; 
par.f2_24 = 0.48088;  free.f2_24 = 1;   units.f2_24 = '-';        label.f2_24 = 'scaled functional response for tW2 data at 24 d'; 
par.f2_27 = 1.9599;   free.f2_27 = 1;   units.f2_27 = '-';        label.f2_27 = 'scaled functional response for tW2 data at 27 d'; 
par.f_06 = 1.3989;    free.f_06  = 1;   units.f_06 = '-';         label.f_06 = 'scaled functional response for tW data at 06 d'; 
par.f_09 = 3.3729;    free.f_09  = 1;   units.f_09 = '-';         label.f_09 = 'scaled functional response for tW data at 09 d'; 
par.f_12 = 1.3126;    free.f_12  = 1;   units.f_12 = '-';         label.f_12 = 'scaled functional response for tW data at 12 d'; 
par.f_15 = 1.0969;    free.f_15  = 1;   units.f_15 = '-';         label.f_15 = 'scaled functional response for tW data at 15 d'; 
par.f_18 = 0.82394;   free.f_18  = 1;   units.f_18 = '-';         label.f_18 = 'scaled functional response for tW data at 18 d'; 
par.f_21 = 0.035539;  free.f_21  = 1;   units.f_21 = '-';         label.f_21 = 'scaled functional response for tW data at 21 d'; 
par.f_24 = 0.67144;   free.f_24  = 1;   units.f_24 = '-';         label.f_24 = 'scaled functional response for tW data at 24 d'; 
par.t_R = 730;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
