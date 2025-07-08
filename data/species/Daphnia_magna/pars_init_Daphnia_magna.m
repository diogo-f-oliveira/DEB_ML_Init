function [par, metaPar, txtPar] = pars_init_Daphnia_magna(metaData)

metaPar.model = 'std'; 

%% core primary parameters 
par.z = 0.1516;        free.z     = 1;       units.z = '-';          label.z = 'zoom factor for female'; 
par.F_m = 30.17;       free.F_m   = 1;      units.F_m = 'l/d.cm^2'; label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.9;       free.kap_X = 0;      units.kap_X = '-';      label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.05;      free.kap_P = 0;      units.kap_P = '-';      label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.1858;        free.v     = 1;      units.v = 'cm/d';       label.v = 'energy conductance'; 
par.kap = 0.5809;      free.kap   = 1;      units.kap = '-';        label.kap = 'allocation fraction to soma';
par.kap_R = 0.95;      free.kap_R = 0;      units.kap_R = '-';      label.kap_R = 'reproduction efficiency'; 
par.p_M = 1200;        free.p_M   = 1;      units.p_M = 'J/d.cm^3'; label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;           free.p_T   = 0;      units.p_T = 'J/d.cm^2'; label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.2537;      free.k_J   = 1;      units.k_J = '1/d';      label.k_J = 'maturity maint rate coefficient';
par.E_G = 4400;        free.E_G   = 1;      units.E_G = 'J/cm^3';   label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 0.05464;    free.E_Hb  = 1;      units.E_Hb = 'J';       label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.09;       free.E_Hp  = 1;      units.E_Hp = 'J';       label.E_Hp = 'maturity at puberty';  
par.h_a = 0.0002794;   free.h_a   = 1;      units.h_a = '1/d^2';    label.h_a = 'Weibull aging acceleration'; 
par.s_G = -0.3;        free.s_G   = 0;      units.s_G = '-';        label.s_G = 'Gompertz stress coefficient for female'; 

%% other parameters 
par.T_A = 6400;        free.T_A   = 0;      units.T_A = 'K';        label.T_A = 'Arrhenius temperature'; 
par.T_ref = 293.15;    free.T_ref = 0;      units.T_ref = 'K';      label.T_ref = 'Reference temperature'; 
par.del_M = 0.264;     free.del_M = 1;      units.del_M = '-';      label.del_M = 'shape coefficient'; 
par.eR0 = 1;           free.eR0   = 0;      units.eR0 = '-';        label.eR0 = 'eR at start starvation '; 
par.f = 1;             free.f     = 0;      units.f = '-';          label.f = 'scaled functional response for 0-var data';
par.f_LJO = 0.78;      free.f_LJO = 0;      units.f_LJO = '-';      label.f_LJO = 'scaled functional response for LJO data';
par.f_tN = 1.343;      free.f_tN  = 1;      units.f_tN = '-';       label.f_tN = 'scaled functional response for tN data'; 
par.f_tL = 0.8404;     free.f_tL  = 1;      units.f_tL = '-';       label.f_tL = 'scaled functional response for tL_f, tL_m data';
par.f_tL1 = 1.031;     free.f_tL1 = 1;      units.f_tL1 = '-';      label.f_tL1 = 'scaled functional response for tL1 data'; 
par.f_tL2 = 0.9601;    free.f_tL2 = 1;      units.f_tL2 = '-';      label.f_tL2 = 'scaled functional response for tL2 data'; 
par.f_tL3 = 0.8563;    free.f_tL3 = 1;      units.f_tL3 = '-';      label.f_tL3 = 'scaled functional response for tL3 data'; 
par.f_tL4 = 0.724;     free.f_tL4 = 1;      units.f_tL4 = '-';      label.f_tL4 = 'scaled functional response for tL4 data'; 
par.f_tL5 = 0.6297;    free.f_tL5 = 1;      units.f_tL5 = '-';      label.f_tL5 = 'scaled functional response for tL5 data';
par.n_Carb_E = 0.457;  free.n_Carb_E = 0;   units.n_Carb_E = '-';   label.n_Carb_E = 'chem coeff for Carb in reserve'; 
par.n_Carb_V = 0.1484; free.n_Carb_V = 0;   units.n_Carb_V = '-';   label.n_Carb_V = 'chem coeff for Carb in structure'; 
par.n_Glyc_E = 0.4309; free.n_Glyc_E = 0;   units.n_Glyc_E = '-';   label.n_Glyc_E = 'chem coeff for Glyc in reserve'; 
par.n_Glyc_V = 0.0801; free.n_Glyc_V = 0;   units.n_Glyc_V = '-';   label.n_Glyc_V = 'chem coeff for Glyc in structure'; 
par.n_Lipi_E = 0.3934; free.n_Lipi_E = 0;   units.n_Lipi_E = '-';   label.n_Lipi_E = 'chem coeff for Lipi in reserve'; 
par.n_Lipi_V = 0.1497; free.n_Lipi_V = 0;   units.n_Lipi_V = '-';   label.n_Lipi_V = 'chem coeff for Lipi in structure'; 
par.n_Prot_E = 1.571;  free.n_Prot_E = 0;   units.n_Prot_E = '-';   label.n_Prot_E = 'chem coeff for Prot in reserve'; 
par.n_Prot_V = 1.233;  free.n_Prot_V = 0;   units.n_Prot_V = '-';   label.n_Prot_V = 'chem coeff for Prot in structure'; 
par.n_Trig_E = 0.241;  free.n_Trig_E = 0;   units.n_Trig_E = '-';   label.n_Trig_E = 'chem coeff for Trig in reserve'; 
par.n_Trig_V = 0.076;  free.n_Trig_V = 0;   units.n_Trig_V = '-';   label.n_Trig_V = 'chem coeff for Trig in structure'; 
par.s_Gm = -0.2;       free.s_Gm  = 0;      units.s_Gm = '-';       label.s_Gm = 'Gompertz stress coefficient for male'; 
par.z_m = 0.08759;     free.z_m   = 0;      units.z_m = '-';        label.z_m = 'zoom factor for male'; 
par.f_SK1 = 1.244;     free.f_SK1 = 0;      units.f_SK1 = '-';      label.f_SK1 = 'scaled functional response for tL_SK1, tN_SK1 data';
par.f_SK2 = 1.096;     free.f_SK2 = 0;      units.f_SK2 = '-';      label.f_SK2 = 'scaled functional response for tL_SK2, tN_SK2 data';
par.f_SK3 = 0.6747;    free.f_SK3 = 0;      units.f_SK3 = '-';      label.f_SK3 = 'scaled functional response for tL_SK3, tN_SK3 data';
par.f_SK4 = 0.497;     free.f_SK4 = 0;      units.f_SK4 = '-';      label.f_SK4 = 'scaled functional response for tL_SK2, tN_SK2 data';
par.f_ap = 0.8293;     free.f_ap  = 0;      units.f_ap = '-';       label.f_ap = 'scaled functional response for Tap data';
par.s_shrink = 4.38;   free.s_shrink = 0;   units.s_shrink = '-';   label.s_shrink = 'shrinking stress coefficient';  
par.f_LW = 1;          free.f_LW  = 0;      units.f_LW = '-';       label.f_LW = 'scaled functional response for LW data';
par.t_0 = 2.324;       free.t_0   = 0;      units.t_0  = 'd';       label.t_0  = 'time for egg production at 20 C';
par.L_01 = 0.313;      free.L_01  = 0;      units.L_01  = 'd';      label.L_01  = 'initial size for Coors data';
par.L_02 = 0.313;      free.L_02  = 0;      units.L_02  = 'd';      label.L_02  = 'initial size for Coors data';
par.L_03 = 0.11;       free.L_03  = 0;      units.L_03  = 'd';      label.L_03  = 'initial size for Coors data';
par.mu_x2 = 0.02;      free.mu_x2 = 0;      units.mu_x2  = 'J/mg';  label.mu_x2  = 'conversion of mg carbon to J for algal food (Desmodesmus subspicatus)';
par.fF_m = 1.5;        free.fF_m  = 0;      units.fF_m  = '-';      label.fF_m  = 'increase in filtration rate at low food density, approximated from Lampert W. Limnol. Oceanogr., 39(5), 1994,997-1006';

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class);
par.d_V = 0.19;     free.d_V   = 0;   units.d_V = 'g/cm^3';         label.d_V = 'specific density of structure';  % g/cm^3, specific density of structure, see ref bibkey
par.d_E = par.d_V;

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
