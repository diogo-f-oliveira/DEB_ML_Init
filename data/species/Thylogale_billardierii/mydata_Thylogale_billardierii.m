function [data, auxData, metaData, txtData, weights] = mydata_Thylogale_billardierii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Macropodidae';
metaData.species    = 'Thylogale_billardierii'; 
metaData.species_en = 'Tasmanian pademelon'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 07]; 

%% set data
% zero-variate data

data.tg = 29;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Wiki: 58 d';
data.tx = 202;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 435;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8.8*365;    units.am = 'd';      label.am = 'life span';          bibkey.am = 'AnAge';   
  temp.am = C2K(35.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.42; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwx = 1029; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';    bibkey.Wwx = 'AnAge';
data.Wwi = 5000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'AnAge';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 litter per yr; 1 pup per litter';

% univariate data

% time-weight
data.tWw = [ ... % time since birth (wk), weight (kg)
4.885	0.010
6.154	0.037
8.690	0.074
9.773	0.047
11.046	0.111
12.308	0.074
15.021	0.075
16.112	0.129
17.383	0.175
17.560	0.139
19.011	0.175
19.013	0.193
20.293	0.321
20.476	0.339
21.194	0.285
21.198	0.321
23.224	0.658
23.383	0.458
23.386	0.485
24.104	0.430
24.108	0.467
24.127	0.649
24.845	0.594
25.226	0.776
25.735	0.467
26.127	0.740
26.292	0.594
26.864	0.867
27.049	0.903
27.573	0.731
27.749	0.685
28.508	1.013
28.520	1.122
28.525	1.167
28.874	1.049
29.416	1.049
29.759	0.877
29.978	1.222
30.123	0.895
30.710	1.304
30.718	1.377
31.224	1.040
31.605	1.213
31.607	1.231
32.582	1.886
33.105	1.704
33.784	1.295
34.201	1.804
34.395	1.923
34.540	1.595
35.983	1.559
36.221	2.086
37.295	1.978
38.049	2.259
39.157	2.469
39.868	2.360
40.218	2.251
41.690	2.478
42.618	2.696
43.876	2.615
44.433	2.751
44.957	2.579
45.344	2.815
45.897	2.906
46.966	2.761
48.111	3.306
49.072	3.834
49.741	3.325
49.912	3.234
50.124	3.525
50.806	3.143
52.087	3.279
53.090	4.189
53.543	3.361
54.264	3.334
55.216	3.780
56.290	3.671
57.042	3.935
57.081	4.298
58.274	3.617
60.105	3.826
62.090	3.781
62.173	4.544
64.872	4.417
65.893	3.827
69.895	4.036
70.157	4.782
73.577	4.628];
data.tWw(:,1) = data.tWw(:,1) * 7;
units.tWw  = {'d', 'kg'};  label.tWw = {'time', 'weight'};  
temp.tWw  = C2K(35.9);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'RoseMcCa1982';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 10 * weights.tWw;
weights.Wwi = 3 * weights.Wwi;
weights.Wwx = 0 * weights.Wwx;

%% set weights for all real data
weights = setweights(data, []);

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

%% Links
metaData.links.id_CoL = '56Q7H'; % Cat of Life
metaData.links.id_ITIS = '552755'; % ITIS
metaData.links.id_EoL = '128431'; % Ency of Life
metaData.links.id_Wiki = 'Thylogale_billardierii'; % Wikipedia
metaData.links.id_ADW = 'Thylogale_billardierii'; % ADW
metaData.links.id_Taxo = '60386'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000302'; % MSW3
metaData.links.id_AnAge = 'Thylogale_billardierii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thylogale_billardierii}}';
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
bibkey = 'RoseMcCa1982'; type = 'Article'; bib = [ ... 
'author = {R. W. Rose and D. J. McCartney}, ' ... 
'year = {1982}, ' ...
'title = {Growth  of  the  Red-Bellied  Pademelon, \emph{Thylogale  billardierii}, and Age  Estimation of Pouch Young}, ' ...
'journal = {Aust. Wildl. Res.}, ' ...
'volume = {9}, ' ...
'pages = {33-38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Thylogale_billardierii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

