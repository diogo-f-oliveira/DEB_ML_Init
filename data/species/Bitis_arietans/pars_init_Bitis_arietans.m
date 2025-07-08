function [par, metaPar, txtPar] = pars_init_Bitis_arietans(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 10.4762;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor for females'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.05;     free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.029603;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.86717;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 83.6579;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7836.4514;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 8.707e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 3.077e+06; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 2.627e-09;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.L0_f1 = 35;       free.L0_f1 = 0;   units.L0_f1 = 'cm';       label.L0_f1 = 'initial length for tL_f1 data'; 
par.L0_f2 = 38.3;     free.L0_f2 = 0;   units.L0_f2 = 'cm';       label.L0_f2 = 'initial length for tL_f2 data'; 
par.L0_m1 = 35;       free.L0_m1 = 0;   units.L0_m1 = 'cm';       label.L0_m1 = 'initial length for tL_m1 data'; 
par.L0_m2 = 42.6;     free.L0_m2 = 0;   units.L0_m2 = 'cm';       label.L0_m2 = 'initial length for tL_m2 data'; 
par.del_M = 0.056902;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_f1 = 0.52549;   free.f_f1  = 1;   units.f_f1 = '-';         label.f_f1 = 'scaled functional response for tL_f1 data'; 
par.f_f2 = 0.56438;   free.f_f2  = 1;   units.f_f2 = '-';         label.f_f2 = 'scaled functional response for tL_f2 data'; 
par.f_m1 = 0.65583;   free.f_m1  = 1;   units.f_m1 = '-';         label.f_m1 = 'scaled functional response for tL_m1 data'; 
par.f_m2 = 0.48247;   free.f_m2  = 1;   units.f_m2 = '-';         label.f_m2 = 'scaled functional response for tL_m2 data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
