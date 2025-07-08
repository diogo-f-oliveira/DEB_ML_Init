function [par, metaPar, txtPar] = pars_init_Natator_depressus(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 6274;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 36.693;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.12426;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.87524;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 19.159;     free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.0018583;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7816.9262;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.918e+04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 4.368e+07; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.992e-11;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hh = 2.409e+04; free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'maturity at hatch'; 
par.T_AH = 95000;     free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'high temp boundary'; 
par.T_H = 309.15;     free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'high Arrhenius temperature'; 
par.d_Y = 0.53;       free.d_Y   = 0;   units.d_Y = 'd';          label.d_Y = 'yolk dry to wet mass ratio'; 
par.del_MC = 0.38362;  free.del_MC = 1;   units.del_MC = '-';       label.del_MC = 'shape coefficient CCL'; 
par.del_MS = 0.42517;  free.del_MS = 1;   units.del_MS = '-';       label.del_MS = 'shape coefficient SCL'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for Li_ref data'; 
par.f_E = 1.2165;     free.f_E   = 1;   units.f_E = '-';          label.f_E = 'scaled functional response for data from Eighty Mile Beach'; 
par.f_T = 0.95;       free.f_T   = 0;   units.f_T = '-';          label.f_T = 'scaled functional response for data from Thevenard Island'; 
par.f_tW1 = 1.0212;   free.f_tW1 = 1;   units.f_tW1 = '-';        label.f_tW1 = 'scaled functional response for 1-var data Clutch 1 embryo'; 
par.f_tW2 = 1.1034;   free.f_tW2 = 1;   units.f_tW2 = '-';        label.f_tW2 = 'scaled functional response for 1-var data Clutch 2 embryo'; 
par.f_tW3 = 0.95675;  free.f_tW3 = 1;   units.f_tW3 = '-';        label.f_tW3 = 'scaled functional response for 1-var data Clutch 3 embryo'; 
par.f_tW4 = 1.3162;   free.f_tW4 = 1;   units.f_tW4 = '-';        label.f_tW4 = 'scaled functional response for 1-var data Clutch 4 embryo'; 
par.f_tW5 = 1.1108;   free.f_tW5 = 1;   units.f_tW5 = '-';        label.f_tW5 = 'scaled functional response for 1-var data Clutch 5 embryo'; 
par.f_tW6 = 0.84412;  free.f_tW6 = 1;   units.f_tW6 = '-';        label.f_tW6 = 'scaled functional response for 1-var data Clutch 6 embryo'; 
par.f_tWR = 0.7045;   free.f_tWR = 1;   units.f_tWR = '-';        label.f_tWR = 'scaled functional response for 1-var data birth onwards, R = rearing at AQWA'; 
par.t_0 = 27;         free.t_0   = 0;   units.t_0 = 'd';          label.t_0 = 'time growth phase starts for embryo assuming a similar growth pattern to C. mydas'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
