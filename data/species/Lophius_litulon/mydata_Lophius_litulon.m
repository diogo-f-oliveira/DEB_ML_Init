  function [data, auxData, metaData, txtData, weights] = mydata_Lophius_litulon
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lophiiformes'; 
metaData.family     = 'Lophiidae';
metaData.species    = 'Lophius_litulon'; 
metaData.species_en = 'Yellow goosefish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE','MPSE','MIN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 11];

%% set data
% zero-variate data
data.am = 30*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(17.4);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 54.6;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Lpm = 32.5;   units.Lpm = 'cm';  label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'fishbase'; 
data.Li = 150;   units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  
data.Wwb = 1.6e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fisbase';
  comment.Wwb = 'based on egg diameter of 0.67 mm of Lophius piscatorius: pi/6*0.067^3';
data.Wwi = 47.7e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01413*Li^3.00, see F1; max published weight 3.5 kg';

data.Ri = 1.6e6/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(17.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... since since hatch (d), total length (cm)
1.897	20.649
1.921	18.626
1.998	21.324
2.857	29.152
2.931	24.028
2.933	31.716
2.955	22.679
2.979	19.847
3.006	25.107
3.007	26.861
3.940	29.564
3.941	31.453
3.942	34.015
3.966	30.643
3.967	32.262
4.015	28.081
5.026	36.450
5.027	38.743
5.100	33.214
5.151	35.102
5.932	35.512
5.934	41.716
5.956	32.545
5.983	36.996
5.984	37.805
6.967	41.319
6.968	43.342
7.067	39.431
7.924	41.056
7.975	43.484
8.001	45.372
8.054	50.902
8.984	47.402
9.010	49.830
9.013	58.327
9.037	53.202
9.061	50.774
10.019	52.399
10.045	54.557
10.951	51.596
11.002	54.429
11.907	50.254
12.034	52.548
12.035	53.627
12.111	56.325
12.992	54.307
13.015	49.992
13.016	52.419
13.017	55.521
13.018	57.005
14.028	64.700];
data.tL_f(:,1) = (0+data.tL_f(:,1))*365;  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth','total length','females'}; 
temp.tL_f = C2K(17.4); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SunZhan2021'; 
%
data.tL_m = [ ... since since hatch (d), total length (cm)
1.897	21.863
1.947	20.649
2.880	22.139
2.982	27.670
2.983	29.558
3.006	24.028
3.007	25.782
3.008	26.591
3.865	31.587
3.889	26.732
3.891	32.936
3.914	28.081
3.964	25.248
3.965	29.699
3.989	24.439
4.068	34.690
5.880	30.926
5.956	32.950
5.982	34.703
5.983	36.996
5.984	37.671
6.008	35.513
6.110	39.560
6.940	37.407
6.991	38.217
6.992	39.701
7.019	45.770
7.094	44.017
7.874	42.674
8.001	44.023
8.052	45.507
8.077	46.991
8.985	49.560
8.986	50.774
10.016	45.655
10.947	41.481
11.001	50.518
11.982	48.906
12.010	56.594
12.059	52.143];
data.tL_m(:,1) = (0+data.tL_m(:,1))*365;  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth','total length','males'}; 
temp.tL_m = C2K(17.4); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SunZhan2021'; 

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
18.149	63.162
21.695	109.568
23.677	217.243
25.867	271.196
27.014	516.988
27.640	256.011
27.744	340.475
29.518	340.645
29.622	455.818
31.186	363.837
31.708	709.377
31.708	563.504
32.751	870.706
32.855	486.838
34.524	609.839
36.193	717.485
36.297	594.654
36.819	940.194
37.862	779.066
38.070	1047.799
38.801	848.253
40.156	1262.971
40.156	902.126
40.991	1009.692
41.930	1055.847
41.930	956.039
41.930	871.586
42.451	933.057
43.286	1363.079
44.120	1140.511
45.372	1417.022
45.580	1271.169
47.666	1931.638
51.213	2692.055
51.421	2477.104
51.421	2369.618
52.881	2477.244
52.881	2277.628
54.446	3122.308
58.514	3483.543];    
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length','weight','females'}; 
bibkey.LW_f = 'SunZhan2021'; 
%
data.LW_m = [ ... % total length (cm), weight (g)
18.149	47.807
20.026	32.632
20.860	101.810
21.069	201.638
21.904	55.845
22.008	124.953
23.051	209.506
23.155	125.063
23.468	140.448
23.781	286.351
25.033	117.566
25.241	217.393
25.658	286.531
25.971	378.692
26.597	171.458
26.910	332.717
27.119	463.255
27.849	263.709
27.849	163.901
28.266	471.043
28.370	378.922
28.683	225.401
28.996	309.884
29.413	432.765
29.622	540.271
30.352	363.757
30.561	478.941
30.561	601.781
30.561	240.937
31.186	317.772
31.708	571.181
31.708	409.953
31.917	287.132
32.229	486.778
32.647	340.945
32.855	648.067
32.855	402.385
33.168	532.933
33.794	609.769
34.003	755.663
34.211	433.226
34.211	356.450
34.837	702.000
35.150	571.512
35.463	609.929
35.463	464.056
35.880	847.973
36.402	786.603
36.506	510.221
36.714	694.502
37.132	587.057
37.757	863.508
38.070	756.053
38.175	656.255
38.488	994.097
39.426	909.734
39.635	702.460
41.095	856.151
42.347	1163.373
44.224	1025.357
44.329	1370.857
44.746	1117.538];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length','weight','males'}; 
bibkey.LW_m = 'SunZhan2021'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;

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
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only ';
metaData.discussion = struct('D1',D1);  
                                 
%% Facts
F1 = 'length-weight Ww in g = 0.01413*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3W2MC'; % Cat of Life
metaData.links.id_ITIS = '690538'; % ITIS
metaData.links.id_EoL = '46566110'; % Ency of Life
metaData.links.id_Wiki = 'Lophius_litulon'; % Wikipedia
metaData.links.id_ADW = 'Lophius_litulon'; % ADW
metaData.links.id_Taxo = '179104'; % Taxonomicon
metaData.links.id_WoRMS = '272600'; % WoRMS
metaData.links.id_fishbase = 'Lophius-litulon'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lophius_litulon}}';  
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
bibkey = 'SunZhan2021'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00343-019-9216-4}, ' ...
'author = {Yu Sun and Chi Zhang and Yongjun Tian and Yoshiro Watanabe}, ' ...
'year = {2021}, ' ...
'title = {Age, growth, and mortality rate of the yellow goosefish \emph{Lophius litulon} ({J}ordan, 1902) in the {Y}ellow {S}ea}, ' ... 
'journal = {Journal of Oceanology and Limnology}, ' ...
'volume = {39(2)}, '...
'pages = {732-740}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lophius-litulon.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
