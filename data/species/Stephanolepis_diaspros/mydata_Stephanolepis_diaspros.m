function [data, auxData, metaData, txtData, weights] = mydata_Stephanolepis_diaspros

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Monacanthidae';
metaData.species    = 'Stephanolepis_diaspros'; 
metaData.species_en = 'Reticulated leatherjacket'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 29];

%% set data
% zero-variate data

data.am = 4 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'ElGaSabr2008';   
  temp.am = C2K(26.1);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'RimMoha2011'; 
  comment.Lp = 'estimate, derived from other species';
data.Li  = 25;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Wiki';

data.Wwb = 9.7e-7;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.47 mm of Stephanolepis_hispidus: pi/6*0.057^3';
data.Wwp = 7.5;  units.Wwp = 'g';   label.Wwp = 'wet weight at birth';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01738*Lp^2.92, see F1';
data.Wwi = 210;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01738*Li^2.92, see F1';

data.Ri  = 218000/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate at TL 16.3'; bibkey.Ri  = 'RimMoha2011';   
  temp.Ri = C2K(26.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    0  8.90
    1 13.65
    2 18.74
    3 23.06
    4 25.65];
data.tL(:,1) = 365 * (0.9 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(26.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ElGaSabr2008';

% length-weight
data.LW = [ ... length (cm), weight (g)
7.029	6.625
8.087	11.830
8.124	6.625
8.427	12.776
8.691	10.410
8.730	14.196
8.843	10.410
8.994	16.088
9.183	10.883
9.409	10.410
9.448	16.088
9.486	20.347
9.674	13.249
9.864	18.927
10.090	15.615
10.355	21.767
10.619	17.035
10.620	21.293
10.696	28.864
10.922	19.401
10.960	25.079
11.188	30.757
11.224	19.401
11.264	38.328
11.338	24.132
11.378	44.953
11.527	23.186
11.528	33.596
11.565	27.445
11.755	35.016
11.791	24.132
11.830	32.177
11.831	41.167
12.020	36.909
12.208	28.391
12.322	34.543
12.322	38.801
12.472	30.757
12.662	40.221
12.699	26.498
12.775	35.016
12.887	24.606
12.890	44.006
12.964	30.284
13.040	38.328
13.266	35.489
13.306	46.845
13.533	48.738
13.607	38.801
13.645	42.587
13.759	43.533
13.871	34.069
13.911	51.577
14.137	48.265
14.138	53.470
14.212	41.640
14.326	45.899
14.515	52.997
14.668	62.461
14.780	56.782
14.893	50.631
15.007	53.470
15.045	57.256
15.046	63.407
15.310	65.300
15.460	54.416
15.461	61.041
15.500	70.032
15.651	69.085
15.725	58.202
15.727	73.344
15.802	64.353
15.990	59.621
16.065	53.943
16.067	70.505
16.068	78.076
16.103	61.514
16.295	82.808
16.370	79.022
16.445	76.656
16.558	66.719
16.558	73.344
16.711	82.334
16.711	88.486
16.786	84.227
16.902	105.047
16.937	77.603
16.974	72.397
17.052	90.852
17.239	77.129
17.278	83.754
17.543	88.959
17.544	100.315
17.693	86.120
17.770	94.164
17.920	81.861
17.959	91.325
18.037	110.252
18.110	92.271
18.188	114.038
18.227	118.770
18.299	96.530
18.376	105.047
18.450	94.637
18.454	121.136
18.525	88.486
18.793	114.511
18.907	120.662
18.942	100.789
19.056	106.467
19.138	152.839
19.170	109.779
19.282	97.003
19.325	137.697
19.397	112.618
19.397	115.931
19.436	122.555
19.512	127.760
19.550	130.599
19.700	114.038
19.778	140.063
19.813	116.404
19.814	119.716
19.814	124.921
19.932	157.098
19.963	105.047
19.967	137.697
20.117	131.546
20.192	127.287
20.231	134.858
20.383	143.849
20.533	130.599
20.876	153.785
21.177	142.902
21.556	157.098
21.936	171.767
23.225	207.256
23.523	176.025
23.832	229.968
24.588	226.183
26.179	262.145];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'ElGaSabr2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01738*(TL in cm)^2.92';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '52CCT'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46570754'; % Ency of Life
metaData.links.id_Wiki = 'Stephanolepis_diaspros'; % Wikipedia
metaData.links.id_ADW = 'Stephanolepis_diaspros'; % ADW
metaData.links.id_Taxo = '188196'; % Taxonomicon
metaData.links.id_WoRMS = '127408'; % WoRMS
metaData.links.id_fishbase = 'Stephanolepis-diaspros'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stephanolepis_diaspros}}';
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
bibkey = 'ElGaSabr2008'; type = 'Article'; bib = [ ... 
'author = {Azza A. El-Ganainy and Manal M.M. Sabra}, ' ... 
'year = {2008}, ' ...
'title = {Age, growth, mortality and yield per recruit of the filefish \emph{Stephanolepis diaspros} ({F}raser-{B}runner, 1940) ({P}isces: {M}onacanthidae), in the {G}ulf of {S}uez, {E}gypt}, ' ...
'journal = {Journal of Fisheries and Aquatic Science}, ' ...
'volume = {3(4)}, ' ...
'pages = {252-260}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RimMoha2011'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s11160-011-9202-1}, ' ...
'author = {Zouari-Ktari Rim and Bradai Mohamed-Nejmeddine}, ' ... 
'year = {2011).}, ' ...
'title = {Reproductive biology of the lessepsian Reticulated leatherjacket \emph{Stephanolepis diaspros}({F}raser-{B}r\"{u}nner, 1940) in the {G}ulf of {G}abes ({E}astern {M}editerranean {S}ea)}, ' ...
'journal = {JRev Fish Biol Fisheries}, ' ...
'volume = {21(3)}, ' ...
'pages = {641–648}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{hhttp://www.fishbase.se/summary/Stephanolepis-diaspros.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
