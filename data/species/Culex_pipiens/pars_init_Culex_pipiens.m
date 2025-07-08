function [par, metaPar, txtPar] = pars_init_Culex_pipiens(metaData)

metaPar.model = 'hax'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8463.9974;  free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.016333;     free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.015515;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.9966;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.kap_V = 0.10396;  free.kap_V = 0;   units.kap_V = '-';        label.kap_V = 'conversion efficient E -> V -> E'; 
par.p_M = 3150.7196;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4439.1892;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.742e-06; free.E_Hb  = 0;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 4.500e-03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.E_He = 5.604e-10; free.E_He  = 1;   units.E_He = 'J';         label.E_He = 'maturity at emergence'; 
par.E_Rj = 51.4463;   free.E_Rj  = 1;   units.E_Rj = 'J/cm^3';    label.E_Rj = 'reproduction buffer density at pupation'; 
par.h_a = 5.032e-12;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.5;        free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_Ta = 0.46792;   free.f_Ta  = 1;   units.f_Ta = '-';         label.f_Ta = 'scaled functional response for Ta data'; 
par.f_Tae = 0.48753;  free.f_Tae = 1;   units.f_Tae = '-';        label.f_Tae = 'scaled functional response for Tae data'; 
par.f_Tte = 1.3843;   free.f_Tte = 1;   units.f_Tte = '-';        label.f_Tte = 'scaled functional response for Tte data'; 
par.f_tW = 1;         free.f_tW  = 0;   units.f_tW = '-';         label.f_tW = 'scaled functional response for tW data'; 
par.f_tW1 = 1;        free.f_tW1 = 0;   units.f_tW1 = '-';        label.f_tW1 = 'scaled functional response for tW1 data'; 
par.f_tW2 = 1;        free.f_tW2 = 0;   units.f_tW2 = '-';        label.f_tW2 = 'scaled functional response for tW2 data'; 
par.h_am = 2.657e-09;  free.h_am  = 1;   units.h_am = '1/d^2';     label.h_am = 'Weibull aging acceleration for males'; 
par.s_1 = 1.3574;     free.s_1   = 0;   units.s_1 = '-';          label.s_1 = 'stress at instar 1: L_1^2/ L_b^2'; 
par.s_2 = 4.3932;     free.s_2   = 0;   units.s_2 = '-';          label.s_2 = 'stress at instar 2: L_2^2/ L_1^2'; 
par.s_3 = 4.1453;     free.s_3   = 0;   units.s_3 = '-';          label.s_3 = 'stress at instar 3: L_3^2/ L_2^2'; 
par.s_4 = 5.6037;     free.s_4   = 0;   units.s_4 = '-';          label.s_4 = 'stress at instar 4: L_3^2/ L_2^2'; 
par.t_0 = -0.010647;  free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
