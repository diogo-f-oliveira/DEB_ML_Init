function [par, metaPar, txtPar] = pars_init_Gammarus_pseudolimnaeus(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 6000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.14765;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.015041;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.91338;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 123.5973;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4440.5185;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 4.406e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 9.343e-01; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 4.499e+00; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 5.916e-06;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.24812;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_LN_0 = 0.86632;  free.f_LN_0 = 1;   units.f_LN_0 = '-';       label.f_LN_0 = 'scaled functional response for LN_0 data'; 
par.f_LN_11 = 1.9003;  free.f_LN_11 = 1;   units.f_LN_11 = '-';      label.f_LN_11 = 'scaled functional response for LN_11 data'; 
par.f_LN_112 = 0.58384;  free.f_LN_112 = 1;   units.f_LN_112 = '-';     label.f_LN_112 = 'scaled functional response for LN_112 data'; 
par.f_LN_12 = 0.5503;  free.f_LN_12 = 1;   units.f_LN_12 = '-';      label.f_LN_12 = 'scaled functional response for LN_12 data'; 
par.f_LN_13 = 1.1278;  free.f_LN_13 = 1;   units.f_LN_13 = '-';      label.f_LN_13 = 'scaled functional response for LN_13 data'; 
par.f_LN_16 = 1.0185;  free.f_LN_16 = 1;   units.f_LN_16 = '-';      label.f_LN_16 = 'scaled functional response for LN_16 data'; 
par.f_LN_18 = 0.42438;  free.f_LN_18 = 1;   units.f_LN_18 = '-';      label.f_LN_18 = 'scaled functional response for LN_18 data'; 
par.f_LN_19 = 0.51116;  free.f_LN_19 = 1;   units.f_LN_19 = '-';      label.f_LN_19 = 'scaled functional response for LN_19 data'; 
par.f_LN_3 = 0.47176;  free.f_LN_3 = 1;   units.f_LN_3 = '-';       label.f_LN_3 = 'scaled functional response for LN_3 data'; 
par.f_LN_6 = 2.3368;  free.f_LN_6 = 1;   units.f_LN_6 = '-';       label.f_LN_6 = 'scaled functional response for LN_6 data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
