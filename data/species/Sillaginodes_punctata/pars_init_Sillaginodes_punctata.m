function [par, metaPar, txtPar] = pars_init_Sillaginodes_punctata(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temp'; 
par.z = 2.6266;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.020813;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.92921;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 19.1391;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5232.9435;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 6.782e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 6.219e+00; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 7.984e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.103e-09;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_Sampl = 4.5023;  free.T_Sampl = 1;   units.T_Sampl = 'C';      label.T_Sampl = 'temperature amplitude at S'; 
par.T_Smean = 19.287;  free.T_Smean = 1;   units.T_Smean = 'C';      label.T_Smean = 'mean temperature at S'; 
par.T_Vampl = 8.4253;  free.T_Vampl = 1;   units.T_Vampl = 'C';      label.T_Vampl = 'temperature amplitude at V'; 
par.T_Vmean = 19.5156;  free.T_Vmean = 1;   units.T_Vmean = 'C';      label.T_Vmean = 'mean temperature at V'; 
par.T_Wampl = 2.9109;  free.T_Wampl = 1;   units.T_Wampl = 'C';      label.T_Wampl = 'temperature amplitude at W'; 
par.T_Wmean = 23.4456;  free.T_Wmean = 1;   units.T_Wmean = 'C';      label.T_Wmean = 'mean temperature at W'; 
par.del_M = 0.15857;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_S = 0.68993;    free.f_S   = 1;   units.f_S = '-';          label.f_S = 'scaled functional response for tL_S data'; 
par.f_V = 0.63843;    free.f_V   = 1;   units.f_V = '-';          label.f_V = 'scaled functional response for tL_V data'; 
par.f_W200 = 0.31381;  free.f_W200 = 1;   units.f_W200 = '-';       label.f_W200 = 'scaled functional response for tL_W data at 200 d'; 
par.f_W500 = 0.71019;  free.f_W500 = 1;   units.f_W500 = '-';       label.f_W500 = 'scaled functional response for tL_W data at 500 d'; 
par.t_T0 = -4.7881;   free.t_T0  = 1;   units.t_T0 = 'd';         label.t_T0 = 'time offset for tmeperator at birth'; 
par.z_m = 2.4634;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
