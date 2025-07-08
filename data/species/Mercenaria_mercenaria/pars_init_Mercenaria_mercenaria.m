function [par, metaPar, txtPar] = pars_init_Mercenaria_mercenaria(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 12000;      free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.36764;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.37166;  free.kap_X = 1;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.022846;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.98066;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 4.7328;     free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.00059084;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 2405.0863;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.060e-06; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 3.033e-03; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metamorphosis'; 
par.E_Hp = 1.721e+02; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.154e-11;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_AH = 54222;     free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature above the upper boundary'; 
par.T_AL = 125550;    free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature below the lower boundary'; 
par.T_H = 300.15;     free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'upper boundary tolerance range'; 
par.T_L = 282.15;     free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'lower boundary tolerance range'; 
par.del_Mb = 0.74516;  free.del_Mb = 0;   units.del_Mb = '-';       label.del_Mb = 'shape coefficient for embryo and larvae'; 
par.del_Mj = 0.38233;  free.del_Mj = 1;   units.del_Mj = '-';       label.del_Mj = 'shape coefficient for juvenile and adult'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_CharShri2004 = 1;  free.f_CharShri2004 = 0;   units.f_CharShri2004 = '-';  label.f_CharShri2004 = 'scaled functional response for CharShri2004 data'; 
par.f_RiceHick1989 = 0.56991;  free.f_RiceHick1989 = 1;   units.f_RiceHick1989 = '-';  label.f_RiceHick1989 = 'scaled functional response for RiceHick1989 data'; 
par.f_RigwRich2011 = 0.65142;  free.f_RigwRich2011 = 1;   units.f_RigwRich2011 = '-';  label.f_RigwRich2011 = 'scaled functional response for RigwRich2011 data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
