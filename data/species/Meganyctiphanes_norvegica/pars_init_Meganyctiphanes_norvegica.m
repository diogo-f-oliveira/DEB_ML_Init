function [par, metaPar, txtPar] = pars_init_Meganyctiphanes_norvegica(metaData)

metaPar.model = 'std'; 

%% core primary parameters 
par.z = 0.8755;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.3281;   free.kap_X = 1;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.5;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.06913;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.8645;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 152.5;      free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4400;       free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 0.01678;   free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 39.2;      free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 2.287e-06;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.Lw_0 = 0.25;      free.Lw_0  = 0;   units.Lw_0 = 'cm';        label.Lw_0 = 'initial length for tL data'; 
par.Lw_01 = 0.1;      free.Lw_01 = 0;   units.Lw_01 = 'cm';       label.Lw_01 = 'initial length for tL_1-tL_4 data'; 
par.Lw_05 = 0.25;     free.Lw_05 = 0;   units.Lw_05 = 'cm';       label.Lw_05 = 'initial length for tL_5-tL_6 data'; 
par.T_A = 5630;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 
par.del_M = 0.1947;   free.del_M = 0;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_1050 = 0.7;     free.f_1050 = 0;   units.f_1050 = '-';       label.f_1050 = 'scaled functional response for tL data at t = 1050 d'; 
par.f_1200 = 0.7;     free.f_1200 = 0;   units.f_1200 = '-';       label.f_1200 = 'scaled functional response for tL data at t = 1200 d'; 
par.f_150 = 0.6;      free.f_150 = 0;   units.f_150 = '-';        label.f_150 = 'scaled functional response for tL data at t = 150 d'; 
par.f_300 = 1;        free.f_300 = 0;   units.f_300 = '-';        label.f_300 = 'scaled functional response for tL data at t = 300 d'; 
par.f_450 = 0.5;      free.f_450 = 0;   units.f_450 = '-';        label.f_450 = 'scaled functional response for tL data at t = 450 d'; 
par.f_600 = 1;        free.f_600 = 0;   units.f_600 = '-';        label.f_600 = 'scaled functional response for tL data at t = 600 d'; 
par.f_750 = 0.6;      free.f_750 = 0;   units.f_750 = '-';        label.f_750 = 'scaled functional response for tL data at t = 750 d'; 
par.f_900 = 1;        free.f_900 = 0;   units.f_900 = '-';        label.f_900 = 'scaled functional response for tL data at t = 900 d'; 
par.f_tL1 = 0.9;      free.f_tL1 = 1;   units.f_tL1 = '-';        label.f_tL1 = 'scaled functional response for tL_1 data'; 
par.f_tL2 = 0.65;     free.f_tL2 = 1;   units.f_tL2 = '-';        label.f_tL2 = 'scaled functional response for tL_2 data'; 
par.f_tL3 = 0.55;     free.f_tL3 = 1;   units.f_tL3 = '-';        label.f_tL3 = 'scaled functional response for tL_3 data'; 
par.f_tL4 = 0.3921;   free.f_tL4 = 1;   units.f_tL4 = '-';        label.f_tL4 = 'scaled functional response for tL_4 data'; 
par.f_tL5 = 1;        free.f_tL5 = 1;   units.f_tL5 = '-';        label.f_tL5 = 'scaled functional response for tL_5 data'; 
par.f_tL6 = 1;        free.f_tL6 = 1;   units.f_tL6 = '-';        label.f_tL6 = 'scaled functional response for tL_6 data'; 
par.t_0 = 4.8;        free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class);

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
