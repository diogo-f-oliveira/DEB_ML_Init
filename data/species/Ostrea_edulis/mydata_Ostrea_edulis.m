function [data, auxData, metaData, txtData, weights] = mydata_Ostrea_edulis 

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Ostreoida'; 
metaData.family     = 'Ostreidae';
metaData.species    = 'Ostrea_edulis'; 
metaData.species_en = 'European flat oyster'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW','MAm', 'MAn'};
metaData.ecoCode.habitat = {'jiMcb', 'jiMr', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Hsb'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K. body temp
metaData.data_0     = {'am'; 'Lb'; 'Ls'; 'Lm'; 'Ww0'; 'Wws'; 'Wwp'};
metaData.data_1     = {'t-L_f', 't-Wd', 'L-N', 'Wd-JO_T', 'Wd-CR_T'}; 

metaData.COMPLETE = 3.5; % using criteria of LikaKear2011

metaData.author   = {'Bram Elbers'};                             
metaData.date_subm = [2013 08 20];                           
metaData.email    = {'Bram.Elbers@gmail.com'};                 
metaData.address  = {'VU University amsterdam. 1081 HV. The Netherlands'};     

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2013 12 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Brecht Stechele'};    
metaData.date_mod_2     = [2020 03 25];              
metaData.email_mod_2    = {'brecht.stechele@ugent.be'};            
metaData.address_mod_2  = {'Ghent University, Coupure Links 653, 9000 Gent, Belgium'};  

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 03 26]; 

%% set data
% zero-variate data
data.am = 12777;    units.am = 'd';    label.am = 'life span';                           bibkey.am = 'Saur2003'; 
    temp.am = C2K(12.4);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.0150;      units.Lb  = 'cm';   label.Lb  = 'length at birth';               bibkey.Lb  = 'Buro1985';
data.Lr = 0.0183;       units.Lr  = 'cm';   label.Lr  = 'length at release';             bibkey.Lr  = 'Robe2017';  
data.Ls = 0.0300;       units.Ls = 'cm';    label.Ls = 'length at eyespot';              bibkey.Ls  = 'Rodr2019';   
data.Li = 23;           units.Li = 'cm';    label.Li = 'maximul length';                 bibkey.Li  = 'Cole1941';

data.Ww0 = 1.44e-6;      units.Ww0  = 'g';   label.Ww0  = 'initial wet weight';          bibkey.Ww0 = 'Bayn2017'; 
  comment.Ww0 = 'based on egg diameter of 0.014 cm: pi/6*0.014^3;';
data.Wdr = 1.7e-7;      units.Wdr  = 'g';   label.Wdr  = 'dry weight at release';            bibkey.Wdr = 'Laba1999'; 
data.Wwp = 1.062;       units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';         bibkey.Wwp = 'Elbe2013';  

% uni-variate data 

% LARVAL GROWTH 
% tL data at 15 C
data.tL_Robe_15 = [1	2	4	6	8	10	11	12	13	15;
    0.018325	0.019178	0.020131	0.020834	0.022988	0.023991	0.024617	0.024594	0.02482	0.024898]';
units.tL_Robe_15 = {'d', 'cm'}; label.tL_Robe_15 = {'time since release', 'length'};  
temp.tL_Robe_15    = C2K(15);  units.temp.tL_Robe_15 = 'K'; label.temp.tL_Robe_15 = 'temperature';
bibkey.tL_Robe_15 = 'Robe2017';
% tL data at 20 C
data.tL_Robe_20 = [ 1	2	4	6	7	8	9	10; 
    0.018325	0.020353	0.023131	0.024809	0.026261	0.026713	0.027964	0.028316]';
units.tL_Robe_20 = {'d', 'cm'}; label.tL_Robe_20 = {'time since release', 'length'};  
temp.tL_Robe_20    = C2K(20);  units.temp.tL_Robe_20 = 'K'; label.temp.tL_Robe_20 = 'temperature';
bibkey.tL_Robe_20 = 'Robe2017';
% tL data at 25 C
data.tL_Robe_25 = [ 1	2	4	6	7	8; 
    0.018325	0.020853	0.025081	0.029509	0.031286	0.032313]';
units.tL_Robe_25 = {'d', 'cm'}; label.tL_Robe_25 = {'time since release', 'length'};  
temp.tL_Robe_25    = C2K(25);  units.temp.tL_Robe_25 = 'K'; label.temp.tL_Robe_25 = 'temperature';
bibkey.tL_Robe_25 = 'Robe2017';
% tL data at 30 C
data.tL_Robe_30 = [ 1	2	4	6	7	8; 
    0.018325	0.021228	0.026581	0.029983	0.031684	0.032763]';
units.tL_Robe_30 = {'d', 'cm'}; label.tL_Robe_30 = {'time since release', 'length'};  
temp.tL_Robe_30    = C2K(30);  units.temp.tL_Robe_30 = 'K'; label.temp.tL_Robe_30 = 'temperature';
bibkey.tL_Robe_30 = 'Robe2017';
% tWd data at 16 C
data.tWd_Laba = [0.01 7 11; 1.7e-7 5.7e-7 1.15e-6]'; 
units.tWd_Laba   = {'d', 'g'};  label.tWd_Laba = {'time since release', 'tissue dry weight'};  
temp.tWd_Laba   = C2K(16);  units.temp.tWd_Laba = 'K'; label.temp.tWd_Laba = 'temperature';
bibkey.tWd_Laba = 'Laba1999';


% POST-LARVAL GROWTH
% tL data
data.tL_spat = [1 5 12 26; 0.0303 0.0575 0.1090 0.2730]';
units.tL_spat = {'d', 'cm'}; label.tL_spat = {'time since settlement', 'length'};  
temp.tL_spat    = C2K(19);  units.temp.tL_spat = 'K'; label.temp.tL_spat = 'temperature';
bibkey.tL_spat = 'Holl1973';
% tWd data
data.tWd_spat = [1 3 6 10; 2.26e-6 2.04e-6 4.65e-6 8.09e-6]'; 
units.tWd_spat   = {'d', 'g'};  label.tWd_spat = {'time since settlement', 'tissue dry weight'};  
temp.tWd_spat   = C2K(16);  units.temp.tWd_spat = 'K'; label.temp.tWd_spat = 'temperature';
bibkey.tWd_spat = 'Laba1999';


% ADULT GROWTH
% tL data
data.tL_Saur = [1	366	731	1096	1461	1826	2191	2556	2921	3286	3651	4016	4381	5111	5476	5841	6206	6571	7301	7666;
   5.77	6.65	8.02	7.84	8.14	8.77	9.14	9.38	9.46	10.29	10.01	9.63	10.47	11.09	10.81	11.26	11.49	11.5	11.6	12.19]';
units.tL_Saur = {'d', 'cm'}; label.tL_Saur = {'time since start experiment', 'length'};  
temp.tL_Saur    = C2K(12.4);  units.temp.tL_Saur = 'K';  label.temp.tL_Saur = 'temperature';
bibkey.tL_Saur = 'Saur2003';
% tWd data
data.tWd_Mann = [1	21	35	49	63	77	91	105	119	133; 
    95	211	325	447	479	456	375	591	838	756]'; 
data.tWd_Mann(:,2) = data.tWd_Mann(:,2)./1000;    %mg to g
units.tWd_Mann = {'d', 'g'};  label.tWd_Mann = {'time since start experiment', 'tissue dry weight'};
temp.tWd_Mann = C2K(21);  units.temp.tWd_Mann = 'K'; label.temp.tWd_Mann = 'temperature';
bibkey.tWd_Mann = 'Mann1975';
spawn.tWd_Mann = 65.1; units.spawn.tWd_Mann = 'd'; label.spawn.tWd_Mann = 'day of spawning';
% tL and tWd data at varying temp and transition juv -> adult
data.tL_Wils = [1	36	58	91	123	172	281	335	382	464	528; 
    1.03	2.04	2.91	3.49	4	3.74	3.75	3.91	4.87	6.18	6.38]';
units.tL_Wils = {'d', 'cm'};  label.tL_Wils = {'time since start experiment', 'length'};
bibkey.tL_Wils = {'Wils1987'};
temp.tL_Wils = [1 40 56	91	158	195	293	321	343	355	376	386	405	422	443	450	458	504	528; 
        10.01 16.47 16.52 15.94 11.14 8.83 8.65 12.02	11.02	12.45	12.72	13.37	15.81	15.91	16.77	16.13	9.9	8.61	7.82]'; % Temperature data (C)
temp.tL_Wils(:,2) = C2K(temp.tL_Wils(:,2)); units.temp.tL_Wils = {'d','K'}; label.temp.tL_Wils = 'temperature';
% 
data.tWd_Wils = [1	36	58	91	123	172	281	335	382	464	528; 
    0.01	0.02	0.02	0.04	0.06	0.05	0.05	0.1	0.21	0.28	0.64]';
units.tWd_Wils = {'d', 'g'};  label.tWd_Wils = {'time since start experiment', 'tissue dry weight'};
bibkey.tWd_Wils = {'Wils1987'};
temp.tWd_Wils = temp.tL_Wils; units.temp.tWd_Wils = {'d','K'}; label.temp.tWd_Wils = 'temperature';

% OTHER DATA
% LN data
data.LN = [4.1 4.5	4.7	5 5.1 5.3	5.5	5.51 5.7 5.75 6.01 6.02 6.03 6.04 6.05 6.2 6.21	6.3	6.35 6.4 6.41 6.5 6.51	6.52 6.53 6.54 6.7 7.0 7.01;
    84400	108800	14900	257800	440000	161300	416300	482800	216200	944200	374600	349400	562800	571600	353100	601600	275900	519800	1172800	492200	1239100	496100	693700	1393300	1189400	559100	544000	555400	181800]'; % length vs # of eggs
units.LN = {'cm', '#'};  label.LN = {'shell length', 'fecundity'};
temp.LN = C2K(12);  units.temp.LN = 'K';  label.temp.LN = 'temperature';
bibkey.LN = 'Cole1941';
  
% Wd-JO and Wd-clearance rate data
%Wd     | oxygen consumption (mg O_2/h)         | clearance rate (L/h)
%Wd     |10      15      20      25      30     |10      15      20      25      30
Haur = [...
0.1     0.05	0.08	0.13	0.21	0.32	0.10	0.15	0.24	0.41	0.73
0.2     0.08	0.14	0.23	0.35	0.53	0.15	0.23	0.37	0.63	1.12
0.3     0.11	0.19	0.31	0.47	0.72	0.19	0.29	0.48	0.82	1.44
0.4     0.14	0.24	0.38	0.59	0.89	0.23	0.35	0.57	0.98	1.73
0.5     0.16	0.28	0.45	0.69	1.05	0.27	0.40	0.65	1.12	1.98
0.6     0.19	0.32	0.51	0.79	1.20	0.30	0.45	0.73	1.26	2.22
0.7     0.21	0.36	0.57	0.89	1.35	0.33	0.50	0.81	1.38	2.45
0.8     0.23	0.40	0.63	0.98	1.49	0.36	0.54	0.88	1.50	2.66
0.9     0.26	0.43	0.69	1.07	1.63	0.38	0.58	0.94	1.62	2.86
1       0.28	0.47	0.75	1.16	1.76	0.41	0.62	1.01	1.72	3.05
1.1     0.30	0.50	0.80	1.24	1.89	0.43	0.66	1.07	1.83	3.24
1.2     0.32	0.54	0.86	1.33	2.02	0.46	0.69	1.13	1.93	3.42
1.3     0.34	0.57	0.91	1.41	2.14	0.48	0.73	1.18	2.03	3.60
1.4     0.35	0.60	0.96	1.49	2.26	0.50	0.76	1.24	2.13	3.77
1.5     0.37	0.63	1.01	1.57	2.38	0.53	0.80	1.30	2.22	3.93
1.6     0.39	0.66	1.06	1.65	2.50	0.55	0.83	1.35	2.31	4.09
1.7     0.41	0.69	1.11	1.72	2.61	0.57	0.86	1.40	2.40	4.25
1.8     0.43	0.73	1.16	1.80	2.73	0.59	0.89	1.45	2.49	4.40
1.9     0.45	0.75	1.21	1.87	2.84	0.61	0.92	1.50	2.57	4.55
2       0.46	0.78	1.25	1.94	2.95	0.63	0.95	1.55	2.65	4.70
2.1     0.48	0.81	1.30	2.01	3.06	0.65	0.98	1.60	2.74	4.85
2.2     0.50	0.84	1.35	2.09	3.17	0.67	1.01	1.64	2.82	4.99
2.3     0.51	0.87	1.39	2.16	3.27	0.69	1.04	1.69	2.90	5.13
2.4     0.53	0.90	1.44	2.23	3.38	0.70	1.07	1.73	2.97	5.26
2.5     0.55	0.93	1.48	2.29	3.48	0.72	1.09	1.78	3.05	5.40
2.6     0.56	0.95	1.53	2.36	3.59	0.74	1.12	1.82	3.12	5.53
2.7     0.58	0.98	1.57	2.43	3.69	0.76	1.15	1.87	3.20	5.66
2.8     0.59	1.01	1.61	2.50	3.79	0.78	1.17	1.91	3.27	5.79
2.9     0.61	1.03	1.65	2.56	3.89	0.79	1.20	1.95	3.34	5.92
3       0.63	1.06	1.70	2.63	3.99	0.81	1.22	1.99	3.42	6.05];
%
data.WdJO_10 = Haur(:,[1 2]);
units.WdJO_10 = {'g', 'mg/h'};  label.WdJO_10 = {'tissue dry weight', 'O_2 consumption', '10 C'};
temp.WdJO_10 = C2K(10);  units.temp.WdJO_10 = 'K'; label.temp.WdJO_10 = 'temperature';
bibkey.WdJO_10 = 'Haur1998';
%
data.WdJO_15 = Haur(:,[1 3]);
units.WdJO_15 = {'g', 'mg/h'};  label.WdJO_15 = {'tissue dry weight', 'O_2 consumption', '15 C'};
temp.WdJO_15 = C2K(15);  units.temp.WdJO_15 = 'K'; label.temp.WdJO_15 = 'temperature';
bibkey.WdJO_15 = 'Haur1998';
%
data.WdJO_20 = Haur(:,[1 4]);
units.WdJO_20 = {'g', 'mg/h'};  label.WdJO_20 = {'tissue dry weight', 'O_2 consumption', '20 C'};
temp.WdJO_20 = C2K(20);  units.temp.WdJO_20 = 'K'; label.temp.WdJO_20 = 'temperature';
bibkey.WdJO_20 = 'Haur1998';
%
data.WdJO_25 = Haur(:,[1 5]);
units.WdJO_25 = {'g', 'mg/h'};  label.WdJO_25 = {'tissue dry weight', 'O_2 consumption', '25 C'};
temp.WdJO_25 = C2K(25);  units.temp.WdJO_25 = 'K'; label.temp.Wd_JO_25 = 'temperature';
bibkey.WdJO_25 = 'Haur1998';
%
data.WdJO_30 = Haur(:,[1 6]);
units.WdJO_30 = {'g', 'mg/h'}; label.WdJO_30 = {'tissue dry weight', 'O_2 consumption', '30 C'};
temp.WdJO_30 = C2K(30);  units.temp.WdJO_30 = 'K'; label.temp.WdJO_30 = 'temperature';
bibkey.WdJO_30 = 'Haur1998';
%
data.WdCR_10 = Haur(:,[1 7]);
units.WdCR_10 = {'g', 'L/h'};  label.WdCR_10 = {'tissue dry weight', 'clearance rate' '10 C'};
temp.WdCR_10 = C2K(10);  units.temp.WdCR_10 = 'K'; label.temp.WdCR_10 = 'temperature';
bibkey.WdCR_10 = 'Haur1998';
%
data.WdCR_15 = Haur(:,[1 8]);
units.WdCR_15 = {'g', 'L/h'}; label.WdCR_15 = {'tissue dry weight', 'clearance rate', '15 C'};
temp.WdCR_15 = C2K(15);  units.temp.WdCR_15 = 'K'; label.temp.WdCR_15 = 'temperature';
bibkey.WdCR_15 = 'Haur1998';
%
data.WdCR_20 = Haur(:,[1 9]);
units.WdCR_20 = {'g', 'L/h'};  label.WdCR_20 = {'tissue dry weight', 'clearance rate', '20 C'};
temp.WdCR_20 = C2K(20);  units.temp.WdCR_20 = 'K'; label.temp.WdCR_20 = 'temperature';
bibkey.WdCR_20 = 'Haur1998';
%
data.WdCR_25 = Haur(:,[1 10]);
units.WdCR_25 = {'g', 'L/h'};  label.WdCR_25 = {'tissue dry weight', 'clearance rate', '25 C'};
temp.WdCR_25 = C2K(25);  units.temp.WdCR_25 = 'K'; label.temp.WdCR_25 = 'temperature';
bibkey.WdCR_25 = 'Haur1998';
%
data.WdCR_30 = Haur(:,[1 11]);
units.WdCR_30 = {'g', 'L/h'};  label.WdCR_30 = {'tissue dry weight', 'clearance rate', '30 C'};
temp.WdCR_30 = C2K(30);  units.temp.WdCR_30 = 'K'; label.temp.WdCR_30 = 'temperature';
bibkey.WdCR_30 = 'Haur1998';

% Hutch 1992
data.POMCR = [...
0       1
0.29	0.7612
1.98	0.487
2.89	0.322
3.62	0.180
4.12	0.111
4.79	0.056
5.4     0.031
6.03	0.011
6.78	0.009];
units.POMCR = {'mg/L', '-'}; label.POMCR = {'POM', 'clearance rate/max clearance rate'};
temp.POMCR = C2K(20); units.temp.POMCR = 'K'; label.temp.POMCR ='temperature';
bibkey.POMCR = 'Hutc1992';


%% set weights for all real data
 weights = setweights(data, []);  
 
%% set pseudodata and respective weights
 [data, units, label, weights] = addpseudodata(data, units, label, weights);
 weights.psd.k_J = 0; weights.psd.k = 0.1;
 data.psd.k = 0.6; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio';  

%% pack auxData and txtData for output
 auxData.temp = temp;
 auxData.spawn = spawn;
 txtData.units = units;
 txtData.label = label;
 txtData.bibkey = bibkey;
 txtData.comment = comment;

%% Group plots
 set1 = {'tL_Robe_30','tL_Robe_25','tL_Robe_20','tL_Robe_15'}; subtitle1 = {' post settlement length at 30, 25, 20, 15 C'};
 set2 = {'WdJO_30', 'WdJO_25', 'WdJO_20', 'WdJO_15', 'WdJO_10'}; subtitle2 = {'O_2 consump at 30, 25, 20, 15, 10 C'};
 set3 = {'WdCR_30', 'WdCR_25', 'WdCR_20', 'WdCR_15', 'WdCR_10'}; subtitle3 = {'Clearance rate at 30, 25, 20, 15, 10 C'};  
 metaData.grp.sets = {set1, set2, set3}; 
 metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3}; 

%% Discussion points
 D1 = 'mod_2: larval release 6 to 8 d after hatch and feed within mothers  mantle cavity: https://doi.org/10.2307/1542477, https://doi.org/10.2307/1542477';
 D2 = 'mod_2: settlement is 7 d after release: https://doi.org/10.1007/BF02114680';     
 D3 = 'mod_2: model asj is used, instead of  abj'; 
 D4 = 'mod_2: max length and max age are much longer: https://doi.org/10.1007/BF02114680';
 D5 = 'mod_2: Wwi = 4.98 g is referred to https://doi.org/10.1006/jmsc.1993.1052, but this data is not mentioned in the reference';
 D6 = 'mod_2: Ri is at 9 cm, not at Li';
 D7 = 'mod_2: culture conditions of tL data are not given';
 metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4, 'D5', D5, 'D6', D6, 'D7', D7);

%% Links
metaData.links.id_CoL = '75CW4'; % Cat of Life
metaData.links.id_ITIS = '79885'; % ITIS
metaData.links.id_EoL = '46467141'; % Ency of Life
metaData.links.id_Wiki = 'Ostrea_edulis'; % Wikipedia
metaData.links.id_ADW = 'Ostrea_edulis'; % ADW
metaData.links.id_Taxo = '39291'; % Taxonomicon
metaData.links.id_WoRMS = '140658'; % WoRMS
metaData.links.id_molluscabase = '140658'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ostrea_edulis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman. S. A. L. M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press. Cambridge}, ' ...
'pages = {Table 4.2 (page 150). 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Holl1973'; type = 'article'; bib = [ ... 
'author = {Holland, D. L. and B. E. Spencer}, ' ...
'year = {1973}, ' ...
'title  = {Biochemical changes in fed and starved oysters \emph{Ostrea edulis} {L}. during development, metamorphosis and early spat growth}, ' ...
'journal = {Journal of Marine Biology Ass. U.K.}, ' ...
'volume = {53}, ' ...
'pages = {287--298}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Saur2003'; type = 'techreport'; bib = [ ... 
'author = {Saurel, C. and C. A. Richardson}, ' ...
'year = {2003}, ' ...
'title  = {Age and growth analysis of native oyster bed \emph{Ostrea edulis} in {W}ales}, ' ...
'institution = {CCW Contract Science Report}, ' ...
'volume = {549}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cole1941'; type = 'article'; bib = [ ... 
'author = {Cole, H. A.}, ' ...
'year = {1941}, ' ...
'title  = {The fecundity of \emph{Ostrea edulis}}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...o
'volume = {25}, ' ...
'doi = {10.1017/S0025315400054710}, '...
'pages = {243--260}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Robe2017'; type = 'article'; bib = [ ... 
'author = {Robert, R. and J. Vignier and B. Petton}, ' ...
'year = {2017}, ' ...
'title  = {Influence of feeding regime and temperature on development and settlement of oyster \emph{Ostrea edulis}  ({L}innaeus. 1758) larvae}, '...
'journal = {Aquaculture Research}, ' ...
'volume = {1}, ' ...
'dio = {10.1111/are.13297},' ...
'pages = {1-18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Laba1999';type = 'Article'; bib = [ ... 
'author = {Labarta, U.}, ' ... 
'year = {1999}, ' ...
'title = {Energy. biochemical substrates and growth in the larval development. metamorphosis and postlarvae of \emph{Ostrea edulis}}, ' ...
'journal = {Journal of Experimental Marine Bioogy and Ecology}, ' ...
'volume = {238}, ' ...
'number = {2}, '...
'doi = {10.1016/S0022-0981(98)00171-3}, '...
'pages = {225-242}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mann1975';type = 'Article'; bib = [ ... 
'author = {Mann, P. R.}, ' ... 
'year = {1975}, ' ...
'title = {Growth and biochemical composition in \emph{Ostrea edulis} and \emph{Crassostrea gigas}}, ' ...
'journal = {Nineth European Marine Biology Symposium; Aberden University press}, ' ...
'doi = {10.1017/S0025315400046208}, '...
'pages = {587-607}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Buro1985';type = 'Article'; bib = [ ... 
'author = {Buroker, N. E.}, ' ... 
'year = {1985}, ' ...
'title = {Evolutionary patterns in the family {O}streidae: Larviparity vs. oviparity}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {90}, '...;
'pages = {233-247}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haur1998'; type = 'Article'; bib = [ ... 
'author = {Haure, J. and C. Penisson and S. Bougrier and J. P. Baud}, ' ... 
'year = {1998}, ' ...
'title = {Influence of temperature on clearance and oxygen consumption rates of the flat oyster \emph{Ostrea edulis}: determination of allometric coefficients}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {169}, '...;
'pages = {211-224}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wils1987'; type = 'Article'; bib = [ ... 
'author = {Wilson, J. H.}, ' ... 
'year = {1987}, ' ...
'title = {Environmental parameters controling growth of \emph{Ostrea edulis}  and \emph{Pecten maximums} in suspended culture}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {64}, '...;
'pages = {119-131}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bayn2017'; type = 'Book'; bib = [ ... 
'author = {Bayne, B. L.}, ' ... 
'year = {2017}, ' ...
'title = {Biology of Oysters}, ' ...
'publisher = {Academic Press}, ' ...
'pages = {860}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hutc1992'; type = 'article'; bib = [ ... 
'author = {Hutchinson, S. and L. E. Hawkins}, ' ... 
'year = {1992}, ' ...
'title = {Quantification of the physiological response of the {E}uropean flat oyster, \emph{Ostrea edulis} to temperature and salinity}, ' ...
'journal = {Journal of Molluscan Studies}, ' ...
'pages = {215-226}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rodr2019'; type = 'article'; bib = [ ... 
'author = {Rodriguez-Perez, A. and J. Mark and D. H. David and H. B. Theodore and L. F. Miller and W. G. Sanderson}, ' ... 
'year = {2019}, ' ...
'title = {Conservation and restoration of a keystone species: {U}nderstanding the settlement preferences of the {E}uropean oyster \emph{Ostrea edulis}}, ' ...
'journal = {Marine pollution bulletin}, ' ...
'volume = {138},' ...
'pages = {312--321}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Elbe2013'; type = 'Misc'; bib =[...
'author = {Elbers, B.}, '...
'year = {2013}, ' ...
'note = {Own data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

