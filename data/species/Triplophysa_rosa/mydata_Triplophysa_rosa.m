  function [data, auxData, metaData, txtData, weights] = mydata_Triplophysa_rosa

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Nemacheilidae';
metaData.species    = 'Triplophysa_rosa'; 
metaData.species_en = 'Cave crested loach'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFcc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 12];

%% set data
% zero-variate data
data.tp = 4.8*365;      units.tp = 'd';  label.tp = 'age at puberty';               bibkey.tp = 'XuJing2023';
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16*365;   units.am = 'd';  label.am = 'life span';                        bibkey.am = 'XuJing2023';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.1;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'XuJing2023'; 
data.Li = 23.4;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'XuJing2023';
  comment.Li = 'this is asymptotic length, max observed length is 15.8 cm';

data.Wwb = 2.7e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: 4/3*pi*0.04^3';
 
data.Ri = 1180/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';         bibkey.Ri = 'guess';
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
3.290	4.766
3.396	4.476
3.644	5.348
3.732	3.873
3.750	4.720
3.751	4.357
3.856	5.664
3.873	5.132
4.050	4.890
4.085	5.253
4.174	5.592
4.227	3.899
4.244	4.770
4.315	5.254
4.333	5.714
4.421	6.077
4.422	5.545
4.545	6.271
4.546	4.046
4.563	4.844
4.580	5.352
4.651	4.989
4.669	5.691
4.739	5.159
4.828	7.676
4.863	6.200
4.881	5.184
4.898	7.458
4.951	6.031
4.969	5.838
5.057	5.281
5.181	5.984
5.199	5.209
5.252	5.282
5.305	5.887
5.429	7.218
5.464	7.606
5.482	6.735
5.535	5.961
5.536	5.138
5.623	6.542
5.800	7.534
5.801	6.422
5.802	6.760
5.817	6.059
5.906	7.317
6.012	6.495
6.082	6.955
6.153	7.850
6.171	8.044
6.224	7.706
6.225	5.939
6.295	9.182
6.296	8.819
6.297	8.432
6.454	6.134
6.471	6.811
6.489	6.618
6.630	7.465
6.683	9.957
6.684	8.917
6.825	7.466
6.842	6.619
6.913	7.321
6.966	6.983
7.090	7.249
7.231	8.193
7.478	9.017
7.479	7.517
7.532	7.977
7.549	7.154
7.797	8.244
7.973	10.930
8.168	8.536
8.186	11.415
8.504	8.441
8.521	9.529
8.822	8.514
9.175	9.967
9.299	9.678
9.440	10.864
9.476	10.404
9.493	9.340
10.200	11.060
10.784	10.651
10.907	12.345
10.996	12.007
11.968	10.995
12.197	12.036
15.785	14.325];
data.tL (:,1) = (.5 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'XuJing2023';

% length-weight
data.LWw_f = [ ... % total length (cm), wet weight (g)
3.850	0.466
3.869	0.133
3.945	0.217
4.001	0.425
4.134	0.051
4.210	0.301
4.285	0.633
4.361	0.468
4.494	0.343
4.532	0.260
4.626	0.676
4.645	0.344
4.720	0.884
4.740	0.344
4.795	1.217
4.853	0.677
4.929	0.345
4.966	0.885
5.061	0.719
5.174	0.927
5.194	0.304
5.232	0.512
5.250	1.219
5.420	0.928
5.421	0.388
5.591	0.721
5.647	1.303
5.667	0.389
5.704	0.888
5.856	1.013
5.912	1.262
5.913	0.805
5.950	0.847
6.158	0.972
6.688	1.099
6.726	1.390
6.801	1.847
6.990	1.723
7.122	2.430
7.122	1.973
7.217	2.264
7.349	2.348
7.445	1.642
7.462	2.930
7.519	2.348
7.576	2.764
7.671	1.933
7.748	1.393
7.783	3.222
7.880	1.560
7.917	1.976
7.918	1.768
7.973	2.641
8.144	2.683
8.201	2.351
8.238	3.223
8.409	2.476
8.560	3.058
8.824	3.516
8.937	3.683
9.240	4.058
9.636	4.849
9.996	4.725
10.524	6.348
10.789	6.141
10.882	7.595
11.035	6.640
11.394	6.974
11.995	10.549
12.317	10.052
14.282	13.217];
units.LWw_f = {'cm', 'g'}; label.LWw_f  = {'total length', 'wet weight'};  
bibkey.LWw_f = 'XuJing2023';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % total length (cm), wet weight (g)
5.818	0.639
5.893	1.262
6.158	1.346
6.215	0.765
6.271	1.430
6.367	0.890
6.441	2.012
6.442	1.223
6.460	1.638
6.498	1.472
6.556	0.932
6.744	1.639
6.783	0.975
6.895	1.889
6.972	1.266
6.991	1.432
7.180	1.682
7.501	1.725
7.690	1.975
9.240	3.725
9.863	4.849
10.469	4.519
11.999	7.392];
units.LWw_m = {'cm', 'g'}; label.LWw_m = {'total length', 'wet weight'};  
bibkey.LWw_m = 'XuJing2023';
comment.LWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 2 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to not differ from females but am might be smaller';
D2 = 'Max total length and weight are substantially smaller than asymptotic length and weight';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'cavefish endemic to the groundwater environment in Wulong County, Chongqing, China';
metaData.bibkey.F1 = 'XuJing2023'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '58YT7'; % Cat of Life
metaData.links.id_ITIS = '688275'; % ITIS
metaData.links.id_EoL = '206936'; % Ency of Life
metaData.links.id_Wiki = 'Triplophysa_rosa'; % Wikipedia
metaData.links.id_ADW = 'Triplophysa_rosa'; % ADW
metaData.links.id_Taxo = '43977'; % Taxonomicon
metaData.links.id_WoRMS = '154373'; % WoRMS
metaData.links.id_fishbase = 'Triplophysa-rosa'; % fishbase

%% References
bibkey = 'XuJing2023'; type = 'Article'; bib = [ ... 
'doi = {10.21203/rs.3.rs-3384289/v1}, ' ...
'author = {Yuan Xu and Yangyang Jing and Jing Zhou and Rui Long and Juanzhu Meng and Ya Yang and Yiping Luo}, ' ...
'year = {2023}, ' ...
'title = {Age, growth, and energy storage of the cavesh \emph{Triplophysa rosa}}, ' ... 
'journal = {Research Square}, ' ...
'howpublished = {\ulr{https://assets.researchsquare.com/files/rs-3384289/v1/f48d5b6c-c258-4b4b-be56-4f473abdd467.pdf?c=1696516910}}, '...
'pages = {1-19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Triplophysa-rosa}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
