function [par, metaPar, txtPar] = pars_init_Temora_longicornis(metaData)

metaPar.model = 'abp'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 4442.2513;  free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.023158;     free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.6;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.3;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.028864;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.98407;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.99942;  free.kap_R = 1;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 1530.4159;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4373.5773;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 6.980e-05; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 2.571e-02; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.601e-05;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hj = 2.183e-03; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.T_AH = 4598.6324;  free.T_AH  = 1;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature at upper boundary'; 
par.T_AL = 13337.6836;  free.T_AL  = 1;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature at lower boundary'; 
par.T_H = 293.5;      free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'upper boundary'; 
par.T_L = 275.3;      free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'lower boundary'; 
par.X_K = 22.7163;    free.X_K   = 0;   units.X_K = 'mg C/m^3';   label.X_K = 'half-saturation coefficient'; 
par.del_M = 0.5765;   free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_025 = 0.66493;  free.f_025 = 1;   units.f_025 = '-';        label.f_025 = 'scaled functional response for tW4 data'; 
par.f_050 = 0.80099;  free.f_050 = 1;   units.f_050 = '-';        label.f_050 = 'scaled functional response for tW3 data'; 
par.f_100 = 0.85451;  free.f_100 = 1;   units.f_100 = '-';        label.f_100 = 'scaled functional response for tW2 data'; 
par.f_200 = 0.90938;  free.f_200 = 1;   units.f_200 = '-';        label.f_200 = 'scaled functional response for tW1 data'; 
par.f_JXR = 1;        free.f_JXR = 0;   units.f_JXR = '-';        label.f_JXR = 'scaled functional response for wild parent population in JXR experiment'; 
par.f_LW = 1;         free.f_LW  = 0;   units.f_LW = '-';         label.f_LW = 'scaled functional response for LW data'; 
par.f_Ri = 0.69478;   free.f_Ri  = 0;   units.f_Ri = '-';         label.f_Ri = 'scaled functional response for XR data of mother'; 
par.f_tLX_0029 = 0.61561;  free.f_tLX_0029 = 1;   units.f_tLX_0029 = '-';   label.f_tLX_0029 = 'scaled functional response for f_tL data 29 mg.C'; 
par.f_tLX_0047 = 0.61587;  free.f_tLX_0047 = 1;   units.f_tLX_0047 = '-';   label.f_tLX_0047 = 'scaled functional response for f_tL data 47 mg.C'; 
par.f_tLX_0092 = 0.71402;  free.f_tLX_0092 = 1;   units.f_tLX_0092 = '-';   label.f_tLX_0092 = 'scaled functional response for f_tL data 92 mg.C'; 
par.f_tLX_0165 = 0.76402;  free.f_tLX_0165 = 1;   units.f_tLX_0165 = '-';   label.f_tLX_0165 = 'scaled functional response for f_tL data 165 mg.C'; 
par.f_tLX_0300 = 0.7084;  free.f_tLX_0300 = 1;   units.f_tLX_0300 = '-';   label.f_tLX_0300 = 'scaled functional response for f_tL data 300 mg.C'; 
par.f_tLX_0478 = 0.74528;  free.f_tLX_0478 = 1;   units.f_tLX_0478 = '-';   label.f_tLX_0478 = 'scaled functional response for f_tL data 478 mg.C'; 
par.f_tLX_1398 = 0.77385;  free.f_tLX_1398 = 1;   units.f_tLX_1398 = '-';   label.f_tLX_1398 = 'scaled functional response for f_tL data 1398 mg.C'; 
par.f_tLX_2080 = 0.76182;  free.f_tLX_2080 = 1;   units.f_tLX_2080 = '-';   label.f_tLX_2080 = 'scaled functional response for f_tL data 2080 mg.C'; 
par.f_tL_Klei1999 = 0.85547;  free.f_tL_Klei1999 = 1;   units.f_tL_Klei1999 = '-';  label.f_tL_Klei1999 = 'scaled functional response for Klei1999 tL data'; 
par.f_tL_Pete1994 = 0.86632;  free.f_tL_Pete1994 = 1;   units.f_tL_Pete1994 = '-';  label.f_tL_Pete1994 = 'scaled functional response for Pete1994 tL data'; 
par.kap_XX = 0.2;     free.kap_XX = 1;   units.kap_XX = '-';       label.kap_XX = 'fraction of the feed that reaches the animal'; 
par.p_A0 = 1.90;       free.p_A0  = 1;   units.p_A0 = 'J/d';       label.p_A0 = 'background assimilation, apart from added food in JXR data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
