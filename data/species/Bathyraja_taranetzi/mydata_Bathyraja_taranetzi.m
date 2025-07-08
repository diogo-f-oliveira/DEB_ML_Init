function [data, auxData, metaData, txtData, weights] = mydata_Bathyraja_taranetzi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Bathyraja_taranetzi'; 
metaData.species_en = 'Mud skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(1.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 14];

%% set data
% zero-variate data;
data.ab = 1.8*365;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(1.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'ShelPanc2022';   
  temp.am = C2K(1.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 15;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'ShelPanc2022';
data.Lp = 59.1;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'ShelPanc2022';
data.Lpm = 50.3;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'ShelPanc2022';
data.Li = 70;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase'; 

data.Wwi = 1.83e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00380*Li^3.08, see F1';

data.Ri  = 5/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(1.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.231	17.244
1.698	21.920
1.720	19.814
2.272	22.384
2.525	29.517
2.633	24.019
3.100	27.993
3.521	39.687
3.525	30.213
3.567	31.032
3.738	27.873
4.182	36.057
4.184	29.975
4.290	31.963
4.821	36.053
4.863	35.001
4.926	39.796
5.795	47.510
5.947	38.620
6.477	44.816
6.753	45.165
6.776	41.071
6.862	39.784
6.986	50.076
7.412	47.851
7.433	47.968
7.647	45.978
7.750	53.931
7.816	49.954
7.900	51.123
8.115	45.040
8.222	44.805
8.391	48.430
8.815	50.299
9.007	51.351
9.175	56.730
9.390	49.009
9.498	45.383
9.622	56.961
9.750	54.387
10.110	59.414
10.474	52.044
10.640	64.207
11.194	62.917
11.220	50.870
11.367	55.313
11.494	55.897
11.941	57.064
12.047	57.415
13.023	65.128
13.025	60.216
13.556	61.149
13.874	64.772
13.981	63.368
14.151	64.069
14.257	64.887
14.301	61.261
14.302	59.741
14.639	66.873
14.852	67.106
16.322	61.132
16.469	67.330
17.556	61.359
17.684	62.528
17.790	61.709
18.150	66.034
18.194	62.291
18.491	65.213
19.364	62.284];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(1.7); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ShelPanc2022'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.296	15.027
1.295	17.361
2.038	22.035
2.783	23.317
2.951	27.409
3.292	26.472
3.971	31.380
4.079	26.584
4.291	28.688
4.504	27.985
4.695	29.387
4.887	29.035
5.163	30.554
5.608	36.751
6.181	39.320
6.946	42.123
7.096	39.549
7.627	40.949
8.096	40.245
8.136	47.847
8.261	55.215
8.647	46.674
9.221	47.373
10.093	47.251
10.348	49.705
10.373	39.179
10.710	48.534
11.114	48.063
11.177	49.584
11.286	43.267
11.495	53.792
11.560	49.815
12.006	52.970
12.028	52.035
12.091	53.789
12.111	56.479
12.305	51.214
12.388	55.074
12.579	57.645
12.580	55.189
12.729	54.955
12.792	57.410
12.815	51.328
12.900	53.199
13.048	55.070
13.068	59.163
13.111	57.058
13.134	52.145
13.198	51.560
13.282	54.951
13.303	56.004
13.432	52.728
13.451	57.290
13.556	62.318
13.579	57.523
13.686	56.236
13.836	52.375
13.878	55.299
13.941	56.585
14.050	48.865
14.070	53.777
14.173	62.081
14.197	53.893
14.325	52.255
14.408	60.325
14.409	55.880
14.557	60.324
14.687	54.007
14.707	55.645
14.770	58.217
14.942	53.889
15.089	59.502
15.174	57.981
15.344	60.085
15.897	60.550
15.921	53.065];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to 
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(1.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ShelPanc2022'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouping
set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00380*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'KXVK'; % Cat of Life
metaData.links.id_ITIS = '160939'; % ITIS
metaData.links.id_EoL = '46560776'; % Ency of Life
metaData.links.id_Wiki = 'Bathyraja_taranetzi'; % Wikipedia
metaData.links.id_ADW = 'Bathyraja_taranetzi'; % ADW
metaData.links.id_Taxo = '163728'; % Taxonomicon
metaData.links.id_WoRMS = '271528'; % WoRMS
metaData.links.id_fishbase = 'Bathyraja-taranetzi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathyraja_taranetzi}}';  
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
bibkey = 'ShelPanc2022'; type = 'Article'; bib = [ ...
'doi = {10.1134/S0032945222060285}, ' ...
'author = {V. A. Shelekhova and V. V. Panchenkoa and V. A. Parensky}, ' ...
'year = {2022}, ' ...
'title  = {Age and Growth of the Mud Skate \emph{Bathyraja taranetzi} ({A}rhynchobatidae) of the {N}orthern {K}uril {I}slands}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {62(7)}, ' ...
'pages = {1332–1342}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bathyraja-taranetzi.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
