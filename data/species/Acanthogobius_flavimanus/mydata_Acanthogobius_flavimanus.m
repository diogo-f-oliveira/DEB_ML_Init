function [data, auxData, metaData, txtData, weights] = mydata_Acanthogobius_flavimanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Acanthogobius_flavimanus'; 
metaData.species_en = 'Yellowfin gobi'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMm', '0iFr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 25];

%% set data
% zero-variate data

data.ab = 28;   units.ab = 'd';   label.ab = 'age at birth'; bibkey.ab = 'Siri2008';   
  temp.ab = C2K(13);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'this is ignorned; there is probably a delay in the start of development';
data.am = 4.5*365;   units.am = 'd';   label.am = 'life span'; bibkey.am = 'fishbase';   
  temp.am = C2K(17.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'fishbase gives 27 cm, but that is unlikely given Li';
data.Li  = 30; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 0.0023; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'Siri2008';
  comment.Wwb = 'based on egg length of 5.5 mm and width 0.9 mm: pi/6*0.55*0.09^2';
data.Wwp = 24;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00692*Lp^3.01, see F1';
data.Wwi = 193;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00692*Li^3.01, see F1';

data.Ri  = 37000/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'Siri2008';   
  temp.Ri = C2K(17.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time (d), total length (cm)
0.899	4.986
30.125	7.048
60.700	8.606
91.725	11.263
122.300	14.058
152.425	14.928
183.450	16.257];
data.tL(:,1) = data.tL(:,1) + 50; % set origin at birth
units.tL  = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL   = C2K(17.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KwakHuh2009'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
1.873	0.925
2.022	0.445
2.498	0.199
2.825	1.626
2.914	0.908
3.271	1.380
3.330	3.526
3.717	0.297
3.776	0.656
4.133	1.366
4.519	0.406
5.025	1.829
5.203	1.349
5.500	1.583
5.590	1.582
5.738	2.056
5.946	1.337
6.095	2.051
6.363	1.569
6.571	1.566
6.868	1.561
6.987	2.752
7.106	3.466
7.433	3.938
7.552	3.459
7.730	3.456
8.117	4.404
8.622	3.442
8.741	6.303
8.920	6.300
9.039	3.674
9.187	4.149
9.187	7.250
9.455	5.814
9.485	6.291
9.604	7.005
9.901	8.193
9.901	7.000
9.931	15.349
10.109	7.951
10.228	6.279
10.436	8.184
10.466	10.092
10.763	8.656
10.882	10.802
10.942	7.938
11.120	11.752
11.120	9.366
11.328	10.317
11.328	7.455
11.536	12.700
11.685	10.550
11.893	11.501
11.952	13.409
12.309	13.403
12.369	11.732
12.428	14.117
12.547	18.409
12.636	15.545
12.725	14.112
13.023	11.960
13.142	16.730
13.320	14.818
13.350	20.066
13.499	17.440
13.558	15.292
13.617	5.987
13.647	20.300
13.796	16.958
13.796	22.684
13.796	13.618
13.915	15.763
13.944	18.387
14.153	20.054
14.153	13.612
14.242	17.189
14.331	22.198
14.361	26.492
14.480	23.866
14.509	18.855
14.628	21.239
14.718	24.339
14.747	28.633
14.807	24.099
14.836	15.749
14.955	27.198
15.015	25.527
15.015	15.269
15.045	29.582
15.134	23.140
15.193	21.469
15.372	34.110
15.372	20.034
15.401	16.932
15.431	34.109
15.520	25.042
15.580	30.528
15.610	28.380
15.669	26.232
15.669	35.537
15.937	28.375
15.996	40.780
16.055	45.073
16.234	31.472
16.264	29.324
16.353	41.013
16.383	30.277
16.442	21.687
16.531	41.726
16.561	27.172
16.591	44.349
16.620	32.420
16.680	43.393
16.858	45.299
16.858	30.746
16.888	34.563
17.007	49.352
17.007	38.140
17.007	29.312
17.066	39.809
17.096	47.681
17.185	43.862
17.185	36.705
17.245	41.714
17.245	33.842
17.393	52.925
17.453	50.299
17.602	37.892
17.661	54.113
17.721	41.230
17.810	61.984
17.869	39.796
18.226	41.460
18.256	53.149
18.345	47.661
18.642	55.290
18.791	52.187
18.880	66.738
19.237	53.372
19.386	61.959
19.415	44.304
19.683	60.761
19.713	58.852
19.802	56.226
19.950	66.960
20.010	55.984
20.129	62.185
20.188	60.276
20.218	56.935
20.307	66.954
20.337	66.238
20.367	60.034
21.110	85.072
21.110	78.631
21.407	77.911
22.002	72.891
22.151	80.046
23.816	92.186
24.351	96.949
24.708	100.522];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'KwakHuh2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.LW = 5 * weights.LW;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% weights.psd.v = 5 * weights.psd.v;
% weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00692*(TL in cm)^3.01'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'introduced to many sites on earth'; 
metaData.bibkey.F2 = 'Siri2008'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '8XN6'; % Cat of Life
metaData.links.id_ITIS = '171882'; % ITIS
metaData.links.id_EoL = '46576511'; % Ency of Life
metaData.links.id_Wiki = 'Acanthogobius_flavimanus'; % Wikipedia
metaData.links.id_ADW = 'Acanthogobius_flavimanus'; % ADW
metaData.links.id_Taxo = '159895'; % Taxonomicon
metaData.links.id_WoRMS = '279475'; % WoRMS
metaData.links.id_fishbase = 'Acanthogobius-flavimanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthogobius_flavimanus}}';
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
bibkey = 'KwakHuh2009'; type = 'article'; bib = [ ...
'doi = {10.1080/19768354.2009.9647224}, ' ...
'author = {Seok Nam Kwak and Sung‐Hoi Huh and Ha Won Kim}, ' ... 
'year = {2009}, ' ...
'title = {Growth and estimated production of \emph{Acanthogobius flavimanus} in an eelgrass (\emph{Zostera marina}) bed and unvegetated tidal flat of {D}ongdae {B}ay}, ' ...
'journal = {Animal Cells and Systems}, ' ...
'volume = {13(3)}, ' ...
'pages = {315-321}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Siri2008'; type = 'Misc'; bib = [ ...
'author = {Sunil Siriwardena}, '...   
'year = {2008}, ' ...
'doi = {10.1079/cabicompendium.95}, ' ...
'howpublished = {\url{https://www.cabidigitallibrary.org/doi/10.1079/cabicompendium.95431}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acanthogobius-flavimanus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


