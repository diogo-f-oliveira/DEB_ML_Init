function [par, metaPar, txtPar] = pars_init_Pseudemydura_umbrina(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 19731;      free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'T_A'; 
par.z = 7.6493;       free.z     = 1;   units.z = '-';            label.z = 'z'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_M}'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'kap_X'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'kap_P'; 
par.v = 0.025724;     free.v     = 1;   units.v = 'cm/d';         label.v = 'v'; 
par.kap = 0.64866;    free.kap   = 1;   units.kap = '-';          label.kap = 'kap'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'kap_R'; 
par.p_M = 18.9334;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M]'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}'; 
par.k_J = 0.0019898;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'k_J'; 
par.E_G = 8290.9886;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G]'; 
par.E_Hb = 1.043e+04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'E_Hb'; 
par.E_Hp = 5.467e+05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'E_Hp'; 
par.h_a = 9.195e-11;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'h_a'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 's_G'; 

%% other parameters 
par.T_AH = 90000;     free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'T_AH'; 
par.T_AL = 50000;     free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'T_AL'; 
par.T_H = 304.15;     free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'T_H'; 
par.T_L = 278.15;     free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'T_L'; 
par.del_M = 0.42991;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'del_M'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'f'; 
par.s_M = 0.073599;   free.s_M   = 1;   units.s_M = '-';          label.s_M = 's_M'; 
par.s_MO2 = 1;        free.s_MO2 = 0;   units.s_MO2 = '-';        label.s_MO2 = 's_MO2'; 
par.s_Megg = 1;       free.s_Megg = 0;   units.s_Megg = '-';       label.s_Megg = 's_Megg'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
