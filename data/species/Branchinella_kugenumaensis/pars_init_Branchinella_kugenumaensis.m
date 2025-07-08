function [par, metaPar, txtPar] = pars_init_Branchinella_kugenumaensis(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.042134;     free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.010224;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.99612;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 8631.0977;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4456.0632;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 3.966e-06; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 1.768e-03; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 8.813e-02; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 3.583e-05;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.10456;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.fL1_04 = 0.6455;  free.fL1_04 = 1;   units.fL1_04 = '-';       label.fL1_04 = 'scaled functional response for tL_L1 data at 04 d'; 
par.fL1_07 = 0.74545;  free.fL1_07 = 1;   units.fL1_07 = '-';       label.fL1_07 = 'scaled functional response for tL_L1 data at 07 d'; 
par.fL1_10 = 1.014;   free.fL1_10 = 1;   units.fL1_10 = '-';       label.fL1_10 = 'scaled functional response for tL_L1 data at 10 d'; 
par.fL1_20 = 1.0758;  free.fL1_20 = 1;   units.fL1_20 = '-';       label.fL1_20 = 'scaled functional response for tL_L1 data at 20 d'; 
par.fL1_25 = 0.85079;  free.fL1_25 = 1;   units.fL1_25 = '-';       label.fL1_25 = 'scaled functional response for tL_L1 data at 25 d'; 
par.fL2_04 = 1.0837;  free.fL2_04 = 1;   units.fL2_04 = '-';       label.fL2_04 = 'scaled functional response for tL_L2 data at 04 d'; 
par.fL2_07 = 0.13746;  free.fL2_07 = 1;   units.fL2_07 = '-';       label.fL2_07 = 'scaled functional response for tL_L2 data at 07 d'; 
par.fL2_10 = 0.35613;  free.fL2_10 = 1;   units.fL2_10 = '-';       label.fL2_10 = 'scaled functional response for tL_L2 data at 10 d'; 
par.fL2_20 = 0.8884;  free.fL2_20 = 1;   units.fL2_20 = '-';       label.fL2_20 = 'scaled functional response for tL_L2 data at 20 d'; 
par.fL2_25 = 2.5341;  free.fL2_25 = 1;   units.fL2_25 = '-';       label.fL2_25 = 'scaled functional response for tL_L2 data at 25 d'; 
par.fS1_04 = 1.3058;  free.fS1_04 = 1;   units.fS1_04 = '-';       label.fS1_04 = 'scaled functional response for tS_S1 data at 04 d'; 
par.fS1_07 = 0.38802;  free.fS1_07 = 1;   units.fS1_07 = '-';       label.fS1_07 = 'scaled functional response for tS_S1 data at 07 d'; 
par.fS1_10 = 1.3392;  free.fS1_10 = 1;   units.fS1_10 = '-';       label.fS1_10 = 'scaled functional response for tS_S1 data at 10 d'; 
par.fS1_15 = 2.4837;  free.fS1_15 = 1;   units.fS1_15 = '-';       label.fS1_15 = 'scaled functional response for tS_S1 data at 15 d'; 
par.fS2_04 = 0.9476;  free.fS2_04 = 1;   units.fS2_04 = '-';       label.fS2_04 = 'scaled functional response for tS_S2 data at 04 d'; 
par.fS2_07 = 0.35222;  free.fS2_07 = 1;   units.fS2_07 = '-';       label.fS2_07 = 'scaled functional response for tS_S2 data at 07 d'; 
par.fS2_10 = 1.2567;  free.fS2_10 = 1;   units.fS2_10 = '-';       label.fS2_10 = 'scaled functional response for tS_S2 data at 10 d'; 
par.fS2_15 = 0.70469;  free.fS2_15 = 1;   units.fS2_15 = '-';       label.fS2_15 = 'scaled functional response for tS_S2 data at 15 d'; 
par.fS3_04 = 0.50233;  free.fS3_04 = 1;   units.fS3_04 = '-';       label.fS3_04 = 'scaled functional response for tS_S3 data at 04 d'; 
par.fS3_07 = 0.25449;  free.fS3_07 = 1;   units.fS3_07 = '-';       label.fS3_07 = 'scaled functional response for tS_S3 data at 07 d'; 
par.fS3_10 = 0.91748;  free.fS3_10 = 1;   units.fS3_10 = '-';       label.fS3_10 = 'scaled functional response for tS_S3 data at 10 d'; 
par.fS3_15 = 2.0343;  free.fS3_15 = 1;   units.fS3_15 = '-';       label.fS3_15 = 'scaled functional response for tS_S3 data at 15 d'; 
par.fS4_04 = 0.53468;  free.fS4_04 = 1;   units.fS4_04 = '-';       label.fS4_04 = 'scaled functional response for tS_S4 data at 04 d'; 
par.fS4_07 = 0.35528;  free.fS4_07 = 1;   units.fS4_07 = '-';       label.fS4_07 = 'scaled functional response for tS_S4 data at 07 d'; 
par.fS4_10 = 0.49718;  free.fS4_10 = 1;   units.fS4_10 = '-';       label.fS4_10 = 'scaled functional response for tS_S4 data at 10 d'; 
par.fS4_15 = 1.0534;  free.fS4_15 = 1;   units.fS4_15 = '-';       label.fS4_15 = 'scaled functional response for tS_S4 data at 15 d'; 
par.fS5_04 = 0.47877;  free.fS5_04 = 1;   units.fS5_04 = '-';       label.fS5_04 = 'scaled functional response for tS_S5 data at 04 d'; 
par.fS5_07 = 0.16383;  free.fS5_07 = 1;   units.fS5_07 = '-';       label.fS5_07 = 'scaled functional response for tS_S5 data at 07 d'; 
par.fS5_10 = 0.84858;  free.fS5_10 = 1;   units.fS5_10 = '-';       label.fS5_10 = 'scaled functional response for tS_S5 data at 10 d'; 
par.fS5_15 = 1.1622;  free.fS5_15 = 1;   units.fS5_15 = '-';       label.fS5_15 = 'scaled functional response for tS_S5 data at 15 d'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
