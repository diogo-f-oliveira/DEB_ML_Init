function [par, metaPar, txtPar] = pars_init_Rhinolophus_euryale(metaData)

metaPar.model = 'stx'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.4383;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.044747;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.9339;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 1147.8803;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7853.644;   free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 6.623e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hx = 1.114e+04; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at weaning'; 
par.E_Hp = 1.102e+05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty for female'; 
par.h_a = 2.118e-11;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.001;      free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 
par.t_0 = 74.8521;    free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development'; 

%% other parameters 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var and tW6 data'; 
par.f_00 = 1.3177;    free.f_00  = 1;   units.f_00 = '-';         label.f_00 = 'scaled functional response for tW data at 00 d'; 
par.f_10 = 1.2571;    free.f_10  = 1;   units.f_10 = '-';         label.f_10 = 'scaled functional response for tW data at 10 d'; 
par.f_15 = 0.80508;   free.f_15  = 1;   units.f_15 = '-';         label.f_15 = 'scaled functional response for tW data at 15 d'; 
par.f_40 = 0.83458;   free.f_40  = 1;   units.f_40 = '-';         label.f_40 = 'scaled functional response for tW data at 40 d'; 
par.f_80 = 0.84801;   free.f_80  = 1;   units.f_80 = '-';         label.f_80 = 'scaled functional response for tW data at 80 d'; 
par.t_N = 365;        free.t_N   = 0;   units.t_N = 'd';          label.t_N = 'time between clutches at T'; 
par.z_m = 1.1406;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
