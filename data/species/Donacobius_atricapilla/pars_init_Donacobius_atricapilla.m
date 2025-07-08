function [par, metaPar, txtPar] = pars_init_Donacobius_atricapilla(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.6971;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.028027;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.97459;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 666.3652;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.02741;    free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7316.8085;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.439e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 2.316e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 6.457e-12;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 8.957e+02; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f2_00 = 1.7575;   free.f2_00 = 1;   units.f2_00 = '-';        label.f2_00 = 'scaled functional response for tW2 data at 00 d'; 
par.f2_03 = 2.5612;   free.f2_03 = 1;   units.f2_03 = '-';        label.f2_03 = 'scaled functional response for tW2 data at 03 d'; 
par.f2_12 = 1.3506;   free.f2_12 = 1;   units.f2_12 = '-';        label.f2_12 = 'scaled functional response for tW2 data at 12 d'; 
par.f2_15 = 0.79907;  free.f2_15 = 1;   units.f2_15 = '-';        label.f2_15 = 'scaled functional response for tW2 data at 15 d'; 
par.f3_00 = 0.25959;  free.f3_00 = 1;   units.f3_00 = '-';        label.f3_00 = 'scaled functional response for tW3 data at 00 d'; 
par.f3_03 = 2.1721;   free.f3_03 = 1;   units.f3_03 = '-';        label.f3_03 = 'scaled functional response for tW3 data at 03 d'; 
par.f3_12 = 1.7557;   free.f3_12 = 1;   units.f3_12 = '-';        label.f3_12 = 'scaled functional response for tW3 data at 12 d'; 
par.f3_15 = 0.80207;  free.f3_15 = 1;   units.f3_15 = '-';        label.f3_15 = 'scaled functional response for tW3 data at 15 d'; 
par.t_R = 365;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 
par.z_m = 1.7287;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor  for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
