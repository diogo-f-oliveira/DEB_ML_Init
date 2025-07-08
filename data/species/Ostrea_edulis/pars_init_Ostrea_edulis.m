function [par, metaPar, txtPar] = pars_init_Ostrea_edulis(metaData)

metaPar.model = 'asj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.2119;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 0.73753;    free.F_m   = 1;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.019655;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.95378;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 14.4022;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 2392.32;    free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 9.494e-05; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hs = 1.417e-03; free.E_Hs  = 1;   units.E_Hs = 'J';         label.E_Hs = 'maturity at settlement'; 
par.E_Hj = 1.435e+00; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 8.934e+01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.828e-09;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0031076;  free.s_G   = 1;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_H0 = 5.000e+01; free.E_H0  = 0;   units.E_H0 = 'J';         label.E_H0 = 'initial maturity in tL_Wils and tWd_Wils data'; 
par.E_Hr = 1.255e-04; free.E_Hr  = 1;   units.E_Hr = 'J';         label.E_Hr = 'maturity at release'; 
par.E_R0 = 0.022793;  free.E_R0  = 1;   units.E_R0 = 'J';         label.E_R0 = 'initial reprod buffer in tWd_Mann data'; 
par.K_S = 0.02654;    free.K_S   = 0;   units.K_S = 'mol/L';      label.K_S = 'silt half saturation constant'; 
par.L_0Mann = 0.86102;  free.L_0Mann = 1;   units.L_0Mann = 'cm';     label.L_0Mann = 'initial struct length in tWd_Mann data'; 
par.L_0Saur = 5.4004;  free.L_0Saur = 1;   units.L_0Saur = 'cm';     label.L_0Saur = 'initial struct length in tL_Saur data'; 
par.L_0Wils = 0.49516;  free.L_0Wils = 1;   units.L_0Wils = 'cm';     label.L_0Wils = 'initial struct length in tL_Wils and tWd_Wils data'; 
par.T_AH = 116600;    free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature at high boundary'; 
par.T_AL = 3848;      free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature at low boundary'; 
par.T_H = 367.3;      free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'High boundary temperature'; 
par.T_L = 293.1;      free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'Low boundary temperature'; 
par.del_M = 0.52034;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled function respons, univariate'; 
par.f_Haur = 0.94782;  free.f_Haur = 1;   units.f_Haur = '-';       label.f_Haur = 'scaled functional response for WdJO data'; 
par.f_Holl = 0.99999;  free.f_Holl = 1;   units.f_Holl = '-';       label.f_Holl = 'scaled functional response for tL_spat data'; 
par.f_LN = 0.12101;   free.f_LN  = 1;   units.f_LN = '-';         label.f_LN = 'scaled functional response for LN data'; 
par.f_Laba = 0.99989;  free.f_Laba = 1;   units.f_Laba = '-';       label.f_Laba = 'scaled functional response for tWd_Laba data'; 
par.f_Mann = 0.20328;  free.f_Mann = 1;   units.f_Mann = '-';       label.f_Mann = 'scaled functional response for tWd_Mann data'; 
par.f_Robe = 0.19023;  free.f_Robe = 1;   units.f_Robe = '-';       label.f_Robe = 'scaled functional response for tL_Robe data'; 
par.f_Saur = 0.46578;  free.f_Saur = 1;   units.f_Saur = '-';       label.f_Saur = 'scaled functional response for tL_adult1 data'; 
par.f_Wils = 0.36227;  free.f_Wils = 1;   units.f_Wils = '_';       label.f_Wils = 'scaled functional response for tL_Wils and tWd_Wils data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
