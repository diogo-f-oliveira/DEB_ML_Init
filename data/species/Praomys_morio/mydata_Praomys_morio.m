function [data, auxData, metaData, txtData, weights] = mydata_Praomys_morio
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Praomys_morio'; 
metaData.species_en = 'Cameroon soft-furred mouse'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 16];              

%% set data
% zero-variate data

data.tg = 36;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Dela2009';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 20;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 38;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'Dela2009';
  temp.tp = C2K(36); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 2.5;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Dela2009';
data.Wwi = 37;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Dela2009';

data.Ri  = 2.5*2/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Dela2009';   
  temp.Ri = C2K(36); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-3 pups per litter; 2 litters per yr assumed';
  
% univariate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
0.018	2.702
0.021	3.048
0.024	3.464
0.578	2.357
0.858	2.219
1.996	4.159
3.394	3.193
3.399	3.885
3.965	4.370
4.252	5.270
5.089	4.372
5.941	5.619
5.944	6.034
6.787	6.105
7.056	4.445
7.058	4.721
7.644	8.114
8.179	4.170
8.765	7.631
8.768	8.046
8.785	10.468
9.035	6.109
10.713	4.935
11.003	6.182
12.418	7.637
12.422	8.191
12.439	10.613
12.743	13.866
13.811	5.771
14.674	8.610
14.677	9.095
15.828	12.972
15.854	16.640
16.631	7.229
18.928	14.154
18.954	17.891
19.749	10.972
19.754	11.733
20.286	7.513
21.478	17.065
21.783	20.456
22.544	8.901
22.566	12.015
23.137	13.261
26.481	9.253
27.083	14.929
27.088	15.552
27.117	19.704
27.134	22.196
29.040	13.479
31.873	16.668
32.735	19.299
33.287	17.985
33.885	22.969
33.897	24.699
34.416	18.610
35.541	18.750
35.544	19.165
38.375	22.077
38.382	23.115
39.780	22.148
40.638	24.157
41.492	25.750
41.752	22.705
42.030	22.291
44.847	23.334
45.155	27.140
45.417	24.442
47.691	28.114
47.954	25.553
47.961	26.592
48.542	29.153
50.772	26.666
51.619	27.221
53.048	30.545
53.860	26.187
53.871	27.709
56.992	32.005
57.542	30.276
60.368	32.495
61.197	30.490
61.481	30.836
66.838	33.337
67.927	28.287
67.936	29.602
74.430	33.973
75.535	31.207
75.818	31.553
81.172	33.500
83.135	32.950
83.423	33.919
88.785	37.181
89.068	37.459
90.123	27.564
90.414	28.949
97.490	36.158
97.510	38.926
103.949	35.547
104.806	37.417
109.315	39.224
109.570	35.556
118.559	35.018
119.148	38.825];
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(36);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'Dela2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 3 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4M8YL'; % Cat of Life
metaData.links.id_ITIS = '585479'; % ITIS
metaData.links.id_EoL = '1179327'; % Ency of Life
metaData.links.id_Wiki = 'Praomys_morio'; % Wikipedia
metaData.links.id_ADW = 'Praomys_morio'; % ADW
metaData.links.id_Taxo = '63109'; % Taxonomicon
metaData.links.id_MSW3 = '13001688'; % Mammal Spec World
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Praomys_morio}}';
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
bibkey = 'Dela2009'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1469-7998.1971.tb02177.x}, ' ...
'author = {Delany, M. J.}, ' ... 
'year = {2009}, ' ...
'title = {The biology of small rodents in {M}ayanja {F}orest, {U}ganda}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {165(1)}, ' ...
'pages = {85–1297}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

