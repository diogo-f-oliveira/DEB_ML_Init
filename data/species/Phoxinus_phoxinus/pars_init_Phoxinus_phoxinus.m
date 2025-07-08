function [par, metaPar, txtPar] = pars_init_Phoxinus_phoxinus(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temp'; 
par.z = 1.6968;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.1234;       free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.93529;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 110.6338;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5321.3686;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 5.422e-01; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 2.339e+00; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 3.645e+02; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 6.616e-08;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_Mf = 0.21565;  free.del_Mf = 1;   units.del_Mf = '-';       label.del_Mf = 'shape coefficient fork length'; 
par.del_Ms = 0.25403;  free.del_Ms = 1;   units.del_Ms = '-';       label.del_Ms = 'shape coefficient standard length'; 
par.del_Mt = 0.19081;  free.del_Mt = 1;   units.del_Mt = '-';       label.del_Mt = 'shape coefficient total length'; 
par.del_Y = 8.2883;   free.del_Y = 1;   units.del_Y = '-';        label.del_Y = 'shape coefficient for egg'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_Frost1943_adults = 0.55;  free.f_Frost1943_adults = 0;   units.f_Frost1943_adults = '-';  label.f_Frost1943_adults = 'scaled functional response for Frost1943'; 
par.f_Frost1943_larvae = 0.42944;  free.f_Frost1943_larvae = 1;   units.f_Frost1943_larvae = '-';  label.f_Frost1943_larvae = 'scaled functional response for Frost1943'; 
par.f_Hees1984 = 0.61118;  free.f_Hees1984 = 1;   units.f_Hees1984 = '-';   label.f_Hees1984 = 'scaled functional response for Hees1984'; 
par.f_Kill2014 = 0.58835;  free.f_Kill2014 = 1;   units.f_Kill2014 = '-';   label.f_Kill2014 = 'scaled functional response for Kill2014'; 
par.f_MillElor1985 = 1;  free.f_MillElor1985 = 1;   units.f_MillElor1985 = '-';  label.f_MillElor1985 = 'scaled functional response for MillElor1985'; 
par.f_MuseBorg2002 = 0.58684;  free.f_MuseBorg2002 = 1;   units.f_MuseBorg2002 = '-';  label.f_MuseBorg2002 = 'scaled functional response for MuseBorg2002'; 
par.f_SchoSchw2000 = 0.43738;  free.f_SchoSchw2000 = 1;   units.f_SchoSchw2000 = '-';  label.f_SchoSchw2000 = 'scaled functional response for SchoSchw2000'; 
par.f_tL = 0.56183;   free.f_tL  = 1;   units.f_tL = '-';         label.f_tL = 'scaled functional response for tL data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
