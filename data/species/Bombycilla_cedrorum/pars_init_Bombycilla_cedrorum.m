function [par, metaPar, txtPar] = pars_init_Bombycilla_cedrorum(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.6687;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.038984;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.96031;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 861.7928;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.035255;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7322.8266;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.305e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 3.758e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 4.546e-14;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 1.575e+03; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_02 = 2.5537;   free.f1_02 = 1;   units.f1_02 = '-';        label.f1_02 = 'scaled functional response for tW1 data at 02 d'; 
par.f1_06 = 2.1757;   free.f1_06 = 1;   units.f1_06 = '-';        label.f1_06 = 'scaled functional response for tW1 data at 6 d'; 
par.f1_10 = 1.1864;   free.f1_10 = 1;   units.f1_10 = '-';        label.f1_10 = 'scaled functional response for tW1 data at 10 d'; 
par.f1_14 = 0.77366;  free.f1_14 = 1;   units.f1_14 = '-';        label.f1_14 = 'scaled functional response for tW1 data at 14 d'; 
par.f2_02 = 2.6187;   free.f2_02 = 1;   units.f2_02 = '-';        label.f2_02 = 'scaled functional response for tW2 data at 02 d'; 
par.f2_06 = 2.2395;   free.f2_06 = 1;   units.f2_06 = '-';        label.f2_06 = 'scaled functional response for tW2 data at 6 d'; 
par.f2_10 = 1.0626;   free.f2_10 = 1;   units.f2_10 = '-';        label.f2_10 = 'scaled functional response for tW2 data at 10 d'; 
par.f2_14 = 0.9395;   free.f2_14 = 1;   units.f2_14 = '-';        label.f2_14 = 'scaled functional response for tW2 data at 14 d'; 
par.f3_02 = 2.8586;   free.f3_02 = 1;   units.f3_02 = '-';        label.f3_02 = 'scaled functional response for tW3 data at 02 d'; 
par.f3_06 = 2.1124;   free.f3_06 = 1;   units.f3_06 = '-';        label.f3_06 = 'scaled functional response for tW3 data at 6 d'; 
par.f3_10 = 1.0511;   free.f3_10 = 1;   units.f3_10 = '-';        label.f3_10 = 'scaled functional response for tW3 data at 10 d'; 
par.f3_14 = 1.0094;   free.f3_14 = 1;   units.f3_14 = '-';        label.f3_14 = 'scaled functional response for tW3 data at 14 d'; 
par.f4_02 = 2.8491;   free.f4_02 = 1;   units.f4_02 = '-';        label.f4_02 = 'scaled functional response for tW4 data at 02 d'; 
par.f4_06 = 2.0942;   free.f4_06 = 1;   units.f4_06 = '-';        label.f4_06 = 'scaled functional response for tW4 data at 6 d'; 
par.f4_10 = 1.282;    free.f4_10 = 1;   units.f4_10 = '-';        label.f4_10 = 'scaled functional response for tW4 data at 10 d'; 
par.f4_14 = 0.0049287;  free.f4_14 = 1;   units.f4_14 = '-';        label.f4_14 = 'scaled functional response for tW4 data at 14 d'; 
par.t_R = 365;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
