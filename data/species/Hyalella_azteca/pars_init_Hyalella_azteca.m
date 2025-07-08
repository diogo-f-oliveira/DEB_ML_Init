function [par, metaPar, txtPar] = pars_init_Hyalella_azteca(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 10030;      free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.20662;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.021251;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.88358;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 247.4962;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4411.8244;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.847e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 1.847e-02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 4.083e-01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 5.320e-05;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = -0.5;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hpm = 5.155e-01; free.E_Hpm = 1;   units.E_Hpm = 'J';        label.E_Hpm = 'maturity at puberty'; 
par.del_M = 0.25045;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient of body length'; 
par.del_Mh = 2.2006;  free.del_Mh = 1;   units.del_Mh = '-';       label.del_Mh = 'shape coefficient of head length'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_Borg = 1.5668;  free.f_Borg = 1;   units.f_Borg = '-';       label.f_Borg = 'scaled functional response of Borg1989'; 
par.f_Gonz = 0.67843;  free.f_Gonz = 1;   units.f_Gonz = '-';       label.f_Gonz = 'scaled functional response for Gonz2002 0-var data'; 
par.f_Inge = 1;       free.f_Inge = 0;   units.f_Inge = '-';       label.f_Inge = 'scaled functional response of Inge1998'; 
par.f_Lind = 0.33629;  free.f_Lind = 1;   units.f_Lind = '-';       label.f_Lind = 'scaled functional response of Lind1982'; 
par.f_OthmPasc = 0.99576;  free.f_OthmPasc = 1;   units.f_OthmPasc = '-';   label.f_OthmPasc = 'scaled functional response of OthmPasc2001'; 
par.f_Pede = 1;       free.f_Pede = 0;   units.f_Pede = '-';       label.f_Pede = 'scaled functional response of Pede2013'; 
par.f_Pery_1 = 0.85413;  free.f_Pery_1 = 1;   units.f_Pery_1 = '-';     label.f_Pery_1 = 'scaled functional response Pery2005 0.1 mg'; 
par.f_Pery_2 = 0.79387;  free.f_Pery_2 = 1;   units.f_Pery_2 = '-';     label.f_Pery_2 = 'scaled functional response Pery2005 0.2 mg'; 
par.f_Pery_3 = 0.82315;  free.f_Pery_3 = 1;   units.f_Pery_3 = '-';     label.f_Pery_3 = 'scaled functional response Pery2005 0.3 mg'; 
par.f_Pery_4 = 0.65369;  free.f_Pery_4 = 1;   units.f_Pery_4 = '-';     label.f_Pery_4 = 'scaled functional response Pery2005 0.04 mg'; 
par.f_Pery_5 = 0.56025;  free.f_Pery_5 = 1;   units.f_Pery_5 = '-';     label.f_Pery_5 = 'scaled functional response Pery2005 0.06 mg'; 
par.f_WdJO = 1;       free.f_WdJO = 0;   units.f_WdJO = '-';       label.f_WdJO = 'scaled functional response of Math1971'; 
par.mu_F = 585;       free.mu_F  = 0;   units.mu_F = '#/J';       label.mu_F = 'coupler ingested energy - faecal pellet number '; 
par.s_shrink = 3.903;  free.s_shrink = 0;   units.s_shrink = '-';     label.s_shrink = 'shrinking stress coefficient'; 
par.t_0 = 7.0706;     free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development'; 
par.t_R = 11;         free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time between broods at T_ref'; 
par.z_m = 0.28815;    free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
