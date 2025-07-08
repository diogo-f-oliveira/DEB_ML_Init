function [par, metaPar, txtPar] = pars_init_Alaskozetes_antarcticus(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 278;      free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.053165;     free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.079811;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.86097;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 352.4852;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 11400;      free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.124e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 1.371e-02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 1.100e+00; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 5.195e-08;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_AH = 31907.2397;  free.T_AH  = 1;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature for T_H'; 
par.T_AL = 31848.7012;  free.T_AL  = 1;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature for T_L'; 
par.T_H = 279;        free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'upper boundary temperature'; 
par.T_L = 277;        free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'low boundary temperature'; 
par.Wd_a0 = 52.4;     free.Wd_a0 = 0;   units.Wd_a0 = 'mug';      label.Wd_a0 = 'intial dry weight for tWd_a data'; 
par.Wd_d0 = 6.7;      free.Wd_d0 = 0;   units.Wd_d0 = 'mug';      label.Wd_d0 = 'intial dry weight for tWd_d data'; 
par.Wd_p0 = 3.6;      free.Wd_p0 = 0;   units.Wd_p0 = 'mug';      label.Wd_p0 = 'intial dry weight for tWd_p data'; 
par.Wd_t0 = 14.8;     free.Wd_t0 = 0;   units.Wd_t0 = 'mug';      label.Wd_t0 = 'intial dry weight for tWd_t data'; 
par.Ww_tW0 = 26;      free.Ww_tW0 = 0;   units.Ww_tW0 = 'mug';     label.Ww_tW0 = 'intial wet weight for tWw_d* data'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.t_0 = 36.7805;    free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 
par.d_V = 0.46;       free.d_V   = 0;   units.d_V = 'g/cm^3';     label.d_V = 'specific density of structure'; 
par.d_E = 0.46;       free.d_E   = 0;   units.d_E = 'g/cm^3';     label.d_E = 'specific density of reserve'; 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
