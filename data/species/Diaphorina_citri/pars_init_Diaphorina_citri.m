function [par, metaPar, txtPar] = pars_init_Diaphorina_citri(metaData)

metaPar.model = 'abp'; 

%% core primary parameters 
par.z = 3.392;        free.z     = 0;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.0323;       free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.9999;     free.kap   = 0;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 17.75;      free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4440;       free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 8.032e-05; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth';  
par.E_Hp = 0.002987;  free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 2.47e-05;   free.h_a   = 0;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration';
par.s_G = 0.4869;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_A =  9807;      free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.T_Aa = 5087;      free.T_Aa  = 0;   units.T_Aa = 'K';         label.T_Aa = 'Arrhenius temperature for ageing'; 
par.T_L = 273.1;      free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'lower boundary temperature'; 
par.T_H = 306.7;      free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'upper boundary temperature';
par.T_Hs = 302.6;     free.T_Hs  = 0;   units.T_Hs = 'K';         label.T_Hs = 'upper boundary temperature for reproduction and larval survival';
par.T_AL = 1e+04;     free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature at lower boundary';
par.T_AH = 7e+04;     free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature at upper boundary';
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature';

par.del_Y =  2.14;    free.del_Y = 1;   units.del_Y = '-';        label.del_Y = 'shape coefficient for egg'; 
par.del_M =  1.071;   free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.del_Mh = 2.732;   free.del_Mh = 1;  units.del_Mh = '-';       label.del_Mh = 'shape coefficient for head capsule width'; 
par.del_Mi = 0.5698;  free.del_Mi = 1;  units.del_Mi = '-';       label.del_Mi = 'shape coefficient for imago'; 

par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.s_1 = 1.482;      free.s_1   = 1;   units.s_1 = '-';          label.s_1 = 'stress at instar 1: L_1^2/ L_b^2'; 
par.s_2 = 1.387;      free.s_2   = 1;   units.s_2 = '-';          label.s_2 = 'stress at instar 2: L_2^2/ L_1^2'; 
par.s_3 = 1.419;      free.s_3   = 1;   units.s_3 = '-';          label.s_3 = 'stress at instar 3: L_3^2/ L_2^2'; 
par.s_4 = 1.63;       free.s_4   = 1;   units.s_4 = '-';          label.s_4 = 'stress at instar 4: L_4^2/ L_3^2'; 
par.h_b = 0.01659;    free.h_b   = 1;   units.h_b = '1/d';        label.h_b = 'background hazard during larval development'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class);

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
