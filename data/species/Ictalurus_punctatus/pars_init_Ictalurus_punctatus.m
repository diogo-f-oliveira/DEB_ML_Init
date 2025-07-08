function [par, metaPar, txtPar] = pars_init_Ictalurus_punctatus(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.54301;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.051754;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.99621;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 59.0127;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5441.0282;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 7.959e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 1.296e+04; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metamorphosis'; 
par.E_Hp = 1.296e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 4.304e-10;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.Lw_0 = 10;        free.Lw_0  = 0;   units.Lw_0 = 'cm';        label.Lw_0 = 'initial length for tL data'; 
par.T_AH = 76847.0436;  free.T_AH  = 1;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature'; 
par.T_AL = 20000;     free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature'; 
par.T_H = 306.9593;   free.T_H   = 1;   units.T_H = 'K';          label.T_H = 'Arrhenius temperature'; 
par.T_L = 276.15;     free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'Arrhenius temperature'; 
par.Ww_0 = 450;       free.Ww_0  = 0;   units.Ww_0 = 'g';         label.Ww_0 = 'wet weight for TJO data'; 
par.Ww_dW = 4;        free.Ww_dW = 0;   units.Ww_dW = 'g';        label.Ww_dW = 'wet weight for TdW data'; 
par.del_M = 0.20255;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for total length'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f2 = 0.1218;      free.f2    = 1;   units.f2 = '-';           label.f2 = 'scaled functional response for fish fed 2 perc/d'; 
par.f4 = 0.18942;     free.f4    = 1;   units.f4 = '-';           label.f4 = 'scaled functional response for fish fed 4 perc/d'; 
par.f6 = 0.20358;     free.f6    = 1;   units.f6 = '-';           label.f6 = 'scaled functional response for fish fed 6 perc/d'; 
par.f_tL = 0.42855;   free.f_tL  = 1;   units.f_tL = '-';         label.f_tL = 'scaled functional response for tL data'; 
par.t_0 = -0.004445;  free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time till start of development'; 
par.t_dW = 84;        free.t_dW  = 0;   units.t_dW = 'd';         label.t_dW = 'growth period for TdW data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
