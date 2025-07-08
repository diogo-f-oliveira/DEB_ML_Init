function [par, metaPar, txtPar] = pars_init_Coptodon_rendalli(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8332.65;    free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 11.1734;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.5;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.055224;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.8504;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 22.5451;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.00092221;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7583;       free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.153e+00; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 4.380e+05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 8.476e-10;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hh = 7.402e-01; free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'maturity at hatch'; 
par.T_AH = 47230;     free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature'; 
par.T_AL = 602000;    free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature'; 
par.T_H = 308.0025;   free.T_H   = 1;   units.T_H = 'K';          label.T_H = 'Arrhenius temperature'; 
par.T_L = 284.7;      free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'Arrhenius temperature'; 
par.del_M = 0.28965;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for larvae, juveniles and adults'; 
par.del_Y = -0.95496;  free.del_Y = 1;   units.del_Y = '-';        label.del_Y = 'shape coefficient for egg'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_ChanDeSi1981 = 0.46819;  free.f_ChanDeSi1981 = 1;   units.f_ChanDeSi1981 = '-';  label.f_ChanDeSi1981 = 'scaled functional response for ChanDeSi1981'; 
par.f_Hlop2011 = 0.70005;  free.f_Hlop2011 = 1;   units.f_Hlop2011 = '-';   label.f_Hlop2011 = 'scaled functional response for Hlop2011 wild fish'; 
par.f_exp = 0.53194;  free.f_exp = 1;   units.f_exp = '-';        label.f_exp = 'scaled functional response for temperature experiment'; 
par.f_tL = 0.41797;   free.f_tL  = 1;   units.f_tL = '-';         label.f_tL = 'scaled functional response for WeylHech1998'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 
par.d_V = 0.29;       free.d_V   = 0;   units.d_V = 'g/cm^3';     label.d_V = 'specific density of structure'; 
par.d_E = 0.29;       free.d_E   = 0;   units.d_E = 'g/cm^3';     label.d_E = 'specific density of reserve'; 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
