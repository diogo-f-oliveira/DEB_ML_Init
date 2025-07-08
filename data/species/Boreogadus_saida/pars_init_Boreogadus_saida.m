function [par, metaPar, txtPar] = pars_init_Boreogadus_saida(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.50565;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor for females'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_M}, max spec searching rate'; 
par.kap_X = 0.51981;  free.kap_X = 1;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.016315;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.53981;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 476.9915;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5248.4845;  free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.059e+00; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 2.204e+02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 6.668e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty for females'; 
par.h_a = 2.310e-06;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_AH = 29539.1692;  free.T_AH  = 1;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature  at upper boundary'; 
par.T_AL = 90000;     free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature at lower boundary'; 
par.T_H = 293.5;      free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'Upper boundary temperature'; 
par.T_L = 261.3863;   free.T_L   = 1;   units.T_L = 'K';          label.T_L = 'Lower boundary temperature'; 
par.del_M = 0.093903;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient total length'; 
par.del_Me = 0.064833;  free.del_Me = 1;   units.del_Me = '-';       label.del_Me = 'embryo shape coefficient'; 
par.del_Y = 0.087108;  free.del_Y = 1;   units.del_Y = '-';        label.del_Y = 'yolk shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f2 = 1;           free.f2    = 0;   units.f2 = '-';           label.f2 = 'sc. func. res. '; 
par.f_tL = 0.8;       free.f_tL  = 0;   units.f_tL = '-';         label.f_tL = 'sc. func. res. HopGrah1995, 1997'; 
par.f_tL2 = 1;        free.f_tL2 = 0;   units.f_tL2 = '-';        label.f_tL2 = 'sc. func. res. BoucMoll2016'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 
par.mu_X = 583160;    free.mu_X  = 0;   units.mu_X = '-';         label.mu_X = 'chemical potential capelin (HopTonn1997)'; 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
