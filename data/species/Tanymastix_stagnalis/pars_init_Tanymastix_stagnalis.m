function [par, metaPar, txtPar] = pars_init_Tanymastix_stagnalis(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.082249;     free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.01624;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.99538;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 5103.413;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4439.2934;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.128e-05; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 1.490e-04; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 8.286e-02; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 4.054e-04;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.10765;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f87_05 = 0.52458;  free.f87_05 = 1;   units.f87_05 = '-';       label.f87_05 = 'scaled functional response for tL_1987 data at 05 d'; 
par.f87_10 = 0.62349;  free.f87_10 = 1;   units.f87_10 = '-';       label.f87_10 = 'scaled functional response for tL_1987 data at 10 d'; 
par.f87_30 = 0.86382;  free.f87_30 = 1;   units.f87_30 = '-';       label.f87_30 = 'scaled functional response for tL_1987 data at 30 d'; 
par.f87_60 = 0.68383;  free.f87_60 = 1;   units.f87_60 = '-';       label.f87_60 = 'scaled functional response for tL_1987 data at 60 d'; 
par.f88_05 = 0.74404;  free.f88_05 = 1;   units.f88_05 = '-';       label.f88_05 = 'scaled functional response for tL_1988 data at 05 d'; 
par.f88_10 = 1.4609;  free.f88_10 = 1;   units.f88_10 = '-';       label.f88_10 = 'scaled functional response for tL_1988 data at 10 d'; 
par.f88_30 = 1.7458;  free.f88_30 = 1;   units.f88_30 = '-';       label.f88_30 = 'scaled functional response for tL_1988 data at 30 d'; 
par.f88_60 = 0.28275;  free.f88_60 = 1;   units.f88_60 = '-';       label.f88_60 = 'scaled functional response for tL_1988 data at 60 d'; 
par.t_0 = 1.7114;     free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
