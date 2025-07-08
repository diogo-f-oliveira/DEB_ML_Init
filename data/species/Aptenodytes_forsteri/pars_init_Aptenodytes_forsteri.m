function [par, metaPar, txtPar] = pars_init_Aptenodytes_forsteri(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 25.0859;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.045427;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.9976;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 21.6949;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.00088842;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7321.6771;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.374e+03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 2.776e+05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 9.247e-13;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 4.364e+04; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_000 = 11.1407;  free.f_000 = 1;   units.f_000 = '-';        label.f_000 = 'scaled functional response for tW data at 000 d'; 
par.f_010 = 0.0024531;  free.f_010 = 1;   units.f_010 = '-';        label.f_010 = 'scaled functional response for tW data at 010 d'; 
par.f_020 = 2.2383;   free.f_020 = 1;   units.f_020 = '-';        label.f_020 = 'scaled functional response for tW data at 020 d'; 
par.f_030 = 0.00016594;  free.f_030 = 1;   units.f_030 = '-';        label.f_030 = 'scaled functional response for tW data at 030 d'; 
par.f_040 = -0.0014816;  free.f_040 = 1;   units.f_040 = '-';        label.f_040 = 'scaled functional response for tW data at 040 d'; 
par.f_050 = 3.656;    free.f_050 = 1;   units.f_050 = '-';        label.f_050 = 'scaled functional response for tW data at 050 d'; 
par.f_060 = 0.23824;  free.f_060 = 1;   units.f_060 = '-';        label.f_060 = 'scaled functional response for tW data at 060 d'; 
par.f_070 = 0.0039475;  free.f_070 = 1;   units.f_070 = '-';        label.f_070 = 'scaled functional response for tW data at 070 d'; 
par.f_080 = 11.7724;  free.f_080 = 1;   units.f_080 = '-';        label.f_080 = 'scaled functional response for tW data at 080 d'; 
par.f_090 = -2.8118e-05;  free.f_090 = 1;   units.f_090 = '-';        label.f_090 = 'scaled functional response for tW data at 090 d'; 
par.f_100 = -3.7171e-06;  free.f_100 = 1;   units.f_100 = '-';        label.f_100 = 'scaled functional response for tW data at 100 d'; 
par.f_110 = 7.7083;   free.f_110 = 1;   units.f_110 = '-';        label.f_110 = 'scaled functional response for tW data at 110 d'; 
par.f_120 = 2.6036;   free.f_120 = 1;   units.f_120 = '-';        label.f_120 = 'scaled functional response for tW data at 120 d'; 
par.f_130 = 0.13588;  free.f_130 = 1;   units.f_130 = '-';        label.f_130 = 'scaled functional response for tW data at 130 d'; 
par.f_140 = -0.000143;  free.f_140 = 1;   units.f_140 = '-';        label.f_140 = 'scaled functional response for tW data at 140 d'; 
par.f_150 = 0.024617;  free.f_150 = 1;   units.f_150 = '-';        label.f_150 = 'scaled functional response for tW data at 150 d'; 
par.f_160 = 2.7842;   free.f_160 = 1;   units.f_160 = '-';        label.f_160 = 'scaled functional response for tW data at 160 d'; 
par.f_170 = 2.0626;   free.f_170 = 1;   units.f_170 = '-';        label.f_170 = 'scaled functional response for tW data at 170 d'; 
par.f_180 = 7.4341e-09;  free.f_180 = 1;   units.f_180 = '-';        label.f_180 = 'scaled functional response for tW data at 180 d'; 
par.t_R = 1642.5;     free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
