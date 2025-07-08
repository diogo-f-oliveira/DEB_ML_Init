function [par, metaPar, txtPar] = pars_init_Myzus_persicae(metaData)

metaPar.model = 'hex'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8782.562;   free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 5.1617;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.0071039;    free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.8;        free.kap   = 0;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.kap_V = 0.7;      free.kap_V = 0;   units.kap_V = '-';        label.kap_V = 'conversion efficient E -> V -> E'; 
par.p_M = 28.7098;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4400;       free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.960e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.s_j = 0.84526;    free.s_j   = 1;   units.s_j = '-';          label.s_j = 'reprod buffer/structure at pupation as fraction of max'; 
par.E_He = 1.000e-10; free.E_He  = 0;   units.E_He = 'J';         label.E_He = 'maturity at emergence'; 
par.h_a = 1.595e-02;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_AH = 24305.5944;  free.T_AH  = 1;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature for upper boundary'; 
par.T_H = 299.8583;   free.T_H   = 1;   units.T_H = 'K';          label.T_H = 'upper boundary'; 
par.del_M = 0.31018;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for most 0-var data'; 
par.f_1 = 1;          free.f_1   = 0;   units.f_1 = '-';          label.f_1 = 'scaled functional response for DaviRadc2007 - cultivar Red La Soda'; 
par.f_2 = 1;          free.f_2   = 0;   units.f_2 = '-';          label.f_2 = 'scaled functional response for CutlRama2009 - potato leaf discs'; 
par.f_3 = 3.7389;     free.f_3   = 1;   units.f_3 = '-';          label.f_3 = 'scaled functional response for SataKers2008 - pepper leaves'; 
par.f_4 = 1.2274;     free.f_4   = 1;   units.f_4 = '-';          label.f_4 = 'scaled functional response for DaviRadc2006 - Chinese cabbage'; 
par.f_5 = 2.2912;     free.f_5   = 1;   units.f_5 = '-';          label.f_5 = 'scaled functional response for Weed1927 - spinach leaves'; 
par.f_6 = 2.0103;     free.f_6   = 1;   units.f_6 = '-';          label.f_6 = 'scaled functional response for Fenj1945 - beet leaves'; 
par.s_1 = 1.3645;     free.s_1   = 1;   units.s_1 = '-';          label.s_1 = 'stress at instar 1: L_1^2/ L_b^2'; 
par.s_2 = 1.3642;     free.s_2   = 1;   units.s_2 = '-';          label.s_2 = 'stress at instar 2: L_2^2/ L_1^2'; 
par.s_3 = 1.3638;     free.s_3   = 1;   units.s_3 = '-';          label.s_3 = 'stress at instar 3: L_3^2/ L_2^2'; 
par.t_0R = 1.2584;    free.t_0R  = 1;   units.t_0R = 'd';         label.t_0R = 'preoviposition period at reference temperature'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
