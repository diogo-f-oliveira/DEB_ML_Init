function [par, metaPar, txtPar] = pars_init_Anthus_pratensis(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.3919;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.028126;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.97219;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 817.5712;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.033489;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7319.9876;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 7.923e+01; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.304e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.287e-12;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 4.752e+02; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_00 = 4.0747;   free.f1_00 = 1;   units.f1_00 = '-';        label.f1_00 = 'scaled functional response for tW data at 00 d'; 
par.f1_03 = 0.97294;  free.f1_03 = 1;   units.f1_03 = '-';        label.f1_03 = 'scaled functional response for tW data at 03 d'; 
par.f1_06 = 3.5803;   free.f1_06 = 1;   units.f1_06 = '-';        label.f1_06 = 'scaled functional response for tW data at 06 d'; 
par.f1_09 = 1.1553;   free.f1_09 = 1;   units.f1_09 = '-';        label.f1_09 = 'scaled functional response for tW data at 09 d'; 
par.f2_00 = 0.0045426;  free.f2_00 = 1;   units.f2_00 = '-';        label.f2_00 = 'scaled functional response for tW data at 00 d'; 
par.f2_03 = 2.9347;   free.f2_03 = 1;   units.f2_03 = '-';        label.f2_03 = 'scaled functional response for tW data at 03 d'; 
par.f2_06 = 2.9622;   free.f2_06 = 1;   units.f2_06 = '-';        label.f2_06 = 'scaled functional response for tW data at 06 d'; 
par.f2_09 = 1.7626;   free.f2_09 = 1;   units.f2_09 = '-';        label.f2_09 = 'scaled functional response for tW data at 09 d'; 
par.f2_12 = 0.58529;  free.f2_12 = 1;   units.f2_12 = '-';        label.f2_12 = 'scaled functional response for tW data at 09 d'; 
par.t_R = 365;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
