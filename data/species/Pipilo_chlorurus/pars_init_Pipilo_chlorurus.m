function [par, metaPar, txtPar] = pars_init_Pipilo_chlorurus(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.9907;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.056977;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.9044;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 460.4129;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.018739;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7323.1699;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.298e+03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.514e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 9.910e-12;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.001;      free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 6.196e+03; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_01 = 3.2289;   free.f1_01 = 1;   units.f1_01 = '-';        label.f1_01 = 'scaled functional response for tW data at 01 d'; 
par.f1_02 = 1.9057;   free.f1_02 = 1;   units.f1_02 = '-';        label.f1_02 = 'scaled functional response for tW data at 02 d'; 
par.f1_04 = 2.6244;   free.f1_04 = 1;   units.f1_04 = '-';        label.f1_04 = 'scaled functional response for tW data at 04 d'; 
par.f1_06 = 0.2044;   free.f1_06 = 1;   units.f1_06 = '-';        label.f1_06 = 'scaled functional response for tW data at 06 d'; 
par.f2_01 = 2.4136;   free.f2_01 = 1;   units.f2_01 = '-';        label.f2_01 = 'scaled functional response for tW data at 01 d'; 
par.f2_02 = 2.2233;   free.f2_02 = 1;   units.f2_02 = '-';        label.f2_02 = 'scaled functional response for tW data at 02 d'; 
par.f2_04 = 2.3016;   free.f2_04 = 1;   units.f2_04 = '-';        label.f2_04 = 'scaled functional response for tW data at 04 d'; 
par.f2_06 = 1.1152;   free.f2_06 = 1;   units.f2_06 = '-';        label.f2_06 = 'scaled functional response for tW data at 06 d'; 
par.f3_01 = 1.6176;   free.f3_01 = 1;   units.f3_01 = '-';        label.f3_01 = 'scaled functional response for tW data at 01 d'; 
par.f3_02 = 0.89032;  free.f3_02 = 1;   units.f3_02 = '-';        label.f3_02 = 'scaled functional response for tW data at 02 d'; 
par.f3_04 = 3.8018;   free.f3_04 = 1;   units.f3_04 = '-';        label.f3_04 = 'scaled functional response for tW data at 04 d'; 
par.f3_06 = 0.11275;  free.f3_06 = 1;   units.f3_06 = '-';        label.f3_06 = 'scaled functional response for tW data at 06 d'; 
par.t_R = 365;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 
par.z_m = 1.9786;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
