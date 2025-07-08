function [par, metaPar, txtPar] = pars_init_Danio_rerio(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temp'; 
par.z = 0.22175;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.019569;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.35759;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 243.3609;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5269.3023;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 7.918e-01; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 3.711e+01; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 2.438e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 8.970e-10;  free.h_a   = 0;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.029882;   free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_R_init_BeauGous2015 = 800;  free.E_R_init_BeauGous2015 = 0;   units.E_R_init_BeauGous2015 = 'J';  label.E_R_init_BeauGous2015 = 'initial energy in the repro buffer, BeauGous2015'; 
par.E_R_init_DrewRodn2008 = 200;  free.E_R_init_DrewRodn2008 = 0;   units.E_R_init_DrewRodn2008 = 'J';  label.E_R_init_DrewRodn2008 = 'initial energy in the repro buffer, DrewRodn2008'; 
par.T_cult = 295.15;  free.T_cult = 0;   units.T_cult = 'K';       label.T_cult = 'temp in culture'; 
par.del_Mt = 0.14256;  free.del_Mt = 1;   units.del_Mt = '-';       label.del_Mt = 'shape coefficient for adult'; 
par.del_X = 0.90123;  free.del_X = 0;   units.del_X = '-';        label.del_X = 'shrinking threshold'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response'; 
par.f_BagaPels2001 = 0.58258;  free.f_BagaPels2001 = 0;   units.f_BagaPels2001 = '-';  label.f_BagaPels2001 = 'scaled functional response of BagaPels2001 data'; 
par.f_BeauGous2015 = 0.7548;  free.f_BeauGous2015 = 0;   units.f_BeauGous2015 = '-';  label.f_BeauGous2015 = 'sc. func. resp., BeauGous2015'; 
par.f_BestAdat2010 = 1;  free.f_BestAdat2010 = 0;   units.f_BestAdat2010 = '-';  label.f_BestAdat2010 = 'scaled functional response of BestAdat2010 data'; 
par.f_DrewRodn2008 = 0.70431;  free.f_DrewRodn2008 = 0;   units.f_DrewRodn2008 = '-';  label.f_DrewRodn2008 = 'sc. func. resp., DrewRodn2008'; 
par.f_EatoFarl1974 = 0.9;  free.f_EatoFarl1974 = 0;   units.f_EatoFarl1974 = '-';  label.f_EatoFarl1974 = 'scaled functional response of EatoFarl1974b data'; 
par.f_LawrEber2002_high = 0.76425;  free.f_LawrEber2002_high = 0;   units.f_LawrEber2002_high = '-';  label.f_LawrEber2002_high = 'scaled functional response of LawrEber2002_high data'; 
par.f_LawrEber2002_low = 0.52671;  free.f_LawrEber2002_low = 0;   units.f_LawrEber2002_low = '-';  label.f_LawrEber2002_low = 'scaled functional response of LawrEber2002_low data'; 
par.f_Schi2002 = 0.51754;  free.f_Schi2002 = 0;   units.f_Schi2002 = '-';   label.f_Schi2002 = 'scaled functional response of Schi2002 data'; 
par.s_rejuv = 0;      free.s_rejuv = 0;   units.s_rejuv = '-';      label.s_rejuv = 'rejuvenation stress coefficient'; 
par.s_shrink = 202.009;  free.s_shrink = 0;   units.s_shrink = '-';     label.s_shrink = 'shrinking stress coefficient'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
