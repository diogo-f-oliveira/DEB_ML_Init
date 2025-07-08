function [par, metaPar, txtPar] = pars_init_Argyrosomus_regius(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.z = 6.7098;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.10285;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.87469;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 7.1589;     free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.00039266;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5394.5504;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.639e-01; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 8.310e+01; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 4.120e+06; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 2.461e-09;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hh = 6.252e-02; free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'maturity at hatch'; 
par.T_A = 5728.5072;  free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.del_M = 0.2054;   free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.del_Me = 0.17799;  free.del_Me = 1;   units.del_Me = '-';       label.del_Me = 'shape coefficient for embryo'; 
par.del_My = 0.095586;  free.del_My = 1;   units.del_My = '-';       label.del_My = 'shape coefficient for yolk'; 
par.del_Y = 0.7529;   free.del_Y = 1;   units.del_Y = '-';        label.del_Y = 'shape coefficient for egg diameter'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_JOT = 1.2;      free.f_JOT = 1;   units.f_JOT = '-';        label.f_JOT = 'scaled functional response for 1-var data (oxygen)'; 
par.f_WwR = 1.2;      free.f_WwR = 1;   units.f_WwR = '-';        label.f_WwR = 'scaled functional response for 1-var data (reproduction)'; 
par.f_tL21 = 1.1885;  free.f_tL21 = 1;   units.f_tL21 = '-';       label.f_tL21 = 'scaled functional response for 1-var data'; 
par.f_tL22 = 1.1994;  free.f_tL22 = 1;   units.f_tL22 = '-';       label.f_tL22 = 'scaled functional response for 1-var data'; 
par.f_tW13 = 0.70001;  free.f_tW13 = 1;   units.f_tW13 = '-';       label.f_tW13 = 'scaled functional response for 1-var data (KR13)'; 
par.f_tW15 = 0.90131;  free.f_tW15 = 1;   units.f_tW15 = '-';       label.f_tW15 = 'scaled functional response for 1-var data (KR15)'; 
par.f_tWVG = 1.0515;  free.f_tWVG = 1;   units.f_tWVG = '-';       label.f_tWVG = 'scaled functional response for 1-var data (Vargas2014)'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 


%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
