function [data, auxData, metaData, txtData, weights] = mydata_Gambusia_affinis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Poeciliidae';
metaData.species    = 'Gambusia_affinis'; 
metaData.species_en = 'Mosquitofish'; 

metaData.ecoCode.climate = {'Am', 'Af', 'Cfa'};
metaData.ecoCode.ecozone = {'TP','THn','TN','TA'};
metaData.ecoCode.habitat = {'0iFm','0iFp'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'aR_T'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri_T'}; 
metaData.data_1     = {'t-Ww_Tf'}; 

metaData.COMPLETE = 3.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 07 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   


metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 30]; 

%% set data
% zero-variate data

data.ab = 22;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';   
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '16-28 d';
data.tR20= 189;  units.tR20 = 'd';    label.tR20 = 'time since birth at first reprod';  bibkey.tR20 = 'VondWurt1988';   
  temp.tR20 = C2K(20);  units.temp.tR20 = 'K'; label.temp.tR20 = 'temperature'; 
data.tR25= 74;  units.tR25 = 'd';    label.tR25 = 'time since birth at first reprod';  bibkey.tR25 = 'VondWurt1988';   
  temp.tR25 = C2K(25);  units.temp.tR25 = 'K'; label.temp.tR25 = 'temperature'; 
data.tR30= 56;  units.tR30 = 'd';    label.tR30 = 'time since birth at first reprod';  bibkey.tR30 = 'VondWurt1988';   
  temp.tR30 = C2K(30);  units.temp.tR30 = 'K'; label.temp.tR30 = 'temperature'; 
data.tpm= 53;  units.tpm = 'd';    label.tpm = 'time since birth at puberty';  bibkey.tpm = 'Wiki';   
  temp.tpm = C2K(27.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
  comment.tpm = '43-62 d';
data.am = 3 * 365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.7; units.Lb  = 'cm';  label.Lb = 'total length at birth';                bibkey.Lb  = 'BeadGino2008';  
  comment.Lb = '6 to 8 mm for Gambusia holbrooki';
data.Lp  = 2; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'VondWurt1988';
  comment.Lp = '17 to 20 mm';
data.Lpm  = 2.5; units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for male';  bibkey.Lpm  = 'BeadGino2008';
  comment.Lpm = 'value for Gambusia holbrooki';
data.Li  = 7; units.Li  = 'cm';  label.Li  = 'ultimate total length for female';       bibkey.Li  = 'Wiki';
data.Lim = 4; units.Lim = 'cm';  label.Lim = 'ultimate total length for male';        bibkey.Lim = 'Wiki';

data.Wwb = 3.1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = {'BeadGino2008','fishbase'};
  comment.Wwb = 'based on 0.00977*Lb^3.18, see F2';
data.WwR20 = 0.28;  units.WwR20 = 'g';  label.WwR20 = 'wet weight of female at first reprod'; bibkey.WwR20 = 'VondWurt1988';
  temp.WwR20 = C2K(20);  units.temp.WwR20 = 'K'; label.temp.WwR20 = 'temperature'; 
data.WwR25 = 0.52;  units.WwR25 = 'g';  label.WwR25 = 'wet weight of female at first reprod'; bibkey.WwR25 = 'VondWurt1988';
  temp.WwR25 = C2K(25);  units.temp.WwR25 = 'K'; label.temp.WwR25 = 'temperature'; 
data.WwR30 = 0.53;  units.WwR30 = 'g';  label.WwR30 = 'wet weight of female at first reprod'; bibkey.WwR30 = 'VondWurt1988';
  temp.WwR30 = C2K(30);  units.temp.WwR30 = 'K'; label.temp.WwR30 = 'temperature'; 
data.Wwi = 3.37;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00794*Li^3.11, see F2';
data.Wwim = 0.59; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00794*Lim^3.11, see F2';

data.Ri20  = 16/224;  units.Ri20  = '#/d'; label.Ri20  = 'maximum reprod rate';  bibkey.Ri20  = 'VondWurt1988';   
  temp.Ri20 = C2K(20);  units.temp.Ri20 = 'K'; label.temp.Ri20 = 'temperature';
data.Ri25  = 275/224;  units.Ri25  = '#/d'; label.Ri25  = 'maximum reprod rate';  bibkey.Ri25  = 'VondWurt1988';   
  temp.Ri25 = C2K(25);  units.temp.Ri25 = 'K'; label.temp.Ri25 = 'temperature';
data.Ri30  = 425/224;  units.Ri30  = '#/d'; label.Ri30  = 'maximum reprod rate';  bibkey.Ri30  = 'VondWurt1988';   
  temp.Ri30 = C2K(30);  units.temp.Ri30 = 'K'; label.temp.Ri30 = 'temperature';

% uni-variate data
  
% time - length data for females
% high temperature
data.tWw_30h = [ ...6.325	0.026
13.069	0.061
21.057	0.117
28.839	0.170
35.557	0.187
42.894	0.211
50.009	0.221
57.095	0.209
63.859	0.260
71.389	0.277];
units.tWw_30h = {'d', 'cm'}; label.tWw_30h = {'time since birth','wet weight', 'female, high food, 30 C'};  
temp.tWw_30h = C2K(30);  units.temp.tWw_30h = 'K'; label.temp.tWw_30h = 'temperature';
bibkey.tWw_30h = 'VondWurt1988';
comment.tWw_30h = 'Data for females, high food, high temperature';
%
data.tWw_30m = [ ...
6.922	0.017
13.651	0.042
20.996	0.072
28.141	0.104
35.251	0.111
42.560	0.114
49.481	0.131
57.253	0.176
64.131	0.161
71.653	0.172];
units.tWw_30m = {'d', 'cm'}; label.tWw_30m = {'time since birth','wet weight', 'female, med food, 30 C'};  
temp.tWw_30m = C2K(30);  units.temp.tWw_30m = 'K'; label.temp.tWw_30m = 'temperature';
bibkey.tWw_30m = 'VondWurt1988';
comment.tWw_30m = 'Data for females, medium food, high temperature';
%
data.tWw_30l = [ ...
6.920	0.016
14.047	0.035
21.159	0.042
28.276	0.054
35.415	0.082
42.733	0.092
49.652	0.107
57.001	0.140
64.279	0.121
70.981	0.125];
units.tWw_30l = {'d', 'cm'}; label.tWw_30l = {'time since birth','wet weight', 'females. low food, 30 C'};  
temp.tWw_30l = C2K(30);  units.temp.tWw_30l = 'K'; label.temp.tWw_30l = 'temperature';
bibkey.tWw_30l = 'VondWurt1988';
comment.tWw_30l = 'Data for females, low food, high temperature';
% medium temperature
data.tWw_25h = [ ...
6.646	0.022
14.505	0.050
21.738	0.059
28.191	0.084
35.454	0.117
42.730	0.158
49.608	0.201
56.592	0.175
63.246	0.201
70.321	0.241];
units.tWw_25h = {'d', 'cm'}; label.tWw_25h = {'time since birth','wet weight', 'female, high food, 25 C'};  
temp.tWw_25h = C2K(25);  units.temp.tWw_25h = 'K'; label.temp.tWw_25h = 'temperature';
bibkey.tWw_25h = 'VondWurt1988';
comment.tWw_25h = 'Data for females, high food, medium temperature';
%
data.tWw_25m = [ ...
7.042	0.018
14.290	0.038
21.325	0.050
28.164	0.064
34.997	0.075
42.252	0.100
49.105	0.125
56.561	0.151
63.988	0.156
70.822	0.166];
units.tWw_25m = {'d', 'cm'}; label.tWw_25m = {'time since birth','wet weight', 'female, med food, 25 C'};  
temp.tWw_25m = C2K(25);  units.temp.tWw_25m = 'K'; label.temp.tWw_25m = 'temperature';
bibkey.tWw_25m = 'VondWurt1988';
comment.tWw_25m = 'Data for females, medium food, medium temperature';
%
data.tWw_25l = [ ...
7.237	0.014
13.670	0.025
21.300	0.031
28.531	0.038
35.368	0.052
42.800	0.060
49.428	0.067
56.052	0.070
63.488	0.081
70.532	0.099];
units.tWw_25l = {'d', 'cm'}; label.tWw_25l = {'time since birth','wet weight', 'female, low food, 25 C'};  
temp.tWw_25l = C2K(25);  units.temp.tWw_25l = 'K'; label.temp.tWw_25l = 'temperature';
bibkey.tWw_25l = 'VondWurt1988';
comment.tWw_25l = 'Data for females, low food, medium temperature';
% low temperature
data.tWw_20h = [ ...
6.473	0.013
13.948	0.021
21.025	0.033
27.690	0.039
34.757	0.044
42.419	0.041
49.290	0.050
55.967	0.065
63.239	0.072
70.321	0.088];
units.tWw_20h = {'d', 'cm'}; label.tWw_20h = {'time since birth','wet weight', 'female, high food, 20 C'};  
temp.tWw_20h = C2K(20);  units.temp.tWw_20h = 'K'; label.temp.tWw_20h = 'temperature';
bibkey.tWw_20h = 'VondWurt1988';
comment.tWw_20h = 'Data for females, high food, low temperature';
%
data.tWw_20m = [ ...
6.472	0.012
13.742	0.017
20.816	0.028
27.479	0.032
34.545	0.036
41.821	0.047
49.080	0.044
55.745	0.050
63.204	0.046
70.074	0.055];
units.tWw_20m = {'d', 'cm'}; label.tWw_20m = {'time since birth','wet weight', 'female, med food, 20 C'};  
temp.tWw_20m = C2K(20);  units.temp.tWw_20m = 'K'; label.temp.tWw_20m = 'temperature';
bibkey.tWw_20m = 'VondWurt1988';
comment.tWw_20m = 'Data for females, medium food, low temperature';
%
data.tWw_20l = [ ...
6.068	0.012
13.938	0.013
20.600	0.017
27.662	0.018
34.526	0.022
42.001	0.030
49.061	0.030
56.134	0.039
63.197	0.041
70.057	0.042];
units.tWw_20l = {'d', 'cm'}; label.tWw_20l = {'time since birth','wet weight', 'female, low food, 20 C'};  
temp.tWw_20l = C2K(20);  units.temp.tWw_20l = 'K'; label.temp.tWw_20l = 'temperature';
bibkey.tWw_20l = 'VondWurt1988';
comment.tWw_20l = 'Data for females, low food, low temperature';

% time -weight
data.tWw_30 = [ ...
6.894	0.049
14.080	0.120
20.432	0.176
27.613	0.240
34.515	0.296
41.419	0.356
48.058	0.432
55.565	0.570
62.977	0.570
69.594	0.612
77.023	0.638
83.676	0.732
90.888	0.841
96.989	0.931
104.268	1.137
111.923	1.092
118.307	1.193
125.198	1.235
132.702	1.370
139.293	1.373
145.956	1.482
153.132	1.538
160.023	1.580
167.509	1.689
173.854	1.734
181.820	1.741
188.711	1.782
195.045	1.812];
units.tWw_30 = {'d', 'cm'}; label.tWw_30 = {'time since birth','wet weight', 'female, 30 C'};  
temp.tWw_30 = C2K(30);  units.temp.tWw_30 = 'K'; label.temp.tWw_30 = 'temperature';
bibkey.tWw_30 = 'VondWurt1988';
comment.tWw_30 = 'Data for females, high temperature';
%
data.tWw_25 = [ ...
 9.351	0.030
14.303	0.045
21.474	0.094
27.279	0.154
34.986	0.184
42.155	0.229
49.336	0.293
55.711	0.383
62.610	0.435
70.019	0.432
76.397	0.525
83.866	0.608
90.231	0.683
98.761	0.713
104.813	0.732
111.448	0.799
119.219	0.923
125.258	0.923
133.291	1.028
139.120	1.122
146.063	1.238
153.757	1.250
160.594	1.212
167.765	1.261
174.397	1.325
181.575	1.385
189.031	1.448
195.329	1.426
202.469	1.430
209.914	1.478
216.802	1.516
224.294	1.632];
units.tWw_25 = {'d', 'cm'}; label.tWw_25 = {'time since birth','wet weight', 'female, 25 C'};  
temp.tWw_25 = C2K(25);  units.temp.tWw_25 = 'K'; label.temp.tWw_25 = 'temperature';
bibkey.tWw_25 = 'VondWurt1988';
comment.tWw_25 = 'Data for females, medium temperature';
%
data.tWw_20 = [ ...
8.530	0.034
14.013	0.023
20.883	0.034
27.479	0.045
34.909	0.071
42.046	0.071
49.181	0.068
55.782	0.086
62.394	0.120
69.810	0.128
76.948	0.128
83.536	0.128
90.129	0.135
97.831	0.158
104.158	0.176
111.831	0.158
119.281	0.214
126.098	0.146
133.012	0.221
139.023	0.180
146.992	0.191
153.064	0.240
161.287	0.221
167.341	0.244
174.776	0.278
181.888	0.240
188.776	0.278
195.919	0.285
203.082	0.323
210.224	0.330
216.802	0.315
223.952	0.334];
units.tWw_20 = {'d', 'cm'}; label.tWw_20 = {'time since birth','wet weight', 'female, 20 C'};  
temp.tWw_20 = C2K(20);  units.temp.tWw_20 = 'K'; label.temp.tWw_20 = 'temperature';
bibkey.tWw_20 = 'VondWurt1988';
comment.tWw_20 = 'Data for females, low temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri20 = 0 * weights.Ri20;
weights.Lp = 0 * weights.Lp;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_30h','tWw_30m','tWw_30l'}; subtitle1 = {'Data for high, medium, low food at 30 C'};
set2 = {'tWw_25h','tWw_25m','tWw_25l'}; subtitle2 = {'Data for high, medium, low food at 25 C'};
set3 = {'tWw_20h','tWw_20m','tWw_20l'}; subtitle3 = {'Data for high, medium, low food at 20 C'};
set4 = {'tWw_30','tWw_25','tWw_20'}; subtitle4 = {'Data for 30, 25, 20 C'};
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Very low reproduction at 20 C could not be explained';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'ovoviviparous, not viviparous, so reproduction is by eggs';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'leight-weight: Ww (in g) = 0.00794*(TL in cm)^3.11';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6K97T'; % Cat of Life
metaData.links.id_ITIS = '165878'; % ITIS
metaData.links.id_EoL = '46566797'; % Ency of Life
metaData.links.id_Wiki = 'Gambusia_affinis'; % Wikipedia
metaData.links.id_ADW = 'Gambusia_affinis'; % ADW
metaData.links.id_Taxo = '44573'; % Taxonomicon
metaData.links.id_WoRMS = '159325'; % WoRMS
metaData.links.id_fishbase = 'Gambusia-affinis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gambusia_affinis}}';
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
bibkey = 'VondWurt1988'; type = 'Article'; bib = [ ... 
'author = {Bruce Vondracek and Wayne A. Wurtsbaugh and Joseph J. Cech}, ' ... 
'year = {1988}, ' ...
'title = {Growth and reproduction of the mosquitofish, \emph{Gambusia affinis}, in relation to temperature and ration level: consequences for life history}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {21}, ' ...
'pages = {45-57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChenXion2018'; type = 'Article'; bib = [ ... 
'author = {Yu Cheng and Wen Xiong and Juan Tao and Dekui He and Kang Chen and Yifeng Chen}, ' ... 
'year = {2018}, ' ...
'title = {Life-history traits of the invasive mosquitofish (\emph{Gambusia affinis} {B}aird and {G}irard, 1853) in the central {Y}angtze {R}iver, {C}hina}, ' ...
'journal = {BioInvasions Records}, ' ...
'volume = {7}, ' ...
'pages = {309-318}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Gambusia-affinis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BeadGino2008'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2008.02101.x}, ' ...
'author = {R. Beadouin and V. Ginot and G. Monod}, ' ... 
'year = {2008}, ' ...
'title = {Growth characteristics of eastern mosquitofish \emph{Gambusia holbrooki} in a northern habitat ({B}rittany, {F}rance)}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {73}, ' ...
'pages = {2468-2484}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

