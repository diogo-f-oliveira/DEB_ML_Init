function [data, auxData, metaData, txtData, weights] = mydata_Microtus_cabrerae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Microtus_cabrerae'; 
metaData.species_en = 'Cabrera vole'; 

metaData.ecoCode.climate = {'BSk', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg', '0iTht'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Susana Maia'};    
metaData.date_subm = [2013 04 16];              
metaData.email    = {'susana.m.maia@ist.utl.pt'};            
metaData.address  = {'Instituto Superior Tcnico, Lissabon'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 10 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Starrlight Augustine'};    
metaData.date_mod_2 = [2016 11 14];              
metaData.email_mod_2    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address_mod_2  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2016 11 14]; 

%% set data
% zero-variate data

data.tg = 24;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'FernGarc2001';   
  temp.tg = C2K(36.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from MathKlun2003';
data.tx = 19;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Value taken from M. oeconomus, which has the same max body weight';
data.tp = 39;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tx = 'Value taken from M. oeconomus, which has the same max body weight';
data.am = 4.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(36.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Wiki for M. arvalis';

data.Lb  = 3.98;   units.Lb  = 'cm';  label.Lb  = 'body length at birth';   bibkey.Lb  = 'FernGarc2001';
data.Lx  = 7.3;   units.Lx  = 'cm';  label.Lx  = 'body length at weaning'; bibkey.Lx  = 'FernGarc2001';
data.Li  = 11.25;   units.Li  = 'cm';  label.Li  = 'ultimate body length';   bibkey.Li  = 'FernGarc2001';

data.Wwb = 3.47;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'FernGarc2001';
%data.Wwx = 12;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'FernGarc2001';
data.Wwi = 55.45;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'FernGarc2001';

data.Ri  = 0.04;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'FernGarc2001';   
  temp.Ri = C2K(36.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (d), head-body lenght (mm)
0	42.264
0	43.552
0	40.977
0	36.585
0	37.928
0	39.486
1.15	47.482
1.15	46.331
1.15	45.111
1.15	41.046
1.15	42.333
1.15	43.688
1.15	39.487
1.15	37.726
3	50.872
3	52.092
3	43.758
3	45.181
3	46.536
3	48.026
3	49.449
5.1	47.554
5.1	49.112
5.1	50.738
5.1	51.89
5.1	53.449
5.1	45.996
5.1	44.031
7	51.892
7	53.383
7	54.873
7	56.161
7	57.448
7	59.142
7	62.056
9.1	55.892
9.1	57.857
9.1	60.567
9.1	63.277
9.1	59.28
9.1	61.922
11	67.954
11	65.108
11	66.463
11	61.924
11	63.482
12.3	66.194
12.3	68.023
12.3	61.993
13	71.683
13	73.444
13	69.921
13	67.956
14.3	72.022
14.3	73.445
14.3	69.99
15.1	68.093
15.1	75.547
15.1	76.631
15.1	73.921
17.1	85.237
17.1	76.971
17.1	73.855
17.1	75.481
17.1	78.53
17.1	80.224
17.1	81.985
18.15	88.152
18.15	85.306
18.15	91.201
18.15	80.157
18.15	83.138
18.15	76.092
19.25	76.16
19.25	80.7
19.25	82.191
20.2	89.916
20.2	92.084
20.2	96.014
21.1	79.888
21.1	86.8
21.1	85.038
21.1	88.426
22	92.628
22	91.137
22	88.901
23	81.516
23	83.143
23	84.701
23	86.463
23	87.75
23	89.851
23	91.68
23	93.306
23	98.185
23	96.084
24	89.58
24	91.41
25.054	93.579
25.148	87.074
25.149	88.701
25.15	90.191
25.151	91.953
26.043	96.019
26.047	102.049
26.095	98.865
26.096	100.356
27.127	91.887
27.128	93.31
27.18	97.104
29	84.977
29.007	95.344
29.053	91.414
29.055	93.718
29.06	101.375
29.102	89.924
29.107	97.241
29.108	99.681
29.111	103.949
30.936	99.073
31.032	94.804
31.033	96.837
31.08	92.975
33.094	98.224
33.1	108.108
33.137	94.949
33.138	96.617
33.14	100.015
33.141	102.054
33.143	103.845
33.144	105.637
34.987	100.017
34.988	101.314
35.031	98.225
35.073	94.828
35.074	96.496
37.102	97.98
37.109	108.421
37.111	110.892
37.153	106.938
37.196	103.046
39.039	98.723
39.041	101.998
39.085	100.268
39.128	96.994
41.073	108.98
41.167	115.035
41.256	113.181
42.144	95.019
42.191	97.923
42.193	100.332
42.196	104.904
42.239	102.309
44.138	113.122
44.231	116.891
44.232	118.559
48.055	110.964
48.097	106.207
49.082	98.176
49.087	105.59
49.095	117.081
49.096	118.378
49.097	120.169
49.129	101.142
49.131	103.242
49.134	107.443
53.148	116.219
53.15	120.173
56.07	108.5
56.071	110.23
56.114	107.017
56.155	100.036
56.158	105.72
59.05	120.302
59.087	106.958
59.091	113.012
59.094	117.893
63.999	111.163
64.042	108.94
64.086	107.024
64.14	120.245
64.183	118.083
65.164	102.145
65.169	110.361
65.213	108.632
70.13	120.189
70.173	118.026
72.059	109.009
72.105	110.491
72.148	106.785
77.103	108.272
77.112	122.172
77.149	110.187
77.15	111.484
77.151	113.152
77.156	119.948
77.192	106.789];
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'head-body length'};  
temp.tL    = C2K(36.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FernGarc2001';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
% weights.psd.t_0 = 0.1;


%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7VV7Q'; % Cat of Life
metaData.links.id_ITIS = '632858'; % ITIS
metaData.links.id_EoL = '1179636'; % Ency of Life
metaData.links.id_Wiki = 'Microtus_cabrerae'; % Wikipedia
metaData.links.id_ADW = 'Microtus_cabrerae'; % ADW
metaData.links.id_Taxo = '62682'; % Taxonomicon
metaData.links.id_MSW3 = '13000252'; % Mammal Spec World

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microtus_cabrerae}}';
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
bibkey = 'FernGarc2001'; type = 'Article'; bib = [ ... 
'author = {Fernadez-Salvador, R and Garcia-Perea, R. and Ventura, J.}, ' ... 
'year = {2001}, ' ...
'title = {Reproduction and postnatal growth of the {C}acrera vole, \emph{Microtus cabrera}, in captivity.}, ' ...
'journal = {Can. J. Zool.}, ' ...
'volume = {79}, ' ...
'pages = {2080--2085}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MathKlun2003'; type = 'Article'; bib = [ ... 
'author = {Mathias, M. and Klunder, M. and Santos, S. M.}, ' ... 
'year = {2003}, ' ...
'title = {Metabolism and thermoregulation in the {C}abrera vole ({R}odentia: \emph{Microtus cabrerae})}, ' ...
'journal = {Comp. Biochem. Physiol. A}, ' ...
'volume = {136}, ' ...
'pages = {441--446}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Microtus_oeconomus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

