function [par, metaPar, txtPar] = pars_init_Crassostrea_virginica(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 4548.0055;  free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'T_A'; 
par.z = 1.8647;       free.z     = 1;   units.z = '-';            label.z = 'z'; 
par.F_m = 31.7823;    free.F_m   = 1;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_M}'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'kap_X'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'kap_P'; 
par.v = 0.021499;     free.v     = 1;   units.v = 'cm/d';         label.v = 'v'; 
par.kap = 0.70032;    free.kap   = 1;   units.kap = '-';          label.kap = 'kap'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'kap_R'; 
par.p_M = 4.3055;     free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M]'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}'; 
par.k_J = 0.00055616;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'k_J'; 
par.E_G = 2319.9589;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G]'; 
par.E_Hb = 1.140e-03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'E_Hb'; 
par.E_Hj = 6.452e-02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'E_Hj'; 
par.E_Hp = 1.054e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'E_Hp'; 
par.h_a = 9.504e-10;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'h_a'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 's_G'; 

%% other parameters 
par.J_XFm = 0.000128;  free.J_XFm = 0;   units.J_XFm = 'mol/d.cm^2';  label.J_XFm = 'maximum surface-specific ingestion rate'; 
par.L0 = 7;           free.L0    = 0;   units.L0 = 'cm';          label.L0 = 'shell length for ingestion'; 
par.del_Mb = 1.2649;  free.del_Mb = 1;   units.del_Mb = '-';       label.del_Mb = 'del_Mb'; 
par.del_Mj = 0.2491;  free.del_Mj = 1;   units.del_Mj = '-';       label.del_Mj = 'del_Mj'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_CasaLape2011 = 0.9;  free.f_CasaLape2011 = 0;   units.f_CasaLape2011 = '-';  label.f_CasaLape2011 = 'scaled functional response for CasaLape2011 data'; 
par.f_HopkMack1953 = 1;  free.f_HopkMack1953 = 0;   units.f_HopkMack1953 = '-';  label.f_HopkMack1953 = 'scaled functional response for HopkMack1953 data'; 
par.f_MannSout2009 = 0.73808;  free.f_MannSout2009 = 1;   units.f_MannSout2009 = '-';  label.f_MannSout2009 = 'scaled functional response for MannSout2009 data'; 
par.f_PaynPoli2010 = 1;  free.f_PaynPoli2010 = 0;   units.f_PaynPoli2010 = '-';  label.f_PaynPoli2010 = 'scaled functional response for PaynPoli2010 data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
