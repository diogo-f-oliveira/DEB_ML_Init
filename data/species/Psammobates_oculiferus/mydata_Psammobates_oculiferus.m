function [data, auxData, metaData, txtData, weights] = mydata_Psammobates_oculiferus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Testudinidae';
metaData.species    = 'Psammobates_oculiferus'; 
metaData.species_en = 'Serrated tortoise'; 

metaData.ecoCode.climate = {'BWh','BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh', '0iTi'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Ri'}; 
metaData.data_1     = {'t-L','t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 09];

%% set data
% zero-variate data

data.am = 188*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Astrochelys radiata';
  
data.Lb = 2.0; units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'Kesw2012';
data.Lp = 9.0; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';   bibkey.Lp = 'Kesw2012';
data.Li = 15; units.Li = 'cm';   label.Li = 'ultimate carapace length';   bibkey.Li = 'Wiki';

data.Wwp = 150; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Kesw2012';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';       bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-2 eggs per clutch, probably 1-2 clutches per yr';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time  since birth (yr), length of carapace (cm)
1.828	3.940
5.767	7.342
6.900	5.771
8.052	6.594
9.097	6.061
9.208	8.083
9.210	8.216
9.210	8.323
9.967	7.497
10.164	8.295
10.827	7.682
11.975	8.027
11.977	8.213
12.082	9.437
12.095	11.113
12.924	7.334
12.948	10.314
12.954	11.059
13.143	10.953
13.995	10.047
14.007	11.537
14.188	10.340
15.150	11.296
15.154	11.829
15.714	10.258
15.815	10.950
15.910	10.843
16.000	10.231
16.003	10.604
16.007	11.056
16.014	11.907
16.105	11.402
16.202	11.561
16.303	12.253
16.868	11.348
16.953	9.991
16.962	11.108
17.143	9.964
17.157	11.693
17.162	12.359
17.925	12.251
17.927	12.517
18.013	11.320
18.111	11.666
18.113	11.958
18.973	12.037
19.057	10.654
19.058	10.760
19.059	10.920
19.060	11.053
19.065	11.612
19.245	10.308
19.256	11.665
20.105	10.440
20.113	11.398
20.120	12.302
20.121	12.435
20.211	11.717
21.079	12.887
21.161	11.290
21.167	12.008
21.252	10.678
21.257	11.370
21.261	11.769
21.922	10.970
22.123	12.247
22.214	11.661
23.266	11.900];
data.tL_f(:,1) = data.tL_f(:,1) * 365;
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Kesw2012';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time  since birth (yr), length of carapace (cm)
10.172	9.200
10.172	9.306
10.943	10.237
11.124	8.933
11.124	8.986
11.991	9.996
12.076	8.745
12.078	8.905
12.092	10.768
12.269	9.038
12.944	9.835
13.034	9.197
13.036	9.410
13.037	9.596
13.138	10.208
13.140	10.474
13.229	9.729
13.894	9.302
13.896	9.595
13.898	9.808
13.898	9.834
14.090	9.967
14.092	10.260
14.096	10.739
14.178	9.089
14.948	9.860
14.949	10.046
15.046	10.259
15.048	10.472
15.050	10.658
15.134	9.327
15.230	9.407
15.232	9.567
15.906	10.338
15.907	10.551
16.187	9.725
17.055	10.842
17.140	9.591
17.142	9.804
18.006	10.469
18.389	10.654
19.048	9.563
19.337	9.829
19.348	11.292
19.350	11.452
19.906	9.455
20.203	10.812
20.403	11.876
22.013	10.411
22.973	11.155
24.022	10.994];
data.tL_m(:,1) = data.tL_m(:,1) * 365;
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Kesw2012';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time  since birth (yr), weight (g)
2.111	17.466
6.024	98.096
7.250	46.992
8.111	75.658
8.977	131.772
9.070	119.998
9.154	61.171
10.120	143.416
10.211	122.493
10.876	117.195
11.924	130.157
12.016	115.769
12.017	122.304
12.129	208.560
12.240	292.202
13.013	360.090
13.088	255.515
13.094	282.963
13.250	103.876
14.037	244.959
14.134	255.406
14.148	331.215
14.248	356.039
15.091	289.290
15.093	299.746
15.198	350.712
15.487	368.981
15.938	244.760
16.067	419.897
16.068	427.739
16.139	300.944
16.140	306.172
16.152	370.218
16.231	286.557
16.232	293.092
16.244	354.524
17.079	245.948
17.189	321.748
17.204	402.786
17.286	336.115
17.288	345.265
17.377	311.271
17.873	423.629
18.061	409.231
18.154	398.765
18.161	436.670
18.235	328.174
18.244	372.614
18.336	358.226
18.428	339.917
19.084	291.487
19.087	308.478
19.088	312.400
19.094	343.769
19.104	394.744
19.173	260.107
19.184	317.618
19.281	329.371
19.288	364.662
19.957	381.584
20.045	348.898
20.053	389.417
20.131	299.220
20.142	358.037
20.341	402.457
21.002	381.475
21.078	280.821
21.096	373.623
21.180	317.409
21.299	440.263
22.054	412.735
22.135	340.837
22.227	322.528
23.182	348.570
23.194	408.695];
data.tWw_f(:,1) = data.tWw_f(:,1) * 365;
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'weight', 'female'};  
temp.tWw_f    = C2K(21);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Kesw2012';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time  since birth (yr), weight (g)
10.030	166.953
10.218	156.477
10.978	155.090
11.074	161.615
11.276	220.413
12.117	148.436
12.120	162.813
12.130	216.403
12.132	224.245
12.313	175.864
12.314	183.706
12.317	198.084
13.071	162.714
13.073	173.170
13.073	177.091
13.079	205.847
13.172	197.994
13.175	211.065
13.266	188.835
13.836	188.775
13.938	224.056
14.020	156.079
14.021	161.307
14.118	170.447
14.124	203.123
14.310	180.883
14.310	183.498
14.877	163.832
14.891	237.027
14.980	203.034
15.066	159.891
15.069	174.269
15.073	193.874
15.165	176.873
15.165	179.487
15.166	186.022
15.172	217.392
15.645	205.578
15.943	270.902
16.121	205.529
16.315	229.036
16.317	236.878
16.879	192.379
16.975	201.518
17.268	238.086
18.032	257.612
18.220	249.750
19.157	175.148
19.164	214.360
20.109	181.584
20.119	236.481
22.210	233.648
23.166	264.918
24.208	243.896];
data.tWw_m(:,1) = data.tWw_m(:,1) * 365;
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'weight', 'male'};  
temp.tWw_m    = C2K(21);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Kesw2012';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';   
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'LdL data is assumed to represent relative growth in percent per yr, rather than mm/yr, since von Bert is reported to fit well; the resulting time since birth ar puberty is 14 yr, rather than the ignorved 5.3 yr';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4NBHK'; % Cat of Life
metaData.links.id_ITIS = '551851'; % ITIS
metaData.links.id_EoL = '47044126'; % Ency of Life
metaData.links.id_Wiki = 'Psammobates'; % Wikipedia
metaData.links.id_ADW = 'Psammobates_oculiferus'; % ADW
metaData.links.id_Taxo = '548957'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Psammobates&species=oculiferus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Psammobates_oculifer}}';
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
bibkey = 'Kesw2012'; type = 'phdthesis'; bib = [ ... 
'author = {Tobias Keswick}, ' ... 
'year = {2012}, ' ...
'title = {Ecology and morphology of the {K}alahari tent tortoise, \emph{Psammobates oculifer}, in a semi-arid environment}, ' ...
'school = {University of the Western Cape}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

