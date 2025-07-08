function [par, metaPar, txtPar] = pars_init_Asplanchna_girodi(metaData)

metaPar.model = 'std'; 

%% core primary parameters 
par.z = 0.02365;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.172;        free.v     = 0;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.3111;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 2083;       free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 915.9;      free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 0.006749;  free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 0.1183;    free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 2.029e-6;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_120 = 0.9611;   free.f_120 = 0;   units.f_120 = '-';        label.f_120 = 'scaled functional response at 120 paramecia/d'; 
par.f_20 = 0.8624;    free.f_20  = 0;   units.f_20 = '-';         label.f_20 = 'scaled functional response at 20 paramecia/d'; 
par.f_240 = 1.05;     free.f_240 = 0;   units.f_240 = '-';        label.f_240 = 'scaled functional response at 240 paramecia/d'; 
par.f_30 = 0.907;     free.f_30  = 0;   units.f_30 = '-';         label.f_30 = 'scaled functional response at 30 paramecia/d'; 
par.f_60 = 0.9212;    free.f_60  = 0;   units.f_60 = '-';         label.f_60 = 'scaled functional response at 60 paramecia/d'; 
par.hf_a = 1.016e-08;  free.hf_a  = 1;   units.hf_a = '1/d^2';     label.hf_a = 'NO2 stress coefficient'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class);par.d_V = 0.035;      free.d_V   = 0;   units.d_V = 'g/cm^3';     label.d_V = 'specific density of structure'; 
par.d_E = 0.035;      free.d_E   = 0;   units.d_E = 'g/cm^3';     label.d_E = 'specific density of reserve'; 


%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
