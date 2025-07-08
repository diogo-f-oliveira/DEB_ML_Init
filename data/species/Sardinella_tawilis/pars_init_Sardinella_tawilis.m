function [par, metaPar, txtPar] = pars_init_Sardinella_tawilis(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius tmeprature'; 
par.z = 1.5346;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_M}, spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'defacation efficiency'; 
par.v = 0.020442;     free.v     = 1;   units.v = 'cm/d';         label.v = 'engergy conductance'; 
par.kap = 0.65441;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 19.6923;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], spec som maintenans'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, spec somatic maintenance'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'mainturity maintenance rate coefficient'; 
par.E_G = 5228.9199;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec costs for structure'; 
par.E_Hb = 5.930e-01; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'E_Hb, maturity at birth'; 
par.E_Hj = 1.777e+00; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'E_Hj, maturity at metam'; 
par.E_Hp = 1.081e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'E_Hp, maturity at puberty'; 
par.h_a = 5.905e-09;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'h_a, ageing acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 's_G, Gompertz stress coeffcient'; 

%% other parameters 
par.del_M = 0.18313;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_tL = 1.2414;    free.f_tL  = 1;   units.f_tL = '-';         label.f_tL = 'scaled functional response for tL data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
