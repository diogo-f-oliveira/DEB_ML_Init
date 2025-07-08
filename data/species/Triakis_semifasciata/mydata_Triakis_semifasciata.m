function [data, auxData, metaData, txtData, weights] = mydata_Triakis_semifasciata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Triakis_semifasciata'; 
metaData.species_en = 'Leopard shark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biSvm'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 10 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 15];


%% set data
% zero-variate data

data.ab = 365;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'ADW';   
  temp.ab = C2K(12.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 30*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(12.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 20;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Wiki'; 
  comment.Lb = '30 to 36  cm';
data.Lp  = 110;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'KushSmit1992'; 
data.Lpm  = 100; units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'KushSmit1992'; 
data.Li  = 160;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'KushSmit1992';

data.Wwb = 28.3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on 0.00305*Lb^3.05, see F3';
data.Wwp = 5.13e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00305*Lp^3.05, see F3';
data.Wwpm = 3.84e3;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';      bibkey.Wwpm = 'fishbase';
  comment.Wwpm = 'based on 0.00305*Lpm^3.05, see F3';
data.Wwi = 16.1e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00305*Lim^3.05, see F3';
 
data.Ri  = 29/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(12.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

 % uni-variate data
 
% time-length data 
data.tL = [ ... % time since birth (yr), total length (cm)
0.017	22.404
1.003	37.148
1.043	38.993
1.984	45.829
1.990	53.473
3.076	44.492
3.089	62.153
3.091	65.316
3.110	38.429
4.144	64.770
5.016	83.470
5.076	58.955
5.106	46.302
5.106	47.092
5.118	62.381
5.119	63.699
5.119	64.753
5.120	65.807
5.121	67.125
5.122	68.707
5.123	69.761
5.124	70.815
5.125	73.188
5.130	78.987
5.135	86.894
5.155	60.271
5.175	87.948
5.995	88.724
5.996	90.306
6.031	83.979
6.032	86.088
6.060	71.326
6.062	73.962
6.069	82.660
6.096	67.108
6.098	68.953
6.131	61.572
6.142	76.860
6.144	79.232
6.146	81.077
6.944	105.841
6.991	63.666
6.992	64.984
7.002	78.163
7.003	79.481
7.003	80.535
7.005	82.380
7.013	93.451
7.034	68.409
7.036	72.363
7.040	77.108
7.046	85.543
7.047	86.861
7.048	87.651
7.050	90.814
7.057	100.304
7.117	76.052
8.017	80.254
8.019	81.835
8.025	90.007
8.026	91.325
8.050	71.291
8.061	85.788
8.062	87.106
8.062	87.897
8.072	101.077
8.073	102.395
8.074	103.712
8.092	76.035
8.106	94.750
9.002	92.362
9.036	85.771
9.042	93.943
9.046	99.742
9.053	109.758
9.072	82.344
9.073	83.926
9.082	96.051
9.108	77.862
9.944	101.307
9.954	113.960
9.959	121.604
9.967	79.165
9.980	96.035
10.010	84.700
10.011	85.491
10.102	102.886
10.103	104.731
10.954	95.227
11.005	111.042
11.009	117.104
11.022	80.465
11.033	96.807
11.076	101.024
11.964	88.619
11.965	89.937
11.966	91.255
11.966	92.310
11.997	80.184
12.091	102.060
12.927	125.505
12.982	93.346
13.004	123.395
13.007	127.613
13.009	130.248
13.010	131.830
13.028	103.362
13.031	107.052
13.984	130.231
13.986	133.131
14.001	100.972
14.056	122.586
15.040	133.639
15.080	135.748
15.102	112.287
16.013	130.986
16.070	101.727
16.079	114.115
16.943	122.272
16.980	119.635
17.028	131.496
18.045	135.168
18.052	144.921
18.063	106.700
19.004	114.064
19.014	126.716
19.102	140.158
19.119	110.635
19.995	134.343
20.029	128.544
22.010	115.856
22.959	133.500
24.053	136.381];
data.tL(:,1) = 365*data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
temp.tL    = C2K(12.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'KushSmit1992';
comment.tL = 'sexes combined; aged using band pairs in vertebrae';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwi = 5 * weights.Wwi;
weights.Li = 5 * weights.Li;
weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'Relatively poor fit might be due to cannibalism among neonates in mother''s belly, meaning that kap is too low';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Ovoviparity (aplacental viviparity)';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Preferred temp 12.4 C, usually 0 - 156 m deep';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Ww (in g) = 0.00305*(TL in cm)^3.05';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '5859B'; % Cat of Life
metaData.links.id_ITIS = '160448'; % ITIS
metaData.links.id_EoL = '46560018'; % Ency of Life
metaData.links.id_Wiki = 'Triakis_semifasciata'; % Wikipedia
metaData.links.id_ADW = 'Triakis_semifasciata'; % ADW
metaData.links.id_Taxo = '106557'; % Taxonomicon
metaData.links.id_WoRMS = '279060'; % WoRMS
metaData.links.id_fishbase = 'Triakis-semifasciata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Triakis_semifasciata}}';
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
bibkey = 'KushSmit1992'; type = 'Article'; bib = [ ... 
'author = {David I. Kusher and Susan E. Smith and Gregor M. Cailliet}, ' ... 
'year = {1992}, ' ...
'title = {Validated age and growth of the leopard shark, \emph{Triakis semifasciuta}, with comments on reproduction}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {35}, ' ...
'pages = {187-203}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Triakis-semifasciata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Triakis_semifasciata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

