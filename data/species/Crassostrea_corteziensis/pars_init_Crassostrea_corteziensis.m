function [par, metaPar, txtPar] = pars_init_Crassostrea_corteziensis(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.19198;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 0.46796;    free.F_m   = 1;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.02556;      free.v     = 0;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.78662;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 25.6757;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 2326.567;   free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 8.403e-06; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 1.070e-02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 1.813e+01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 8.442e-10;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_AH = 40000;     free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature high boundary'; 
par.T_H = 300;        free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'Upper temperature boundary for optimal growth'; 
par.del_M = 0.15056;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_guzm = 1;       free.f_guzm = 1;   units.f_guzm = '-';       label.f_guzm = 'scaled functional response for uni-vars data'; 
par.f_tL = 0.56534;   free.f_tL  = 1;   units.f_tL = '-';         label.f_tL = 'scaled functional response for tL data'; 
par.f_tL2 = 0.78877;  free.f_tL2 = 1;   units.f_tL2 = '-';        label.f_tL2 = 'scaled functional response for tL data'; 
par.t_0 = 5.0741;     free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development'; 
par.t_start = 20;     free.t_start = 0;   units.t_start = 'd';      label.t_start = 'time since birth to start experiment'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
