function [data, auxData, metaData, txtData, weights] = mydata_Astarte_borealis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Carditida'; 
metaData.family     = 'Astartidae';
metaData.species    = 'Astarte_borealis'; 
metaData.species_en = 'Northern astarte'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN','MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.5); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 08]; 

%% set data
% zero-variate data

data.am = 150*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'MossSurg2018';   
  temp.am = C2K(5.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'reported from NW Greenland';
  
data.Lb  = 0.02; units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'MossSurg2018';
data.Lp  = 2; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 4.22;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'MossSurg2018';

data.Wwb = 2.8e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'MossSurg2018';
  comment.Wwb = 'based on egg diameter of 200 mum: pi/9*0.02^3'; 
data.Wwi = 15.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'sealifebase';
  comment.Wwi = 'based on 0.2321*Li^2.920, see F2';

data.Ri  = 3.8e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(5.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.98';

% uni-variate data

% time-length 
data.tL = [ ... % time since settlement (d), shell height (cm)
0.869	0.695
1.135	0.782
1.579	0.889
2.287	1.146
2.639	1.333
2.731	1.265
3.173	1.421
3.618	1.502
4.510	1.577
5.045	1.634
6.114	1.790
7.095	1.878
7.897	1.978
8.969	2.034
10.218	2.140
11.290	2.197
12.272	2.253
13.076	2.303
14.147	2.365
14.951	2.409
15.933	2.459
17.005	2.509
17.898	2.540
19.061	2.559
19.954	2.584
20.938	2.603
21.743	2.609
22.995	2.615
24.067	2.659
25.140	2.658
25.945	2.677
27.017	2.696
27.911	2.727
29.163	2.739
30.146	2.758
30.861	2.770
31.934	2.789
32.918	2.776
34.080	2.808
34.974	2.814
35.689	2.832
36.941	2.851
37.836	2.851
38.998	2.863
39.981	2.882
41.055	2.882
41.949	2.882
42.754	2.900
43.827	2.907
44.900	2.906
45.973	2.906
46.957	2.919
47.940	2.937];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'shell height'};  
temp.tL    = C2K(5.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MossSurg2018';
comment.tL = 'Data from White Sea; temperature -1 to 12 C';
%
data.tL1 = [ ... % time since settlement (d), shell height (cm)
0.870	0.682
1.052	0.576
1.053	0.526
1.497	0.638
2.298	0.789
2.389	0.720
2.922	0.845
4.260	0.964
5.064	1.020
5.328	1.151
6.040	1.258
6.046	1.064
6.755	1.283
6.930	1.408
8.091	1.489
8.093	1.408
8.805	1.527
9.339	1.640
9.963	1.696
10.234	1.602
11.038	1.652
12.377	1.721
13.268	1.833
14.163	1.833
14.965	1.921
16.037	1.977
16.930	2.039
18.002	2.083
19.253	2.114
20.147	2.127
21.040	2.158
22.382	2.176
23.097	2.189
23.990	2.226
24.974	2.239
26.046	2.264
27.119	2.276
28.013	2.289
28.997	2.307
29.712	2.313
30.696	2.326
31.858	2.338
33.110	2.357
33.914	2.375
34.719	2.375
35.882	2.388
37.044	2.406
37.938	2.406
39.011	2.425];
data.tL1(:,1) = data.tL1(:,1) * 365; % convert yr to d
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since settlement', 'shell height'};  
temp.tL1    = C2K(5.5);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'MossSurg2018';
comment.tL1 = 'Data from White Sea';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.tL1 = 10 * weights.tL1;
weights.Ri = 0 * weights.Ri;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
%weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data at different food levels'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Eggs in sticky envelope, settling in clusters; no pelagic stage';
metaData.bibkey.F1 = 'MossSurg2018'; 
F2 = 'length weight: Wet weight in g = 0.2321 * (shell length in cm)^2.920';
metaData.bibkey.F2 = 'sealifebase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'HN3J'; % Cat of Life
metaData.links.id_ITIS = '80831'; % ITIS
metaData.links.id_EoL = '46468914'; % Ency of Life
metaData.links.id_Wiki = 'Astarte_borealis'; % Wikipedia
metaData.links.id_ADW = 'Astarte_borealis'; % ADW
metaData.links.id_Taxo = '39574'; % Taxonomicon
metaData.links.id_WoRMS = '138818'; % WoRMS
metaData.links.id_molluscabase = '138818'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Astarte_borealis}}';
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
bibkey = 'MossSurg2018'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-018-2290-9}, ' ...
'author = {David K. Moss and Donna Surge and Vadim Khaitov}, ' ... 
'year = {2018}, ' ...
'title = {Lifespan and growth of \emph{Astarte borealis} ({B}ivalvia) from {K}andalaksha {G}ulf, {W}hite {S}ea, {R}ussia}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {41}, ' ...
'pages = {1359-1369}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Astarte-borealis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

