function [data, auxData, metaData, txtData, weights] = mydata_Crocuta_crocuta

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Hyaenidae';
metaData.species    = 'Crocuta_crocuta'; 
metaData.species_en = 'Spotted hyena'; 

metaData.ecoCode.climate = {'Aw', 'BSh', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvm', 'xiSvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 10 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2018 08 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 10]; 


%% set data
% zero-variate data

data.tg = 110;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from Hyena hyena in AnAge';
data.tx = 265;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1095;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'for females; 639 d for males';
data.am = 41.1*365; units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 130;   units.Li  = 'cm'; label.Li  = 'ultimate head-body length'; bibkey.Li  = 'Wiki';
  comment.Li = 'Wiki: 95 - 165.8 cm';

data.Wwb = 1390;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 14500; units.Wwx = 'g';  label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
  comment.Wwx = 'sex not indicated; Wiki: males grow faster';
data.Wwi = 63000; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'for female; Wiki: heavy in Zambia (male 67.6 kg, female 69.2 kg), 81.7 and 90 recorded';

data.Ri  = 2/449; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tL = [ ... % time since birth (month), head length (cm)
0.080	 9.511
0.160	10.180
0.240	10.551
0.321	11.295
1.202	14.192
2.004	14.187
2.004	14.410
2.004	14.931
2.004	15.899
2.004	16.643
2.164	15.302
2.966	16.265
3.046	17.976
3.126	15.892
3.206	17.306
3.287	16.784
4.008	20.054
4.168	18.044
4.168	19.607
4.168	19.830
4.248	17.821
4.248	17.821
4.329	16.853
4.329	19.011
4.329	19.159
4.810	19.826
4.970	21.090
5.130	18.336
5.130	21.610
5.210	18.410
5.210	21.089
5.371	19.972
5.531	19.078
5.691	20.789
5.772	21.384
6.253	21.827
6.253	23.911
6.333	23.017
6.413	19.445
6.493	22.198
6.573	21.081
6.653	20.486
6.653	21.527
7.134	21.078
7.214	21.971
7.214	22.343
7.295	22.640
7.375	23.086
7.535	21.671
7.615	21.299
8.176	22.114
8.176	22.263
8.176	22.337
8.337	23.750
8.657	23.004
8.657	23.525
9.138	25.606
9.299	22.554
9.299	23.001
9.299	24.266
9.299	24.414
9.299	24.638
9.459	23.595
9.459	25.009
9.539	24.041
10.180	24.186
10.261	25.004
10.421	25.227
10.581	25.672
10.661	24.853
10.982	24.628
11.142	24.107
11.142	24.479
11.463	25.146
11.623	25.518
12.024	25.813
12.184	24.175
12.184	24.696
12.184	27.523
12.265	24.919
12.265	25.440
12.345	26.927
12.826	26.552
12.906	26.329
12.986	25.733
13.707	25.208
13.707	26.696
14.028	26.992
14.028	28.555
14.188	25.875
14.269	25.652
14.269	27.214
14.349	28.404
14.429	26.172
14.429	27.660
14.509	28.031
14.589	26.394
15.070	26.986
15.150	27.209
15.150	28.474
15.230	27.655
15.471	25.645
15.631	25.942
15.711	26.239
15.872	27.056
16.273	28.170
16.353	29.063
16.433	27.053
16.593	27.499
17.395	28.759
17.956	27.268
18.116	26.746
18.196	29.127
19.078	27.931
19.158	26.815
19.719	27.704
19.800	26.811
19.800	27.258
19.880	28.150
20.441	29.561
20.601	27.104
20.842	29.558
21.162	29.110
21.162	29.408
21.323	28.812
22.445	27.466
23.888	28.723
23.968	27.904
24.369	28.274
24.449	27.753
24.529	29.389
24.529	30.207
27.014	28.333
27.495	29.670
29.820	28.541
29.900	28.020
30.621	28.239
34.068	28.666
36.393	28.355
36.473	27.611
38.798	27.672
38.798	27.896];
data.tL(:,1) = data.tL(:,1) * 30.5; % convert month to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'head length'};  
temp.tL   = C2K(37);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BindValk2000';

% time weight
data.tW = [ ... % time since birth (d), weight (g)
9.942	1768.044
11.043	1856.847
14.876	1917.191
17.089	1925.372
19.947	2198.985
24.731	2384.909
27.817	2562.841
30.286	3116.237
34.625	3316.730
41.607	3709.725
47.178	4227.431];
units.tW  = {'d', 'cm'};  label.tW = {'time since birth', 'weight'};  
temp.tW   = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'KinsKrei1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: additional tW data';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'ZL56'; % Cat of Life
metaData.links.id_ITIS = '621907'; % ITIS
metaData.links.id_EoL = '311569'; % Ency of Life
metaData.links.id_Wiki = 'Crocuta_crocuta'; % Wikipedia
metaData.links.id_ADW = 'Crocuta_crocuta'; % ADW
metaData.links.id_Taxo = '67062'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000684'; % MSW3
metaData.links.id_AnAge = 'Crocuta_crocuta'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crocuta_crocuta}}';
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
bibkey = 'BindValk2000'; type = 'Article'; bib = [ ... 
'author = {Binder, W. J. and Valkengurgh, B. van}, ' ... 
'year = {2000}, ' ...
'title = {Development of bite strength and feeding behaviour in juvenilespotted hyenas (\emph{Crocuta crocuta})}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {252}, ' ...
'pages = {273--283}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KinsKrei1990'; type = 'Article'; bib = [ ... 
'author = {F. M. Kinsey and D. Kreider}, ' ... 
'year = {1990}, ' ...
'title = {Reintroduction of a hand-reared spotted hyaena cub \emph{Crocuta crocuta})}, ' ...
'journal = {Int. Zoo Yb}, ' ...
'volume = {29}, ' ...
'pages = {164--169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Crocuta_crocuta}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

