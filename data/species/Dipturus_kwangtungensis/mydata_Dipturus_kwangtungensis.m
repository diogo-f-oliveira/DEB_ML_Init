function [data, auxData, metaData, txtData, weights] = mydata_Dipturus_kwangtungensis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Dipturus_kwangtungensis'; 
metaData.species_en = 'Kwangtung skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW','MPSE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 20];

%% set data
% zero-variate data;
data.ab = 1*365; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(18.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'JounChen2015';   
  temp.am = C2K(18.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 5.9;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'JounChen2015';
data.Lp  = 50.4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';   bibkey.Lp  = 'guess';
  comment.Lp = 'based on Dipturus chinensis 55.3*75.7/83.1';
data.Li  = 75.7; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwp = 962;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00282*Lp^3.25';
data.Wwi = 3.6e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00282*Li^3.25';

data.Ri  = 30/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Dipturus chinensis: 40*(75.7/83.1)^3';

% uni-variate data at f
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.952	15.068
1.267	12.329
1.384	13.151
1.402	15.753
1.441	17.671
1.478	20.822
1.769	26.301
1.828	25.890
1.947	23.836
2.102	26.027
2.144	20.548
2.400	18.493
2.418	20.822
3.356	24.247
3.377	22.192
3.591	23.973
3.899	35.205
4.022	24.247
4.100	25.342
4.137	29.041
4.192	37.260
4.199	23.562
4.213	35.342
4.312	31.781
4.333	30.274
4.336	22.466
4.368	37.945
4.413	25.890
4.564	38.082
4.701	37.945
4.719	41.644
4.728	23.425
4.838	37.534
4.935	39.041
4.975	37.123
5.116	29.315
5.170	40.411
5.190	38.082
5.427	33.699
5.504	37.945
5.621	37.671
5.702	33.425
5.816	39.178
5.975	34.932
5.992	39.726
6.183	49.452
6.210	35.479
6.387	34.521
6.405	36.438
6.421	43.562
6.517	48.219
6.538	45.068
6.559	42.329
6.733	46.849
6.790	49.589
6.871	44.795
6.929	47.123
6.932	39.726
7.048	44.384
7.181	50.822
7.189	35.342
7.281	47.945
7.282	45.479
7.324	39.315
7.380	46.027
7.634	46.301
7.653	48.082
7.832	42.603
7.906	50.822
7.911	41.370
7.926	49.726
7.950	40.411
7.988	43.836
8.125	44.110
8.205	39.041
8.221	47.260
8.732	43.151
8.806	51.644
9.084	44.384
9.181	47.397
9.999	55.753
11.600	64.521
12.929	70.959];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(18.4); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JounChen2015';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.581	13.425
0.599	17.123
0.774	18.904
0.776	14.658
0.971	16.301
1.205	19.726
1.459	19.178
1.494	27.397
1.656	16.712
1.672	23.836
1.693	21.370
1.714	18.219
1.753	20.137
1.851	19.726
1.891	17.123
1.967	22.192
2.434	28.493
2.530	31.233
2.568	34.658
2.573	25.342
2.588	33.288
2.709	25.616
2.790	20.411
2.867	24.521
2.886	25.616
3.025	21.918
3.101	25.890
3.161	22.466
3.215	32.192
3.279	21.233
3.648	27.945
3.726	29.589
3.920	31.918
4.039	30.822
4.039	30.000
4.465	39.726
4.467	36.438
4.485	38.082
4.503	42.466
4.503	42.192
4.506	35.068
4.543	41.233
4.646	30.137
4.776	44.110
4.821	32.877
4.898	34.247
4.939	30.822
4.978	31.918
4.998	30.137
5.017	32.877
5.169	41.644
5.172	35.205
5.313	27.123
5.346	40.137
5.367	36.164
5.445	37.260
5.480	45.342
5.488	30.685
5.500	46.438
5.604	32.192
5.695	46.438
5.723	30.000
5.752	50.548
5.773	48.082
5.795	43.699
5.816	40.959
5.896	37.534
5.937	33.288
5.974	37.260
6.070	41.370
6.192	32.877
6.251	31.233
6.271	30.411
6.402	42.466
6.408	29.726
6.442	41.507
6.541	38.082
6.751	50.822
6.771	48.767
6.811	48.082
6.813	42.466
6.814	40.411
6.952	38.767
7.033	34.110
7.166	43.288
7.226	39.589
7.229	33.562
7.303	42.466
7.306	36.712
7.416	52.603
7.425	33.562
7.439	45.068
7.747	55.479
7.787	53.014
7.788	51.644
7.789	50.274
7.809	48.493
8.026	46.712
8.187	36.438
8.282	41.781
8.359	45.479
8.361	40.959
8.454	51.233
8.549	56.575
8.765	55.616
8.787	50.822
8.843	56.849
9.046	43.151
9.240	45.479
9.262	40.548
9.435	46.575
9.486	63.288
9.740	64.110
9.937	62.877
10.257	48.904
13.597	65.479];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(18.4); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JounChen2015';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00282*(TL in cm)^3.25';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '36R3V'; % Cat of Life
metaData.links.id_ITIS = '564174'; % ITIS
metaData.links.id_EoL = '46560489'; % Ency of Life
metaData.links.id_Wiki = 'Dipturus'; % Wikipedia
metaData.links.id_ADW = 'Dipturus_kwangtungensis'; % ADW
metaData.links.id_Taxo = '173276'; % Taxonomicon
metaData.links.id_WoRMS = '271551'; % WoRMS
metaData.links.id_fishbase = 'Dipturus-kwangtungensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dipturus}}'; 
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
bibkey = 'JounChen2015'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0025315415001307}, ' ...
'author = {Shoou-Jeng Joung and Chien-Chi Chen and Kwang-Ming Liu and Tzu-Chi Hsieh}, ' ...
'year = {2015}, ' ...
'title  = {Age and growth estimates of the {K}wangtungskate \emph{Dipturus kwangtungensis} in the waters of northern {T}aiwan}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {96(7)}, ' ...
'pages = {1395–1402}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Dipturus-kwangtungensis.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

