function [data, auxData, metaData, txtData, weights] = mydata_Thyroptera_tricolor
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Thyropteridae';
metaData.species    = 'Thyroptera_tricolor'; 
metaData.species_en = 'Spix''s disk-winged bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 26]; 

%% set data
% zero-variate data

data.tg = 110;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'ChavVonh2011';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '3.5 mnth';
data.tx = 120;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'ChavVonh2011';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 621;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'guess';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 33*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'ChavVonh2011';
data.Wwi = 4;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Wiki';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
1.562	1.305
6.044	1.492
8.417	1.579
9.735	1.496
10.526	1.679
15.272	2.281
15.800	1.894
17.645	1.986
18.173	2.393
21.073	2.089
22.128	1.973
26.874	2.409
28.983	2.409
30.038	2.583
30.829	2.488
32.938	2.795
32.939	2.595
36.102	2.496
39.002	2.803
47.176	3.006
52.449	2.906
55.613	2.590
56.403	3.172
56.404	3.172
59.304	2.989
60.359	3.175
60.886	3.304
66.687	3.399
70.642	3.287
75.915	3.183
79.343	3.403
81.189	3.091
81.452	3.187
91.999	3.585
92.790	3.385
100.436	3.684
100.963	3.888
103.073	3.792
107.291	3.580
113.356	3.488
120.475	3.280
120.476	3.874
121.002	3.986
121.266	3.783
123.902	3.496
128.648	3.591
131.285	3.691
135.767	3.487
142.622	3.682
155.015	3.681
157.651	3.581
163.979	3.797
164.507	3.589
182.436	3.987
201.420	3.882];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'females'};  
temp.tWw_f    = C2K(34.8);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'ChavVonh2011';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
1.034	1.081
1.562	1.201
2.616	1.392
6.571	1.504
9.472	1.604
11.845	2.003
12.899	1.811
15.272	2.094
16.854	2.193
18.173	2.293
20.282	2.293
20.283	2.093
23.446	2.193
25.292	2.293
29.774	2.492
30.829	2.691
31.092	2.795
33.729	2.591
33.992	2.487
35.047	2.786
37.947	2.591
39.793	2.495
42.957	2.607
45.594	2.790
45.595	3.006
50.603	3.101
50.867	2.603
61.150	3.288
64.314	2.506
65.105	3.200
67.742	3.395
73.015	3.204
74.333	2.896
81.452	3.307
85.671	3.095
92.262	3.593
95.163	3.398
100.172	3.489
101.491	3.705
101.492	3.385
106.764	3.576
114.674	3.687
116.256	3.288
117.838	3.691
123.111	3.384
134.185	3.192
136.294	3.599
165.561	3.398
169.253	3.792
200.629	3.387];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'males'};  
temp.tWw_m    = C2K(34.8);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'ChavVonh2011';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 10 * weights.tWw_f;
weights.tWw_m = 10 * weights.tWw_m;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
D3 = 'Assimilation during lactation is initially higher elevated';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '56SY5'; % Cat of Life
metaData.links.id_ITIS = '631901'; % ITIS
metaData.links.id_EoL = '327546'; % Ency of Life
metaData.links.id_Wiki = 'Thyroptera_tricolor'; % Wikipedia
metaData.links.id_ADW = 'Thyroptera_tricolor'; % ADW
metaData.links.id_Taxo = '64567'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13801531'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thyroptera_tricolor}}';
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
bibkey = 'ChavVonh2011'; type = 'Article'; bib = [ ... 
'doi = {10.3161/150811011x578697}, ' ...
'author = {Chaverri, G. and Vonhof, M. J.}, ' ... 
'year = {2011}, ' ...
'title = {Reproduction and Growth in a Neotropical Insectivorous Bat}, ' ...
'journal = {Acta Chiropterologica}, ' ...
'volume = {13(1)}, ' ...
'pages = {147–155}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

