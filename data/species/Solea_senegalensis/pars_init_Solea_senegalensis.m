function [par, metaPar, txtPar] = pars_init_Solea_senegalensis(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 6896.2003;  free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 3.6343;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.079714;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.8365;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 23.6737;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5207.8978;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.438e-01; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 4.913e+00; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metamorphosis'; 
par.E_Hp = 1.151e+06; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 5.528e-09;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hh = 3.855e-02; free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'maturity at hatch'; 
par.del_M = 0.23471;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient after metamorphosis'; 
par.del_Me = 0.24813;  free.del_Me = 1;   units.del_Me = '-';       label.del_Me = 'shape coefficient before metamorphosis'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data from the field'; 
par.f_CanaFern1 = 0.59635;  free.f_CanaFern1 = 1;   units.f_CanaFern1 = '-';  label.f_CanaFern1 = 'scaled functional response for tWd_f1 data'; 
par.f_CanaFern2 = 0.55553;  free.f_CanaFern2 = 1;   units.f_CanaFern2 = '-';  label.f_CanaFern2 = 'scaled functional response for tWd_f2 data'; 
par.f_CanaFern3 = 0.64876;  free.f_CanaFern3 = 1;   units.f_CanaFern3 = '-';  label.f_CanaFern3 = 'scaled functional response for tWd_f3 data'; 
par.f_CanaFern4 = 0.59099;  free.f_CanaFern4 = 1;   units.f_CanaFern4 = '-';  label.f_CanaFern4 = 'scaled functional response for tWd_f4 data'; 
par.f_Man = 0.88638;  free.f_Man = 1;   units.f_Man = '-';        label.f_Man = 'scaled functional response for Manchado pers.comm. (aquaculture) data'; 
par.f_ParrYufe = 0.71761;  free.f_ParrYufe = 1;   units.f_ParrYufe = '-';   label.f_ParrYufe = 'scaled functional response for ParrYufe2001 data'; 
par.f_RibeEngr = 0.45162;  free.f_RibeEngr = 1;   units.f_RibeEngr = '-';   label.f_RibeEngr = 'scaled functional response for RibeEngr2017 data'; 
par.f_TeixCabr = 0.81078;  free.f_TeixCabr = 1;   units.f_TeixCabr = '-';   label.f_TeixCabr = 'scaled functional response for tL3 data'; 
par.f_YufeParr = 0.93306;  free.f_YufeParr = 1;   units.f_YufeParr = '-';   label.f_YufeParr = 'scaled functional response for YufeParr1999 data'; 
par.f_exp = 1.4287;   free.f_exp = 1;   units.f_exp = '-';        label.f_exp = 'scaled functional response for PA exp data'; 
par.f_tL = 0.80253;   free.f_tL  = 1;   units.f_tL = '-';         label.f_tL = 'scaled functional response for tL data'; 
par.z_m = 3.2938;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
