function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_albimarginatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_albimarginatus'; 
metaData.species_en = 'Silvertip shark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 11 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data

data.ab = 19*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'guess';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'ADW give 1 yr, but this is at odds with tL data';
data.am = 25*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'ADW';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 65.5;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'ADW';
  comment.Lb = '63-68 cm';
data.Lp  = 175;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'ADW'; 
  comment.Lp = '160-190 cm';
data.Lpm  = 170;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'ADW'; 
  comment.Lpm = '160-180 cm';
data.Li  = 300;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';
data.Lim  = 280;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'guess';

data.Wwi = 208.7e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00437*Li^3.10, see F1';

data.Ri  = 11/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 till 11 pups per litter, 1 litter per 2 yrs';

% uni-variate data

% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.011	83.860
0.041	74.893
0.070	53.268
0.071	58.014
0.071	61.706
0.104	65.397
0.104	69.089
0.928	63.259
0.962	84.882
0.963	87.519
0.963	90.156
0.992	71.168
0.993	76.442
0.993	80.134
1.945	81.683
1.945	86.429
1.946	91.704
1.947	95.396
1.979	99.087
2.007	74.297
2.011	105.415
2.931	102.218
2.931	105.382
2.931	106.964
2.932	111.711
2.960	83.757
2.961	92.723
2.962	96.415
2.965	121.731
2.996	118.566
3.976	92.160
3.981	133.826
4.009	107.454
4.011	118.530
4.011	121.694
4.040	100.069
4.041	102.706
4.042	114.837
4.073	111.144
4.902	146.980
4.960	101.619
4.961	109.530
4.962	115.859
4.995	125.879
5.026	121.659
5.059	132.206
5.945	117.407
5.946	121.626
5.946	125.318
5.947	130.593
5.947	134.285
5.948	137.977
5.948	141.141
6.039	110.547
6.992	120.007
6.993	131.083
7.024	124.753
7.026	134.774
7.027	142.158
7.091	149.012
7.914	138.962
7.916	153.203
7.916	155.840
7.917	158.477
7.945	132.105
7.978	145.289
7.979	151.618
7.980	161.112
8.041	142.650
8.929	137.872
8.930	146.310
8.931	156.332
8.932	159.496
8.932	162.133
8.961	141.035
8.994	149.473
8.994	151.582
8.996	165.296
8.996	169.515
9.944	144.693
9.977	149.966
9.978	157.877
10.011	166.315
10.011	168.952
10.011	171.589
10.012	180.028
10.962	165.754
10.963	175.247
10.963	177.885
10.964	181.049
10.994	172.609
11.024	153.093
11.024	158.895
11.060	186.847
11.948	186.816
11.980	189.452
11.980	195.254
12.008	160.970
12.009	172.574
12.010	174.683
12.933	202.604
12.962	181.506
12.992	168.320
12.995	193.636
13.027	196.272
13.914	188.329
13.946	190.965
13.948	206.788
13.948	208.898
13.976	176.724
14.011	205.731
14.993	196.203
14.994	199.895
15.023	184.071
15.059	215.188
15.948	224.123
15.976	192.476
15.977	203.552
16.932	231.472
16.960	198.771
16.961	209.847
17.976	208.756
17.977	215.085
18.043	240.927];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'SmarChin2017';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.010	59.357
0.012	75.953
0.013	81.486
0.043	63.880
0.043	69.413
0.044	72.431
0.077	82.993
0.870	83.973
0.870	88.500
0.900	75.923
0.933	80.953
0.934	92.019
0.966	95.036
0.995	69.381
1.030	97.549
1.884	78.406
1.885	84.945
1.919	102.549
1.919	105.567
1.920	112.610
1.948	88.967
1.981	97.014
2.044	92.988
2.869	93.463
2.900	90.444
2.902	106.037
2.903	110.062
2.903	112.577
2.904	123.643
2.933	102.012
2.964	96.478
2.965	100.502
2.967	116.096
3.853	98.963
3.853	103.993
3.884	97.453
3.949	111.033
3.950	114.554
3.950	121.093
3.951	127.129
3.984	135.679
4.902	119.552
4.902	122.067
4.902	124.582
4.936	138.665
4.966	129.107
4.968	144.701
4.998	133.130
5.027	108.984
5.027	110.493
5.028	113.511
5.886	129.579
5.887	134.106
5.916	119.518
5.917	121.530
5.917	124.548
5.951	140.140
6.870	139.607
6.871	143.631
6.901	133.066
6.935	149.162
6.964	128.034
6.964	129.543
6.967	152.682
7.885	134.542
7.917	137.559
7.917	140.578
7.918	150.135
7.919	152.650
7.919	156.171
7.919	159.692
7.920	163.213
8.013	145.101
8.871	157.648
8.871	160.163
8.871	163.684
8.901	147.084
8.901	149.096
8.904	174.750
8.964	144.567
8.965	154.124
9.062	168.708
9.887	169.183
9.887	172.202
9.980	152.581
9.980	156.102
9.981	159.120
9.981	165.156
10.015	177.227
10.901	165.125
10.932	162.106
10.936	188.766
10.964	159.590
10.965	170.153
10.966	173.171
10.966	179.208
11.916	168.612
11.917	171.631
11.981	182.192
11.982	185.713
12.900	175.119
12.932	178.136
12.933	183.166
12.933	185.681
12.934	191.214
13.884	182.631
13.918	196.211
13.949	193.695
13.980	184.640
13.980	190.173
14.963	188.128
14.964	190.643
14.965	200.200
14.965	203.721
15.916	196.144
15.916	198.156
15.949	211.234
16.932	205.668
16.963	201.642
17.915	211.168];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'SmarChin2017';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;
weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'temperatures are guessed';
D3 = 'The little curvature in tL data gives parameter estimation problems';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'length-weight: 0.00437*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Preferred temp 27 C,usually 20 - 65 m deep';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'R3MB'; % Cat of Life
metaData.links.id_ITIS = '160354'; % ITIS
metaData.links.id_EoL = '46559800'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_albimarginatus'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_albimarginatus'; % ADW
metaData.links.id_Taxo = '41971'; % Taxonomicon
metaData.links.id_WoRMS = '217352'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-albimarginatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_albimarginatus}}';
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
bibkey = 'SmarChin2017'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00338-016-1533-x}, ' ...
'author = {Jonathan J. Smart and Andrew Chin and Leontine Baje and  Andrew J. Tobin and Colin A. Simpfendorfer and William T. White}, ' ... 
'year = {2017}, ' ...
'title = {Life history of the silvertip shark \emph{Carcharhinus albimarginatus} from {P}apua {N}ew {G}uinea}, ' ...
'journal = {Coral Reefs}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-albimarginatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Carcharhinus_albimarginatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

