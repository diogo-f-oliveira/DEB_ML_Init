function [data, auxData, metaData, txtData, weights] = mydata_Fratercula_arctica 
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Alcidae';
metaData.species    = 'Fratercula_arctica'; 
metaData.species_en = 'Atlantic puffin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'xiMcp', '0bTd'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp  
metaData.data_0     = {'ab';'tp';'tR';'am';'Li';'V0';'Wwb';'Wdb';'Wwx';'Wwi';'Ww0';'JOi';'Ri'}; 
metaData.data_1     = {'t-Ww_f';'t-L';'t-N'};  

metaData.COMPLETE = 2.7;

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Cerren Richards'};    
metaData.date_mod_1     = [2019 03 17];              
metaData.email_mod_1    = {'cerrenrichards@gmail.com'};            
metaData.address_mod_1  = {'Memorial University of Newfoundland, Canada'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 40;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'LowtDiam2002';  
  temp.ab = C2K(32);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'Mean [Range 36 - 45 d - Variation between years and colonies]';  
data.tx = 45;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'LowtDiam2002';  
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature'; 
  comment.tx = 'Mean [Range 34 and 83 d - Variation between years and colonies]';
data.tp = 135;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';  
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'Mean [Range 34 and 83 d - Variation between years and colonies]';
 
data.tR = 1460;        units.tR = 'd';    label.tR = 'time since hatching at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';   
data.am = 40.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature';  
  comment.am = 'Maximum life span';

data.Li  = 16.7;   units.Li  = 'cm';  label.Li  = 'wing length';   bibkey.Li  = 'LowtDiam2002';
  comment.Li = 'Wing length Mean [Range 16.2 - 17.3 cm varied based on colony]';

data.V0 = 66.5;   units.V0 = 'ml';   label.V0 = 'Volume at start of development';     bibkey.V0 = 'Barr2001';
  comment.V0 = 'From eggs in Norway';

data.Ww0 = 65.8;   units.Ww0 = 'g';   label.Ww0 = 'wet weight at start of development';     bibkey.Ww0 = 'LowtDiam2002';
  comment.Ww0 = 'Mean [Range 61.9 - 70.4 - Varied based on colony]';
data.Wwb = 44;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LowtDiam2002'; 
  comment.Wwb = 'Mean [range 39.7-50 g - Varied based on colony]';
% data.Wdb = 41.9;   units.Wdb = 'g';   label.Wdb = 'Dry weight at birth';     bibkey.Wdb = 'BechAarv1987';
%   comment.Wdb = 'Mean [range 36.2 - 53.0 g - Norway colony]';
% data.Wwp = 283.8;   units.Wwp = 'g';   label.Wwp = 'wet weight at fledging';     bibkey.Wwp = 'LowtDiam2002';
%   comment. Wwp = 'Mean [Range 251.8-303 g - Variation between years and colonies]';
data.Wwi = 436;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'LowtDiam2002'; 
  comment.Wwi = 'Mean breeding season weight [Range 350-555 g - Varied based on colony]';

data.Ri  = 1/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reproductive rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'One clutch per year, one egg per clutch';

data.JOi = 1.4 * 436; units.JOi = 'cm3/h';   label.JOi = 'O2 consumption at ultimate state';     bibkey.JOi = 'BryaFurn1995';
  temp.JOi = C2K(40.7); units.temp.JOi = 'K'; label.temp.JOi = 'temperature'; 
  comment.JOi = 'measured as BMR';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.996	42.763
1.793	48.857
2.922	55.709
3.918	63.327
5.047	76.290
5.911	86.968
6.907	96.878
7.970	108.315
8.899	115.935
10.095	125.841
11.025	138.045
11.888	150.250
12.951	160.923
13.947	169.305
15.009	179.978
15.939	189.890
17.002	196.743
17.932	205.126
18.928	213.509
19.991	229.530
21.053	247.843
21.983	260.046
22.913	273.014
23.909	281.397
24.972	293.598
25.968	301.216
26.964	309.598
28.027	316.451
28.956	324.835
30.019	332.452
31.148	339.303
32.011	343.868
32.941	351.488
33.937	359.870
35.398	366.715
36.129	370.519
36.926	373.557
38.121	378.879];  
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};
temp.tW    = C2K(40.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
comment.tW = 'Temperature unknown. Chick temperature changes with age, so we use typical temperature of an incubating adult here.';
bibkey.tW  = 'OyanAnke1996';
% time-weight, food restricted level 1
data.tW1 = [ ... % time since birth (d), wet weight (g)
0.863	42.766
1.926	49.618
2.789	52.656
3.985	61.034
4.782	67.892
6.110	83.143
6.907	86.946
8.102	97.616
8.899	106.767
10.095	112.089
10.892	125.059
12.154	134.964
12.951	143.351
13.947	152.497
14.877	159.353
16.006	165.440
16.935	172.296
17.998	180.677
18.861	189.062
19.924	203.555
20.987	216.520
22.116	231.775
22.979	243.981
23.909	250.836
25.104	260.742
26.034	267.598
26.898	278.275
27.960	287.420
28.956	291.219
30.019	298.835
31.082	303.396
32.078	312.543
33.074	320.161
34.070	326.251
35.199	333.103
35.996	337.669
36.992	344.524
38.254	349.080];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(40.1);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
comment.tW1 = 'Temperature unknown. Chick temperature changes with age, so we use typical temperature of an incubating adult here.';
bibkey.tW1  = 'OyanAnke1996';
% time-weight, food restricted level 2
data.tW2 = [ ... % time since birth (d), wet weight (g)
0.930	41.236
1.860	47.328
2.922	50.361
3.985	58.742
4.981	67.124
6.044	77.033
6.973	83.125
8.036	89.213
8.966	95.305
9.896	99.869
10.892	112.835
11.954	120.452
12.951	128.070
14.013	135.687
15.076	142.540
15.873	147.107
17.002	153.958
18.065	159.283
19.127	165.372
20.123	181.394
21.053	192.834
22.049	202.745
23.112	214.181
24.042	221.801
24.972	230.185
26.034	238.566
27.030	246.184
28.027	250.746
29.089	256.071
29.953	261.401
31.148	269.014
32.144	272.049
33.074	278.141
34.070	283.467
35.066	290.321
36.129	294.118
37.059	300.210
37.989	304.773];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};
temp.tW2    = C2K(40.1);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
comment.tW2 = 'Temperature unknown. Chick temperature changes with age, so we use typical temperature of an incubating adult here.';
bibkey.tW2  = 'OyanAnke1996';
% time-weight, food restricted level 3
data.tW3 = [ ... % time since birth (d), wet weight (g)
1.063	41.997
2.125	47.322
3.188	51.119
4.118	52.627
5.114	56.425
6.110	64.043
7.173	67.840
7.970	73.171
9.032	76.204
9.896	83.061
10.958	91.442
12.021	98.294
13.083	105.147
14.080	113.530
15.009	118.093
16.006	122.656
17.068	126.453
18.065	130.251
19.061	137.105
19.924	143.962
20.987	156.163
21.917	163.783
23.046	173.690
24.042	182.837
25.171	189.688
25.968	197.311
27.097	204.926
27.960	207.964
29.023	214.052
29.953	218.616
31.015	223.177
31.945	227.741
33.008	230.010
34.070	237.626
35.133	239.895
35.930	243.698
37.125	247.492
37.989	250.529];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight'};
temp.tW3    = C2K(40.1);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
comment.tW3 = 'Temperature unknown. Chick temperature changes with age, so we use typical temperature of an incubating adult here.';
bibkey.tW3  = 'OyanAnke1996';
% time-weight, food restricted level 4
data.tW4 = [ ... % time since birth (d), wet weight (g)
0.996	43.527
2.125	44.266
3.055	45.010
3.985	46.517
5.047	48.786
5.844	51.825
7.040	58.675
8.036	63.237
8.966	64.745
10.028	68.542
11.025	73.868
11.954	79.196
13.017	85.285
13.880	89.850
14.943	92.883
15.939	97.445
17.002	101.242
17.932	105.042
19.061	108.073
19.924	114.166
20.987	120.255
22.049	123.288
22.913	129.381
23.975	134.706
24.972	140.032
26.034	144.593
27.894	152.192
30.085	159.021
31.945	165.092
34.004	171.923
36.129	174.933
37.989	180.240];
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'wet weight'};
temp.tW4    = C2K(40.1);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
comment.tW4 = 'Temperature unknown. Chick temperature changes with age, so we use typical temperature of an incubating adult here.';
bibkey.tW4  = 'OyanAnke1996';
% time-weight, food restricted level 5
data.tW5 = [ ... % time since birth (d), wet weight (g)
0.996	40.471
1.992	41.977
2.989	43.483
4.051	44.224
5.047	47.258
6.044	49.529
7.106	50.269
8.036	52.541
9.231	57.099
10.028	59.374
10.958	62.409
12.021	66.970
12.951	66.950
13.880	69.222
14.943	70.726
16.139	72.228
17.002	72.210
18.065	73.714
18.861	75.989
20.057	80.547
20.920	85.112
21.917	88.910
22.846	93.474
23.975	99.562
24.972	104.124
26.034	110.213
27.030	111.719
28.159	113.986
29.156	116.257
30.152	116.999
30.949	119.273
31.879	121.545
33.207	125.336
33.871	128.378
35.266	128.347
36.195	129.855
37.059	133.656
38.121	134.397];
units.tW5   = {'d', 'g'};  label.tW5 = {'time since birth', 'wet weight'}; 
temp.tW5    = C2K(40.1);  units.temp.tW5 = 'K'; label.temp.tW5 = 'temperature';
comment.tW5 = 'Temperature unknown. Chick temperature changes with age, so we use typical temperature of an incubating adult here.';
bibkey.tW5  = 'OyanAnke1996'; 
 
% time-length
data.tL = [ ... % age since hatching (d), wing length (mm) 
0	0	2	2	2	2	2	3	3	4	4	6	6	6	6	6	7	7	8	8	10	10	10	10	10	10	10	10	10	10	11	11	12	12	14	14	14	14	14	14	14	14	14	14	14	15	15	16	16	18	18	18	18	18	18	18	18	18	18	19	19	20	20	22	22	22	22	22	22	22	22	22	22	22	22	23	23	24	24	26	26	26	26	26	26	26	26	26	26	26	26	27	27	28	28	30	30	30	30	30	30	30	30	30	30	31	31	32	32	34	34	34	34	34	34	34	34	34	34	34	35	36	36	38	38	38	38	38	38	38	38	38	38	38	38	39	39	40	42	42	42	42	42	40	40	40	40	42	42	42	42	44	44	48	47	47	46	46	46	46	46	48	48	50	51	50	50	50	52	52	53	52	52	54	54	54	55	55	56	57	58	59	62	63	62	66	64;
23	25	22	23	25	26	29	24	25	25	28	25	27	30	32	36	29	31	30	32	27	28	35	37	39	41	43	44	46	49	42	45	39	41	31	35	43	46	49	51	53	59	62	64	69	60	62	58	50	45	52	59	62	70	70	77	78	84	87	82	78	64	67	60	65	72	75	81	85	86	95	97	98	101	103	94	97	76	81	75	77	83	85	87	91	99	100	107	109	114	116	108	112	84	88	88	91	94	96	112	117	120	122	125	128	122	119	89	101	94	100	102	105	107	120	124	127	129	132	135	130	113	97	97	103	106	111	113	115	128	132	135	137	141	142	140	138	102	98	108	116	123	124	124	138	143	145	148	147	142	137	133	106	106	109	110	113	120	128	131	135	137	134	120	121	132	135	140	140	139	141	133	110	120	125	127	136	143	142	116	126	130	145	146	151	141	126]';   
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL = {'d', 'cm'};     label.tL = {'age since hatching', 'wing length'}; 
temp.tL    = C2K(40.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
comment.tL = 'Temperature unknown. Chick temperature changes with age, so we use typical temperature of an incubating adult here.';
bibkey.tL = 'Rodw1997';

% time -fecundity data
data.tN = [ ... % age (d), cumulative number of eggs (#)
365	730	1095	1460	1825	2190	2555	2920	3285	3650	4015	4380	4745	5110	5475	5840	6205	6570	6935	7300	7665	8030	8395	8760	9125	9490	9855	10220	10585	10950	11315	11680	12045	12410	12775	13140	13505	13870	14235	14600;
0	0	0	1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29	30	31	32	33	34	35	36	37]';
units.tN = {'d', '#'};     label.tN = {'age', 'cumulative number of eggs'}; 
temp.tN    = C2K(40.1);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
comment.tN = 'Temperature unknown. We use typical temperature of an incubating adult here.';
bibkey.tN = 'Rodw1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tW5 = weights.tW5 * 2;
weights.tW4 = weights.tW4 * 2;
weights.tW3 = weights.tW3 * 2;
weights.tW2 = weights.tW2 * 2;
weights.tW1 = weights.tW1 * 2;
weights.tW = weights.tW * 2;
weights.Ww0 = 0;
weights.tL = weights.tL * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1','tW2','tW3','tW4','tW5'}; subtitle1 = {'Data for different feeding levels'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Author_mod_1: In LowtDiam2002, I found that internal temperature of an adult varied depending on behaviour - 40.1 deg C during incubation, 40.6 deg C during flight, but did not change the existing temperature here of 40.7 dec C';
D2 = 'Author_mod_1: I changed the value of "ab" to the mean because Atlantic Puffins have a range of "ab" depending on year and colony location';     
D3 = 'Author_mod_1: I changed the value of "tx" to the mean because Atlantic Puffins have a range of "tx" depending on year and colony location';     
D4 = 'Author_mod_1: I changed the value of "Wwi" to the mean because Atlantic Puffins have a range of "Wwi" depending on colony location';   
D5 = 'Author_mod_1: I changed the value to "Wwb" the mean because Atlantic Puffins have a range of "Wwb" depending on colony location';     
D6 = 'Author_mod_1: I changed the temperature of tW, tW1, tW2, tW3, tW4, tW5 from 40.7 to 40.1 because chicks cannot thermoregulate at a young age and core temperature changes with age. It is likely they experience the temperature of the incubating adult (40.1 deg C)';
D7 = 'Author_mod_1: I changed the English species name to Atlantic puffin';
D8 = 'curator: Wdb is ignorned because of inconsistency with Wwb';
D9 = 'curator: tL is ignorned because wings don not grow isomorphically';
D10 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4,'D5', D5, 'D6', D6, 'D7', D7, 'D8', D8, 'D9', D9, 'D10', D10);

%% Links
metaData.links.id_CoL = '6JMR3'; % Cat of Life
metaData.links.id_ITIS = '177025'; % ITIS
metaData.links.id_EoL = '45509370'; % Ency of Life
metaData.links.id_Wiki = 'Fratercula_arctica'; % Wikipedia
metaData.links.id_ADW = 'Fratercula_arctica'; % ADW
metaData.links.id_Taxo = '53907'; % Taxonomicon
metaData.links.id_WoRMS = '137131'; % WoRMS
metaData.links.id_avibase = '2771624B64AD7F2C'; % avibase
metaData.links.id_birdlife = 'atlantic-puffin-fratercula-arctica'; % birdlife
metaData.links.id_AnAge = 'Fratercula_arctica'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Atlantic_puffin}}';
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
bibkey = 'LowtDiam2002'; type = 'Book'; bib = [ ... 
'author = {Lowther, P. E. and Diamond, A. W. and Kress, S. W. and Robertson, G. J. and Russell, K.}, ' ... 
'year = {2002}, ' ...
'title = {Atlantic Puffin (\emph{Fratercula arctica}). In the Birds of {N}orth {A}merica}, ' ...
'publisher = {The Birds of North America, Inc., Philadelphia, PA.}, ' ...
'number = {709}, '...
'pages = {Page 11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Fratercula_arctica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BechAarv1987'; type = 'Article'; bib = [ ... 
'author = {Bech, C. and Aarvik, F. J. and Vongraven, D.}, ' ... 
'year = {1987}, ' ...
'title = {Temperature regulation in hatching Puffins (\emph{Fratercula arctica})}, ' ...
'journal = {Journal of Ornithology}, ' ...
'volume = {128}, ' ...
'pages = {163-170}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'BryaFurn1995'; type = 'Article'; bib = [ ... 
'author = {Bryant, D. M. and Furness, R. W.}, ' ... 
'year = {1995}, ' ...
'title = {Basal metabolic rate of {N}orth {A}tlantic seabirds}, ' ...
'journal = {Ibis}, ' ...
'volume = {137}, ' ...
'pages = {219-226}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Barr2001'; type = 'Article'; bib = [ ... 
'author = {Barret, R.}, ' ... 
'year = {2001}, ' ...
'title = {The breeding demography and egg size of north {N}orwegian {A}tlantic Puffins \emph{Fratercula arctica} and Razorbills \emph{Alca torda} during 20 years of climatic variability}, ' ...
'journal = {Atlantic Seabirds}, ' ...
'volume = {3}, ' ...
'pages = {97-112}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rodw1997'; type = 'Article'; bib = [ ... 
'author = {Rodway, M.}, ' ... 
'year = {1997}, ' ...
'title = {Relationship between Wing Length and Body Mass in {A}tlantic Puffin Chicks}, ' ...
'journal = {Journal of Field Ornithology}, ' ...
'volume = {68}, ' ...
'pages = {338-347}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OyanAnke1996'; type = 'Article'; bib = [ ...  
'title = {ALLOCATION OF GROWTH IN FOOD-STRESSED ATLANTIC PUFFIN CHICKS}, ' ...
'journal = {The Auk}, ' ...
'volume = {113}, ' ...
'pages = {830--841}, ' ...
'year = {1996}, ' ...
'author = {H. S. {\O}yan and T. Anker-Nilssen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

