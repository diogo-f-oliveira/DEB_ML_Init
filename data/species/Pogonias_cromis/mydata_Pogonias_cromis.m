function [data, auxData, metaData, txtData, weights] = mydata_Pogonias_cromis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Pogonias_cromis'; 
metaData.species_en = 'Black drum'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.5); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author         = {'Bas Kooijman'};    
metaData.date_subm      = [2019 01 27];              
metaData.email          = {'bas.kooijman@vu.nl'};            
metaData.address        = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 43*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(23.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.2;    units.Lj  = 'cm';  label.Lj  = 'total length at metam';  bibkey.Lj  = 'Rich2005';
data.Lp  = 64.5;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 170;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 5.3e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Rich2005';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 51.8e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.Ri = 7e6/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(23.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.90';
 
% uni-variate data

% time-length
data.tL_f = [ ... % yr class (yr), total length (cm)
1.333	22.491
1.333	21.809
1.334	19.991
1.353	23.627
1.373	25.217
2.294	33.603
2.295	32.239
2.297	26.330
2.305	31.330
2.306	29.966
2.306	29.285
2.307	27.921
2.309	22.694
2.314	35.194
3.229	33.580
3.230	31.989
3.247	39.261
3.248	37.670
3.248	36.988
3.249	35.852
3.249	35.397
3.255	46.761
3.255	44.715
3.256	43.579
3.257	41.306
3.277	42.669
4.195	59.010
4.197	52.873
4.198	51.510
4.199	49.010
4.200	47.191
4.200	45.828
4.204	35.828
4.205	34.237
4.209	49.918
4.221	44.464
4.222	42.418
4.222	41.736
4.223	40.600
4.223	39.691
4.224	37.873
5.146	43.531
5.164	50.122
5.165	46.712
5.179	38.985
5.179	37.848
5.180	36.712
5.191	34.212
7.088	42.573
7.095	52.573
7.095	51.209
7.096	50.073
7.096	48.709
7.097	47.573
8.049	55.731
8.056	63.230
8.061	50.730
8.062	49.367
8.062	48.003
8.063	47.094
8.063	45.957
8.064	44.139
8.066	39.821
8.067	37.094
8.085	42.775
8.085	41.866
9.003	58.206
9.016	52.297
9.025	54.342
9.037	50.933
9.038	48.887
9.038	47.751
9.052	39.114];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(23.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'OlseMcDo2018';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % yr class (yr), total length (cm)
1.351	22.165
1.351	24.201
1.361	21.034
2.297	27.821
2.298	29.179
2.309	31.215
2.319	32.798
2.319	33.703
2.330	33.930
2.330	35.513
3.244	33.477
3.248	47.731
3.254	34.608
3.255	36.192
3.258	48.862
3.259	51.124
3.266	38.228
3.266	39.133
3.266	40.717
3.277	40.943
3.277	42.074
3.277	43.658
3.278	46.373
4.228	63.568
4.230	34.382
4.232	42.527
4.233	44.111
4.233	44.789
4.233	45.016
4.233	46.373
4.234	47.731
4.234	48.862
4.235	52.029
4.237	61.079
4.242	41.170
4.245	50.898
4.252	37.323
4.252	39.133
5.187	38.455
5.187	39.586
5.210	47.731
5.210	49.993
5.218	41.848
6.166	52.934
7.131	48.183
8.075	44.111
8.077	53.387
8.078	55.423
8.086	48.183
8.089	58.817
8.097	49.767
8.097	51.124
8.097	51.803
8.098	52.708
9.039	40.038
9.045	63.341
9.053	54.518
9.062	49.088
9.063	51.577
9.064	55.423
9.064	57.007
9.065	58.364
9.065	59.269
10.005	42.753];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(23.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'OlseMcDo2018';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4KVBP'; % Cat of Life
metaData.links.id_ITIS = '169288'; % ITIS
metaData.links.id_EoL = '46579058'; % Ency of Life
metaData.links.id_Wiki = 'Pogonias_cromis'; % Wikipedia
metaData.links.id_ADW = 'Pogonias_cromis'; % ADW
metaData.links.id_Taxo = '184254'; % Taxonomicon
metaData.links.id_WoRMS = '159333'; % WoRMS
metaData.links.id_fishbase = 'Pogonias-cromis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pogonias_cromis}}';
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
bibkey = 'OlseMcDo2018'; type = 'Article'; bib = [ ... 
'author = {Zachary Olsen and Dusty McDonald and Britt Bumguardner}, ' ... 
'year = {2018}, ' ...
'title = {Intraspecific variation in life history strategies and implications for management: A case study of black drum (\emph{Pogonias cromis}) in the {U}pper {L}aguna {M}adre, {T}exas {U}{S}{A}}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {207}, ' ...
'pages = {55-62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rich2005'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {William J. Richards}, ' ...
'year = {2005}, ' ...
'title  = {Early Stages of Atlantic Fishes: An Identification Guide for the Western Central North Atlantic}, ' ...
'volume = {1}, ' ...
'publisher = {Taylor \& Francis}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Pogonias-cromis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

