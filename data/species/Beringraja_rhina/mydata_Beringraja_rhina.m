function [data, auxData, metaData, txtData, weights] = mydata_Beringraja_rhina

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Beringraja_rhina'; 
metaData.species_en = 'Longnose skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW', 'MASW', 'MPNE', 'MPSE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2017 07 23];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};                             
metaData.date_mod_1     = [2017 11 11];                          
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 11]; 

%% set data
% zero-variate data;
data.ab = 1.7*365;units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps for all data are guessed';
data.tp = 8*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females';   bibkey.tp = 'Zein1991';
  temp.tp = C2K(6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 5*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Zein1991';
  temp.tpm = C2K(6); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 26*365; units.am = 'd';    label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(6);  units.temp.am = 'K'; label.temp.am = 'temperature';

% fishbase: Egg capsules are 9.4-13.0 cm long and 5.7-7.7 cm wide 
data.Lb  = 0.12 * 180;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'guess';
  comment.Lb = 'guess based on same relative length, compared to Raja clavata: 0.12 * 180 cm';
data.Lp  = 70;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'Zein1991';
data.Lpm  = 60;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'Zein1991';
data.Li  = 180;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';
 
data.Ri  = 82/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
data.tL = [ ... % time since birth (yr), total length (cm)
1.970	30.537
1.971	33.219
1.972	35.096
1.991	41.801
1.992	43.946
2.985	35.613
2.987	39.636
2.987	40.977
2.989	45.268
3.974	61.878
3.975	63.487
3.976	66.973
3.983	39.617
3.988	53.295
3.989	54.636
3.989	56.781
3.990	58.391
4.002	45.785
4.003	47.662
4.004	51.417
4.987	60.249
4.988	61.858
4.988	63.199
4.989	66.149
4.990	68.027
4.990	69.099
5.000	49.253
5.000	50.057
5.001	51.398
5.001	53.544
5.012	83.582
5.014	42.011
5.026	73.658
5.936	69.350
5.936	70.691
5.937	71.763
5.965	56.475
5.966	58.889
5.967	60.498
5.967	60.498
5.967	61.571
5.968	64.790
5.968	65.326
5.971	72.567
5.971	72.835
5.973	77.663
5.973	78.199
5.974	80.077
5.974	81.150
5.974	82.222
5.992	85.172
6.922	87.032
6.939	88.909
6.949	68.257
6.949	69.062
6.962	57.529
6.963	59.943
6.965	67.184
6.967	71.475
6.968	73.889
6.968	75.230
6.969	76.839
6.975	93.199
6.982	66.111
6.988	82.471
6.988	83.544
7.964	73.870
7.964	74.406
7.965	75.211
7.965	75.479
7.965	77.088
7.968	85.403
7.979	67.433
7.980	70.651
7.984	83.257
7.986	88.889
7.987	91.034
7.988	94.253
8.000	79.233
8.000	79.502
8.000	80.306
8.006	97.471
8.992	66.341
8.994	72.241
8.994	72.778
8.995	75.191
8.995	75.996
8.996	77.337
8.996	79.483
9.015	83.505
9.017	89.137
9.960	83.755
9.961	86.437
9.964	94.215
9.965	97.165
9.975	77.318
9.976	78.927
9.976	79.732
9.991	75.977
10.003	107.088
10.941	85.882
10.943	90.978
10.944	93.928
10.944	94.464
10.953	72.204
10.957	85.345
10.975	87.759
10.975	88.563
11.985	77.011
11.988	86.667
11.989	89.885
11.990	91.226
13.018	131.973];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};
temp.tL = C2K(6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Zein1991';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
30.198	104.477
34.604	235.075
35.786	365.671
35.793	208.954
39.681	522.387
39.699	156.715
42.056	548.507
44.093	522.387
45.452	496.268
46.301	496.268
47.476	757.462
47.839	261.193
48.158	679.104
49.501	992.536
49.681	783.582
51.223	470.149
52.224	835.821
52.231	679.104
52.895	992.536
55.463	522.387
55.939	1201.492
56.966	1018.656
58.144	1227.611
58.822	1253.731
60.009	1253.731
61.357	1462.685
62.378	1410.448
62.384	1279.850
63.035	1854.477
63.571	1305.970
63.695	2246.269
64.043	2063.433
64.373	2246.269
65.072	1828.358
65.916	1932.835
66.093	1776.119
66.251	2011.194
67.035	3343.283
67.082	2376.865
67.087	2272.387
67.765	2298.508
67.780	1985.074
68.456	2037.313
68.784	2272.387
68.789	2167.909
69.968	2350.747
71.179	1880.597
71.480	2664.179
71.850	2037.313
72.173	2376.865
72.319	2873.133
72.329	2664.179
72.504	2559.701
73.193	2350.747
73.512	2768.657
73.769	966.417
73.866	2455.223
74.031	2559.701
74.182	2951.493
74.365	2664.179
74.682	3134.328
75.706	3003.732
76.395	2794.776
76.541	3291.044
76.554	3029.850
77.902	3212.686
78.422	3003.732
78.556	3735.074
78.562	3604.478
79.598	3238.806
80.083	3735.074
80.265	3473.881
80.274	3291.044
81.040	4988.805
81.068	4414.179
81.614	3656.717
82.276	3996.268
82.290	3708.956
82.774	4231.342
83.016	2742.537
83.265	4597.015
83.278	4335.820
83.463	4022.388
84.657	3891.791
85.289	4858.209
85.354	3526.118
85.654	4335.820
85.958	5067.164
86.632	5171.641
87.971	5537.313
88.066	3578.357
89.062	4048.507
89.394	4205.223
89.713	4623.134
91.367	5511.194
92.372	5772.388
93.725	5876.865
94.932	5485.074
94.942	5276.119
95.229	6347.014
97.409	6895.522
98.138	5850.746
106.998	8619.403
132.423	12720.149];
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Zein1991';


%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '6WRBW'; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '160851'; % ITIS
metaData.links.id_EoL = '59030932'; % Ency of Life
metaData.links.id_Wiki = 'Beringraja_rhina'; % Wikipedia
metaData.links.id_ADW = 'Raja_rhina'; % ADW
metaData.links.id_Taxo = '185729'; % Taxonomicon
metaData.links.id_WoRMS = '1461133'; % WoRMS
metaData.links.id_fishbase = 'Raja-rhina'; % fishbase
metaData.links.id_AnAge = 'Raja_rhina'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Beringraja_rhina}}';   
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
bibkey = 'Zein1991'; type = 'Phdthesis'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {S. J. Zeiner}, ' ...
'year = {1991}, ' ...
'title  = {GROWTH CHARACTERISTICS AND ESTIMATES OF AGE AT MATURITY OF TWO SPECIES OF SKATES (\emph{Raja binoculata} AND \emph{Raja rhina}) FROM {M}ONTEREY {B}AY, {C}ALIFORNIA}, ' ...
'school = {California State University, Stanislaus and Moss Landing Marine Laboratories}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Raja_rhina}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Raja_rhina/}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Summary/SpeciesSummary.php?ID=2566&AT=Raja+dlugonosa}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];