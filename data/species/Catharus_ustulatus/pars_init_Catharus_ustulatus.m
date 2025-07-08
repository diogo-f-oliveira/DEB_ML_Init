function [par, metaPar, txtPar] = pars_init_Catharus_ustulatus(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.4242;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.040948;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.91103;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 1471.2434;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.059981;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7326.0498;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 6.803e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 6.039e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 3.520e-14;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 3.110e+03; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_00 = -0.0045509;  free.f1_00 = 1;   units.f1_00 = '-';        label.f1_00 = 'scaled functional response for tW1 data at 00 d'; 
par.f1_02 = 2.8895;   free.f1_02 = 1;   units.f1_02 = '-';        label.f1_02 = 'scaled functional response for tW1 data at 02 d'; 
par.f1_08 = 0.98239;  free.f1_08 = 1;   units.f1_08 = '-';        label.f1_08 = 'scaled functional response for tW1 data at 08 d'; 
par.f1_10 = 1.1728;   free.f1_10 = 1;   units.f1_10 = '-';        label.f1_10 = 'scaled functional response for tW1 data at 10 d'; 
par.f_00 = 0.54433;   free.f_00  = 1;   units.f_00 = '-';         label.f_00 = 'scaled functional response for tW data at 00 d'; 
par.f_02 = 3.0915;    free.f_02  = 1;   units.f_02 = '-';         label.f_02 = 'scaled functional response for tW data at 02 d'; 
par.f_08 = -1.0205e-08;  free.f_08  = 1;   units.f_08 = '-';         label.f_08 = 'scaled functional response for tW data at 08 d'; 
par.f_10 = 8.1307;    free.f_10  = 1;   units.f_10 = '-';         label.f_10 = 'scaled functional response for tW data at 10 d'; 
par.t_R = 365;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
