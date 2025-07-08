function [par, metaPar, txtPar] = pars_init_Harengula_clupeola(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 3.505;        free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_M}, spec max searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'defecation efficiency'; 
par.v = 0.017184;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.36346;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 12.5568;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], spec somatic maintenance'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, spec somatic maintenance'; 
par.k_J = 0.00069689;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maintenance rate coefficient'; 
par.E_G = 5237.6099;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec costs for structure'; 
par.E_Hb = 8.152e+00; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 9.998e+00; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 7.974e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 8.369e-09;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'ageing accelerations'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.1678;   free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_0400 = 1.2993;  free.f_0400 = 1;   units.f_0400 = '-';       label.f_0400 = 'scaled functional response for tL data at 400 d'; 
par.f_2000 = 0.241;   free.f_2000 = 1;   units.f_2000 = '-';       label.f_2000 = 'scaled functional response for tL data at 2000 d'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
