  function [data, auxData, metaData, txtData, weights] = mydata_Cyprinodon_variegatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Cyprinodontidae';
metaData.species    = 'Cyprinodon_variegatus'; 
metaData.species_en = 'Sheepshead minnow'; 

metaData.ecoCode.climate = {'Aw', 'Cfa'};
metaData.ecoCode.ecozone = {'THn', 'TN'};
metaData.ecoCode.habitat = {'0iFm', '0iMm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L_f'; 't-Ww_f'; 'L-Ww'; 't-N_f'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Roland Kuhl'; 'Benoit Goussen'};        
metaData.date_subm = [2018 12 20];                           
metaData.email    = {'roland.kuhl@ibacon.com'};                 
metaData.address  = {'ibacon GmbH'}; 

metaData.author_mod_1   = {'Bas Kooijman'};        
metaData.date_mod_1 = [2020 07 29];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU Univ. Amsterdam'}; 

metaData.curator     = {'Bas Kooijman','Starrlight Augustine'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 07 29]; 

%% set data
% zero-variate data
data.ab = 6;         units.ab = 'd';  label.ab = 'age at birth';          bibkey.ab = 'EPA2002';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Hatching happens generally 5 to 7 days after fertilisation';
data.tj = 28;  units.tj = 'd';  label.tj = 'time since birth at metamorphosis';          bibkey.tj = 'SchnDuss2017';
  temp.tj = C2K(26); units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'The larval stage lasts ca. 28 days';
data.tp = 60;        units.tp = 'd';  label.tp = 'time since birth at puberty';        bibkey.tp = 'CripHemm2009';
  temp.tp = C2K(26.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'Fost1967';
  temp.am = C2K(26.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Probably does not live beyond three years';
  
data.Lb = 0.4;      units.Lb = 'cm';     label.Lb = 'standard length at birth';  bibkey.Lb = 'EPA2002';
data.Lj = 0.97;  units.Lj = 'cm';  label.Lj = 'standard length at metamorphosis';          bibkey.Lj = 'SchnDuss2017';
  comment.Lj = 'Measurement made on the representative juvenile of 28 dph. Figure 1b in Schnitzler et al. 2017';
data.Lp = 2.7;     units.Lp = 'cm';     label.Lp = 'standard length at puberty'; bibkey.Lp = 'CripHemm2009'; 
data.Li = 7.5;     units.Li = 'cm';     label.Li = 'ultimate standard length';  bibkey.Li = 'PageBurr1991';

data.Wwb = 1.2e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'JordEver1896';   
comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';

data.Ri = 800/365;       units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'guess';   
  temp.Ri = C2K(26.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Bas Kooijman: based on other Cyprinodon species in AmP';
  
% uni-variate data
% time-length
data.tLs1 = [... % time (d), standard length (cm)
35  1.3
94  2.9
189 3.6];
units.tLs1  = {'d', 'cm'};  label.tLs1 = {'time since birth', 'standard length'};  
L0.tLs1 = 1.3; units.L0.tLs1  = {'cm'};  label.L0.tLs1 = 'initial standard length'; 
temp.tLs1   = C2K(30);  units.temp.tLs1 = 'K'; label.temp.tLs1 = 'temperature';
bibkey.tLs1 = 'ParrDyar1978';
%
data.tLs2 = [... % time (d), standard length (cm)
34  1.2
91  2.7
151 3.1];
units.tLs2  = {'d', 'cm'};  label.tLs2 = {'time since birth', 'standard length'};  
L0.tLs2 = 1.2; units.L0.tLs2  = {'cm'};  label.L0.tLs2 = 'initial standard length'; 
temp.tLs2   = C2K(30);  units.temp.tLs2 = 'K'; label.temp.tLs2 = 'temperature';
bibkey.tLs2 = 'ParrDyar1978';
%
data.tLs3 = [... % time (d), standard length (cm)
37  1.3
94  3.0
166 3.4];
units.tLs3  = {'d', 'cm'};  label.tLs3 = {'time since birth', 'standard length'};  
L0.tLs3 = 1.3; units.L0.tLs3  = {'cm'};  label.L0.tLs3 = 'initial standard length'; 
temp.tLs3   = C2K(30);  units.temp.tLs3 = 'K'; label.temp.tLs3 = 'temperature';
bibkey.tLs3 = 'ParrDyar1978';
data.tLs4 = [... % time (d), standard length (cm)
30  1.6
50  2.3
59  2.6
80  3.0
97  3.4];
units.tLs4  = {'d', 'cm'};  label.tLs4 = {'time since birth', 'standard length'};  
L0.tLs4 = 1.6; units.L0.tLs4  = {'cm'};  label.L0.tLs4 = 'initial standard length'; 
temp.tLs4   = C2K(26.5);  units.temp.tLs4 = 'K'; label.temp.tLs4 = 'temperature';
bibkey.tLs4 = 'CripHemm2009';
comment.tLs4 = 'males and females grouped together';
% Brine shrimp food
data.tLs5 = [... % time (d), standard length (mm)
30	14.1
41	16.3
50	18.0
61	19.7
71	20.8
79	22.1];
data.tLs5(:,2) = data.tLs5(:,2) / 10; % convert mm to cm
units.tLs5  = {'d', 'cm'};  label.tLs5 = {'time since birth', 'standard length'};  
L0.tLs5 = 1.41; units.L0.tLs5  = {'cm'};  label.L0.tLs5 = 'initial standard length'; 
temp.tLs5   = C2K(26.5);  units.temp.tLs5 = 'K'; label.temp.tLs5 = 'temperature';
bibkey.tLs5 = 'CripHemm2009';

% Flake food
data.tLs6 = [... % time (d), standard length (mm)
30	16.3
41	19.1
50	21.5
61	24.4
71	26.1
79	29.0];
data.tLs6(:,2) = data.tLs6(:,2) / 10; % convert mm to cm
units.tLs6  = {'d', 'cm'};  label.tLs6 = {'time since birth', 'standard length'};  
L0.tLs6 = 1.63; units.L0.tLs6  = {'cm'};  label.L0.tLs6 = 'initial standard length'; 
temp.tLs6   = C2K(26.5);  units.temp.tLs6 = 'K'; label.temp.tLs6 = 'temperature';
bibkey.tLs6 = 'CripHemm2009';

% Combination Brine shrimp and Flake food
data.tLs7 = [... % time (d), standard length (mm)
30	16.3
41	18.4
50	21.1
61	23.2
71	24.8
79	27.3];
data.tLs7(:,2) = data.tLs7(:,2) / 10; % convert mm to cm
units.tLs7  = {'d', 'cm'};  label.tLs7 = {'time since birth', 'standard length'};  
L0.tLs7 = 1.63; units.L0.tLs7  = {'cm'};  label.L0.tLs7 = 'initial standard length'; 
temp.tLs7   = C2K(26.5);  units.temp.tLs7 = 'K'; label.temp.tLs7 = 'temperature';
bibkey.tLs7 = 'CripHemm2009';

% time - weight
data.tWw1 = [... % time (d), wet weight (g)
35  0.1
94  0.8
189 1.3];
units.tWw1  = {'d', 'g'};  label.tWw1 = {'time since birth', 'wet weight'};  
W0.tWw1 = 0.1; units.W0.tWw1  = {'g'};  label.W0.tWw1 = 'initial wet weight'; 
temp.tWw1   = C2K(30);  units.temp.tWw1 = 'K'; label.temp.tWw1 = 'temperature';
bibkey.tWw1 = 'ParrDyar1978';
%
data.tWw2 = [... % time (d), wet weight (g)
34  0.06
91  0.7
151 0.8];
units.tWw2  = {'d', 'g'};  label.tWw2 = {'time since birth', 'wet weight'};  
W0.tWw2 = 0.06; units.W0.tWw2  = {'g'};  label.W0.tWw2 = 'initial wet weight'; 
temp.tWw2   = C2K(30);  units.temp.tWw2 = 'K'; label.temp.tWw2 = 'temperature';
bibkey.tWw2 = 'ParrDyar1978';
%
data.tWw3 = [... % time (d), wet weight (g)
37  0.08
94  0.8
166 1.1];
units.tWw3  = {'d', 'g'};  label.tWw3 = {'time since birth', 'wet weight'};  
W0.tWw3 = 0.08; units.W0.tWw3  = {'g'};  label.W0.tWw3 = 'initial wet weight'; 
temp.tWw3   = C2K(30);  units.temp.tWw3 = 'K'; label.temp.tWw3 = 'temperature';
bibkey.tWw3 = 'ParrDyar1978';

% time - weight females/males
data.tWwf1 = [... % time (d), wet weight (g)
74  0.63
91  0.88
107 1.99];
units.tWwf1  = {'d', 'g'};  label.tWwf1 = {'time since birth', 'wet weight', 'female'};  
L0.tWwf1 = 2.7; units.L0.tWwf1  = {'cm'};  label.L0.tWwf1 = 'initial standard length';
W0.tWwf1 = 0.63; units.W0.tWwf1  = {'g'};  label.W0.tWwf1 = 'initial wet weight'; 
temp.tWwf1   = C2K(26.5);  units.temp.tWwf1 = 'K'; label.temp.tWwf1 = 'temperature';
bibkey.tWwf1 = 'CripHemm2009';
comment.tWwf1 = 'female';
%
data.tWwm1 = [... % time (d), wet weight (g)
74  0.74
91  1.22
107 2.19];
units.tWwm1  = {'d', 'g'};  label.tWwm1 = {'time since birth', 'wet weight', 'male'};  
L0.tWwm1 = 2.7; units.L0.tWwm1  = {'cm'};  label.L0.tWwm1 = 'initial standard length';
W0.tWwm1 = 0.74; units.W0.tWwm1  = {'g'};  label.W0.tWwm1 = 'initial wet weight'; 
temp.tWwm1   = C2K(26.5);  units.temp.tWwm1 = 'K'; label.temp.tWwm1 = 'temperature';
bibkey.tWwm1 = 'CripHemm2009';
comment.tWwm1 = 'male';

% time - cum reprod
data.tN1 = [... % time (d), eggs (#)
1	72.6
2	20.27
3	15.97
4	39.1
5	32.87
6	29.42
7	28.07
8	15.11
9	21.08
10	27.47
11	21.24
12	28.81
13	20.73
14	32.83
15	19.79
16	21.55
17	22.98
18	18.94
19	32.81
20	41.22
21	39.37];
data.tN1(:,1) = data.tN1(:,1) + 70; % Fishes were 70 days old at initiation of experiment
data.tN1(:,2) = cumsum(data.tN1(:,2))/100; % Transform in cumulative sum
units.tN1  = {'d', '#'};  label.tN1 = {'time since birth', 'cumulative number of eggs'};  
L0.tN1 = 3.1; units.L0.tN1  = {'cm'};  label.L0.tN1 = 'initial standard length of female';
W0.tN1 = 0.88; units.W0.tN1  = {'g'};  label.W0.tN1 = 'initial wet weight of female'; 
temp.tN1   = C2K(26.5);  units.temp.tN1 = 'K'; label.temp.tN1 = 'temperature';
bibkey.tN1 = 'CripHemm2009';
comment.tN1 = 'Bas Kooijman: I divided the cum number of eggs by 100';
%
data.tN2 = [... % time (d), eggs (#)
1	37.26
2	32.22
3	33.78
4	32.82
5	31.63
6	16.73
7	15.17
8	17.45
9	30.32
10	29.48
11	30.57
12	23.36
13	21.8
14	20.72
15	36.83
16	56.3
17	57.39
18	47.18
19	46.94
20	36.37
21	44.9
22	69.79
23	63.3
24	77.61
25	74.72
26	78.94
27	77.26
28	68.24
29	71.85
30	72.82
31	71.26
32	81.72
33	91.22
34	52.88
35	83.65];
data.tN2(:,1) = data.tN2(:,1) + 107; % Fishes were 107 days old at initiation of experiment
data.tN2(:,2) = cumsum(data.tN2(:,2))/100; % Transform in cumulative sum
units.tN2  = {'d', '#'};  label.tN2 = {'time since birth', 'cumulative number of eggs'};  
W0.tN2 = 1.99; units.W0.tN2  = {'g'};  label.W0.tN2 = 'initial wet weight of female'; 
temp.tN2   = C2K(26.5);  units.temp.tN2 = 'K'; label.temp.tN2 = 'temperature';
bibkey.tN2 = 'CripHemm2009';
comment.tN2 = 'Bas Kooijman: I divided the cum number of eggs by 100';

% length - weight
data.LWw = [... % standard length (mm), weight (g) 
26.13	0.91
26.21	0.65
27.25	0.97
28.2	1.06
28.33	1.16
28.69	1.07
29.13	1.36
29.64	1.22
30.62	2.26
30.46	1.35
30.93	1.35
31.18	1.33
31.71	1.51
32.09	1.67
32.43	1.79
32.66	1.66
32.65	1.5
33.16	2.02
33.13	1.81
33.52	1.57
33.73	2.09
34.25	2.14
34.17	1.74
34.54	1.81
34.62	1.87
34.69	1.96
34.65	2.06
34.54	2.07
35.03	2.14
35.33	2.17
35.3	1.91
35.42	1.93
35.42	1.79
35.55	2.08
35.82	2.26
36.7	1.7
36.32	2.38
36.5	2.54
36.64	2.49
36.79	2.25
36.97	2.06
37.29	2.06
37.2	2.2
37.52	2.21
37.24	2.45
37.41	2.57
37.42	2.74
37.26	3.97
37.76	3.19
37.79	2.99
38.53	3.17
38.46	3.01
38.41	2.74
37.59	2.73
38.09	2.75
38.16	2.69
38.13	2.63
38.4	2.53
38.24	2.36
38.84	3.02
38.99	2.48
38.89	2.81
39.25	2.58
39.62	2.29
39.2	2.77
39.44	2.74
39.4	2.67
40.02	2.59
40.53	2.39
40.08	2.66
40.11	2.71
40.07	2.77
39.66	2.85
39.77	2.84
39.97	2.92
39.98	2.99
39.58	3.31
39.89	3.28
39.95	3.22
40.44	2.69
40.9	2.63
40.83	2.74
40.94	2.76
40.85	2.81
40.38	3.18
40.63	3.1
40.95	3.12
40.99	2.97
40.71	3.42
40.61	3.67
40.85	3.76
40.16	2.98];
data.LWw(:,1) = data.LWw(:,1)/ 10; % convert mm to cm
units.LWw  = {'cm', 'g'};  label.LWw = {'standard length', 'weight'};  
bibkey.LWw = 'RoseSand2004';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 10 * weights.Li;
weights.tN1 = 0 * weights.tN1;
weights.tN2 = 0 * weights.tN2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.L0 = L0;
auxData.W0 = W0;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% grouped plots
set1 = {'tLs1', 'tLs2', 'tLs3', 'tLs4'}; subtitle1 = {'ParrDyar1978 and CripHemm2009'};
set2 = {'tLs5', 'tLs6','tLs7'}; subtitle2 = {'Data for brine shrimp, flake, mix'}; 
set3 = {'tWw1', 'tWw2', 'tWw3'}; subtitle3 = {'ParrDyar1978 and CripHemm2009'};
set4 = {'tWwf1', 'tWwm1'}; subtitle4 = {'Data for female, male'}; 
set5 = {'tN2', 'tN1'}; subtitle5 = {'Data for age 107, 70 d'}; 
metaData.grp.sets = {set1,set2,set3,set4,set5}; metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5};

%% Discussion points
D1 = 'Males and female are treated as having the same parameter values';
D2 = 'mod_1: tN data is ignored and Ri is added, the weight of the eggs would substantially exceed that of the fish';
D3 = 'mod_1: replaced egg dry weight by egg weit weight';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '33HP6'; % Cat of Life
metaData.links.id_ITIS = '165631'; % ITIS
metaData.links.id_EoL = '1157174'; % Ency of Life
metaData.links.id_Wiki = 'Cyprinodon_variegatus'; % Wikipedia
metaData.links.id_ADW = 'Cyprinodon_variegatus'; % ADW
metaData.links.id_Taxo = '44509'; % Taxonomicon
metaData.links.id_WoRMS = '159285'; % WoRMS
metaData.links.id_fishbase = 'Cyprinodon-variegatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyprinodon_variegatus}}';
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
bibkey = 'EPA2002'; type = 'Techreport'; bib = [ ...
'author = {EPA}, ' ...
'year = {2002}, ' ...
'title  = {Method 1004.0: Sheepshead Minnow, \emph{Cyprinodon variegatus}, Larval Survival and Growth Test; Chronic Toxicity}, ' ...
'institution = {EPA}, ' ...
'pages = {1--63}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'CripHemm2009'; type = 'Article'; bib = [ ...  
'author = {Cripe, G. M. and Hemmer, B. L. and Goodman, L. R.}, ' ...
'year = {2008}, ' ...
'title = {Development of a Methodology for Successful Multigeneration Life-Cycle Testing of the Estuarine Sheepshead Minnow,  \emph{Cyprinodon variegatus}}, ' ... 
'journal = {Archives of Environmental Contamination and Toxicology}, ' ...
'volume = {56}, '...
'pages = {500--508}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'PageBurr1991'; type = 'Book'; bib = [ ...    
'author = {Page, L. M. and Burr, B. M.}, ' ...
'year  = {1991}, ' ...
'title = {A Field Guide to Freshwater Fishes of North America, north of Mexico}, ' ...  
'publisher = {Houghton Mifflin Company}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JordEver1896'; type = 'Book'; bib = [ ...    
'author = {Jordan, D. S. and Evermann, B. W.}, ' ...
'year  = {1896-1900}, ' ...
'title = {The fishes of North and Middle America : a descriptive catalogue of the species of fish-like vertebrates found in the waters of {N}orth {A}merica, north of the {I}sthmus of {P}anama}, ' ...  
'publisher = {Smithsonian Institution}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%
%
bibkey = 'ParrDyar1978'; type = 'Techreport'; bib = [ ...  
'author = {Parrish, P. R. and Dyar, E. E. and Enos, J. M. and Wilson, W. G.}, ' ...
'year = {1978}, ' ...
'title = {Chronic Toxicity of Chlordane, Trifluralin, and Pentachlorphenol to Sheepshead Minnows ( \emph{Cyprinodon variegatus})}, ' ... 
'institution = {Environmental Research Laboratory, Office Of Research and Development, U.S. Environmental Protection Agency}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'RoseSand2004'; type = 'Article'; bib = [ ...  
'author = {Rosenfield, J. and Sandoval-Green, C.M.J.}, ' ...
'year = {2004}, ' ...
'title = {The Role of Hybrid Vigor in the Replacement of Pecos Pupfish by Its Hybrids with Sheepshead Minnow}, ' ... 
'journal = {Conservation Biology}, ' ...
'volume = {18.6}, '...
'pages = {1589--1598}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fost1967'; type = 'phdthesis'; bib = [ ...  
'author = {Foster, N. R.}, ' ...
'year = {1967}, ' ...
'title = {Comparative studies on the biology of killifishes ({P}isces: {C}yprinodontidae)}, ' ... 
'address = {Ithaca, N.Y.}, ' ... 
'note = {369 pp}, ' ... 
'school = {Cornell University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'SchnDuss2017'; type = 'Article'; bib = [ ...
'author = {Schnitzler, J.G. and Dussenne, M. and Fr\''{e}d\''{e}rich, B. and Das, K.}, ' ...
'year = {2017}, ' ...
'title = {Post-embryonic development of sheepshead minnow \emph{Cyprinodon variegatus}: a staging tool based on externally visible anatomical traits}, ' ...
'journal = {Ichthyological Research}, ' ...
'volume = {64}, '...
'pages = {29-36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


