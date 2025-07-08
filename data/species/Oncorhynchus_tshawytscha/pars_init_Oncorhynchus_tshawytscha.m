function [par, metaPar, txtPar] = pars_init_Oncorhynchus_tshawytscha(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 10000;      free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temp'; 
par.z = 9.7827;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.085799;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.56995;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 21.6258;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.0013388;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = ' maturity maint rate coefficient'; 
par.E_G = 5269.665;   free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.138e+03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 6.609e+04; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 7.516e+06; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 2.174e-07;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 1;          free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hh = 3.687e+02; free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'maturity at hatch'; 
par.L0_AlleHass1985 = 3.391;  free.L0_AlleHass1985 = 0;   units.L0_AlleHass1985 = 'cm';  label.L0_AlleHass1985 = 'L at start AlleHass1985'; 
par.L0_ShelClar1995 = 6.366;  free.L0_ShelClar1995 = 0;   units.L0_ShelClar1995 = 'cm';  label.L0_ShelClar1995 = 'L at start ShelClar1995'; 
par.del_M = 0.20066;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for fork length'; 
par.del_M_R = 0.21835;  free.del_M_R = 1;   units.del_M_R = '-';      label.del_M_R = 'shape coefficient for spawners'; 
par.del_M_e = 0.17331;  free.del_M_e = 1;   units.del_M_e = '-';      label.del_M_e = 'shape coefficient for embryo length'; 
par.f = 0.9;          free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_AlleHass1985 = 0.872;  free.f_AlleHass1985 = 0;   units.f_AlleHass1985 = '-';  label.f_AlleHass1985 = 'scaled functional response for AlleHass1985 data'; 
par.f_BeacMurr1993 = 0.7376;  free.f_BeacMurr1993 = 0;   units.f_BeacMurr1993 = '-';  label.f_BeacMurr1993 = 'scaled functional response for BeacMurr1993 data'; 
par.f_OrsiJaen1996 = 0.871;  free.f_OrsiJaen1996 = 0;   units.f_OrsiJaen1996 = '-';  label.f_OrsiJaen1996 = 'scaled functional response for OrsiJaen1996 data'; 
par.f_ShelClar1995 = 0.5039;  free.f_ShelClar1995 = 0;   units.f_ShelClar1995 = '-';  label.f_ShelClar1995 = 'scaled functional response for ShelClar1995 data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
