function [data, auxData, metaData, txtData, weights] = mydata_Eulimnadia_braueriana
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Spinicaudata'; 
metaData.family     = 'Limnadiidae';
metaData.species    = 'Eulimnadia_braueriana'; 
metaData.species_en = 'Clam shrimp'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'Hha'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L_T'; 'L-N'; 'T-ab'; 'T-ap'; 'T-am'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 25]; 

%% set data
% zero-variate data

data.Lp  = 0.33;  units.Lp = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'HuanChou2015';
data.Li  = 0.8;  units.Li = 'cm';  label.Li  = 'ultimate carapace length';   bibkey.Li  = 'HuanChou2015';

data.Wwb  = 3.6e-6; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'Belk1972';
  comment.Wwb = 'based on egg diameter of 200-210 mum of Eulimnadia antlei, but that probably includes the ridges: pi/6*190e-4^3';
data.Wwi  = 0.0471;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on foto length 0.777 cm, height 0.5 cm, thickness 0.15 cm: pi/4*0.8*0.5*0.15; uncertain because of water in carapace';
 
% uni-variate data

% time-length
data.tL_30 = [ ... % time since birth (d), length (cm)
0.000	0.020
0.975	0.059
1.769	0.107
3.016	0.229
4.036	0.287
5.057	0.308
6.077	0.281
6.984	0.296
7.778	0.363
9.025	0.373
10.159	0.382
10.952	0.396
12.086	0.378
13.107	0.403
14.014	0.430
14.921	0.436
16.168	0.393
16.961	0.447
17.755	0.409
18.776	0.424
19.796	0.439
20.930	0.435
22.857	0.234
26.939	0.297];
units.tL_30 = {'d', 'cm'}; label.tL_30 = {'time since birth', 'carapace length', '30 C'};  
temp.tL_30 = C2K(30); units.temp.tL_30 = 'K'; label.temp.tL_30 = 'temperature';
bibkey.tL_30 = 'HuanChou2015';
%
data.tL_25 = [ ... % time since birth (d), length (cm)
1.012	0.045
2.364	0.086
2.921	0.137
4.048	0.171
5.051	0.261
6.061	0.310
8.208	0.344
9.107	0.383
10.123	0.402
11.036	0.371
12.058	0.354
13.194	0.344
14.099	0.350
14.889	0.365
16.248	0.369
16.808	0.403
17.837	0.356
19.190	0.393
19.870	0.393
21.117	0.389
21.676	0.432
22.707	0.368
23.943	0.423
24.964	0.419
25.982	0.429
26.900	0.368
28.032	0.374
28.819	0.409
30.062	0.425
30.966	0.439
31.987	0.433
33.008	0.429
34.027	0.431];
units.tL_25 = {'d', 'cm'}; label.tL_25 = {'time since birth', 'carapace length', '25 C'};  
temp.tL_25 = C2K(25); units.temp.tL_25 = 'K'; label.temp.tL_25 = 'temperature';
bibkey.tL_25 = 'HuanChou2015';
%
data.tL_20 = [ ... % time since birth (d), length (cm)
1.709	0.051
2.963	0.055
3.989	0.063
4.900	0.090
6.040	0.118
6.952	0.133
8.091	0.161
9.003	0.194
10.028	0.233
11.054	0.239
12.194	0.250
13.105	0.276
13.903	0.295
15.043	0.311
15.954	0.309
16.866	0.336
17.778	0.344
18.917	0.346
20.057	0.358
21.083	0.337
22.108	0.352
23.248	0.370
23.932	0.409
24.957	0.339
26.097	0.384
27.236	0.354
27.806	0.512
28.946	0.374
30.199	0.397
30.997	0.427
32.137	0.431
33.276	0.442];
units.tL_20 = {'d', 'cm'}; label.tL_20 = {'time since birth', 'carapace length', '20 C'};  
temp.tL_20 = C2K(20); units.temp.tL_20 = 'K'; label.temp.tL_20 = 'temperature';
bibkey.tL_20 = 'HuanChou2015';
%
data.tL_15 = [ ... % time since birth (d), length (cm)
2.720	0.039
4.079	0.053
5.099	0.070
6.119	0.072
7.252	0.063
8.159	0.069
9.065	0.057
10.085	0.073
11.105	0.078
12.125	0.114
12.918	0.094
13.938	0.104
14.958	0.162
15.977	0.174
17.110	0.225
18.130	0.213
18.810	0.235
19.943	0.233
21.190	0.262
22.210	0.245
23.116	0.278
24.249	0.291
25.156	0.309
26.289	0.358
27.195	0.344
28.215	0.327
28.895	0.338
30.142	0.335
30.935	0.352
32.181	0.364
32.975	0.389
34.108	0.376
35.127	0.356
36.034	0.364
37.054	0.372
37.960	0.370
38.980	0.386
40.000	0.421];
units.tL_15 = {'d', 'cm'}; label.tL_15 = {'time since birth', 'carapace length', '15 C'};  
temp.tL_15 = C2K(15); units.temp.tL_15 = 'K'; label.temp.tL_15 = 'temperature';
bibkey.tL_15 = 'HuanChou2015';

% length-reprod rate
data.LN = [ ... % carapace length (cm), brood szie (#)
0.302	4.886
0.308	4.893
0.338	18.058
0.366	13.038
0.384	17.604
0.384	6.998
0.386	11.545
0.405	20.153
0.406	12.578
0.408	16.116
0.420	20.675
0.427	15.632
0.445	29.794
0.452	27.276
0.453	30.813
0.468	31.334
0.498	67.733
0.548	22.838
0.549	83.446
0.598	101.683
0.598	95.622
0.599	93.098
0.649	113.356
0.699	119.978
0.799	127.665];
units.LN = {'cm', '#'}; label.LN = {'carapace length', 'brood size'};  
temp.LN = C2K(25); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'HuanChou2015';

% temperature-age at birth, time since hatch at puberty-life span
data.Tabtpam = [ ... temperature (d), age at hatch (d), time since hatch at puberty (d), life span (d)
    15  5.8 18.3 21.5
    20  2.7 11.9 17.1
    25  1.6  7.4 17.8
    30  1.7  5.3 19.5];
units.Tabtpam = {'C','d'}; label.Tabtpam = {'temperature', 'time'};  
bibkey.Tabtpam = 'HuanChou2015'; units.treat.Tabtpam = '-'; label.treat.Tabtpam = 'time';
treat.Tabtpam = {1 {'age at hatch','time since hatch at puberty','life span'}};

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.tL_30(end-1:end) = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_30','tL_25','tL_20','tL_15'}; subtitle1 = {'Data for 30, 25, 20, 15 C'};
metaData.grp.sets = {set1}; 
metaData.grp.subtitle = {subtitle1}; txtData.label.sets = {'temperature'};

% %% Discussion points
% D1 = '';   
% metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'BKFN2'; % Cat of Life
metaData.links.id_ITIS = '1204950'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Eulimnadia'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '33137'; % Taxonomicon
metaData.links.id_WoRMS = '1598360'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eulimnadia}}';
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
bibkey = 'HuanChou2015'; type = 'Article'; bib = [ ... 
'author = {Wan-Ping Huang and Lien-Siang Chou}, ' ... 
'year = {2015}, ' ...
'title = {TEMPERATURE EFFECT ON DEVELOPMENT AND REPRODUCTION OF THE ANDRODIOECIOUS CLAM SHRIMP, \emph{Eulimnadia braueriana} ({B}RANCHIOPODA: {S}PINICAUDATA)}, ' ...
'journal = {Journal of crustacean biology}, ' ...
'volume = {35(3)}, ' ...
'pages = {330-338}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Belk1972'; type = 'Article'; bib = [ ... 
'doi = {10.2307/3670065}, '...
'author = {Denton Belk}, ' ... 
'year = {1972}, ' ...
'title = {The Biology and Ecology of \emph{Eulimnadia antlei} {M}ackin ({C}onchostraca)}, ' ...
'journal = {The Southwestern Naturalist}, ' ...
'volume = {16(3-4)}, ' ...
'pages = {297–305}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

