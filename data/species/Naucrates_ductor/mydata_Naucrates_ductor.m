function [data, auxData, metaData, txtData, weights] = mydata_Naucrates_ductor
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Naucrates_ductor'; 
metaData.species_en = 'Pilot fish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 30];

%% set data
% zero-variate data
data.ab = 3.2;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(20.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(20.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 40; units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'guess';
  comment.Lp = 'based on Seriola_dumerili: 109*70/190 cm';
data.Li = 70;   units.Li = 'cm'; label.Li = 'ultimate fork length';   bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi = 3.67e3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01380*Li^2.94, see F1';

data.GSI  = 0.12; units.GSI  = '-'; label.GSI  = 'gonadosomatic index';   bibkey.GSI  = 'RenoMass1998';   
  temp.GSI = C2K(20.9);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
53.000	12.391
57.750	14.604
58.250	15.201
58.750	19.895
58.750	16.139
59.750	16.735
62.500	13.829
62.500	12.634
63.000	16.389
64.000	20.144
64.000	15.961
64.250	17.668
65.000	18.435
65.250	19.459
66.500	16.214
66.750	18.774
66.750	17.323
66.750	13.994
67.750	14.846
68.500	18.601
68.750	20.394
68.750	15.016
69.500	17.746
69.500	18.002
70.000	18.941
70.750	17.232
70.750	16.208
73.000	19.107
74.000	17.569
74.750	16.715
78.500	22.173
79.500	18.757
82.500	21.741
83.750	20.629
87.000	22.332
90.250	23.950
90.250	23.096
90.250	20.791
90.500	24.974
93.750	23.689
95.500	22.064
96.000	21.295
96.000	24.539
96.250	19.417
96.500	25.734
98.000	20.951
98.250	24.024
98.750	19.840
100.000	22.144
100.750	24.447
100.750	22.655
101.000	23.850
101.250	21.459
102.500	26.408
102.500	24.957
102.500	22.226
103.250	24.273
103.250	21.627
103.500	22.395
104.500	22.735
104.750	23.588
105.000	21.198
105.250	20.771
105.750	22.733
105.750	20.172
106.000	25.891
107.250	24.353
108.250	21.535
108.500	22.644
109.750	24.777
113.250	22.382
117.250	22.120
119.250	21.264
122.250	24.162
123.250	22.112
124.000	24.416
126.500	24.412
128.250	23.642
132.000	23.636
133.500	24.573
136.750	25.167
137.500	26.275
138.000	25.592
140.000	28.235
142.750	23.451
143.000	24.987
146.500	24.641
146.750	24.128
149.250	27.198
158.000	23.430
205.750	30.109
220.500	31.113];
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'}; 
temp.tL = C2K(20.9); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RenoMora1999'; 
comment.tL = 'summer cohort';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01380*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '745Y7'; % Cat of Life
metaData.links.id_ITIS = '168742'; % ITIS
metaData.links.id_EoL = '62676306'; % Ency of Life
metaData.links.id_Wiki = 'Naucrates_ductor'; % Wikipedia
metaData.links.id_ADW = 'Naucrates_ductor'; % ADW
metaData.links.id_Taxo = '45245'; % Taxonomicon45245
metaData.links.id_WoRMS = '126811'; % WoRMS
metaData.links.id_fishbase = 'Naucrates-ductor'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Naucrates_ductor}}';  
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
bibkey = 'RenoMora1999'; type = 'article'; bib = [ ...
'author = {Olga Re\~{n}ones and B. Morales-Nin and S. Deudero}, ' ...
'year = {1999}, ' ...
'title = {Population size structure, age and growth of \emph{Naucrates ductor} in the small scale {FADs} fishery of {M}allorca {I}sland (western {M}editerranean)}, ' ... 
'journal = {Sci. Mar.}, ' ...
'volume = {63(3-4)}, ' ...
'pages = {355-366}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RenoMass1998'; type = 'article'; bib = [ ...
'author = {Olga Re\~{n}ones and Enric Massut\''{i} and Salud Deudero and Beatriz Morales-Nin}, ' ...
'year = {1998}, ' ...
'title = {BIOLOGICAL CHARACTERIZATION OF PILOTFISH (\emph{Naucrates ductor}) FROM THE {FADS} FISHERY OF THE {I}SLAND OF{M}ALLORCA (WESTERN {M}EDITERRANEAN)}, ' ... 
'journal = {Bull. Mar. Sci.}, ' ...
' volume = {63(1)}, ' ...
'pages = {249–256}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Naucrates-ductor.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
