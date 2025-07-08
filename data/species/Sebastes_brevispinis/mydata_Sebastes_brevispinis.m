function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_brevispinis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_brevispinis'; 
metaData.species_en = 'Silvergray rockfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNE','MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 24];

%% set data
% zero-variate data

data.am = 82*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(5.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 46;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 71;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 1234;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01047*Lp^3.05, see F1';
data.Wwi = 4.6e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01047*Li^3.05, see F1';

data.Ri  = 1.9e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(5.8);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
7.192	38.867
8.001	40.868
11.136	50.202
12.137	45.559
13.246	46.456
14.056	49.565
15.163	48.689
16.876	49.370
17.988	51.817
21.013	54.283
22.830	57.623
24.127	48.774
26.151	55.218
27.054	53.011
28.069	58.337
29.078	59.676
30.986	55.928
31.996	57.931
33.304	57.058
35.114	54.417
35.926	58.855
36.831	58.199
37.947	63.526
38.944	56.447
40.969	63.776
41.583	70.649
43.291	67.785
44.190	62.256
45.003	67.359
46.107	64.932
47.008	60.732
48.210	56.092
48.932	68.282
50.138	66.521
51.142	64.316
52.152	65.876
53.062	68.764
53.971	70.323
54.973	67.010
55.984	69.235
57.074	56.619
59.103	67.271
60.312	67.504
62.935	69.966
65.045	66.441];
data.tL_f(:,1) = 365*(0.3+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f   = C2K(5.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MaleHans2007';  comment.tL_f = 'females from Gulf of Alaska';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
6.987	36.428
7.795	37.986
9.008	41.321
10.216	40.889
10.929	46.212
12.236	44.674
13.144	45.347
14.052	46.907
15.162	48.246
15.971	50.026
17.682	49.156
18.388	50.049
19.093	49.834
20.204	52.281
21.209	50.962
22.620	51.418
23.227	52.975
24.032	52.539
25.142	54.100
26.146	51.895
26.856	55.224
27.962	54.349
28.966	51.478
29.880	57.247
30.781	53.268
32.091	53.945
33.005	58.827
33.907	55.513
35.212	52.645
35.821	55.974
37.028	54.656
40.158	60.446
41.874	62.899
42.875	58.699
45.190	57.614
46.297	57.181
47.105	58.296
48.217	61.187
49.827	60.316
52.041	59.229
53.960	62.349
54.966	61.472
55.967	57.494
57.387	64.153
57.986	60.836
60.104	63.072
63.125	61.993
65.942	60.026
66.957	65.352];
data.tL_m(:,1) = 365*(0.3+data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m   = C2K(5.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MaleHans2007'; comment.tL_m = 'males from Gulf of Alaska';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
%weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01047*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7L6'; % Cat of Life
metaData.links.id_ITIS = '166711'; % ITIS
metaData.links.id_EoL = '46568124'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_brevispinis'; % ADW
metaData.links.id_Taxo = '187256'; % Taxonomicon
metaData.links.id_WoRMS = '274778'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-brevispinis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes}}';
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
bibkey = 'MaleHans2007'; type = 'techreport'; bib = [ ... 
'author = {Malecha, P.W. and D. H. Hanselman and J. Heifetz},' ...
'year = {2007}, ' ...
'title = {Growth and mortality of rockfish ({S}corpaenidae) from {A}laska waters}, ' ...
'institution = {NOAA}, ' ...
'volume = {Tech. Memo. NMFS F/AFSC-172}, ' ...
'pages = {1-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-brevispinis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
