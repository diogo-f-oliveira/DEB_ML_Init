  function [data, auxData, metaData, txtData, weights] = mydata_Caranx_caninus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Caranx_caninus'; 
metaData.species_en = 'Pacific crevalle jack'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 12];

%% set data
% zero-variate data
data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(15.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(15.7);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 50;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 101;     units.Li = 'cm';   label.Li = 'ultimate total length';     bibkey.Li = 'fishbase';

data.Wwb = 5.23e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 1520;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01479*Lp^2.95, see F1';
data.Wwi = 17.7e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight; based on 0.01479*Li^2.95, see F1, gives 12 kg';

data.GSI = 0.045;   units.GSI = '-';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'BarrCabe2008';
  temp.GSI = C2K(15.7); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), std length (cm), weight (g)
    0  4.62     4
    1 19.02   230
    2 30.78   956
    3 40.39  2136
    4 48.39  3611
    5 54.65  5222
    6 59.89  6845
    7 64.17  8395
    8 67.66  9821
    9 70.52 11098];
data.tLW(:,1) = (0+ data.tLW(:,1)) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'std length', 'weight'};  
  temp.tLW = C2K(15.7);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature'; 
bibkey.tLW = 'BarrCabe2008'; treat.tLW = {1 {'std length','weight'}};

% length-weight
data.LW = [ ... % total length (cm), weight (g)
5.196	47.276
5.981	70.323
6.178	115.972
6.863	47.818
7.452	93.594
7.746	116.482
8.040	48.201
8.334	116.674
8.824	94.041
10.295	117.312
10.884	140.295
11.570	94.935
11.864	163.407
12.943	209.342
13.924	232.454
14.808	323.909
15.002	210.013
15.788	324.229
16.376	278.836
17.061	210.683
17.749	370.451
18.631	302.362
20.004	348.393
20.789	439.817
21.180	303.192
21.378	508.385
22.163	554.225
22.848	394.903
23.240	395.031
23.438	531.847
24.417	418.206
24.811	600.671
25.301	555.246
25.989	692.222
26.673	555.693
26.774	806.438
27.461	806.661
27.854	943.542
27.949	670.069
28.637	784.253
29.420	716.132
29.717	921.356
30.797	1035.668
30.799	1218.005
31.680	1149.916
31.777	990.403
33.053	1173.155
33.252	1355.555
34.329	1264.738
34.821	1378.858
35.410	1493.011
35.505	1196.745
35.702	1310.769
35.901	1584.338
36.686	1561.802
37.075	1356.800
37.177	1675.922
37.371	1493.649
37.765	1653.321
38.450	1562.377
38.552	1858.706
39.628	1699.512
39.730	1950.257
41.203	2155.865
42.088	2406.866
44.543	2749.545
44.841	3045.939
45.823	3183.011
46.223	3821.318
46.605	2978.137
47.097	3160.634
47.883	3274.849
48.083	3594.003
49.652	3662.890
49.852	3982.043
49.857	4346.717
50.635	3822.754
50.839	4483.789
50.932	4050.771
51.222	3708.985
51.615	3845.865
52.015	4438.588
52.496	3709.400
52.895	4256.538
52.901	4735.173
55.059	4872.628
55.457	5328.598
56.143	5306.029
56.443	5784.759
56.630	5009.891
56.643	6126.705
57.121	5124.011
57.805	4873.522
57.812	5466.117
60.081	6606.457
61.560	7336.283];    
units.LW = {'cm','g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'BrewBlab1994';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 5;
weights.ab = weights.ab * 0;
weights.Wwi = weights.Wwi * 3;
weights.Wwp = weights.Wwp * 0;
weights.Li = weights.Li * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01479*(TL in cm)^2.95'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'R2N2'; % Cat of Life
metaData.links.id_ITIS = '168626'; % ITIS
metaData.links.id_EoL = '46577979'; % Ency of Life
metaData.links.id_Wiki = 'Caranx_caninus'; % Wikipedia
metaData.links.id_ADW = 'Caranx_caninus'; % ADW
metaData.links.id_Taxo = '165426'; % Taxonomicon
metaData.links.id_WoRMS = '273272'; % WoRMS
metaData.links.id_fishbase = 'Caranx-caninus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Caranx_caninus}}';  
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
bibkey = 'BarrCabe2008'; type = 'article'; bib = [ ... 
'author = {Elaine Espino Barr and Manuel Gallardo Cabello and Esther Guadalupe Cabral Sol\''{i}s and Arturo Garcia Boa and Marcos Puente G\''{o}mez}, ' ...
'year = {2008}, ' ...
'title = {Growth of the Pacific jack \emph{Caranx caninus} ({P}isces: {C}arangidae) from the coast of {C}olima, {M}\''{e}xico}, ' ... 
'journal = {Rev. biol. trop.}, ' ...
'volume = {56(1)}, '...
'pages = {171-179}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Caranx-caninus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  