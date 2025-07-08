function [par, metaPar, txtPar] = pars_init_Ruditapes_decussatus(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 3459.191;   free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.0253;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 65;         free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.032011;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.80549;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.99995;  free.kap_R = 1;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 5.4841;     free.p_M   = 0;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 2346.3445;  free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 6.386e-04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 3.763e-02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 1.119e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 5.483e-09;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.00014151;  free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_R0_1 = 0;       free.E_R0_1 = 0;   units.E_R0_1 = 'J';       label.E_R0_1 = 'initial reprod buffer in tWd_Urr data age class 1'; 
par.E_R0_2 = 0;       free.E_R0_2 = 0;   units.E_R0_2 = 'J';       label.E_R0_2 = 'initial reprod buffer in tWd_Urr data age class 2'; 
par.E_R0_3 = 182.2716;  free.E_R0_3 = 0;   units.E_R0_3 = 'J';       label.E_R0_3 = 'initial reprod buffer in tWd_Urr data age class 3'; 
par.E_R0_4 = 97.8933;  free.E_R0_4 = 0;   units.E_R0_4 = 'J';       label.E_R0_4 = 'initial reprod buffer in tWd_Urr data age class 4'; 
par.E_R0_5 = 730.3235;  free.E_R0_5 = 0;   units.E_R0_5 = 'J';       label.E_R0_5 = 'initial reprod buffer in tWd_Urr data age class 5'; 
par.E_R0_6 = 1117.9198;  free.E_R0_6 = 0;   units.E_R0_6 = 'J';       label.E_R0_6 = 'initial reprod buffer in tWd_Urr data age class 6'; 
par.E_Spawn = 903.4295;  free.E_Spawn = 0;   units.E_Spawn = 'J';      label.E_Spawn = 'Threshold in reproduction for spawning'; 
par.Kperez = 128.417;  free.Kperez = 0;   units.Kperez = 'cells /ul';  label.Kperez = 'half saturation concentration Perez data'; 
par.L0Urr0 = 3.4687e-09;  free.L0Urr0 = 0;   units.L0Urr0 = 'cm';      label.L0Urr0 = 'initial struct length Urratia data'; 
par.L0Urr01 = 0.40541;  free.L0Urr01 = 0;   units.L0Urr01 = 'cm';     label.L0Urr01 = 'initial struct length Urratia data age class 1'; 
par.L0Urr02 = 0.82667;  free.L0Urr02 = 0;   units.L0Urr02 = 'cm';     label.L0Urr02 = 'initial struct length Urratia data age class 2'; 
par.L0Urr03 = 1.1202;  free.L0Urr03 = 0;   units.L0Urr03 = 'cm';     label.L0Urr03 = 'initial struct length Urratia data age class 3'; 
par.L0Urr04 = 1.3511;  free.L0Urr04 = 0;   units.L0Urr04 = 'cm';     label.L0Urr04 = 'initial struct length Urratia data age class 4'; 
par.L0Urr05 = 1.4899;  free.L0Urr05 = 0;   units.L0Urr05 = 'cm';     label.L0Urr05 = 'initial struct length Urratia data age class 5'; 
par.L0Urr06 = 1.6061;  free.L0Urr06 = 0;   units.L0Urr06 = 'cm';     label.L0Urr06 = 'initial struct length Urratia data age class 6'; 
par.L_0Alb = 0.037809;  free.L_0Alb = 0;   units.L_0Alb = 'cm';      label.L_0Alb = 'Initial length for Alb data'; 
par.L_0Alb1 = 0.050756;  free.L_0Alb1 = 0;   units.L_0Alb1 = 'cm';     label.L_0Alb1 = 'Initial length for Alb f data'; 
par.L_0Chi = 0.0087517;  free.L_0Chi = 0;   units.L_0Chi = 'cm';      label.L_0Chi = 'Initial length for Alb f data'; 
par.L_0Erdal = 2.6;   free.L_0Erdal = 0;   units.L_0Erdal = 'cm';    label.L_0Erdal = 'Initial length for Erdal data'; 
par.L_0Juric = 0.89836;  free.L_0Juric = 0;   units.L_0Juric = 'cm';    label.L_0Juric = 'Initial length for Juric data'; 
par.L_0Matias = 0.011545;  free.L_0Matias = 0;   units.L_0Matias = 'cm';   label.L_0Matias = 'Initial length for Matias data'; 
par.T_Spawn = 293.4002;  free.T_Spawn = 0;   units.T_Spawn = 'K';      label.T_Spawn = 'Threshold in temp for spawning'; 
par.del_M1 = 1.1923;  free.del_M1 = 0;   units.del_M1 = '-';       label.del_M1 = 'shape coefficient before metamorphosis'; 
par.del_M2 = 0.58644;  free.del_M2 = 1;   units.del_M2 = '-';       label.del_M2 = 'shape coefficient after metamorphosis'; 
par.del_Y = 1.7437;   free.del_Y = 0;   units.del_Y = '-';        label.del_Y = 'shape coefficient egg'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response'; 
par.f_Alb = 1;        free.f_Alb = 0;   units.f_Alb = '-';        label.f_Alb = 'scaled functional response for Albentosa 2007 data'; 
par.f_Alb1 = 0.7908;  free.f_Alb1 = 0;   units.f_Alb1 = '-';       label.f_Alb1 = 'scaled functional response for Albentosa 1996 data food type 1'; 
par.f_Alb2 = 0.86003;  free.f_Alb2 = 0;   units.f_Alb2 = '-';       label.f_Alb2 = 'scaled functional response for Albentosa 1996 data food type 2'; 
par.f_Alb3 = 0.66689;  free.f_Alb3 = 0;   units.f_Alb3 = '-';       label.f_Alb3 = 'scaled functional response for Albentosa 1996 data food type 3'; 
par.f_Beir = 0.84999;  free.f_Beir = 0;   units.f_Beir = '-';       label.f_Beir = 'scaled functional response for Beiras data'; 
par.f_Cam = 1;        free.f_Cam = 0;   units.f_Cam = '-';        label.f_Cam = 'scaled functional response for 0-var data'; 
par.f_Chi = 0.31475;  free.f_Chi = 0;   units.f_Chi = '-';        label.f_Chi = 'scaled functional response for 0-var data'; 
par.f_Erdal = 1;      free.f_Erdal = 0;   units.f_Erdal = '-';      label.f_Erdal = 'scaled functional response for Erdal data'; 
par.f_Erdal_f1 = 0.9;  free.f_Erdal_f1 = 0;   units.f_Erdal_f1 = '-';   label.f_Erdal_f1 = 'scaled functional response for Erdal_f1 data'; 
par.f_Erdal_f2 = 0.91;  free.f_Erdal_f2 = 0;   units.f_Erdal_f2 = '-';   label.f_Erdal_f2 = 'scaled functional response for Erdal_f2 data'; 
par.f_Erdal_f3 = 0.96;  free.f_Erdal_f3 = 0;   units.f_Erdal_f3 = '-';   label.f_Erdal_f3 = 'scaled functional response for Erdal_f3 data'; 
par.f_Juric = 0.66;  free.f_Juric = 0;   units.f_Juric = '-';      label.f_Juric = 'scaled functional response for Juric data'; 
par.f_Matias1 = 0.43442;  free.f_Matias1 = 0;   units.f_Matias1 = '-';    label.f_Matias1 = 'scaled functional response for Matias food type 1 data'; 
par.f_Matias2 = 0.50674;  free.f_Matias2 = 0;   units.f_Matias2 = '-';    label.f_Matias2 = 'scaled functional response for Matias food type 2 data'; 
par.f_Ojea = 1;       free.f_Ojea = 0;   units.f_Ojea = '-';       label.f_Ojea = 'scaled functional response for Ojea data'; 
par.f_Sousa = 0.50786;  free.f_Sousa = 0;   units.f_Sousa = '-';      label.f_Sousa = 'scaled functional response for Sousa data'; 
par.f_UrrAut = 0.68;  free.f_UrrAut = 0;   units.f_UrrAut = '-';     label.f_UrrAut = 'scaled functional response for Urratia in autumn'; 
par.f_UrrSpr = 0.42;  free.f_UrrSpr = 0;   units.f_UrrSpr = '-';     label.f_UrrSpr = 'scaled functional response for Urratia in spring'; 
par.f_UrrSum = 1;     free.f_UrrSum = 0;   units.f_UrrSum = '-';     label.f_UrrSum = 'scaled functional response for Urratia in summer'; 
par.f_UrrWin = 0.63;  free.f_UrrWin = 0;   units.f_UrrWin = '-';     label.f_UrrWin = 'scaled functional response for Urratia in winter'; 
par.kap_X1 = 0.68592;  free.kap_X1 = 0;   units.kap_X1 = '-';       label.kap_X1 = 'digestion efficiency of food to reserve for I. galbana'; 
par.kap_X2 = 0.472;   free.kap_X2 = 0;   units.kap_X2 = '-';       label.kap_X2 = 'digestion efficiency of food to reserve for T. suecica'; 
par.kap_X3 = 0.54972;  free.kap_X3 = 0;   units.kap_X3 = '-';       label.kap_X3 = 'digestion efficiency of food to reserve for P. tricornutum'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
