function [par, metaPar, txtPar] = pars_init_Littorina_littorea(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.z = 0.28422;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.12511;  free.kap_X = 1;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.3;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.012756;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.84341;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 32.8966;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 3917.3672;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 4.017e-03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 1.279e+00; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 2.667e+02; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 8.455e-08;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.Lw_00 = 2.205;    free.Lw_00 = 0;   units.Lw_00 = 'cm';       label.Lw_00 = 'initial shell height at for tL0 data'; 
par.Lw_00T = 0.886;   free.Lw_00T = 0;   units.Lw_00T = 'cm';      label.Lw_00T = 'initial shell height at for tL0T data'; 
par.Lw_01 = 1.45;     free.Lw_01 = 0;   units.Lw_01 = 'cm';       label.Lw_01 = 'initial shell height at for tL1 data'; 
par.Lw_01T = 0.05;    free.Lw_01T = 0;   units.Lw_01T = 'cm';      label.Lw_01T = 'initial shell height at for tL1T data'; 
par.Lw_02 = 0.655;    free.Lw_02 = 0;   units.Lw_02 = 'cm';       label.Lw_02 = 'initial shell height at for tL2 data'; 
par.Lw_03 = 0.274;    free.Lw_03 = 0;   units.Lw_03 = 'cm';       label.Lw_03 = 'initial shell height at for tL3 data'; 
par.Lw_04 = 0.312;    free.Lw_04 = 0;   units.Lw_04 = 'cm';       label.Lw_04 = 'initial shell height at for tL4 data'; 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.Wd_00T = 0.25821;  free.Wd_00T = 1;   units.Wd_00T = 'g';       label.Wd_00T = 'initial dry weight at for tW0T data'; 
par.Wd_01T = 0.20578;  free.Wd_01T = 1;   units.Wd_01T = 'g';       label.Wd_01T = 'initial dry weight at for tW1T data'; 
par.Wd_02T = 0.061396;  free.Wd_02T = 1;   units.Wd_02T = 'g';       label.Wd_02T = 'initial dry weight at for tW2T data'; 
par.del_M = 0.49876;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_C = 0.71841;    free.f_C   = 1;   units.f_C = '-';          label.f_C = 'scaled functional response for tL data at Craig-yr-Wylfa'; 
par.f_T = 1;          free.f_T   = 0;   units.f_T = '-';          label.f_T = 'scaled functional response for tL and tW data at Trevor'; 
par.f_W = 0.2;        free.f_W   = 0;   units.f_W = '-';          label.f_W = 'scaled functional response for LW data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class);

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
