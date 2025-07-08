function [par, metaPar, txtPar] = pars_init_Rhithrogena_semicolorata(metaData)

metaPar.model = 'hep'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 11720;      free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.1278;       free.z     = 0;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.0016951;    free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.5129;     free.kap   = 0;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 429.1652;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4435.238;   free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 8.076e-04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 7.389e-01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.E_Rj = 7337.3321;  free.E_Rj  = 1;   units.E_Rj = 'J/cm^3';    label.E_Rj = 'reproduction buffer density at emergence'; 
par.h_a = 1.261e+02;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 1;          free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_AL = 121200;    free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature for lower boundary'; 
par.T_L = 278.1;      free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'lower boundary'; 
par.del_M = 0.11696;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for nymph'; 
par.del_Mi = 0.11797;  free.del_Mi = 1;   units.del_Mi = '-';       label.del_Mi = 'shape coefficient for imago'; 
par.del_Y = 0.77102;  free.del_Y = 1;   units.del_Y = '-';        label.del_Y = 'shape coefficient for egg'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_tW = 0.4867;    free.f_tW  = 0;   units.f_tW = '-';         label.f_tW = 'scaled functional response for tW data'; 
par.f_tW2 = 1;        free.f_tW2 = 0;   units.f_tW2 = '-';        label.f_tW2 = 'scaled functional response for tW data'; 
par.f_tWw = 0.462;    free.f_tWw = 0;   units.f_tWw = '-';        label.f_tWw = 'scaled functional response for tW data'; 
par.t_0w = 199;       free.t_0w  = 0;   units.t_0w = 'd';         label.t_0w = 'time since birth at time zero'; 
par.t_0w2 = 143.3;    free.t_0w2 = 0;   units.t_0w2 = 'd';        label.t_0w2 = 'time since birth at time zero'; 
par.t_0ww = 74.45;    free.t_0ww = 0;   units.t_0ww = 'd';        label.t_0ww = 'time since birth at time zero'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
