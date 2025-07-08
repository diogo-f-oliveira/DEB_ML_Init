function [par, metaPar, txtPar] = pars_init_Eulimnadia_braueriana(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 2524.7154;  free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.14571;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.019892;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.90054;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 6843.5769;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4442.6294;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.596e-04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 7.573e-01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 3.850e-03;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.18243;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f15_05 = 0.06039;  free.f15_05 = 1;   units.f15_05 = '-';       label.f15_05 = 'scaled functional response for tL_05 data at 05 d'; 
par.f15_10 = 0.34241;  free.f15_10 = 1;   units.f15_10 = '-';       label.f15_10 = 'scaled functional response for tL_15 data at 10 d'; 
par.f15_20 = 0.62636;  free.f15_20 = 1;   units.f15_20 = '-';       label.f15_20 = 'scaled functional response for tL_15 data at 20 d'; 
par.f20_05 = 0.34759;  free.f20_05 = 1;   units.f20_05 = '-';       label.f20_05 = 'scaled functional response for tL_20 data at 05 d'; 
par.f20_10 = 0.64325;  free.f20_10 = 1;   units.f20_10 = '-';       label.f20_10 = 'scaled functional response for tL_20 data at 10 d'; 
par.f25_05 = 1.2824;  free.f25_05 = 1;   units.f25_05 = '-';       label.f25_05 = 'scaled functional response for tL_25 data at 05 d'; 
par.f25_10 = 0.51876;  free.f25_10 = 1;   units.f25_10 = '-';       label.f25_10 = 'scaled functional response for tL_25 data at 10 d'; 
par.f30_05 = 1.4891;  free.f30_05 = 1;   units.f30_05 = '-';       label.f30_05 = 'scaled functional response for tL_30 data at 05 d'; 
par.f30_10 = 0.4861;  free.f30_10 = 1;   units.f30_10 = '-';       label.f30_10 = 'scaled functional response for tL_30 data at 10 d'; 
par.f_tL = 0.092059;  free.f_tL  = 1;   units.f_tL = '-';         label.f_tL = 'scaled functional response for tL data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
