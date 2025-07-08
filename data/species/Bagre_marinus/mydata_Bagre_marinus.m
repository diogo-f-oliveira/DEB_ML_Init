function [data, auxData, metaData, txtData, weights] = mydata_Bagre_marinus
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ariidae';
metaData.species    = 'Bagre_marinus'; 
metaData.species_en = 'Gafftopsail catfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 09 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data;

data.am = 10*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'FlinMidw2019';
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 33;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 69;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 

data.Wwb = 8.2; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'wiki'; 
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*02.5^3';
data.Wwp  = 420;   units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase'; 
  comment.Wwp = 'based on 0.00692*Lp^3.15, see F1';
data.Wwi  = 4.296e3;   units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00692*Li^3.15, see F1';

data.Ri  = 70/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.060	24.465
1.332	22.998
1.914	37.463
2.013	35.157
2.015	35.996
2.032	44.277
2.045	34.109
2.252	33.899
2.259	37.463
2.357	34.843
2.999	45.115
3.022	39.769
3.025	41.132
3.139	46.268
3.239	44.591
4.071	46.583
10.297	55.702];
data.tL_f(:,1) = 365 * (0.2 + data.tL_f(:,1));
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FlinMidw2019';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
-0.065	14.051
-0.061	16.043
0.039	14.470
0.077	16.042
0.141	13.526
0.884	22.432
0.885	23.271
0.958	25.262
0.961	26.520
1.004	30.817
1.063	25.890
1.095	24.527
1.100	26.833
1.118	19.181
1.136	27.672
1.138	28.615
1.144	31.865
1.165	25.156
1.193	22.011
1.238	27.042
1.328	20.438
1.409	26.517
1.941	33.328
1.946	35.844
1.985	38.254
2.040	31.546
2.042	32.384
2.047	35.005
2.084	35.843
2.085	36.472
2.088	37.730
2.108	30.811
2.141	30.287
2.160	39.511
2.179	31.964
2.182	33.327
2.184	34.480
2.228	39.092
2.257	36.366
2.259	37.414
2.261	38.148
2.278	29.553
2.296	38.672
2.333	39.510
2.356	34.060
2.397	37.099
2.985	38.040
2.996	43.281
3.066	44.119
3.090	39.087
3.171	44.642
3.304	42.440
3.342	44.117
3.363	37.409
4.348	30.380
5.183	50.292
5.248	48.510
7.323	51.329
7.387	48.918
8.400	55.202
9.258	53.311
10.261	54.878];
data.tL_m(:,1) = 365 * (0.2 + data.tL_m(:,1));
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FlinMidw2019';
comment.tL_m = 'Data for males';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
5.370	3.639
5.905	7.150
6.024	3.696
6.261	3.716
6.499	7.201
6.796	-3.166
7.153	3.794
7.272	10.732
7.569	10.758
7.807	3.850
8.104	10.804
8.402	10.830
8.818	10.866
9.055	3.958
9.352	7.448
9.769	21.341
9.946	4.035
10.244	7.526
10.482	14.475
10.719	7.567
11.255	18.006
11.432	0.700
11.612	18.037
12.207	31.945
12.385	25.032
12.741	21.599
13.157	14.706
13.277	35.502
13.634	32.069
13.930	25.166
14.228	32.120
14.762	25.238
14.941	35.646
15.298	32.213
15.535	32.233
15.774	35.718
16.071	42.672
16.368	42.698
16.725	42.729
17.261	53.168
17.855	56.684
19.045	67.179
19.344	87.990
20.413	81.154
20.947	63.880
20.949	88.129
22.078	95.156
22.614	98.666
22.912	109.085
23.269	119.508
24.579	150.799
25.054	143.912
25.409	119.693
25.706	123.183
25.947	161.310
26.305	178.663
26.778	144.061
26.780	168.311
27.313	151.036
27.791	175.327
28.205	154.577
28.564	189.251
29.815	217.073
30.596	327.995
30.648	237.930
31.066	258.751
31.182	217.191
31.540	234.543
31.780	272.670
32.136	262.308
32.258	300.425
32.733	290.074
33.505	283.212
33.863	300.564
34.222	328.309
34.224	362.951
34.340	317.926
34.874	311.044
34.999	390.732
35.057	363.023
35.233	335.325
35.596	418.497
35.769	352.692
36.005	328.463
36.127	376.973
36.131	422.008
36.426	394.320
36.549	449.757
36.665	411.661
37.265	484.462
37.497	408.269
37.621	474.100
37.623	494.885
37.673	384.035
38.152	425.647
38.215	474.151
38.272	442.978
38.516	522.676
38.745	411.841
39.106	460.371
39.279	398.031
39.519	422.301
39.710	585.135
39.761	477.749
40.002	522.805
40.178	491.642
41.078	599.110
41.495	613.003
41.599	419.017
42.627	644.279
43.164	672.039
43.466	730.957
44.237	706.774
44.479	762.223
44.530	661.765
44.536	734.514
44.540	786.477
45.069	713.775
45.366	710.336
45.670	790.039
46.400	997.955
46.559	758.938
46.682	817.841
48.595	956.574
49.188	935.841
50.321	984.437
50.576	1195.776
51.684	936.057
53.781	1140.626
55.108	1386.700
55.708	1459.500
55.918	1854.437];
units.LWw   = {'d', 'g'};  label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'FlinMidw2019';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Wwb = 2 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;
%weights.psd.p_M = 2 * weights.psd.p_M;

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
%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: W in g = 0.00692 *(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = 'KDYK'; % Cat of Life
metaData.links.id_ITIS = '164159'; % ITIS
metaData.links.id_EoL = '46582127'; % Ency of Life
metaData.links.id_Wiki = 'Bagre_marinus'; % Wikipedia
metaData.links.id_ADW = 'Bagre_marinus'; % ADW
metaData.links.id_Taxo = '154136'; % Taxonomicon
metaData.links.id_WoRMS = '158713'; % WoRMS
metaData.links.id_fishbase = 'Bagre-marinus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Bagre_marinus}}';
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
bibkey = 'FlinMidw2019'; type = 'Article'; bib = [ ... 
'doi = {10.1002/mcf2.10089}, ' ...
'author = {Shane Flinn and Stephen Midway and Andrew Ostrowski},'...
'title = {Age and Growth of Hardhead Catfish and Gafftopsail Catfish in Coastal {L}ouisiana, {U}{S}{A}},'...
'journal = {Marine and Coastal Fisheries: Dynamics, Management, and Ecosystem Science}, '...
'volume = {11(1)}, '...
'year = {2019}, '...
'pages = {362-371}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bagre-marinus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

