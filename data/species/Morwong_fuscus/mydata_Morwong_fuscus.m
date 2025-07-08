function [data, auxData, metaData, txtData, weights] = mydata_Morwong_fuscus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Latridae';
metaData.species    = 'Morwong_fuscus'; 
metaData.species_en = 'Red morwong'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 01];

%% set data

% zero-variate data

data.am = 23*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'StewHugh2009';   
  temp.am = C2K(18.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'am is likely to be larger';

data.Lp = 22;    units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 65;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of  1.3 mm: pi/6*0.13^3';
data.Wwi = 3.8e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^3.04, see F1';
    
data.GSI = 0.05; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(18.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.436	16.776
0.969	24.671
1.076	25.658
1.076	23.355
1.182	29.441
1.182	22.697
1.289	27.961
1.289	27.138
1.715	21.711
1.822	22.862
2.141	24.836
2.141	26.151
2.141	26.974
2.141	28.289
2.248	28.783
2.355	30.099
2.994	22.697
3.101	31.086
3.101	29.934
3.101	26.974
3.101	25.987
3.207	33.224
3.207	25.164
3.314	31.908
3.314	27.632
3.314	21.217
3.421	35.691
3.421	34.211
4.060	31.250
4.167	32.895
4.167	35.033
4.273	30.428
4.273	31.743
4.273	34.211
4.380	42.434
5.126	35.033
5.233	29.112
5.339	31.086
5.339	30.592
5.446	33.224
5.446	32.895
6.298	32.730
6.298	33.388
6.405	30.099
6.405	31.086
6.405	35.855
6.405	37.007
6.512	34.539
7.151	34.868
7.151	25.164
7.364	41.941
7.364	28.289
8.004	32.072
8.217	33.388
8.324	36.184
9.283	33.059
9.390	28.125
9.390	29.605
10.136	43.257
10.136	36.349
10.136	28.618
10.242	33.388
10.242	31.250
10.455	40.954
10.455	38.816
11.202	38.322
11.202	37.336
11.202	37.171
11.308	33.059
11.308	32.072
11.628	34.704
12.054	37.336
12.161	39.309
12.161	38.651
13.866	36.349
14.186	37.829
14.293	35.197
14.293	34.704
14.399	33.059
15.465	38.322
16.318	39.309
16.957	46.382
17.171	39.638
17.171	38.980
18.236	34.868
18.236	34.211
18.343	32.895
19.302	38.816
19.302	42.599
19.409	36.020
19.516	41.612
20.155	41.447
21.114	36.020
21.221	36.842
23.033	36.020
23.140	46.546
23.140	39.145
24.205	38.651
24.205	36.842
24.419	34.868
25.165	28.289
26.124	39.474
26.124	40.461
27.297	33.717
32.093	41.447
33.265	38.816];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.9) * 365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-8;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f = C2K(18.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Lowr2003';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
1.058	26.309
2.030	30.303
2.079	16.804
2.124	27.410
2.234	28.237
2.237	28.926
2.438	26.309
2.766	28.650
2.772	30.028
2.871	28.237
2.917	39.118
2.996	32.645
3.092	30.303
3.096	31.129
3.098	31.680
3.110	34.435
3.116	35.950
3.118	36.364
3.213	33.747
3.397	26.997
3.865	37.328
3.905	21.763
3.917	24.518
3.928	27.135
3.943	30.716
3.951	32.645
3.955	33.471
3.988	41.185
4.026	25.207
4.069	35.399
4.158	31.405
4.171	34.435
4.787	29.477
4.791	30.441
4.906	32.507
4.944	41.460
5.027	35.950
5.962	31.129
6.074	32.369
6.096	37.603
6.855	41.322
6.940	36.364
7.859	27.686
7.996	34.986
8.125	40.358
9.921	38.292
10.051	43.802
11.007	43.939
11.956	42.424
12.279	43.388
13.971	41.873
15.997	43.939
19.822	44.490
28.005	46.143
39.775	42.424];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.9) * 365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-8;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth','fork length','males'};  
temp.tL_m = C2K(18.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Lowr2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
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
F1 = 'length-weight: weight in g = 0.01175*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'TRXJ'; % Cat of Life
metaData.links.id_ITIS = '645622'; % ITIS
metaData.links.id_EoL = '46581332'; % Ency of Life
metaData.links.id_Wiki = 'Morwong_fuscus'; % Wikipedia
metaData.links.id_ADW = 'Cheilodactylus_fuscus'; % ADW
metaData.links.id_Taxo = '312832'; % Taxonomicon46581352
metaData.links.id_WoRMS = '1526241'; % WoRMS
metaData.links.id_fishbase = 'Morwong-fuscus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Morwong_fuscus}}';  
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
bibkey = 'Lowr2003'; type = 'article'; bib = [ ...  
'doi = {10.1016/j.fishres.2008.12.005}, ' ...
'author = {Michael Lowry}, ' ...
'year = {2003}, ' ...
'title = {Age and growth of \emph{Cheilodactylus fuscus}, a temperate rocky reef fish}, ' ... 
 'journal = {New Zealand Journal of Marine and Freshwater Research}, ' ...
'volume = {96(2/3)}, '...
'pages = {267–274}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Morwong-fuscus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
