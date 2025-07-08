function [par, metaPar, txtPar] = pars_init_Moina_macrocopa(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.z = 0.030307;     free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 9500;      free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.022116;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.52346;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 11600.6638;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4445.6882;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 4.674e-03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.313e-01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.002e-03;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.del_M = 0.17491;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_1 = 1;          free.f_1   = 0;   units.f_1 = '-';          label.f_1 = 'scaled functional response for tL1,tS1 data'; 
par.f_2 = 0.73375;    free.f_2   = 1;   units.f_2 = '-';          label.f_2 = 'scaled functional response for tL2,tS2 data'; 
par.f_3 = 0.66369;    free.f_3   = 1;   units.f_3 = '-';          label.f_3 = 'scaled functional response for tL3,tS3 data'; 
par.f_4 = 0.58856;    free.f_4   = 1;   units.f_4 = '-';          label.f_4 = 'scaled functional response for tL4,tS4 data'; 
par.f_5 = 0.46552;    free.f_5   = 1;   units.f_5 = '-';          label.f_5 = 'scaled functional response for tL5,tS5 data'; 
par.f_6 = 0.39812;    free.f_6   = 1;   units.f_6 = '-';          label.f_6 = 'scaled functional response for tL6,tS6 data'; 
par.f_7 = 0.32025;    free.f_7   = 1;   units.f_7 = '-';          label.f_7 = 'scaled functional response for tL7,tS7 data'; 
par.t_0 = 0.90502;    free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class);

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
