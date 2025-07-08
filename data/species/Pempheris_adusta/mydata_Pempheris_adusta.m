function [data, auxData, metaData, txtData, weights] = mydata_Pempheris_adusta
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acropomatiformes'; 
metaData.family     = 'Pempheridae';
metaData.species    = 'Pempheris_adusta'; 
metaData.species_en = 'Dusky sweeper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MP'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 12]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 12]; 

%% set data
% zero-variate data

data.am = 16*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'KoedIshi2016';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'oldest catch, max life span is probably larger';
  
data.Lp  = 7.66; units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'KoedIshi2016'; 
data.Li  = 17;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'KoedFuka2013';
  comment.Wwb = 'based egg diameter of 1 mm : 4/3*pi*0.05^3'; 
data.Wwp = 7; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'KoedIshi2016';
  comment.Wwp = 'based on 0.01585*Lp^2.99, see F1';
data.Wwi = 76; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01585*Li^2.99, see F1';

data.Ri = 1.3e4/365;       units.Ri = '#/d';  label.Ri = 'reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'Based on same weight-specific fecundity of P. schwenkii: 41000 eggs/yr for 24.7 g fish';

% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (yr), standard length (cm)
0.002	1.376
0.002	1.408
0.002	1.504
0.002	1.568
0.002	1.632
0.002	1.632
0.002	1.792
0.002	1.792
0.002	1.920
0.021	0.384
0.021	0.576
0.021	0.608
0.022	0.704
0.022	0.800
0.022	0.832
0.022	1.184
0.023	1.728
0.024	2.432
0.146	1.248
0.188	1.472
0.209	1.632
0.209	1.696
0.212	4.448
0.228	0.544
0.228	0.608
0.228	0.640
0.228	0.768
0.230	1.920
0.232	3.776
0.232	3.904
0.232	3.968
0.232	3.968
0.232	3.968
0.232	3.968
0.233	4.224
0.233	4.256
0.233	4.512
0.233	4.704
0.248	0.448
0.249	0.640
0.249	0.800
0.249	0.832
0.249	1.024
0.249	1.120
0.249	1.184
0.251	2.144
0.252	3.456
0.270	1.184
0.272	2.432
0.272	2.752
0.272	2.784
0.272	3.136
0.273	3.264
0.273	3.264
0.273	3.392
0.273	3.456
0.293	2.976
0.293	3.232
0.420	5.376
0.420	5.696
0.421	6.432
0.446	9.888
0.463	6.688
0.463	6.784
0.463	6.784
0.481	4.704
0.482	5.824
0.483	6.016
0.483	6.144
0.483	6.144
0.483	6.144
0.484	7.136
0.484	7.232
0.485	7.488
0.673	9.728
0.731	6.560
0.731	6.656
0.731	6.752
0.731	6.880
0.734	8.480
0.734	8.832
0.751	6.272
0.753	7.392
0.753	7.616
0.753	7.840
0.754	8.128
0.773	7.104
0.813	5.856
0.813	6.016
0.981	8.640
0.982	8.896
0.984	10.816
1.231	10.304
1.232	10.432
1.232	10.624
1.232	10.848
1.232	11.168
1.253	11.392
1.254	11.648
1.729	11.904
1.729	12.128
1.976	11.136
1.997	12.000
1.998	12.256
2.203	11.136
2.203	11.392
2.268	13.696
2.286	12.032
2.287	12.416
2.287	12.544
2.287	12.800
2.491	10.816
2.493	11.776
2.495	13.312
2.679	12.512
2.742	13.152
2.742	13.248
2.742	13.344
2.742	13.376
2.743	13.632
2.762	12.672
2.763	12.992
2.802	11.648
2.802	11.904
2.803	12.288
3.009	12.096
3.009	12.352
3.031	13.152
3.051	12.768
3.443	12.704
3.444	12.992
3.507	13.632
3.733	12.832
3.733	13.280
3.734	13.472
3.734	13.568
3.734	13.984
3.981	13.312
4.002	13.504
4.024	14.720
4.228	12.448
4.228	12.928
4.250	13.824
4.250	14.048
4.270	13.568
4.457	13.824
4.724	13.472
4.767	14.336
4.972	13.280
5.013	12.800
5.014	13.728
5.014	13.920
5.014	14.144
5.015	14.720
5.239	12.000
5.240	12.800
5.240	13.088
5.240	13.280
5.241	13.504
5.282	13.856
5.283	14.176
5.779	14.560
5.799	14.080
5.966	15.712
6.004	13.280
6.025	13.568
6.209	12.288
6.726	12.800
6.748	13.824
6.748	13.952
6.749	14.112
6.749	14.272
6.749	14.496
7.263	13.152
7.264	13.440
7.266	14.848
7.533	13.888
7.697	13.536
7.718	13.664
7.718	13.824
8.028	13.568
8.028	13.824
8.028	14.016
8.029	14.144
8.029	14.336
8.296	13.696
8.337	12.896
8.708	13.024
8.814	14.496
8.978	14.016
9.206	14.272
9.206	14.912
10.010	14.080
10.465	14.752
10.733	14.144
11.043	14.208
11.311	14.368
11.539	14.592
11.725	14.528
11.971	13.728
12.984	14.944
13.211	14.720
13.768	14.240
16.038	13.824];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KoedIshi2016';

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

%% Facts
F1 = 'weight-length relationship for Pempheris otaitensis and P. molucca: W = 0.01585 SL^2.99';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; depth range 5 - 40 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '76FQB'; % Cat of Life
metaData.links.id_ITIS = '645898'; % ITIS
metaData.links.id_EoL = '46581066'; % Ency of Life
metaData.links.id_Wiki = 'Pempheris_adusta'; % Wikipedia
metaData.links.id_ADW = 'Pempheris_adusta'; % ADW
metaData.links.id_Taxo = '183399'; % Taxonomicon
metaData.links.id_WoRMS = '218704'; % WoRMS
metaData.links.id_fishbase = 'Pempheris-adusta'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pempheris}}';
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
bibkey = 'KoedIshi2016'; type = 'Article'; bib = [ ... 
'author = {K. Koeda and T. Ishihara and T. Fukagawa and K. Tachihara}, ' ... 
'year = {2016}, ' ...
'title = {Life cycle differences between two species of genus \emph{Pempheris} based on age determination around {O}kinawa-jima {I}sland}, ' ...
'journal = {Ichthyol Res}, ' ...
'volume = {63}, ' ...
'pages = {519-528}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KoedFuka2013'; type = 'Article'; bib = [ ... 
'author = {K. Koeda and T. Fukagawa and T. Ishihara  and K. Tachihara}, ' ... 
'year = {2013}, ' ...
'title = {Reproductive biology of nocturnal reef fish \emph{Pempheris sp.} ({P}empherididae) in {O}kinawa {I}sland, {J}apan}, ' ...
'journal = {Galaxea, Journal of Coral Reef Studies}, ' ...
'volume = {special issue}, ' ...
'pages = {221--228}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Pempheris-adusta.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
