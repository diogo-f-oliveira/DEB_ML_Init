function [par, metaPar, txtPar] = pars_init_Saxicola_rubicola(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.0598;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.024363;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.9518;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 1614.6086;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.0020074;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7321.6646;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.735e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.443e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 7.552e-13;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 3.227e+03; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_00 = 0.12597;  free.f1_00 = 1;   units.f1_00 = '-';        label.f1_00 = 'scaled functional response for tW data at 00 d, StarKoni2008'; 
par.f1_03 = 2.7454;   free.f1_03 = 1;   units.f1_03 = '-';        label.f1_03 = 'scaled functional response for tW data at 03 d, StarKoni2008'; 
par.f1_06 = 1.5629;   free.f1_06 = 1;   units.f1_06 = '-';        label.f1_06 = 'scaled functional response for tW data at 06 d, StarKoni2008'; 
par.f1_09 = 1.8422;   free.f1_09 = 1;   units.f1_09 = '-';        label.f1_09 = 'scaled functional response for tW data at 09 d, StarKoni2008'; 
par.f1_12 = 0.95319;  free.f1_12 = 1;   units.f1_12 = '-';        label.f1_12 = 'scaled functional response for tW data at 12 d, StarKoni2008'; 
par.f1_30 = 1.0252;   free.f1_30 = 1;   units.f1_30 = '-';        label.f1_30 = 'scaled functional response for tW data at 30 d, StarKoni2008'; 
par.f2_00 = 4.1881e-06;  free.f2_00 = 1;   units.f2_00 = '-';        label.f2_00 = 'scaled functional response for tW data at 00 d, Oost2016'; 
par.f2_03 = 2.9764;   free.f2_03 = 1;   units.f2_03 = '-';        label.f2_03 = 'scaled functional response for tW data at 03 d, Oost2016'; 
par.f2_06 = 2.3803;   free.f2_06 = 1;   units.f2_06 = '-';        label.f2_06 = 'scaled functional response for tW data at 06 d, Oost2016'; 
par.f2_09 = 1.2853;   free.f2_09 = 1;   units.f2_09 = '-';        label.f2_09 = 'scaled functional response for tW data at 09 d, Oost2016'; 
par.f2_12 = 0.82377;  free.f2_12 = 1;   units.f2_12 = '-';        label.f2_12 = 'scaled functional response for tW data at 12 d, Oost2016'; 
par.f2_15 = 0.71657;  free.f2_15 = 1;   units.f2_15 = '-';        label.f2_15 = 'scaled functional response for tW data at 15 d, Oost2016'; 
par.f2_30 = 2.3157;   free.f2_30 = 1;   units.f2_30 = '-';        label.f2_30 = 'scaled functional response for tW data at 30 d, Oost2016'; 
par.t_R = 365;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
