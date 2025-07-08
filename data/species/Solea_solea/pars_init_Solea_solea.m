function [par, metaPar, txtPar] = pars_init_Solea_solea(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 6684.8153;  free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'T_A, Arrhenius temperature'; 
par.z = 6.6299;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor for female'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_M}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.072774;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.78251;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 34.1944;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5225.2148;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 3.565e-01; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'E_Hb, maturity at birth'; 
par.E_Hj = 6.730e+00; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'E_Hj,maturity at metamorphosis'; 
par.E_Hp = 1.956e+05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'E_Hp, maturity at puberty'; 
par.h_a = 2.433e-09;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration for female'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 's_G, Gompertz stress coefficient'; 

%% other parameters 
par.E_Hh = 2.573e-01; free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'E_Hh, maturity at hatch'; 
par.T_AH = 32359.6175;  free.T_AH  = 1;   units.T_AH = 'K';         label.T_AH = 'T_AH'; 
par.T_AL = 50000;     free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'T_AL'; 
par.T_H = 297.9126;   free.T_H   = 1;   units.T_H = 'K';          label.T_H = 'T_H'; 
par.T_L = 276;        free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'T_L'; 
par.del_M = 0.19606;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'del_M, shape coefficient'; 
par.del_M_larvae = 0.18409;  free.del_M_larvae = 1;   units.del_M_larvae = '-';  label.del_M_larvae = 'del_M, shape coefficient for larvae'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'f_ad_lib'; 
par.f_Day = 0.42528;  free.f_Day = 1;   units.f_Day = '-';        label.f_Day = 'f for Day (larvae)'; 
par.f_Deniel = 0.52079;  free.f_Deniel = 1;   units.f_Deniel = '-';     label.f_Deniel = 'f_Deniel & Devauchelle'; 
par.f_Fonds = 1.1922;  free.f_Fonds = 1;   units.f_Fonds = '-';      label.f_Fonds = 'f for Fonds1977 (ingestion)'; 
par.f_Fonds1979 = 0.42405;  free.f_Fonds1979 = 1;   units.f_Fonds1979 = '-';  label.f_Fonds1979 = 'f for Fonds 1979 (larvae)'; 
par.f_Galois = 1.1311;  free.f_Galois = 1;   units.f_Galois = '-';     label.f_Galois = 'f for Galois (larvae)'; 
par.f_Lund = 0.26;    free.f_Lund = 1;   units.f_Lund = '-';       label.f_Lund = 'f for Lund (larvae)'; 
par.f_Teal = 0.5208;  free.f_Teal = 1;   units.f_Teal = '-';       label.f_Teal = 'scaled functional response for tL data Teal2011'; 
par.f_Witt = 1.7347;  free.f_Witt = 1;   units.f_Witt = '-';       label.f_Witt = 'scaled functional response for LN data WittGree1995'; 
par.h_am = 2.912e-09;  free.h_am  = 1;   units.h_am = '1/d^2';     label.h_am = 'Weibull aging acceleration for male'; 
par.z_m = 6.2432;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for male'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
