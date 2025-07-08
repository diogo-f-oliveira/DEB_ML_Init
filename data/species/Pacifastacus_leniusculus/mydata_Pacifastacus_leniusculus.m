function [data, auxData, metaData, txtData, weights] = mydata_Pacifastacus_leniusculus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Astacidae';
metaData.species    = 'Pacifastacus_leniusculus'; 
metaData.species_en = 'Signal crayfish'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiCi', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ah' ,'ab', 'ap', 'am', 'Lb', 'Lp', 'Li', 'L_t', 'Wwh', 'Wwb', 'Wwj', 'Wwp', 'Wwi', 'Ri', 'E0'}; 
metaData.data_1     = {'t-L_fT', 't-Ww_fT', 'L-N', 'L-Ww'}; 

metaData.COMPLETE = 3.5; 

metaData.author   = {'Bas Kooijman'};  
metaData.date_subm = [2017 08 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1    = {'Nina Marn', 'Ana Dobrovic', 'Sandra Hudina'};    
metaData.date_mod_1 = [2020 08 05];              
metaData.email_mod_1     = {'nina.marn@gmail.com'};            
metaData.address_mod_1   = {'Institut Rudjer Boskovi?, Zagreb, Croatia'};

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nina.marn@gmail.com'}; 
metaData.date_acc    = [2020 08 05]; 

%% set data
% zero-variate data
data.ah = 70;  units.ah = 'd'; label.ah = 'age at hatching'; bibkey.ah = 'CelaPaz1987';   
  temp.ah = C2K(15.5); units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = ['Electronic microscope, development starts almost immediately and takes cca 1000 degrees x days; At hatching a small amount of yolk is visible, enough to sustain survival for a few days',...
      'In nature incubation lasts 160 to 270 days (1500 to 2200 thermal units) and includes a cold diapause (Table 13.1 in Holdich 2002) '];
data.ab = data.ah+10;  units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'KozaBuri2009';   
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Birth assumed at stage2; Table 1: Stage2 reached 9.6d post-hatch at 14.3C and 6d post-hatch at 20.5 C';
data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'Abra1971';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'Abra1971';
  temp.tpm = C2K(10); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 20*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'SoutHold2006';   
  temp.am = C2K(10);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb = 1.1; units.Lb = 'cm';   label.Lb = 'total length at birth';       bibkey.Lb = 'KozaBuri2009';
  comment.Lb = 'Birth assumed between stages2 (10mm) and 3 (12mm) post-hatch; Table 1:stage 2 (stage 3): 9.8mm (11.8mm) at 14.3 C, and 10.3mm (12.4mm) at 20.5 C';
data.Lp  = 8.0;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty females'; bibkey.Lp  = 'SoutHold2006';
data.Lpm  = 8.2;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty males'; bibkey.Lpm  = 'Abra1971';
data.Li  = 12;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'KoesSoes2011';
data.Lim  = 16;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males'; bibkey.Lim  = 'KoesSoes2011';
data.L2 = 7.9;    units.L2  = 'cm';  label.L2  = 'total length at 2yr for females'; bibkey.L2  = 'Abra1971';
  temp.L2 = C2K(10); units.temp.L2 = 'K'; label.temp.L2 = 'temperature'; 
data.L2m = 8.2;    units.L2m  = 'cm';  label.L2m  = 'total length at 2yr for males'; bibkey.L2m  = 'Abra1971';
  temp.L2m = C2K(10); units.temp.L2m = 'K'; label.temp.L2m = 'temperature'; 

data.Wwh = 15.75e-3; units.Wwh = 'g';   label.Wwh = 'wet weight at hatching';       bibkey.Wwh = 'KozaBuri2009';
  comment.Wwh = 'stage 1 at hatch, 15.8mg at 14.3 C, and 15.7mg at 20.5 C';
data.Wwb = 35e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'KozaBuri2009';
  comment.Wwb = 'Birth assumed between stages2 (28.2mg) and 3 post-hatch (45.85); Table 1:stage 2 (stage 3): 26.5mg (42.8mg) at 14.3 C, and 29.9mg (48.9)at 20.5 C';
data.Wwp = 29;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = {'Abra1971', 'WestSavo2002'};
  comment.Wwp = 'Computed from 94 * (Lp/12.2)^3 [Abra1971]; matches L-Ww pairs in LW data [WestSavo2002]';
data.Wwi = 89.4;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = {'Abra1971', 'WestSavo2002'};
  comment.Wwi = 'Computed from 94 * (Li/12.2)^3 [Abra1971]; matches L-Ww pairs in LW data [WestSavo2002]';
data.Wwim = 212;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = {'Abra1971', 'WestSavo2002'};
  comment.Wwim = 'Computed from 94 * (Lim/12.2)^3 [Abra1971]; matches L-Ww pairs in LW data[WestSavo2002]';

data.Ri = 350/365; units.Ri  = '#/d';    label.Ri = 'max reprod rate'; bibkey.Ri  = 'SoutHold2006';
    temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    comment.Ri = 'Number of eggs varies between 200 and 400, repro once per year; temp based on other repro data';
    
data.E0 = 55.56 * 2.56/2.22; units.E0  = 'J'; label.E0  = 'initial energy content of the egg'; bibkey.E0  = {'RodrGarc2006','PawlKorz2010'};
comment.E0 = 'Based on Redclaw crayfish (RodrGarc2006): egg diameter (2.22 mm) and energy (55.56 J/egg), egg diameter 2.56mm (PawlKorz2010)';

%% univariate data
% Kozak et al. (2009). The effect of water temperature on the number of moults and growth of juvenile signal crayfish Pacifastacus leniusculus Dana
% COLD - listed per stages (stage2 onwards; few days after hatching they would start feeding = assume that corresponds to stage2) 					
% age -post Hatch	9.6	29.8	48.8	70.7	94.4 --> birth: at cca 10d post-hatch
% Ww (mg)	26.5	42.8	68.7	110.3	147
% length (mm)	9.8	11.8	14.2	16.6	18.5
% Fig. 1B
tL_temp1 = [  % age (days post-hatch), TL (mm); % T= 14.31 - 0.64 C (cold water)
6.699	5.773	6.697	9.873	9.876	10.832	5.745	6.715	7.624	9.804	10.774	11.683	12.775	9.867	10.777	6.657	8.597	9.809	10.779	12.719	24.702	26.642	25.619	24.652	29.747	29.745	30.654	32.594	34.837	29.742	32.531	33.865	23.737	24.889	25.738	27.799	28.819	29.716	30.612	31.658	32.654	36.688	45.846	49.680	51.822	53.769	41.807	42.753	45.841	46.799	47.758	48.760	50.590	51.898	52.813	54.730	55.601	43.657	44.616	45.879	46.794	47.753	43.651	53.766	62.563	64.742	65.741	67.661	66.736	70.840	72.749	72.667	73.669	70.886	71.757	70.801	73.634	76.768	73.680	77.732	77.765	80.598	80.590	89.787	89.746	87.865	88.823	92.614	95.800	98.630	103.644	109.696	61.619	62.564
10.515	9.996	11.068	11.069	10.516	10.511	9.523	9.523	9.523	10.010	10.024	10.011	10.011	9.510	9.510	9.022	9.023	9.023	9.023	9.023	13.044	13.044	11.582	11.068	10.501	11.069	11.069	11.069	11.070	11.570	11.570	11.557	12.069	12.056	12.056	12.056	12.056	12.067	12.056	12.056	12.057	12.057	13.048	13.048	13.049	12.060	14.036	14.037	14.048	14.048	14.048	14.049	14.029	14.030	14.030	14.030	14.030	15.011	15.011	15.011	15.011	15.011	16.080	15.032	16.093	16.093	16.590	16.084	18.058	16.581	18.040	17.087	17.077	16.104	16.085	15.521	15.521	16.086	15.025	15.026	17.087	17.078	18.547	18.071	17.575	19.044	19.044	19.054	18.063	18.569	18.074	19.047	18.066	18.056
]'; tL_temp1(:,2) = tL_temp1(:,2)/10; %mm to cm
tL_temp1(:,1) = tL_temp1(:,1) - 10; % 10 days from hatching to birth at 14.3 C
data.tL_T1 = tL_temp1(tL_temp1(:,1)>0,:); units.tL_T1   = {'d', 'cm'};  label.tL_T1 = {'age', 'total length'};  
temp.tL_T1    = C2K(14.31);  units.temp.tL_T1 = 'K'; label.temp.tL_T1 = 'temperature';
bibkey.tL_T1 = 'KozaBuri2009'; comment.tL_T1 = 'Crayfish kept at cold temperature (14.3C)'; 

% WARM		listed per stages (stage2 onwards; few days after hatching they would start feeding = assume that corresponds to stage2) 											
% age	6	16.6	28.1	41	57.3	73.9	93.7 --> birth: at cca 7d post-hatch
% Ww (mg)	29.9	48.9	65.4	99.5	144.7	193.3	258.6
% length (mm)	10.3	12.4	14.3	15.9	17.6	20	22.2
tL_temp2 = [  % age (days post-hatch), TL (mm); T= 20.54 - 0.69 C (warm water)
5.707	5.710	5.718	14.581	15.856	16.812	17.729	18.685	14.624	15.859	18.648	14.586	15.821	16.778	17.734	18.690	14.589	17.739	25.641	27.833	28.789	26.561	25.647	26.563	27.838	29.750	26.566	28.797	26.568	27.843	28.839	32.584	27.806	28.802	28.807	32.589	37.623	36.669	36.672	40.775	41.731	42.688	38.587	40.778	41.734	37.633	38.589	40.820	42.653	42.696	40.826	42.698	42.701	38.600	40.831	57.880	54.685	55.641	56.597	57.872	55.675	57.867	60.695	47.745	58.780	61.609	50.611	53.718	55.631	56.587	57.901	58.818	60.650	56.584	58.815	54.669	52.752	55.576	63.830	66.680	73.658	69.838	72.667	73.623	78.683	68.568	71.716	72.712	73.708	75.819	76.815	75.862	76.818	67.617	70.844	69.856	71.771	75.824	76.820	77.737	80.565	82.796	86.621	89.761	87.801	89.748	91.660	91.623	93.851	95.724	97.676	93.856	102.696	102.701
11.081	10.503	9.018	13.039	13.039	13.048	13.057	13.057	12.550	12.559	12.550	12.061	12.061	12.061	12.052	12.052	11.572	11.074	16.072	16.082	16.091	15.504	15.023	15.014	15.015	15.024	14.517	14.508	14.027	14.028	14.046	14.037	13.548	13.557	12.561	13.041	18.048	17.568	17.070	17.080	17.089	17.080	16.572	16.573	16.591	16.092	16.083	16.084	16.084	15.506	15.008	15.026	14.528	14.038	14.030	14.521	16.095	16.095	16.095	16.095	17.082	17.082	17.074	17.561	17.571	17.563	18.059	18.060	18.069	18.069	18.069	18.078	18.061	18.540	18.549	19.038	20.016	21.003	19.519	23.059	22.064	21.023	21.023	21.024	21.024	20.027	20.036	20.036	20.028	20.010	20.019	19.521	19.530	19.040	19.040	17.573	17.066	19.032	19.023	19.015	19.042	19.024	19.034	20.510	22.066	23.071	23.063	22.565	23.072	23.054	23.063	22.076	23.073	22.068
]'; tL_temp2(:,2) = tL_temp2(:,2)/10; %mm to cm
tL_temp2(:,1) = tL_temp2(:,1) -7; % 7 days from hatching to birth at 20.5 C
data.tL_T2 = tL_temp2(tL_temp2(:,1)>0,:); units.tL_T2   = {'d', 'cm'};  label.tL_T2 = {'age', 'total length'};  
temp.tL_T2    = C2K(20.54);  units.temp.tL_T2 = 'K'; label.temp.tL_T2 = 'temperature';
bibkey.tL_T2 = 'KozaBuri2009'; comment.tL_T2 = 'Crayfish kept at warm temperature (20.5C)'; 


% age - carapace length
% Belchier et al. (1998): Estimating age and growth in long lived temperate freshwater crayfish using lipofuscin
% T= annual mean 9.1 C, monthly mean 1.1-18.3 C
% Fig. 1B
tL_Belc1998 = [ % age (years)	CL (mm)
    0.503	0.51	0.51	0.51	0.517	1.502	1.502	1.502	1.502	1.502	1.502	1.502	1.502	1.502	2.515	2.515	2.517	2.523	2.517	3.508	3.502	3.508	3.508	3.508	3.508	3.508	3.508	3.508	4.505	4.505	4.505	4.505	4.505	4.505	4.505	4.505	5.495	5.502	5.502	5.495	6.501	6.495	6.495	6.495	6.495
    12.478	10.97	10.09	9.273	8.33	27.054	26.237	24.728	22.529	21.021	18.947	12.85	11.845	19.764	42.823	41.629	38.498	37.334	35.726	46.534	44.649	41.821	40.601	39.658	38.605	35.721	33.614	32.782	62.112	53.96	53.184	50.966	49.746	43.313	41.872	44.866	59.168	57.56	53.956	47.523	64.83	50.547	47.176	44.205	42.948
    ]'; tL_Belc1998(:,1) = tL_Belc1998(:,1)*365; tL_Belc1998(:,2) = tL_Belc1998(:,2)/10; % years to days, mm to cm
data.tL_Belc1998 = tL_Belc1998; units.tL_Belc1998   = {'d', 'cm'};  label.tL_Belc1998 = {'age', 'carapace length'};
temp.tL_Belc1998    = C2K(9.1);  units.temp.tL_Belc1998 = 'K'; label.temp.tL_Belc1998 = 'temperature';
bibkey.tL_Belc1998 = 'BelcEdsm1998';

% Gonzalez et al. (2010):  Stocking density for the intensive rearing of juvenile crayfish, Pacifastacus leniusculus (Astacidae), using Artemia nauplii to supplement a dry diet from the onset of exogenous feeding
% Fig. 2. : age (days) and CL (mm), at density	100 m-2	600 m-2
tL_Gonz2010 = [ % age (days since start of exp = stage2 = birth)	CL (mm)
    20.1385	8.467	7.773
    40.1485	10.249	9.432
    60.132	12.344	10.847
    80.1415	13.814	12.689
    100.0835	15.254	13.752
    ];tL_Gonz2010(:, 2:3) = tL_Gonz2010(:, 2:3)/10; %mm to cm
data.tL_Gonz2010_f1 = tL_Gonz2010(:,1:2); units.tL_Gonz2010_f1   = {'d', 'cm'};  label.tL_Gonz2010_f1 = {'age', 'carapace length'};
temp.tL_Gonz2010_f1    = C2K(20);  units.temp.tL_Gonz2010_f1 = 'K'; label.temp.tL_Gonz2010_f1 = 'temperature';
bibkey.tL_Gonz2010_f1 = 'GonzCela2010'; 
comment.tL_Gonz2010_f1 = 'Lower density (100/m^3) so assumed higher f'; 

data.tL_Gonz2010_f2 = tL_Gonz2010(:,[1,3]); units.tL_Gonz2010_f2   = {'d', 'cm'};  label.tL_Gonz2010_f2 = {'age', 'carapace length'};
temp.tL_Gonz2010_f2    = C2K(20);  units.temp.tL_Gonz2010_f2 = 'K'; label.temp.tL_Gonz2010_f2 = 'temperature';
bibkey.tL_Gonz2010_f2 = 'GonzCela2010'; 
comment.tL_Gonz2010_f2 = 'Higher density (600/m^3) so assumed lower f';

% age-wet weight  KozaBuri2009 at two temps
% COLD - listed per stages (stage2 onwards; few days after hatching they would start feeding = assume that corresponds to stage2) 					
tLWw_T1 = [9.6	29.8	48.8	70.7	94.4 % --> birth: at cca 10d post-hatch
    26.5	42.8	68.7	110.3	147 % Ww (mg)
    9.8	11.8	14.2	16.6	18.5 % length (mm) --> already included above
]'; tLWw_T1(:,2) = tLWw_T1(:,2)/1e3; %mg to g
tLWw_T1(:,1) = tLWw_T1(:,1) - 10; % 10 days from hatching to birth at 14.3 C
data.tWw_T1 = tLWw_T1(tLWw_T1(:,1)>0,1:2); units.tWw_T1   = {'d', 'g'};  label.tWw_T1 = {'age', 'wet weight'};  
temp.tWw_T1    = C2K(14.31);  units.temp.tWw_T1 = 'K'; label.temp.tWw_T1 = 'temperature';
bibkey.tWw_T1 = 'KozaBuri2009'; 
comment.tWw_T1 = 'Crayfish kept at cold temperature (14.3C)'; 

% WARM		listed per stages (stage2 onwards; few days after hatching they would start feeding = assume that corresponds to stage2) 											
tLWw_T2 = [6	16.6	28.1	41	57.3	73.9	93.7 %--> birth: at cca 7d post-hatch
    29.9	48.9	65.4	99.5	144.7	193.3	258.6 % Ww (mg)
    10.3	12.4	14.3	15.9	17.6	20	22.2 % length (mm) --> already included above
]'; tLWw_T2(:,2) = tLWw_T2(:,2)/1e3; %mg to g
tLWw_T2(:,1) = tLWw_T2(:,1) - 10; % 10 days from hatching to birth at 14.3 C
data.tWw_T2 = tLWw_T2(tLWw_T2(:,1)>0,1:2); units.tWw_T2   = {'d', 'g'};  label.tWw_T2 = {'age', 'wet weight'};  
temp.tWw_T2 = C2K(20.54);  units.temp.tWw_T2 = 'K'; label.temp.tWw_T2 = 'temperature';
bibkey.tWw_T2 = 'KozaBuri2009'; 
comment.tWw_T2 = 'Crayfish kept at cold temperature (20.54C)'; 

% age - wet weight, Belc1998, Fig. 1C	
tWw_Belc1998 = [ % age (years)	Ww (g)
    0.499	1.502	1.502	1.502	1.502	2.507	2.506	2.506	2.506	2.506	2.505	2.505	3.506	3.506	3.506	3.505	3.505	3.505	3.505	3.505	3.505	4.499	4.496	4.495	4.5	4.5	4.5	4.499	4.499	4.499	5.493	5.499	5.497	6.494	6.493	6.492	6.492	6.492
    0.446	2.363	0.155	6.162	4.219	29.987	25.217	17.443	15.853	14.44	3.044	1.427	31.082	22.734	24.019	20.023	18.382	17.097	14.529	11.532	10.176	86.139	59.882	40.977	37.62	33.645	26.931	23.84	22.073	18.274	68.601	58.796	32.471	43.752	27.056	23.964	20.695	97.109
    ]'; tWw_Belc1998(:,1) = tWw_Belc1998(:,1)*365; % age to days
data.tWw_Belc1998 = tWw_Belc1998; units.tWw_Belc1998   = {'d', 'g'};  label.tWw_Belc1998 = {'age', 'wet weight'};
temp.tWw_Belc1998    = C2K(9.1);  units.temp.tWw_Belc1998 = 'K'; label.temp.tWw_Belc1998 = 'temperature';
bibkey.tWw_Belc1998 = 'BelcEdsm1998';

% Gonzalez et al. (2010):  Stocking density for the intensive rearing of juvenile crayfish, Pacifastacus leniusculus (Astacidae), using Artemia nauplii to supplement a dry diet from the onset of exogenous feeding
% Fig. 3. age (days) and Ww (g), at density	100 m-2	600 m-2
tWw_Gonz2010 = [% age (days) and Ww (g),
    20.0275	0.127	0.103
    40.0075	0.237	0.171
    60.0165	0.442	0.295
    80.0305	0.678	0.489
    100.0285	1.079	0.699
    ];
data.tWw_Gonz2010_f1 = tWw_Gonz2010(:,1:2); units.tWw_Gonz2010_f1   = {'d', 'g'};  label.tWw_Gonz2010_f1 = {'age', 'wet weight'};
temp.tWw_Gonz2010_f1    = C2K(20);  units.temp.tWw_Gonz2010_f1 = 'K'; label.temp.tWw_Gonz2010_f1 = 'temperature';
bibkey.tWw_Gonz2010_f1 = 'GonzCela2010'; 
comment.tWw_Gonz2010_f1 = 'Lower density (100/m^3) so assumed higher f';

data.tWw_Gonz2010_f2 = tWw_Gonz2010(:,[1,3]); units.tWw_Gonz2010_f2   = {'d', 'g'};  label.tWw_Gonz2010_f2 = {'age', 'wet weight'};
temp.tWw_Gonz2010_f2    = C2K(20);  units.temp.tWw_Gonz2010_f2 = 'K'; label.temp.tWw_Gonz2010_f2 = 'temperature';
bibkey.tWw_Gonz2010_f2 = 'GonzCela2010'; 
comment.tWw_Gonz2010_f2 = 'Higher density (600/m^3) so assumed lower f';

% length-# of eggs
data.LN = [ ... % total length (cm), number of eggs (#)
8.008	67.721
8.203	50.791
8.406	70.543
8.512	113.271
8.710	149.147
8.902	119.721
9.000	130.605
9.011	220.496
9.114	114.481
9.202	180.186
9.206	195.504
9.211	171.318
9.212	100.372
9.313	158.822
9.402	174.140
9.406	200.341
9.415	111.256
9.503	210.016
9.504	147.535
9.512	190.667
9.602	109.643
9.610	120.930
9.700	140.682
9.700	99.969
9.707	185.023
9.707	166.884
9.808	230.977
9.812	222.109
9.898	200.341
9.908	89.891
10.001	150.357
10.001	99.566
10.008	210.419
10.009	154.791
10.020	180.589
10.094	150.357
10.200	130.202
10.200	119.721
10.201	110.047
10.205	79.411
10.208	185.829
10.215	215.256
10.219	240.248
10.301	200.744
10.311	100.775
10.411	200.341
10.411	160.031
10.504	249.519
10.509	180.589
10.512	226.946
10.596	99.163
10.607	129.798
10.699	258.388
10.699	247.504
10.707	240.651
10.709	110.047
10.712	224.124
10.802	199.938
10.806	180.186
10.899	230.171
10.903	192.682
10.996	257.581
11.001	210.016
11.017	240.651];
units.LN   = {'cm', '#'};  label.LN = {'total length', 'number of eggs'};  
temp.LN    = C2K(10);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Abra1971';

% Martinsson - total length (cm), carapax fecundity (before eggs fall off etc)
data.LN_Mart = [7.395	7.694	8.395	8.395	8.395	8.395	8.497	8.497	8.497	8.594	8.596	8.647	8.696	8.696	8.796	8.796	8.845	8.894	8.896	8.896	8.996	8.996	8.996	9.095	9.095	9.195	9.195	9.195	9.195	9.295	9.295	9.295	9.297	9.297	9.395	9.397	9.397	9.397	9.397	9.495	9.495	9.495	9.495	9.495	9.495	9.497	9.497	9.497	9.596	9.596	9.597	9.597	9.597	9.597	9.597	9.597	9.648	9.697	9.697	9.697	9.697	9.697	9.797	9.797	9.797	9.846	9.894	9.894	9.896	9.896	9.896	9.896	9.896	9.996	9.996	10.046	10.096	10.096	10.196	10.196	10.196	10.196	10.196	10.296	10.296	10.296	10.296	10.398	10.398	10.398	10.498	10.498	10.498	10.598	10.698	10.698	10.698	10.798	10.798	10.8	10.898	10.997	10.999	11.096	11.195	11.195	11.297	11.397	11.397	11.447	11.497	11.597	11.599	11.747	11.797	11.849	11.899	11.899	12.099	12.101	12.397	12.498	13.2	13.75
105.722	177.95	245.691	234.409	228.993	154.527	225.389	200.567	181.161	205.989	159.956	199.674	230.366	216.376	171.702	166.287	191.563	219.096	246.175	182.089	236.252	221.81	186.157	236.259	204.216	256.123	235.814	252.061	132.013	220.476	215.06	152.779	253.421	241.236	235.826	276.444	207.845	204.686	183.926	273.743	262.46	245.31	234.028	228.612	314.812	172.65	158.659	154.146	261.47	250.546	234.937	220.946	213.274	188.452	133.392	286.386	246.907	293.037	288.991	248.124	225.466	85.871	263.506	253.391	222.64	218.597	298.31	183.397	367.5	220.623	202.819	199.178	175.022	246.215	196.541	211.407	276.73	269.689	312.329	300.595	282.603	272.434	243.49	333.848	281.045	172.701	167.616	335.81	325.25	270.1	356.547	259.937	239.598	281.455	305.712	284.2	264.643	355.392	246.266	329.187	359.701	266.618	307.687	308.475	416.044	370.672	354.642	331.572	309.668	346.829	376.95	348.794	376.174	281.92	355.847	488.054	448.944	363.285	432.138	374.25	384.047	370.755	450.983	514.382
]';
 units.LN_Mart   = {'cm', '#'};  label.LN_Mart = {'total length', 'number of eggs'};  
 temp.LN_Mart    = C2K(15);  units.temp.LN_Mart = 'K'; label.temp.LN_Mart = 'temperature';
 bibkey.LN_Mart = 'Mart2011'; 
 comment.LN_Mart = 'Crayfish from 4 lakes; temp 17.8C mean of temperatures in September, annual temp probably lower'; 

% total length (mm), pleopodal fecundity (# eggs)
 data.LN_Hudi = [106.38	107.69	118.56	108.22	112.51	99.16	129.03	121.34	107.75	102.09	114.16	115.15	118.71	120.97	127.55	109.10	108.00	111.86	95.91	103.57	110.50	106.53	117.45	105.20	107.47	117.84	108.30	96.26	121.80	110.12	111.80	101.10	90.45	102.57	106.50	108.70	115.60	109.38	102.58	121.55	104.65	110.40	119.71	107.40	109.67	102.72	108.33	120.68
120	250	260	250	250	125	300	290	230	160	250	280	300	350	240	300	250	200	164	268	255	300	253	221	208	294	206	218	261	233	320	368	236	236	104	229	422	238	208	442	168	300	392	400	388	214	348	83
]';  data.LN_Hudi(:,1) = data.LN_Hudi(:,1)/10; % mm to cm
units.LN_Hudi   = {'cm', '#'};  label.LN_Hudi = {'total length', 'number of eggs'};  
temp.LN_Hudi    = C2K(12);  units.temp.LN_Hudi = 'K'; label.temp.LN_Hudi = 'temperature';
bibkey.LN_Hudi = 'HudiLuci2011'; 
comment.LN_Mart = 'Annual avg temp of Mura river: 10.9C, in September (spawning): 15C, and prior to that up to 19C';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
6.734	12.279
7.235	14.120
7.737	17.651
8.238	20.760
8.739	25.840
9.240	31.907
9.742	40.367
10.243	46.997
10.726	60.951
11.228	70.397
11.747	74.211
12.248	93.939];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Abra1971';

% length - wet weight
% Westman, K. & Savolainen, Riitta. (2002). Growth of the signal crayfish, Pacifastacus leniusculus, in a small forest lake in Finland. Boreal Environment Research. 7. 53-61. 	
% Fig. 3. (184 females, 170 males); lake is oligotrophis so f is separate
LWw_fem = [ % females, TL (mm)	Ww (g)
68.995	71.003	71.94	73.03	75.984	78.02	78.909	79.024	78.995	80.028	80.056	80.056	80.056	80.974	80.974	81.835	81.892	83.011	83.871	83.9	84.989	85.018	85.965	87.064	87.064	88.878	88.878	87.956	87.956	88.878	88.878	89.979	90.008	90.008	90.008	89.979	90.841	90.871	90.871	90.901	91.942	91.942	92.893	92.893	92.893	93.994	93.994	93.994	93.994	94.916	94.916	94.916	95.856	95.856	95.856	95.856	94.921	96.976	96.976	97.86	97.86	97.86	97.86	97.86	97.89	97.86	98.961	98.961	98.991	98.961	98.961	98.991	99.883	99.883	99.913	99.913	99.883	99.883	101.013	100.983	100.983	101.905	101.905	101.905	101.905	102.798	102.827	103.928	103.928	103.898	103.898	103.928	104.88	104.85	104.88	104.85	104.85	104.85	104.88	104.88	104.88	105.98	106.01	106.01	106.902	106.902	106.902	108.003	108.003	108.003	108.003	108.003	108.895	107.973	109.817	109.817	109.817	109.817	110.888	110.947	110.947	110.917	112.94	112.94	113.892	113.862	113.892	114.962	115.884	114.962	117.907	118.829	117.907	119.929	122.903	123.796	125.848	129.863	128.941
10.125	11.106	10.076	9.709	11.181	12.231	16.27	14.907	14.015	15.17	13.859	13.177	12.653	17.373	14.069	16.273	15.119	17.952	18.005	16.117	18.059	17.22	16.276	19.102	18.612	18.015	16.221	23.018	21.169	22.312	20.082	23.02	21.606	21.116	20.409	18.669	25.196	24.108	22.966	21.172	22.967	26.176	27.265	24.165	22.968	26.232	24.057	22.969	21.555	29.116	28.028	24.71	30.34	29.009	27.311	24.053	27.1	26.238	24.942	31.185	30.097	29.118	27.215	25.474	28.085	23.951	34.177	30.207	28.14	27.27	26.182	29.174	32.981	31.241	30.208	29.609	28.032	26.509	26.565	35.158	32.275	35.159	33.962	32.657	31.569	37.987	35.159	39.076	36.248	35.106	34.181	32.931	39.077	37.337	36.195	34.78	34.019	33.584	32.768	32.496	30.158	36.304	34.999	34.075	37.447	36.196	35.054	37.557	36.524	36.36	34.892	33.587	37.667	42.289	42.345	40.06	40.822	36.58	46.207	41.421	40.551	36.254	44.196	43.489	47.243	45.122	42.892	47.951	47.19	39.086	54.099	55.133	51.217	50.185	57.965	62.262	56.173	63.029	67.923
]'; LWw_fem(:,1) =  LWw_fem(:,1)/10; % mm to cm
data.LWw_fem = LWw_fem; units.LWw_fem   = {'cm', 'g'};  label.LWw_fem = {'total length', 'wet weight'};  
bibkey.LWw_fem = 'WestSavo2002'; 
comment.LWw_fem = 'Data from an oligotrophic lake in Finland'; 

LWw_m = [ % females, TL (mm)	Ww (g)
    77.896	81.008	79.903	80.967	81.948	84.000	84.000	86.975	86.945	84.923	85.993	85.963	86.945	86.767	89.919	90.990	91.882	93.102	93.012	93.012	93.845	89.111	91.922	93.008	93.946	95.060	95.060	95.008	95.992	95.915	95.811	96.899	96.847	98.013	97.987	98.920	98.920	98.920	100.034	100.008	100.034	100.034	100.034	100.966	100.914	100.914	100.966	101.847	101.847	101.899	102.987	102.987	102.987	102.987	102.987	102.987	102.987	103.013	103.919	103.919	103.919	103.919	103.919	105.007	105.007	105.007	105.007	105.007	105.007	105.940	105.914	105.914	105.914	105.914	105.914	106.872	106.872	106.872	106.872	106.846	107.960	107.960	108.893	108.893	108.893	108.893	108.893	108.893	108.893	109.981	110.007	110.007	110.007	109.981	109.981	109.981	110.913	110.939	110.939	110.939	110.913	112.053	112.053	112.053	112.027	112.960	112.960	112.960	112.986	112.960	112.960	113.867	113.893	113.893	113.893	114.980	114.980	115.006	115.006	115.006	115.939	117.027	115.913	115.965	115.939	115.939	115.913	118.892	117.960	117.934	122.001	121.975	127.933
    15.885	19.008	16.009	15.942	17.955	21.057	19.480	23.996	24.758	21.384	21.167	19.318	19.972	21.712	25.794	26.828	27.808	27.700	26.666	21.989	25.797	21.999	23.210	32.929	31.925	35.005	31.974	32.921	36.001	32.969	31.358	30.886	34.059	37.045	35.008	41.072	37.993	37.045	35.010	41.831	40.078	38.089	35.957	42.779	41.784	41.074	37.142	38.990	37.995	33.211	49.886	45.812	44.770	43.823	42.686	41.786	39.417	38.044	44.771	42.687	41.076	39.324	31.934	47.851	54.104	49.888	48.798	42.782	41.788	52.920	48.846	43.778	41.836	40.131	45.199	49.889	47.568	46.763	45.674	42.784	49.938	45.817	60.833	55.054	51.975	49.702	46.765	45.817	50.933	58.134	55.055	52.971	49.940	48.945	44.824	42.739	59.793	58.751	54.109	51.930	48.851	70.026	58.041	57.094	49.894	62.826	60.790	59.795	57.095	56.053	55.058	63.822	60.790	59.796	50.938	61.928	58.139	56.102	52.976	51.981	71.024	66.951	63.918	61.834	60.792	58.755	55.013	56.058	52.978	83.957	75.813	74.108	88.040
    ]'; LWw_m(:,1) =  LWw_m(:,1)/10; % mm to cm
data.LWw_m = LWw_m; units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'total length', 'wet weight'};  
bibkey.LWw_m = 'WestSavo2002'; 
comment.LWw_m = 'Data from an oligotrophic lake in Finland'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 5 *weights.tp;
weights.Lp = 20 *weights.Lp;
weights.tpm = 5 *weights.tpm;
weights.Lpm = 5 *weights.Lpm;
weights.E0 = 10 *weights.E0;
weights.tL_T1 = 5 *weights.tL_T1;
weights.tL_T2 = 5 *weights.tL_T2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_T2','tL_T1'}; subtitle1 = {'Data at 20, 14 C, KozaBuri2009'};
set2 = {'LWw_fem','LWw_m'}; subtitle2 = {'Data for females and males, WestSavo2002'};
set3 = {'tL_Gonz2010_f2', 'tL_Gonz2010_f1'}; subtitle3 = {'Data at low and high density, GonzCela2010'};
set4 = {'tWw_Gonz2010_f2', 'tWw_Gonz2010_f1'};  subtitle4 = {'Data at low and high density, GonzCela2010'};
set5 = {'tWw_T2','tWw_T1'}; subtitle5 = {'Data at 20, 14 C, KozaBuri2009'};
set6 = {'LN', 'LN_Hudi', 'LN_Mart'}; subtitle6 = {'Data from Abra1971, HudiLuci2011, Mart2011'};
metaData.grp.sets = {set1,set2,set3,set4,set5, set6};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = ['mod_1: Included new data: ah, ab, Lb, Wwh, Wwb, Ri, E0, age-length at several temperatures, age-wet weight, length-wet weight for males and females,', ...
    'age-length and age-wet weight at two food levels (COMPLETE level from 2.5 to 3.5). Added facts to the entry'];
D3 = 'mod_1: Model std is applied, instead of abj, since freshwater crayfish, unlike marine decapods, have no larval stage';
D4 = 'mod_1: Parameter values different: zoom factor a more realistic value of around 2, rather than <1, [p_M] slightly higher, t_0 not used';

metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Facts
F1 = 'mod_1: Development of free-living larval stage occurs inside the egg and a miniature crayfish hatches (typical for freshwater crayfish)';
metaData.bibkey.F1 = 'McLaBrin2016';
F2 = ['mod_1: Incubation in nature is relatively long, as for other Astacidae: lasts 160 to 270 days (1500 to 2200 thermal units) and includes a cold diapause (Table 13.1 in Holdich 2002).', ...
    'Skipping the diapause by warmer temperatures (>10C) shortens the incubation but can reduce later survival and growth.'];
metaData.bibkey.F2 = 'Hold2002';
F3 = 'mod_1: Adaptations to freshwater habitat includes relatively few yolk-rich eggs combined with the loss of free larvae (direct development), and brood care pattern.';
metaData.bibkey.F3 = 'Hold2002';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '7W7FR'; % Cat of Life
metaData.links.id_ITIS = '97326'; % ITIS
metaData.links.id_EoL = '1021882'; % Ency of Life
metaData.links.id_Wiki = 'Pacifastacus_leniusculus'; % Wikipedia
metaData.links.id_ADW = 'Pacifastacus_leniusculus'; % ADW
metaData.links.id_Taxo = '33799'; % Taxonomicon
metaData.links.id_WoRMS = '885106'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pacifastacus_leniusculus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
%
bibkey = 'Abra1971'; type = 'Article'; bib = [ ... 
'author = {S. A. A. Abrahamsson}, ' ... 
'year = {1971}, ' ...
'title = {Density, growth and reproduction in populations of \textit{Astacus astacus} and \textit{Pacifastacus leniusculus} in an isolated pond}, ' ...
'journal = {Oikos}, ' ...
'volume = {2}, ' ...
'pages = {373--380}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BelcEdsm1998'; type = 'Article'; bib = [ ... 
'author = {Belchier, Mark and Edsman, Lennart and Sheehy, Matt RJ and Shelton, Peter MJ}, ' ... 
'year = {1998}, ' ...
'title = {Estimating age and growth in long-lived temperate freshwater crayfish using lipofuscin}, ' ...
'journal = {Freshwater Biology}, ' ...
'volume = {39 (3)}, ' ...
'doi = {10.1046/j.1365-2427.1998.00292.x}, ' ...
'pages = {439--446}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CelaPaz1987'; type = 'Article'; bib = [ ... 
'author = {Celada, Jesus D and de Paz, Paulino and Gaudioso, Vicente R and Fernandez, Ramon}, ' ... 
'year = {1987}, ' ...
'title = {Embryonic development of the freshwater crayfish (\textit{Pacifastacus leniusculus} {D}ana): a scanning electron microscopic study}, ' ...
'journal = {The Anatomical Record}, ' ...
'volume = {219 (3)}, ' ...
'doi = {10.1002/ar.1092190311}, ' ...
'pages = {304--310}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GonzCela2010'; type = 'Article'; bib = [ ... 
'author = {Gonzalez, R and Celada, JD and Gonzalez, A and Garcia, V and Carral, JM and Saez-Royuela, M}, ' ... 
'year = {2010}, ' ...
'title = {Stocking density for the intensive rearing of juvenile crayfish, \textit{Pacifastacus leniusculus} ({A}stacidae), using {A}rtemia nauplii to supplement a dry diet from the onset of exogenous feeding}, ' ...
'journal = {Aquaculture International}, ' ...
'volume = {18 (3)}, ' ...
'doi = {10.1007/s10499-009-9250-x}, ' ...
'pages = {371--378}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HudiLuci2011'; type = 'Article'; bib = [ ... 
'author = {S. Hudina and A. Lucic and K. Zganec and S. Jankovic}, ' ... 
'year = {2011}, ' ...
'title = {Characteristics and movement patterns of a recently established invasive \textit{Pacifastacus leniusculus} population in the river {M}ura, {C}roatia}, ' ...
'journal = {Knowledge and Management of Aquatic Ecosystems}, ' ...
'volume = {403}, ' ...
'doi = {10.1051/kmae/2011068}, ' ...
'pages = {07, 14pp}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hold2002'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Holdich, David Malcolm and others}, ' ...
'year = {2002}, ' ...
'editor = {David M Holdich }, '...
'title  = {Biology of freshwater crayfish}, ' ...
'isbn = {978-0-632-05431-2}, '...
'publisher = {Blackwell Science Oxford}, ' ...
'pages = {720 Pages}, ' ...
'howpublished = {\url{https://www.wiley.com/en-us/Biology+of+Freshwater+Crayfish-p-9780632054312}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KoesSoes2011'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Koese, B. and Soes. M.}, ' ...
'year = {2011}, ' ...
'title  = {De {N}ederlandse rivierkreeften ({A}stacoidea \& {P}arastacoidea)}, ' ...
'series = {Entomologische tabellen}, ' ...
'publisher = {Ned. Entomol. Vereniging}, ' ...
'volume = {6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KozaBuri2009'; type = 'Article'; bib = [ ... 
'author = {Kozak, P. and Buric, M. and Kanta, J. and Kouba, A. and Hamr, P. and Policar, T. and others}, ' ... 
'year = {2009}, ' ...
'title = {The effect of water temperature on the number of moults and growth of juvenile signal crayfish \textit{Pacifastacus leniusculus} {D}ana}, ' ...
'journal = {Czech Journal of Animal Science}, ' ...
'volume = {54 (6)}, ' ...
'doi = {10.17221/1727-CJAS}, ' ...
'pages = {286--292}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mart2011'; type = 'mastersthesis'; bib = [ ... 
'author = {Johan Martinsson}, ' ...
'year = {2011}, ' ...
'title  = {Size dependent fecundity in the signal crayfish and its importance for a sustainable fishery}, ' ...
'school  = {Lund Univeristy, Sweden}, ' ...
'month  = {January}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McLaBrin2016'; type = 'Incollection'; bib = [ ... 
'author = {McLay, C and van den Brink, A}, ' ...
'year = {2016}, ' ...
'title  = {Crayfish growth and reproduction}, ' ...
'booktitle  = {Biology and ecology of crayfish}, ' ...
'editor  = {Matt Longshaw and Paul Stebbing}, ' ...
'publisher = {CRC Press Boca Raton, FL}, ' ...
'pages = {62--116 (375 pp)}, ' ...
'isbn = {9781498767323}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PawlKorz2010'; type = 'Article'; bib = [ ... 
'author = {Pawlos, Dorota and Korzelecka-Orkisz, Agata and Formicki, Krzysztof and Winnicki, Aleksander}, ' ... 
'year = {2010}, ' ...
'title = {Hatching process in the signal crayfish, \textit{Pacifastacus leniusculus} ({D}ana, 1852)({D}ecapoda, {A}stacidae)}, ' ...
'journal = {Crustaceana}, ' ...
'volume = {83 (10)}, ' ...
'doi = {10.1163/001121610X526997}, ' ...
'howpublished = {\url{https://www.jstor.org/stable/41038628 }}, '...
'pages = {1167--1180}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RodrGarc2006'; type = 'Article'; bib = [ ...
'author = {Rodriguez-Gonzalez, Hervey and Garcia-Ulloa, Manuel and Hernandez-Llamas, Alfredo and Villarreal, Humberto}, ' ...
'year = {2006}, ' ...
'title = {Effect of dietary protein level on spawning and egg quality of redclaw crayfish \textit{Cherax quadricarinatus}},' ...
'journal = {Aquaculture}, ' ...
'volume = {257}, ' ...
'pages = {412--419}, ' ...
'doi = {10.1016/j.aquaculture.2006.01.020}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SoutHold2006'; type = 'Book'; bib = [ ...  
'author = {Souty-Grosset, C. and Holdich, D. M. and No\"{e}l, P. Y. and Reynolds, J. D. and Haffner, P.}, ' ...
'year = {2006}, ' ...
'title  = {Atlas of crayfish in Europe}, ' ...
'series = {Entomologische tabellen}, ' ...
'publisher = {Publications Scientifiques du MNHN}, ' ...
'address = {Paris}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WestSavo2002'; type = 'Article'; bib = [ ...
'author = {Westman, Kai and Savolainen, Riitta}, ' ...
'year = {2002}, ' ...
'title = {Growth of the signal cray-fish, \textit{Pacifastacus leniusculus}, in a small forest lake in {F}inland},' ...
'journal = {Boreal environment research}, ' ...
'volume = {257}, ' ...
'pages = {53--62}, ' ...
'issn = {1239-6095}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
