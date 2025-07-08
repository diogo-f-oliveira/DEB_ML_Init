function [par, metaPar, txtPar] = pars_init_Placopecten_magellanicus(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.91061;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.0088223;    free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.82763;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 109.9835;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 2358.8569;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 4.553e-05; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 5.018e-03; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metamorphosis'; 
par.E_Hp = 1.580e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.506e-08;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_AL = 15.8923;   free.T_AL  = 1;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature below the lower boundary'; 
par.T_L = 275.15;     free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'lower boundary tolerance range'; 
par.Wd0 = 1;          free.Wd0   = 0;   units.Wd0 = 'g';          label.Wd0 = 'dry weight for TJO data'; 
par.del_M = 0.33154;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.del_Mb = 0.51298;  free.del_Mb = 1;   units.del_Mb = '-';       label.del_Mb = 'shape coefficient before metamorphosis'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_LN = 0.12829;   free.f_LN  = 1;   units.f_LN = '-';         label.f_LN = 'scaled functional response for LN data'; 
par.f_LWd = 0.2047;   free.f_LWd = 1;   units.f_LWd = '-';        label.f_LWd = 'scaled functional response for LWd data'; 
par.f_TJO = 1.0371;   free.f_TJO = 1;   units.f_TJO = '-';        label.f_TJO = 'scaled functional response for TJO data'; 
par.f_WJO = 0.91375;  free.f_WJO = 1;   units.f_WJO = '-';        label.f_WJO = 'scaled functional response for WJO data from GranCran1991'; 
par.f_WJO1 = 2.1387;  free.f_WJO1 = 1;   units.f_WJO1 = '-';       label.f_WJO1 = 'scaled functional response for WJO data at 1 C'; 
par.f_WJO10 = 0.74279;  free.f_WJO10 = 1;   units.f_WJO10 = '-';      label.f_WJO10 = 'scaled functional response for WJO data at 10 C'; 
par.f_WJO19 = 2.7981;  free.f_WJO19 = 1;   units.f_WJO19 = '-';      label.f_WJO19 = 'scaled functional response for WJO data at 19 C'; 
par.f_WJO3 = 0.74295;  free.f_WJO3 = 1;   units.f_WJO3 = '-';       label.f_WJO3 = 'scaled functional response for WJO data at 3 C'; 
par.f_WJO6 = 0.79794;  free.f_WJO6 = 1;   units.f_WJO6 = '-';       label.f_WJO6 = 'scaled functional response for WJO data at 6 C'; 
par.f_WJO8 = 0.74279;  free.f_WJO8 = 1;   units.f_WJO8 = '-';       label.f_WJO8 = 'scaled functional response for WJO data at 8 C'; 
par.f_tL1 = 1.7531;   free.f_tL1 = 1;   units.f_tL1 = '-';        label.f_tL1 = 'scaled functional response for tL data at 10 m deep in Newfoundland'; 
par.f_tL2 = 1.6636;   free.f_tL2 = 1;   units.f_tL2 = '-';        label.f_tL2 = 'scaled functional response for tL data at 31 m deep in Newfoundland'; 
par.f_tL3 = 0.96667;  free.f_tL3 = 1;   units.f_tL3 = '-';        label.f_tL3 = 'scaled functional response for tL data in the Gulf of Saint-Lawrence'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
