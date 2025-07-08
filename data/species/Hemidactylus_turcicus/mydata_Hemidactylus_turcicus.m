function [data, auxData, metaData, txtData, weights] = mydata_Hemidactylus_turcicus 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Gekkonidae';
metaData.species    = 'Hemidactylus_turcicus'; 
metaData.species_en = 'Mediterranean house gecko'; % also: Turkish Gecko

metaData.ecoCode.climate = {'BSk', 'Csa', 'Cfa'}; 
metaData.ecoCode.ecozone = {'TP', 'TH', 'TN'};
metaData.ecoCode.habitat = {'0iT'};
metaData.ecoCode.embryo  = {'T'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};
metaData.data_1     = {'L-Ww'; 'Ww-JO_T'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011 http://www.debtheory.org/wiki/index.php?title=Completeness

metaData.author   = {'Dillon Monroe'};    
metaData.date_subm = [2021 06 09];              
metaData.email    = {'dillon.monroe.444@my.csun.edu'};            
metaData.address  = {'California State University, 18111 Nordhoff Street, Northridge, CA 91330'};   

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nmarn@irb.hr'}; 
metaData.date_acc    = [2021 06 16]; 

%% set data
% zero-variate data

data.ab = 50;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Henk1995';   
temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';

data.tp = 237;    units.tp = 'd';    label.tp = 'time since birth at puberty';           bibkey.tp = 'Punz2001';
temp.tp = C2K(22.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.am = 1460;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Paul2004';   
temp.am = C2K(20.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 4.8;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Camp2008';  

data.Lp  = 9.25;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Punz2001'; 
comment.Lp = 'estimated from SVL measurments';

data.Li  = 14;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Camp2008';

data.Wwb = 0.368;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Selcer1990';

data.Wwp = 2.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Selc1986';

data.Wwi = 5.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'DickEspi2021';
comment.Wwi ='length and weight varies by climate';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Selc1986';   
temp.Ri = C2K(22.7);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
  
% length-weight data
data.LW =  [12.48	13.2	12	13.2	12.96	14.4	13.44	12.96	12.72	12.48	13.2	13.2	12.96	13.92	13.2	12.24	12.48	12.24	11.76	13.44	13.2	13.68	13.92	13.92	13.2	10.32	12	12.24	10.8	12.96	12	12.24	12.48	12	12.48	12	12.24	12.24	10.8	12.24	11.52	10.32	12.48	10.08	11.52	11.28	9.84	9.36	10.08	12.72	12.24	11.52	12.72	11.76	11.52	12	12.24	11.04	10.8	12.48	12.24	11.76	11.28	11.76	11.04	12.72	10.8	13.44	10.32	10.32	10.8	11.04	12.96	9.6	8.88	10.32	7.92	12.96	11.04	12.96	13.2	12	12.96	12.48	11.52	9.84	13.2	12	11.28	12.24	13.2	12	13.44	12.24	11.52	12.24	10.8	12.48	12.48	12.72	11.28	13.2	13.2	11.04	12	13.2	13.68	12.96	13.68	13.2	14.16	13.2	14.16	12	13.2	14.4	11.52	9.6	12	12.48	11.52	11.52	11.76	11.04	11.28	13.2	12.48	10.8	9.84	8.4	14.4	12.96	12.48	11.76	13.2	12	12.24	11.28	12.72	14.4	12.36	12.72	12.96	12.72	13.2	12.6	12.72	12.72	12.72	11.76	11.76	12.72	12.72	12.84	11.04	12.72	11.04	11.52	11.76	10.8	11.04	11.04	12.24	11.28	11.28	12	12	11.04	13.44	13.44	11.04	11.04	12.24	13.44	13.2	13.2	13.44	12.48	12.72	11.76	13.2	13.2	12.48	13.2	12.24	12.48	12.24	11.52	12.24	12	12.48	12.24	13.44	10.56	12.72	13.2	11.76	11.76	12.24	12.96	12	12.72	12.24	13.2	12	11.04	12.96	12.96	13.2	12.24	12	9.6	12.72	11.76	13.44	10.8	11.76	11.76	12.24	12.48	11.04
3.2	3.5968	2.9642	4.652	3.924	4.041	4.2705	4.9031	4.25	3.5172	5.2887	3.8	3.6	4.1503	4.1375	3.1278	4.1	2.9169	2.4758	3.5788	4.3	3.4218	3.6874	2.5411	3.5465	1.9	2.878	2.6	3.299	3.2	3.3	2.7802	3.3	2.9298	3.2086	3.0876	3.13	3.3	2.43	3.1	2.36	2.22	3.14	2.01	2.27	2.28	1.85	1.17	2.29	3.84	3.339	2.6716	4.535	3.269	3.1516	3.4858	3.1433	2.8839	2.519	3.807	2.844	2.5794	2.9	3.2576	2.6	2.5944	1.7529	3.2	1.3922	2.3744	2.5591	1.7777	3.236	1.514	1.3108	2.2526	0.863	3.599	2.582	3.037	3.8126	3.0655	3.57	2.8692	3	2.8008	2.8786	2.77	2.63	3.12	3.64	2.95	3.72	2.95	2.69	2.74	2.17	3.3	2.37	3.47	2.23	3.39	3.33	2.33	3.12	3.1	4.0669	3.3771	4.5	3.5812	4	3.6	4.2502	3.3	3.3272	3.7237	2.6607	1.73	2.72	2.73	2.61	2.81	2.66	2.77	2.74	3.27	2.47	2.01	1.81	1.2	4	2.8788	3.2	3.1	3.1976	3.0182	3.6	2.4405	2.4056	2.978	4.3	3.7	3.6965	3.9	3.4756	3.4473	3.1092	3.1745	3.3353	2.9433	3.4739	3.9525	4.2011	3.4663	2.5926	3.0491	2.256	2.424	2.9497	2.0429	2.8637	2.4843	2.861	2.6973	2.3559	3.2496	4.078	2.4203	4.963	4.634	2.604	2.12	2.957	5.719	4.247	3.4163	3.637	3.491	2.77	2.35	3.56	2.93	3.25	4.09	2.9	2.93	3.12	2.62	3.31	3.38	3.13	3.25	4.1	1.92	3.76	4.61	2.26	3.2	2.86	3.76	2.91	3.1	3.37	3.28	3.14	2.86	3.31	3.04	2.86	3.72	2.96	2.07	3.5	2.95	4.25	2.15	3	2.55	3.18	4.52	2.21
]'; % TL (cm), wet weight (g) 
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'DickEspi2021';

% weight-respiration data
% oxygen consumption (resting metabolic rate) , temperature , wet weight
OTW =[0.00081	0.00145	0.00206	0.00176	0.00258	0.00346	0.00104	0.00224	0.00258	0.00218	0.00195	0.00128	0.00204	0.00204	0.00172	0.00257	0.00123	0.00136	0.00231	0.00326	0.00301	0.00313	0.00476	0.00422	0.00284	0.00421	0.00334	0.0027	0.00384	0.00249	0.00412	0.00354	0.00274	0.0041	0.00262	0.00392	0.00318	0.00837	0.00468	0.00564	0.00735	0.00708	0.00594	0.00818	0.00886	0.00416	0.00514	0.00759	0.00749	0.00754	0.00706	0.00604	0.00404	0.00774
10	10	10	10	10	10	10	10	10	10	10	10	10	10	10	10	10	10	20	20	20	20	20	20	20	20	20	20	20	20	20	20	20	20	20	20	30	30	30	30	30	30	30	30	30	30	30	30	30	30	30	30	30	30
1.968	2.524	2.56	2.561	2.704	2.981	3.085	3.089	3.174	3.255	3.283	3.377	3.454	3.547	3.659	3.724	3.808	3.999	1.9942	2.569	2.413	2.533	2.822	2.116	2.989	3.344	3.308	3.275	3.016	3.312	3.412	3.375	3.644	3.323	3.558	3.703	2.004	2.569	2.639	2.568	2.849	3.015	3.015	3.268	3.31	3.082	3.313	3.408	3.43	3.368	3.568	3.279	3.733	3.792
];
temp10 = find(OTW(2,:)==10); temp20 = find(OTW(2,:)==20); temp30 = find(OTW(2,:)==30);
data.WwJO_10 = [OTW(3,temp10)',OTW(1,temp10)'];
units.WwJO_10   = {'g', 'mlO2/min'};  label.WwJO_10 = {'wet weight', 'resting metabolic rate', '10 C'};  
bibkey.WwJO_10 = 'DickEspi2021'; temp.WwJO_10 = C2K(10); units.temp.WwJO_10 = 'K'; label.temp.WwJO_10 = 'temperature';

data.WwJO_20 = [OTW(3,temp20)',OTW(1,temp20)'];
units.WwJO_20   = {'g', 'mlO2/min'};  label.WwJO_20 = {'wet weight', 'resting metabolic rate', '20 C'};  
bibkey.WwJO_20 = 'DickEspi2021'; temp.WwJO_20 = C2K(20); units.temp.WwJO_20 = 'K'; label.temp.WwJO_20 = 'temperature';

data.WwJO_30 = [OTW(3,temp30)',OTW(1,temp30)'];
units.WwJO_30   = {'g', 'mlO2/min'};  label.WwJO_30 = {'wet weight', 'resting metabolic rate', '30 C'};  
bibkey.WwJO_30 = 'DickEspi2021'; temp.WwJO_30 = C2K(30); units.temp.WwJO_30 = 'K'; label.temp.WwJO_30 = 'temperature';


%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'WwJO_30', 'WwJO_20', 'WwJO_10'}; subtitle1 = {'resting metabolic rate at 30, 20 and 10 C'};      
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '3KNFX'; % Cat of Life
metaData.links.id_ITIS = '174059'; % ITIS
metaData.links.id_EoL = '456655'; % Ency of Life
metaData.links.id_Wiki = 'Hemidactylus_turcicus'; % Wikipedia
metaData.links.id_ADW = 'Hemidactylus_turcicus'; % ADW
metaData.links.id_Taxo = '48892'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Hemidactylus&species=turcicus'; % ReptileDB
metaData.links.id_AnAge = 'Hemidactylus_turcicus'; % AnAge


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Henk1995'; type = 'Book'; bib = [ ... %
'author = {Henkel, F.W. and Schmidt, W.}, ' ... 
'year = {1995}, ' ...
'title = {Geckoes: Biology, Husbandry, and Reproduction}, ' ...
'publisher = {Krieger Publishing Company}, ' ...
'note = {Malabar, FL 32950, USA}, ' ...
'ISBN = {0894649191}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Punz2001'; type = 'Article'; bib = [ ... %
'author = {Punzo, F.}, ' ... 
'year = {2001}, ' ...
'title = {The Mediterranean Gecko, \emph{Hemidactylus turcicus}: Life in an urban landscape}, ' ...
'journal = {Florida Scientist }, ' ...
'volume = {64}, ' ...
'pages = {56-66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Paul2004'; type = 'Article'; bib = [ ... %
'author = {Paulissen, M. A.; Hibbs, T. S.; and Meyer, H. A.}, ' ... 
'year = {2004}, ' ...
'title = {\textit{Hemidactylus turcicus} ({M}editerranean House Gecko). Longevity}, ' ...
'journal = {Herpetological Review}, ' ...
'volume = {35}, ' ...
'pages = {168-169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Camp2008'; type = 'Book'; bib = [ ... %
'author = {Campbell, T.S.}, ' ... 
'year = {2008}, ' ...
'title = {Amphibians and Reptiles of {G}eorgia ({M}editerranean Gecko \textit{Hemidactylus turcicus})}, ' ...
'publisher = {University of Georgia Press}, ' ...
'address = {Athens, Georgia, USA}, ' ...
'ISBN = {100820331112}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Selcer1990'; type = 'Article'; bib = [ ... %
'author = {Selcer, K.W.}, ' ... 
'year = {1990}, ' ...
'title = {Egg-size relationships in a lizard with fixed clutch size: Variation in a population of the {M}editerranean Gecko}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {46}, ' ...
'pages = {15-21}, '];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Selc1986'; type = 'Article'; bib = [ ... %
'author = {Selcer, K.W.}, ' ... 
'year = {1986}, ' ...
'title = {Life history of a successful colonizer: The {M}editerranean Gecko, \textit{Hemidactylus turcicus}, in southern {T}exas}, ' ...
'journal = {Copeia }, ' ...
'volume = {1986}, ' ...
'number = {4}, '...
'pages = {956-962}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DickEspi2021'; type = 'misc'; bib = [ ... %
'author = {Dickson, M. and Espinoza, R.E.},' ...
'year = {2021}, ' ...
'note = {Unpublished data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

