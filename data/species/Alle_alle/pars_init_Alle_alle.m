function [par, metaPar, txtPar] = pars_init_Alle_alle(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 2.487;        free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.029846;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.95366;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 698.2972;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 2.1948e-10;  free.p_T   = 1;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.028467;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7321.6767;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.822e+03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.549e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 4.330e-13;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 7.605e+03; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_F00 = 1.1765;   free.f_F00 = 1;   units.f_F00 = '-';        label.f_F00 = 'scaled functional response for tW data at 00 d'; 
par.f_F05 = 2.6232;   free.f_F05 = 1;   units.f_F05 = '-';        label.f_F05 = 'scaled functional response for tW data at 05 d'; 
par.f_F10 = 1.911;    free.f_F10 = 1;   units.f_F10 = '-';        label.f_F10 = 'scaled functional response for tW data at 10 d'; 
par.f_F15 = 1.5314;   free.f_F15 = 1;   units.f_F15 = '-';        label.f_F15 = 'scaled functional response for tW data at 15 d'; 
par.f_F20 = 0.76766;  free.f_F20 = 1;   units.f_F20 = '-';        label.f_F20 = 'scaled functional response for tW data at 20 d'; 
par.f_F25 = 0.44789;  free.f_F25 = 1;   units.f_F25 = '-';        label.f_F25 = 'scaled functional response for tW data at 25 d'; 
par.f_S00 = 0.9847;   free.f_S00 = 1;   units.f_S00 = '-';        label.f_S00 = 'scaled functional response for tW1 data at 00 d'; 
par.f_S05 = 2.0519;   free.f_S05 = 1;   units.f_S05 = '-';        label.f_S05 = 'scaled functional response for tW1 data at 05 d'; 
par.f_S10 = 1.8325;   free.f_S10 = 1;   units.f_S10 = '-';        label.f_S10 = 'scaled functional response for tW1 data at 10 d'; 
par.f_S15 = 1.5462;   free.f_S15 = 1;   units.f_S15 = '-';        label.f_S15 = 'scaled functional response for tW1 data at 15 d'; 
par.f_S20 = 0.86123;  free.f_S20 = 1;   units.f_S20 = '-';        label.f_S20 = 'scaled functional response for tW1 data at 20 d'; 
par.f_S25 = 0.72456;  free.f_S25 = 1;   units.f_S25 = '-';        label.f_S25 = 'scaled functional response for tW1 data at 25 d'; 
par.t_R = 730;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
