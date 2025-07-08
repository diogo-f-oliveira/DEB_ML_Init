function [data, auxData, metaData, txtData, weights] = mydata_Hystrix_africaeaustralis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Hystricidae';
metaData.species    = 'Hystrix_africaeaustralis'; 
metaData.species_en = 'Cape porcupine';

metaData.ecoCode.climate = {'BWk', 'BWh', 'BSk', 'BSh', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTh', '0iTg', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHr', 'xiHw'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Starrlight Augustine'};    
metaData.date_mod_1 = [2016 11 14];              
metaData.email_mod_1    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address_mod_1  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2016 11 14]; 

%% set data
% zero-variate data

data.tg = 93.5;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Aard1987';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from AnAge, HaimAard1990 gives 38 C';
data.tx = 4*30.5; units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 23*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 70;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';
  comment.Li = '63-80 cm';

data.Wwb = 350;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Aard1987';
  comment.Wwb = '300-400 g';
data.Wwi = 12e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '11-20 kg, till 30 kg';

data.Ri  = 4*1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
1.294	533.857
2.203	757.203
3.312	930.803
4.224	1328.061
5.536	1600.982
6.243	1799.540
7.157	2345.866
8.269	2668.534
9.379	2891.823
10.092	3438.205
11.302	3611.777
12.216	4133.258
13.327	4406.236
14.137	4753.833
15.049	5151.091
16.165	5722.205
17.474	5821.214
18.373	5448.290
19.092	6367.341
20.188	5745.914
21.296	5844.980
22.311	6416.122
23.030	7285.484
24.245	7757.191
25.445	7384.181
26.154	7657.273
26.954	7383.755
28.067	7805.801
29.076	8004.274
30.183	8053.651
31.002	8898.140
32.206	8723.887
33.317	9021.710
34.115	8599.125
35.127	8996.355
36.337	9194.771
37.340	9020.574
38.151	9393.016
40.271	9864.468
41.175	9839.367
42.283	9913.589
42.996	10435.127
44.208	10732.921
45.306	10260.562
46.115	10508.780
47.127	10881.166
48.135	11054.794
49.233	10532.745
49.946	11079.127
51.038	10209.254
52.058	11053.686
53.071	11500.605
54.170	11102.779
54.679	11425.617
55.985	11350.714
56.695	11723.185
58.000	11598.592
58.708	11821.995
59.910	11498.675
61.108	11026.286
61.822	11622.358
62.929	11622.046
64.136	11646.550
64.947	12018.992
65.942	11397.593
66.947	11372.464
68.178	12763.421
68.955	11148.295
69.997	13309.491
70.984	12191.200
71.986	11992.159
72.997	12290.011
74.087	11320.759
74.784	10898.202
76.208	11866.744
77.022	12437.943
78.100	10698.508
78.992	9952.914
80.014	10921.570
81.229	11393.277
82.232	11243.925
82.830	10920.775
84.256	12013.540
85.175	12783.467
86.062	11714.894
87.171	11888.493
88.188	12583.858
88.885	12136.457
90.285	11688.856];
data.tW(:,1) = 7 * data.tW(:,1); % convert weeks to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Aard1987';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 10; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7VHZY'; % Cat of Life
metaData.links.id_ITIS = '584680'; % ITIS
metaData.links.id_EoL = '326520'; % Ency of Life
metaData.links.id_Wiki = 'Hystrix_africaeaustralis'; % Wikipedia
metaData.links.id_ADW = 'Hystrix_africaeaustralis'; % ADW
metaData.links.id_Taxo = '63383'; % Taxonomicon
metaData.links.id_MSW3 = '13400050'; % Mammal Spec World
metaData.links.id_AnAge = 'Hystrix_africaeaustralis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hystrix_africaeaustralis}}';
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
bibkey = 'Aard1987'; type = 'Article'; bib = [ ... 
'author = {Aarde, R. L. van}, ' ... 
'year = {1987}, ' ...
'title = {Pre- and postnatal growth of the {C}ape porcupine \emph{Hystrix africaeaustralis}}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {211}, ' ...
'pages = {25--33}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaimAard1990'; type = 'Article'; bib = [ ... 
'author = {Haim, A. and Aarde, R. J. van and Skinner, J. D.}, ' ... 
'year = {1990}, ' ...
'title = {Metabolism and thermoregulation in the {C}ape porcupine, \emph{Hystrix africaeaustralis}}, ' ...
'journal = {Physiol. Zool.}, ' ...
'volume = {63}, ' ...
'pages = {795--802}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hystrix_africaeaustralis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

