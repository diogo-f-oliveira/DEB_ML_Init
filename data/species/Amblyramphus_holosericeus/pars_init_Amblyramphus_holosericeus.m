function [par, metaPar, txtPar] = pars_init_Amblyramphus_holosericeus(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.6033;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.030423;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.98143;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 1437.1006;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.058535;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7323.7977;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 8.543e+01; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.387e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.287e-14;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 5.271e+02; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_00 = 1.2286;   free.f1_00 = 1;   units.f1_00 = '-';        label.f1_00 = 'scaled functional response for tW data at 00 d, nestl 1'; 
par.f1_03 = 2.609;    free.f1_03 = 1;   units.f1_03 = '-';        label.f1_03 = 'scaled functional response for tW data at 03 d, nestl 1'; 
par.f1_10 = 1.8738;   free.f1_10 = 1;   units.f1_10 = '-';        label.f1_10 = 'scaled functional response for tW data at 10 d, nestl 1'; 
par.f1_13 = 2.9538e-06;  free.f1_13 = 1;   units.f1_13 = '-';        label.f1_13 = 'scaled functional response for tW data at 13 d, nestl 1'; 
par.f2_00 = 1.4191;   free.f2_00 = 1;   units.f2_00 = '-';        label.f2_00 = 'scaled functional response for tW data at 00 d, nestl 2'; 
par.f2_03 = 2.3823;   free.f2_03 = 1;   units.f2_03 = '-';        label.f2_03 = 'scaled functional response for tW data at 03 d, nestl 2'; 
par.f2_10 = 1.8538;   free.f2_10 = 1;   units.f2_10 = '-';        label.f2_10 = 'scaled functional response for tW data at 10 d, nestl 2'; 
par.f2_13 = -0.00029082;  free.f2_13 = 1;   units.f2_13 = '-';        label.f2_13 = 'scaled functional response for tW data at 13 d, nestl 2'; 
par.f3_00 = 0.0012393;  free.f3_00 = 1;   units.f3_00 = '-';        label.f3_00 = 'scaled functional response for tW data at 00 d, nestl 3'; 
par.f3_03 = 2.8435;   free.f3_03 = 1;   units.f3_03 = '-';        label.f3_03 = 'scaled functional response for tW data at 03 d, nestl 3'; 
par.f3_10 = 1.4881;   free.f3_10 = 1;   units.f3_10 = '-';        label.f3_10 = 'scaled functional response for tW data at 10 d, nestl 3'; 
par.f3_13 = 0.76449;  free.f3_13 = 1;   units.f3_13 = '-';        label.f3_13 = 'scaled functional response for tW data at 13 d, nestl 3'; 
par.t_R = 365;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 
par.z_m = 1.6652;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
