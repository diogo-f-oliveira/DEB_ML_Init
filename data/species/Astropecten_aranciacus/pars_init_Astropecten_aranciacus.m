function [par, metaPar, txtPar] = pars_init_Astropecten_aranciacus(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.z = 0.39441;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.6;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.019521;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.29246;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 21.6626;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 2353.4262;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.440e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 7.803e+01; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 4.091e+05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 8.071e-08;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.L0_20_1 = 2.384;  free.L0_20_1 = 0;   units.L0_20_1 = 'cm';     label.L0_20_1 = 'vol. length for tL_20_1 data'; 
par.L0_20_2 = 1.8768;  free.L0_20_2 = 0;   units.L0_20_2 = 'cm';     label.L0_20_2 = 'vol. length for tL_20_2 data'; 
par.L0_20_3 = 4.5028;  free.L0_20_3 = 0;   units.L0_20_3 = 'cm';     label.L0_20_3 = 'vol. length for tL_20_3 data'; 
par.L0_80_4 = 4.2028;  free.L0_80_4 = 0;   units.L0_80_4 = 'cm';     label.L0_80_4 = 'vol. length for tL_80_4 data'; 
par.L0_80_5 = 4.8609;  free.L0_80_5 = 0;   units.L0_80_5 = 'cm';     label.L0_80_5 = 'vol. length for tL_80_5 data'; 
par.L0_80_6 = 7.0095;  free.L0_80_6 = 0;   units.L0_80_6 = 'cm';     label.L0_80_6 = 'vol. length for tL_80_6 data'; 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_20 = 0.68041;   free.f_20  = 1;   units.f_20 = '-';         label.f_20 = 'scaled functional response for tL_20 data'; 
par.t0_20_1 = 848.625;  free.t0_20_1 = 0;   units.t0_20_1 = 'd';      label.t0_20_1 = 'time 0 for tL_20_1 data'; 
par.t0_20_2 = 60.833;  free.t0_20_2 = 0;   units.t0_20_2 = 'd';      label.t0_20_2 = 'time 0 for tL_20_2 data'; 
par.t0_20_3 = -1.521;  free.t0_20_3 = 0;   units.t0_20_3 = 'd';      label.t0_20_3 = 'time 0 for tL_20_3 data'; 
par.t0_80_4 = 366.527;  free.t0_80_4 = 0;   units.t0_80_4 = 'd';      label.t0_80_4 = 'time 0 for tL_80_4 data'; 
par.t0_80_5 = 0;      free.t0_80_5 = 0;   units.t0_80_5 = 'd';      label.t0_80_5 = 'time 0 for tL_80_5 data'; 
par.t0_80_6 = 426.088;  free.t0_80_6 = 0;   units.t0_80_6 = 'd';      label.t0_80_6 = 'time 0 for tL_80_6 data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 


%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
