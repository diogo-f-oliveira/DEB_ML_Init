  function [data, auxData, metaData, txtData, weights] = mydata_Mallotus_villosus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osmeriformes'; 
metaData.family     = 'Osmeridae';
metaData.species    = 'Mallotus_villosus'; 
metaData.species_en = 'Capelin'; 
metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MPN', 'MAN', 'MN'};
metaData.ecoCode.habitat = {'0jFr', 'jiMcp'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};
metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'L-Ww'; 'L-N'; 'Ww-N'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2014 05 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 02]; 

%% set data
% zero-variate data
data.ab = 16; units.ab = 'd'; label.ab = 'age at birth';     bibkey.ab = 'fao'; 
  temp.ab = C2K(4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '2-3 wk';
data.ap = 3.5*365;  units.ap = 'd';   label.ap = 'age at puberty';         bibkey.ap = 'JohaVilh1999';
  temp.ap = C2K(7); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'temp is guessed, ap for females';
data.am = 10*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(5); units.temp.am = 'K'; label.temp.am = 'temperature';

%data.L0 = 0.02;   units.Lb = 'cm';  label.Lb = 'total length at birth';  bibkey.Lb = 'gma'; 
%  comment.L0 = 'based on Osmerus_mordax';
data.Lb = 0.24;   units.Lb = 'cm';  label.Lb = 'total length at birth';  bibkey.Lb = 'gma'; 
  comment.Lb = 'based on Osmerus_mordax';
data.Lp = 13.5;   units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
data.Li = 23;     units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fao';

% uni-variate data
% L-Ww data from JohaVilh1999
data.LW = [ ... % average length (cm), wet weight (g)
13.0 10.3
13.5 11.6
14.0 12.6
14.5 14.7
15.0 16.3
15.5 18.5
16.0 19.6
16.5 22.1
17.0 24.1
17.5 26.1
18.0 24.8];
units.LW = {'cm', 'g'}; label.LW = {'length', 'wet weight'};  
bibkey.LW = {'JohaVilh1999'};
%
% L-N data from JohaVilh19999 at 8 C (guessed)
data.LN = [ ... % length (cm), fecundity (numer of eggs)
13.00	7404.12
13.00	7932.58
13.00	8501.68
13.00	8826.88
13.50	6594.01
13.51	7041.26
13.51	7366.46
13.50	7691.62
13.50	8138.77
13.51	8464.02
13.51	8707.92
13.50	8992.38
13.50	9317.59
13.52	10090.09
13.52	10293.34
13.52	10415.29
14.01	7857.16
14.01	8060.42
14.01	8263.67
14.01	8426.27
14.01	8792.12
14.01	9036.02
14.01	9157.98
14.01	9361.23
14.01	9564.48
14.01	9889.68
14.00	10133.54
14.00	10296.14
14.00	10580.69
14.00	10783.94
14.00	10905.90
14.01	11231.15
14.00	11922.16
14.52	6437.34
14.51	7860.06
14.49	8103.87
14.49	8429.07
14.51	8591.77
14.51	9445.43
14.51	9811.28
14.51	10014.53
14.51	10217.78
14.51	10339.73
14.51	10664.94
14.51	10908.84
14.51	11152.74
14.51	11315.34
14.51	11477.95
14.50	11843.75
14.50	12372.21
14.50	12981.96
14.50	13469.77
14.49	14729.88
15.01	9448.32
15.01	9732.88
15.01	9936.13
15.01	10383.28
15.01	10627.18
15.01	10830.44
15.01	11155.64
15.01	11399.54
15.01	11602.79
15.01	11806.05
15.00	12293.80
15.00	12862.91
15.00	13025.51
15.00	13797.87
15.01	15789.79
15.01	16318.24
15.50	10345.48
15.51	11605.69
15.50	11930.85
15.50	12134.10
15.51	12784.55
15.50	13312.96
15.50	13516.21
15.50	13678.81
15.51	13922.76
15.51	14369.92
15.51	14613.82
15.50	15060.93
15.51	15508.13
15.50	15873.94
15.50	17012.15
16.02	11568.03
16.02	11811.89
16.01	12299.64
16.01	12787.45
16.01	13031.35
16.01	13234.60
16.01	13437.86
16.01	13681.76
16.01	14047.61
16.01	14332.17
16.01	14494.77
16.01	14779.32
16.00	15673.58
16.00	15876.83
16.00	16039.43
16.53	12302.68
16.52	12587.19
16.51	13359.50
16.51	14335.11
16.51	15270.07
16.51	15635.87
16.51	15879.78
16.51	16083.03
16.51	16204.98
16.51	16570.83
16.51	16855.39
16.51	17058.64
16.51	17546.49
16.50	17912.25
16.50	18156.15
16.50	18359.40
16.50	18562.66
16.52	19294.51
16.52	19538.41
17.01	13728.25
17.01	14825.81
17.01	14947.76
17.00	15801.33
17.00	16085.88
17.00	16858.28
17.00	17183.49
17.00	17427.39
17.00	17630.64
17.00	17833.89
17.00	18362.30
17.00	18646.90
17.01	19297.36
17.01	19581.91
17.00	20069.67
17.00	21858.28
17.50	23202.64
17.50	19747.36
17.50	17999.39
17.50	17714.84
17.50	17389.64
17.50	17064.43
17.51	16007.57
18.00	17392.53
18.02	19343.85];
units.LN = {'cm', '#'}; label.LN = {'length', 'fecundity'};  
temp.LN = C2K(8); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = {'JohaVilh1999'};
%
% W-N data from JohaVilh19999 at 8 C (guessed)
data.WN = [ ... somatic weight (g), funcudity (number of eggs)
8.03	6904.76
8.03	7981.37
7.79	8147.00
8.42	8726.71
8.70	8519.67
8.47	6573.50
9.24	6532.09
9.10	7525.88
9.38	7608.70
9.38	7815.73
9.52	7939.96
9.42	8229.81
9.75	8271.22
9.52	8726.71
9.10	10217.39
9.49	10010.35
9.70	10341.61
9.31	11832.30
9.94	6656.31
9.80	7318.84
9.94	7774.33
11.52	6449.28
10.29	8147.00
10.33	8478.26
10.61	8312.63
10.87	7525.88
10.89	7981.37
10.89	8354.04
10.94	8602.48
10.75	8892.34
10.49	9016.56
9.89	9306.42
10.15	9596.27
10.15	9472.05
10.38	9513.46
10.56	9596.27
10.66	9844.72
10.52	10258.80
10.26	10051.76
10.61	10797.10
10.91	10921.33
10.84	10507.25
11.10	10590.06
11.33	10838.51
11.01	11542.44
10.98	12039.34
11.19	11915.11
11.01	9430.64
11.01	9761.90
11.50	7981.37
11.50	8519.67
11.75	8312.63
11.33	8850.93
11.64	9513.46
11.64	9886.13
11.85	10258.80
11.85	10631.47
11.89	10921.33
12.12	10755.69
12.40	10797.10
11.71	11459.63
11.92	11708.07
12.52	9637.68
12.78	9886.13
13.06	10051.76
13.31	10341.61
13.50	10548.65
13.36	11045.55
13.29	11418.22
12.96	10714.29
12.75	11169.77
13.01	11128.36
12.85	11376.81
13.03	11708.07
12.82	11956.52
13.31	11708.07
13.31	11997.93
13.31	12204.97
13.20	12287.78
12.40	11832.30
12.40	12039.34
12.54	12370.60
12.47	13033.13
12.73	12908.90
12.52	14026.92
13.10	13033.13
13.20	13405.80
13.47	13819.88
13.36	13985.51
13.45	14358.18
13.34	14689.44
13.89	13530.02
14.06	13322.98
14.22	13530.02
14.08	14399.59
13.94	11749.48
14.64	11832.30
14.64	12246.38
15.10	11542.44
15.59	11625.26
15.80	12329.19
15.43	12701.86
15.15	12701.86
14.87	12908.90
14.99	13033.13
14.99	13322.98
14.69	13571.43
15.34	13447.20
15.22	13571.43
15.24	13861.28
14.73	14358.18
14.92	14275.36
15.13	14399.59
15.36	14730.85
15.43	14358.18
14.73	15600.41
14.48	15641.82
14.80	16304.35
15.06	17215.32
14.41	18250.52
14.90	20072.46
15.85	19285.71
15.90	18167.70
15.90	17670.81
15.31	16387.16
15.59	16138.72
15.57	15807.45
15.50	15600.41
15.36	15393.37
15.62	14730.85
15.85	14358.18
15.99	14523.81
15.99	14068.32
16.18	14151.14
16.20	13737.06
16.20	13530.02
16.46	13488.61
16.71	13488.61
16.39	12991.72
16.41	11459.63
16.92	11956.52
17.34	12287.78
17.20	13033.13
17.50	13240.17
16.55	14151.14
16.32	14482.40
16.32	15020.70
16.20	15807.45
16.46	16677.02
17.13	15766.05
17.29	15393.37
17.01	14565.22
16.90	16925.47
17.41	17091.10
17.08	17795.03
16.99	18291.93
16.83	19244.31
17.69	18333.33
18.29	17919.25
18.55	18002.07
18.76	18498.96
18.57	19534.16
18.83	17629.40
19.27	17422.36
19.62	17298.14
19.64	16677.02
18.25	15434.78
18.62	15807.45
18.90	16097.31
19.02	16097.31
19.23	16097.31
19.67	15807.45
18.83	14813.66
18.48	14026.92
18.57	13240.17
19.04	13654.24
19.11	14316.77
19.76	14937.89
19.53	12577.64
20.20	15020.70
20.79	14316.77
19.74	19782.61
20.81	19534.16
20.79	17919.25
21.16	17215.32
21.41	16842.65
21.72	15973.08
22.32	17629.40
22.58	17380.95
22.72	17505.18
23.21	18747.41
21.74	19285.71
21.32	19575.57
21.18	21853.00
23.02	23219.46];
units.WN = {'g', '#'}; label.WN = {'somatic weight', 'fecundity'};  
temp.WN = C2K(8); units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = {'JohaVilh1999'};
comment.WN = 'temp is guessed';
 
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
F1 = 'spawns in late spring and early summer (different populations) in large schools in the shoreline, or in very shallow water, to lay adhesive eggs on beaches and banks; The eggs are buried in the gravel.';
metaData.bibkey.F1 = 'fao'; 
F2 = 'The spawning mortality of Icelandic capelin is high, especially of the males. It has been estimated that about one half of 4 year old females might on average be spawning for the second time.';
metaData.bibkey.F2 = 'JohaVilh1999'; 
F3 = 'DEB application to this species is discussed in EinaBirn2011';
metaData.bibkey.F3 = 'EinaBirn2011';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);
                                 
%% Links
metaData.links.id_CoL = '3XQ45'; % Cat of Life
metaData.links.id_ITIS = '162035'; % ITIS
metaData.links.id_EoL = '46563006'; % Ency of Life
metaData.links.id_Wiki = 'Mallotus_villosus'; % Wikipedia
metaData.links.id_ADW = 'Mallotus_villosus'; % ADW
metaData.links.id_Taxo = '42863'; % Taxonomicon
metaData.links.id_WoRMS = '126735'; % WoRMS
metaData.links.id_fishbase = 'Mallotus-villosus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Capelin}}';  
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
bibkey = 'JohaVilh1999'; type = 'Article'; bib = [ ...  
'author = {S. J\''{o}hannsd\''{o}ttir and H. Vilhj\''{a}lmsson}, ' ...
'year = {1999}, ' ...
'title = {Fecundity of {I}celandic capelin \emph{Mallotus villosus} ({M}\"{u}ller).}, ' ... 
'journal = {Rit Fiskideildar}, ' ...
'volume = 16, '...
'pages = {263--270}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EinaBirn2011'; type = 'Article'; bib = [ ...  
'author = {Einarsson, B. and Birnir, B. and Sigur\v{o}sson, S }, ' ...
'year = {2011}, ' ...
'title = {A {D}ynamic {E}nergy {B}udget ({D}{E}{B}) model for the energy usage and reproduction of the {I}celandic capelin (\emph{Mallotus villosus})}, ' ... 
'journal = {J. Theor. Biol.}, ' ...
'volume = {281}, '...
'pages = {1--8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/SpeciesSummary.php?ID=252&AT=capelin}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fao'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fao.org/fishery/species/2126/en}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'gma'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.gma.org/fogm/osmerus_mordax.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
