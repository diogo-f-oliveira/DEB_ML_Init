function [par, metaPar, txtPar] = pars_init_Trisopterus_esmarkii(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temp'; 
par.z = 2.1116;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor for females'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_M}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.051345;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.28631;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 257.0756;   free.p_M   = 0;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5220.8619;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.173e+00; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 4.768e+00; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 6.484e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty for females'; 
par.h_a = 1.026e-06;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_N = 14;         free.T_N   = 0;   units.T_N = 'C';          label.T_N = 'mean temp in North Sea'; 
par.T_NA = 11.8451;   free.T_NA  = 1;   units.T_NA = 'C';         label.T_NA = 'temp amplitude in North Sea'; 
par.T_S = 12;         free.T_S   = 0;   units.T_S = 'C';          label.T_S = 'mean temp in Skagerak'; 
par.T_SA = 14.8756;   free.T_SA  = 1;   units.T_SA = 'C';         label.T_SA = 'temp amplitude in Skagerak'; 
par.del_M = 0.10798;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_N = 1;          free.f_N   = 0;   units.f_N = '-';          label.f_N = 'mean scaled functional response for tL_N data'; 
par.f_S = 0.0011716;  free.f_S   = 1;   units.f_S = '-';          label.f_S = 'mean scaled functional response for tL_S data'; 
par.s_N = -0.0038357;  free.s_N   = 1;   units.s_N = '-';          label.s_N = 'temp-food coupler in tL_N data'; 
par.s_S = 0.43757;    free.s_S   = 1;   units.s_S = '-';          label.s_S = 'temp-food coupler in tL_S data'; 
par.t_0 = 333.5754;   free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time offset for temp oscillations'; 
par.z_m = 1.9632;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
