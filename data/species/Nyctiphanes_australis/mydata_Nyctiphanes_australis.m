function [data, auxData, metaData, txtData, weights] = mydata_Nyctiphanes_australis

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca';                                          
metaData.order      = 'Euphausiacea'; 
metaData.family     = 'Euphausiidae';
metaData.species    = 'Nyctiphanes_australis'; 
metaData.species_en = 'NZ krill'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab';'ap'; 'am'; 'Lb';'Lp'; 'Li'; 'Wd0'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L_f';'L-Wd'; 'L-Ww'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Paulo F. Lagos'};    
metaData.date_subm = [2019 04 08];              
metaData.email    = {'lagpa454@student.otago.ac.nz'};            
metaData.address  = {'University of Otago'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 12]; 

%% set data
% zero-variate data

data.ab = 5;       units.ab = 'd';      label.ab = 'age at birth';                   bibkey.ab = 'Guess';   
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
   comment.ab = 'we do not know the incubation time of eggs and weight zero is given to this data.';
data.tp = 115;        units.tp = 'd';      label.tp = 'time since birth at puberty';    bibkey.tp = 'Hosi1982';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 365;        units.am = 'd';      label.am = 'life span';                      bibkey.am = 'Hosi1982';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
comment.am = 'authors says it appears unlikely that N. australis lives longer than one year';
  
data.Lb  = 0.045;     units.Lb  = 'cm';    label.Lb = 'total length at birth';          bibkey.Lb = 'Hosi1982';
data.Lp  = 1.163;     units.Lp  = 'cm';    label.Lp  = 'total length at puberty';       bibkey.Lp  = 'HaywBurn2003';
data.Li  = 2.75;      units.Li  = 'cm';    label.Li  = 'ultimate total length';         bibkey.Li  = 'RitzHose1982';
 comment.Li = 'also the largest female recorded by Hosi1982 in 1980';

data.Wd0 = 0.0086e-3;      units.Wd0 = 'g';    label.Wd0 = 'egg dry weight';            bibkey.Wd0 = 'Hosi1982';
 comment.Wd0 = 'pp 70  - quote: The average dry weights of the egg and developing nauplius for N. australis were 0.0086 and 0.0081 mg respectively. The egg weight is similar to that recorded by Nemoto et al. (1972) for Euphausia pacifica';
 
data.Wwi = 0.05;      units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'Lago2016';

data.Ni  = 1100;      units.Ni  = '#';   label.Ni  = 'life time reproductive output';           bibkey.Ni  = 'Hosi1982';   
  temp.Ni = C2K(12);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
   comment.Ni = 'The total number of eggs produced by a female in a lifetime was calculated by the authors as 1100 (Table 3.5). The authors assumed that a female produces a batch of eggs every 30 days over a season of approximately 240 days';

% uni-variate data

% time-length
data.tL_1 = [ ... % time (d),  length (mm)
3	1.007
6	1.573
14	4.048
14	4.002
23	4.943
29	5.561
39	7.258
47	7.847
55	8.262
60	8.802
85	7.829
100	9.619
];
data.tL_1(:,2) = data.tL_1(:,2)/10; % convert mm to cm
units.tL_1   = {'d','cm'};  label.tL_1 = {'time since birth', 'length', 'Thalassiosira'};  
temp.tL_1 = C2K(16);  units.temp.tL_1 = 'K'; label.temp.tL_1 = 'temperature';
bibkey.tL_1 = {'HaywBurn2003'};
comment.tL_1 = 'on diet of Thalassiosira';
%
data.tL_2 = [ ... % time (d),  length (mm)
4	0.721
25	2.983
28	2.961
38	3.819
47	4.562
54	5.050
60	5.642
73	6.500
14	2.690
85	8.310
91	8.547
99	9.114
];
data.tL_2(:,2) = data.tL_2(:,2)/10; % convert mm to cm
units.tL_2   = {'d','cm'};  label.tL_2 = {'time since birth', 'length', 'Phaeocystis'};  
temp.tL_2 = C2K(16);  units.temp.tL_2 = 'K'; label.temp.tL_2 = 'temperature';
bibkey.tL_2 = {'HaywBurn2003'};
comment.tL_2 = 'on diet of Phaeocystis';
%
data.tL_3 = [ ... % time (d),  length (mm)
5	1.232
9	1.665
10	2.377
15	2.45
25	2.75
28	2.854
38	3.693
47	4.585
55	4.943
61	5.637
74	6.124
93	7.163
95	7.279
];
data.tL_3(:,2) = data.tL_3(:,2)/10; % convert mm to cm
units.tL_3   = {'d','cm'};  label.tL_3 = {'time since birth', 'length', 'Heterocaspa'};  
temp.tL_3 = C2K(16);  units.temp.tL_3 = 'K'; label.temp.tL_3 = 'temperature';
bibkey.tL_3 = {'HaywBurn2003'};
comment.tL_3 = 'on diet of Heterocaspa';

% length- dry weight
data.LWd = [... % lenght (cm), dry weight (g)
0.4129	0.000064
0.4354	0.000047
0.45	0.000117
0.4596	0.000092
0.4971	0.000134
0.5018	0.00011
0.5018	0.000122
0.5349	0.000158
0.5776	0.000162
0.5965	0.000156
0.606	0.000179
0.669	0.000304
0.7063	0.000276
0.7249	0.000274
0.8554	0.000442
0.8728	0.000532
0.9156	0.000855
0.9775	0.00085
1.0333	0.001116
1.0715	0.001275
1.0842	0.001179
1.1478	0.001644
1.2428	0.001777
1.2487	0.001936
1.268	0.001942
1.2705	0.002703
1.3153	0.002257
1.3535	0.002326
1.398	0.002368
1.4559	0.003051
1.6141	0.003997
1.6332	0.003942
1.7161	0.004734
1.735	0.004692
1.7416	0.004664
1.826	0.006691
1.905	0.007612
1.984	0.008615
2.003	0.009702
];
units.LWd = {'cm','g'}; label.LWd = {'length','dry weight'};
temp.LWd = C2K(12); units.temp.LWd = 'K'; label.temp.LWd = 'temperature';
bibkey.LWd = 'Lago2016';
comment.LWd = 'measurements from summer 2016';
% length-wet weight
data.LWw = [
0.01532	0.01043	0.01025	0.01149	0.01343	0.01364	0.01063	0.01695	0.01209	0.01278	0.0154	0.00935	0.0191	0.01785	0.01524	0.02051	0.0171	0.01737	0.01443	0.01551	0.01857	0.0177	0.01477	0.0152	0.01766	0.01586	0.01694	0.01843	0.01317	0.01375	0.01705	0.01713	0.01723	0.01927	0.02037	0.0201	0.01751	0.01815	0.01939	0.01968	0.01896	0.02199	0.01205	0.02409	0.0258	0.01981	0.02872	0.02716	0.02047	0.03655;
14.63447	11.2182	12.30985	12.55719	12.80903	12.87113	12.90684	12.91977	13.09832	13.11312	13.14989	13.31463	13.50397	13.56371	13.56666	13.62564	13.67236	13.77719	13.80687	13.86429	13.88543	13.93272	13.99591	14.04773	14.10469	14.15596	14.1806	14.19364	14.26946	14.31545	14.43865	14.46686	14.48307	14.52374	14.60027	14.67803	14.68163	14.69251	14.73709	14.90141	14.90735	14.94663	14.98145	15.04835	15.25361	15.28364	15.87316	16.33135	17.21109	17.25719]';
data.LWw = [data.LWw(:,2), data.LWw(:,1)]; % re-order column to length mm and wet weight g
data.LWw(:,1) = data.LWw(:,1)/ 10; % mm to cm
units.LWw = {'cm','g'}; label.LWw = {'length','wet weight'};
bibkey.LWw = 'Lago2016';
comment.LWw = 'measurements from summer 2016';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.Lb = 0 * weights.Lb;
weights.Li = 0 * weights.Li;
weights.tL_1 = 3 * weights.tL_1;
weights.tL_2 = 3 * weights.tL_2;
weights.tL_3 = 3 * weights.tL_3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.kap = 3 * weights.psd.kap;
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_1','tL_2','tL_3'}; subtitle1 = {'diets: Thalassiosira, Phaeocystis, Heterocaspa'};
metaData.grp.sets = {set1}; 
metaData.grp.subtitle = {subtitle1}; 

%% Discussion points
D1 = 'Metamorphosis is assumed to not affect morphology, not metabolism';
D2 = 'Males are assumed to have the same parameters as females';     
D3 = ['weight 0 is given to age at birth, length at birth, ultimate physical length.'...
    'Age at birth is unknown and we do not have yet a good guess. '...
    'shape changes so we think a different shape coeff in the early stages would be different.'...
    'Wwi corresponds to heaviest individual measured by Lago2016, and the Li was from the literature-'...
    'as we have weight-length we prioritize a good fit for Wwi over that of Li. The Ni data is an assumption from Hosi1982, more realistic implementation of modelling original data should be implemented in a future version. The egg dry weight is an actual measurment and so is given more weight.'];
D4 = 'v, kap and p_M are given more weight to account for the paucity of information on this species life-cycle.';
D5 = 'we accept a loss of fit in the initial part of the t-L curves which we attribute to changes in shape';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4, 'D5', D5);

%% Facts
F1 = 'Production of mature ova is continuous and oviposition takes place roughly every 30 days.';
metaData.bibkey.F1 = 'Hosi1982'; 
F2 = 'Feeding starts at stage Calyptopsis I';
metaData.bibkey.F2 = 'Hosi1982'; 
F3 = 'Intermoult time is temperature dependant.';
metaData.bibkey.F3 = 'Hosi1982';   
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '6SCPT'; % Cat of Life
metaData.links.id_ITIS = '95549'; % ITIS
metaData.links.id_EoL = '509443'; % Ency of Life
metaData.links.id_Wiki = 'Nyctiphanes'; % Wikipedia
metaData.links.id_ADW = 'Nyctiphanes_australis'; % ADW
metaData.links.id_Taxo = '489569'; % Taxonomicon
metaData.links.id_WoRMS = '237863'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nyctiphanes}}';
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
bibkey = 'Lago2016'; type = 'Misc'; bib = [ ... 
'author = {Paulo F.Lagos}, ' ...
'year = {2016}, ' ...
'note  = {unpublished data}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hosi1982'; type = 'Thesis'; bib = [... %used for growth and dry weight data
'author = {Hosie, W.},'...
'year = {1982},'...
'title = {Biology and production of \emph{Nyctiphanes australis} {G}.{O}. {S}ars, in the coastal waters of {S}.{E}. {T}asmania},'...
'Publisher = {University of Tasmania},'...
'pages = {21--44},'...
'howpublished = {\url{http://eprints.utas.edu.au/20108/1/whole_HosieGrahamWilliam1983_thesis.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JameWilk1988'; type = 'Article'; bib = [ ...  %respiration and excretion rates
'author = {James, M.R. and Wilkinson, V.H.},'...
'year = {1988},'...
'title = {Biomass, carbon ingestion, and ammonia excretion by zooplankton associated with an upwelling plume in western  {C}ook {S}trait, {N}ew {Z}ealand},'...
'Journal = {NZ J Mar Freshwater Res},'...
'volume = {22},'...
'doi = {10.1080/00288330.1988.9516297 },'...
'pages = {249--257}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaywBurn2003'; type = 'Article'; bib = [... 
'author = {Haywood, G.J. and Burns, C.W.},'...
'year = {2003},'...
'title = {Growth of \emph{Nyctiphanes} ({E}uphausiacea) on different diets},'...
'Journal = {J Exp Mar Biol & Ecol},'...
'pages = {139--151},'...
'volume = {289}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ritz1990'; type = 'Article'; bib = [... 
'author = {Ritz D. A. and Hosie G. W. and Kirkwood R. J.},'...
'year = {1990}, ' ...
'title  = {Diet of \emph{Nycthipanes australis} {S}ars ({C}rustacea:{E}uphausiacea)},'...
'Journal = {Aust J Mar Freshwater Res},'...
'pages = {365--75},'...
'Volume = {41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RitzHose1982'; type = 'Article'; bib = [ ... 
'author = {Ritz D.A. and Hosie G.W. and Kirkwood R.J.}, ' ...
'year = {1982}, ' ...
'title  = {Production of the \emph{Euphausid Nyctiphanes} australis in {S}torm {B}ay, {S}outh-{E}astern {T}asmania},' ...
'Journal = {Mar Biol}, ' ...
'pages = {303--108}, ' ...
'Volume = {68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McCl1991'; type = 'Article'; bib = [ ...
'author = {McClatchie. S}, ' ...
'year = {1991}, ' ...
'title  = {Grazing rates of \emph{Nyctiphanes australis} ({E}uphausiacea) in the laboratory and {O}tago {H}arbour, {N}ew {Z}ealand, measured using three independent methods}, ' ...
'Journal = {Continental shelf research}, ' ...
'pages = {1--22}, ' ...
'volume = {1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


