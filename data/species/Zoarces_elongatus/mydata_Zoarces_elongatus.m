function [data, auxData, metaData, txtData, weights] = mydata_Zoarces_elongatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Zoarcidae';
metaData.species    = 'Zoarces_elongatus'; 
metaData.species_en = 'Eastern viviparous eelpout'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 04 22];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 12*365;      units.am = 'd';    label.am = 'life span';        bibkey.am = 'Poez2016';   
  temp.am = C2K(8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 19.06;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'Poez2016'; 
  comment.Lp = '185--250 mm';
data.Li  = 56;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'Poez2016';

data.Wwb = 1.2e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Poez2016';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 26;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for female';    bibkey.Wwp = 'Poez2016';
data.Wwi = 742;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';      bibkey.Wwi = 'Poez2016';

data.Ri  = 185/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 20 cm';    bibkey.Ri  = 'Poez2016';   
  temp.Ri = C2K(8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [... % time (yr), total length (cm)
1.019	12.689
2.040	14.702
2.985	19.250
4.006	23.982
4.989	28.894
6.009	32.175
6.992	35.819
7.994	39.643
9.015	44.556
11.000	51.299]; 
data.tL_f(:,1) = (0.5 + data.tL_f(:,1)) * 365;
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Poez2016';
comment.tL_f = 'data for females'; 
%
data.tL_m = [... % time (yr), total length (cm)
1.019	12.689
2.040	13.977
3.023	17.982
3.987	24.163
4.989	29.438
6.009	32.357
7.011	37.269
8.013	38.012
9.015	44.919]; 
data.tL_m(:,1) = (0.5 + data.tL_m(:,1)) * 365;
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Poez2016';
comment.tL_m = 'data for males'; 

% time-weight 
data.tW_f = [... % time (yr), total length (cm)
1.019	8.935
2.002	12.682
3.003	32.504
4.023	66.614
5.023	100.722
5.986	143.751
6.967	222.497
7.986	261.965
8.984	392.500
10.963	566.068]; 
data.tW_f(:,1) = (0.5 + data.tW_f(:,1)) * 365;
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(8);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Poez2016';
comment.tW_f = 'data for females'; 
%
data.tW_m = [... % time (yr), total length (cm)
1.019	7.150
2.001	14.468
3.022	30.721
3.966	64.819
4.985	115.001
5.967	143.747
6.985	247.501
8.004	288.754
8.985	351.429]; 
data.tW_m(:,1) = (0.5 + data.tW_m(:,1)) * 365;
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(8);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Poez2016';
comment.tW_m = 'data for males'; 

% length-fecundity
data.LN = [... % total length (cm), fecundity (#)
    19.06  25
    23.05  42.4
    25.10  59.0
    29.98  72.3
    36.36  92.7
    39.94 100.7
    39.99  91.5
    44.71 112]; 
units.LN   = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(8);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Poez2016';

% length-weight
data.LW_f = [... % total length (cm), wet weight (g)
11.548	6.312
12.045	12.957
12.401	14.618
12.543	14.618
13.040	11.296
13.608	11.296
14.176	14.618
14.460	14.618
15.028	21.262
15.597	16.279
16.236	16.279
17.088	32.890
17.372	27.907
18.366	37.874
18.722	36.213
18.722	22.924
18.722	16.279
19.574	27.907
19.574	37.874
20.071	34.551
20.710	37.874
21.563	37.874
21.563	49.502
21.563	69.435
21.847	44.518
22.131	47.841
22.415	51.163
22.983	79.402
22.983	51.163
23.267	67.774
23.693	47.841
23.906	69.435
24.119	44.518
24.688	51.163
24.901	67.774
25.895	51.163
25.966	82.724
26.037	67.774
26.392	84.385
26.392	74.419
26.889	105.980
26.960	74.419
27.528	67.774
27.670	61.130
27.955	84.385
28.097	84.385
28.452	99.336
28.736	61.130
29.020	81.063
29.091	107.641
29.446	79.402
29.517	120.930
29.517	97.674
30.014	92.691
30.085	117.608
30.085	145.847
30.724	130.897
30.938	107.641
30.938	115.947
31.080	89.369
31.151	119.269
31.222	145.847
31.293	117.608
31.719	179.070
31.861	137.542
32.003	117.608
32.074	130.897
32.287	159.136
32.500	144.186
32.926	150.831
33.210	139.203
33.210	160.797
33.565	179.070
33.778	157.475
34.063	162.458
34.418	187.375
34.702	104.319
34.915	177.409
35.483	175.748
35.696	203.987
35.980	134.219
36.406	167.442
37.188	187.375
37.756	187.375
37.969	220.598
38.324	174.086
38.963	263.787
39.034	187.375
39.460	227.243
39.531	282.060
39.815	366.777
39.886	142.525
40.170	232.226
40.170	353.488
40.313	323.588
40.739	255.482
41.023	233.887
42.017	313.621
42.372	325.249
42.656	260.465
42.869	320.266
43.295	370.100
43.438	323.588
44.574	340.199
45.426	478.073
46.847	561.130
50.256	607.641
51.108	571.096
55.938	743.854]; 
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','wet weight','female'};  
bibkey.LW_f = 'Poez2016';
comment.LW_f = 'data for females'; 
%
data.LW_m = [... % total length (cm), wet weight (g)
7.358	6.312
11.761	6.312
12.045	7.973
12.543	2.990
13.111	7.973
13.963	14.618
13.963	11.296
14.318	16.279
14.886	14.618
16.236	12.957
16.520	19.601
16.875	19.601
17.301	21.262
17.372	14.618
17.869	34.551
17.869	32.890
18.082	19.601
19.006	7.973
19.006	34.551
19.148	22.924
19.716	41.196
20.355	27.907
20.781	44.518
20.852	27.907
20.994	44.518
21.847	54.485
21.918	31.229
22.131	52.824
22.912	119.269
23.054	56.146
23.551	41.196
23.764	56.146
24.901	69.435
24.972	64.452
25.540	39.535
25.824	81.063
26.179	67.774
27.102	82.724
27.670	41.196
27.670	87.708
28.026	92.691
28.523	94.352
28.594	124.252
28.665	114.286
29.020	102.658
29.943	130.897
30.085	114.286
30.156	139.203
30.653	149.169
30.724	125.914
31.009	147.508
31.648	167.442
32.216	134.219
32.287	157.475
32.571	107.641
32.571	165.781
32.642	144.186
32.642	177.409
32.642	194.020
33.920	184.053
33.991	167.442
34.489	145.847
34.631	174.086
34.986	200.664
35.057	192.359
35.199	179.070
35.483	265.449
35.767	218.937
36.193	225.581
36.335	194.020
36.690	215.615
37.188	220.598
37.401	257.143
37.685	240.532
37.898	298.671
38.040	174.086
38.040	320.266
38.395	157.475
38.608	380.066
38.892	247.176
38.963	232.226
39.744	243.854
39.815	263.787
40.028	346.844
40.313	192.359
41.520	413.289
42.940	403.322
42.940	443.189
43.011	376.744
43.438	250.498
45.923	426.578
46.207	546.179
47.557	421.595]; 
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','wet weight','male'};  
bibkey.LW_m = 'Poez2016';
comment.LW_m = 'data for males'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
set3 = {'LW_f','LW_m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'abj has been applied since related species show acceleration; foetal development was ignored because of absence of its combination with abj. The effect is probably very small.';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '5D67G'; % Cat of Life
metaData.links.id_ITIS = '631237'; % ITIS
metaData.links.id_EoL = '46575085'; % Ency of Life
metaData.links.id_Wiki = 'Zoarces_elongatus'; % Wikipedia
metaData.links.id_ADW = 'Zoarces_elongatus'; % ADW
metaData.links.id_Taxo = '190281'; % Taxonomicon
metaData.links.id_WoRMS = '274153'; % WoRMS
metaData.links.id_fishbase = 'Zoarces-elongatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zoarces_elongatus}}';
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
bibkey = 'Poez2016'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945216030139}, ' ...
'author = {E. A. Poezzhalova-Chegodaeva}, ' ... 
'year = {2016}, ' ...
'title = {Biology of Eelpout \emph{Zoarces elongatus} ({Z}oarcidae) from {T}auysk {B}ay, the {S}ea of {O}khotsk}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {56}, ' ...
'pages = {569-577}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Zoarces-elongatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

