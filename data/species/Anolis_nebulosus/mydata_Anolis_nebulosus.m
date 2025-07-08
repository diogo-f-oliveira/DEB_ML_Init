function [data, auxData, metaData, txtData, weights] = mydata_Anolis_nebulosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Dactyloidae';
metaData.species    = 'Anolis_nebulosus'; 
metaData.species_en = 'Clouded Anole'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 15];

%% set data
% zero-variate data

data.tp = 9*30.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'HernRami2019';   
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 7*30.5;  units.tpm = 'd';    label.tpm = 'time since birth at puberty'; bibkey.tpm = 'HernRami2019';   
  temp.tpm = C2K(25); units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 2*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.1;  units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';          bibkey.Lb  = 'HernRami2019'; 
data.Lp  = 3.7;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'HernRami2019';  
data.Lpm  = 3.5;    units.Lpm = 'cm';  label.Lpm = 'SVL at puberty for males';  bibkey.Lpm  = 'HernRami2019';  
data.Li  = 5.28;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'HernRami2019';  
data.Lim  = 4.65;    units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'HernRami2019';  

data.Wwi = 1.77;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Larcerta agilis: 12*0.528^3 g';

data.Ri  = 12/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 egg per clutch, assumed: 12 clutches per yr';

% univariate data
% length-change in length data
data.LdL_f = [ ... % SVL (cm), change in SVL (mum/d)
2.416	109.310
2.521	86.820
2.558	162.134
2.601	163.180
2.610	93.096
2.705	87.866
2.748	43.933
2.842	153.243
2.847	39.226
2.847	44.456
2.847	49.163
2.852	100.418
2.852	55.439
2.890	150.105
2.904	221.757
2.904	130.230
2.904	77.929
2.913	52.301
2.932	148.013
2.951	40.272
2.956	48.640
2.956	43.933
2.994	26.674
3.003	71.653
3.003	68.515
3.003	52.824
3.041	33.473
3.055	46.025
3.055	61.192
3.055	98.326
3.060	179.916
3.088	35.565
3.088	154.289
3.098	0.000
3.098	45.502
3.098	85.774
3.098	90.481
3.098	117.678
3.098	137.029
3.103	74.791
3.103	82.636
3.103	141.213
3.107	70.084
3.107	207.113
3.112	59.623
3.112	64.854
3.121	127.615
3.126	46.025
3.136	80.021
3.140	50.732
3.150	92.573
3.159	34.519
3.164	131.276
3.169	62.238
3.188	77.406
3.188	161.088
3.192	68.515
3.192	50.732
3.192	96.234
3.211	126.569
3.230	81.590
3.230	63.808
3.240	121.339
3.240	44.979
3.244	38.180
3.249	51.778
3.254	94.142
3.254	98.326
3.259	55.962
3.292	1.569
3.297	22.490
3.297	35.565
3.297	81.590
3.297	85.774
3.297	93.096
3.297	97.280
3.301	27.720
3.306	70.084
3.334	79.498
3.353	9.414
3.353	18.828
3.353	35.565
3.353	42.364
3.353	48.117
3.353	57.531
3.353	62.238
3.391	110.879
3.391	107.218
3.391	30.335
3.391	0.523
3.396	52.824
3.401	89.435
3.410	25.105
3.410	35.565
3.410	18.828
3.429	66.423
3.443	52.824
3.443	50.209
3.448	35.042
3.448	31.904
3.448	26.151
3.448	18.828
3.453	152.197
3.491	96.234
3.491	99.895
3.491	104.603
3.495	12.552
3.495	41.841
3.495	125.523
3.500	0.000
3.505	87.866
3.538	44.979
3.538	95.711
3.538	105.126
3.543	60.669
3.547	37.657
3.547	49.163
3.547	51.778
3.547	54.393
3.547	126.046
3.552	25.105
3.552	30.335
3.552	34.519
3.552	140.167
3.580	63.285
3.585	65.900
3.585	59.623
3.590	69.038
3.595	39.226
3.595	34.519
3.599	52.301
3.599	55.439
3.599	49.163
3.599	0.523
3.614	24.059
3.637	32.950
3.637	19.351
3.642	31.381
3.651	103.556
3.651	85.251
3.656	27.720
3.656	8.368
3.694	0.523
3.694	72.176
3.694	98.326
3.694	103.556
3.694	175.732
3.703	76.360
3.727	18.828
3.751	29.289
3.751	32.950
3.751	43.933
3.751	59.623
3.756	54.916
3.760	18.828
3.760	50.209
3.760	70.607
3.779	84.205
3.784	52.301
3.789	130.230
3.789	24.059
3.793	35.565
3.793	65.377
3.798	71.653
3.798	0.523
3.798	60.669
3.826	64.854
3.845	59.623
3.845	40.795
3.845	34.519
3.845	25.628
3.845	5.230
3.850	55.962
3.850	52.301
3.850	48.117
3.850	20.921
3.850	16.736
3.850	12.029
3.864	80.021
3.883	53.870
3.888	33.473
3.897	38.180
3.902	1.046
3.931	66.946
3.940	71.653
3.945	19.874
3.959	24.582
3.992	0.000
3.992	23.536
3.992	64.331
3.992	60.146
3.992	52.301
3.997	47.071
4.002	18.305
4.002	67.992
4.006	33.996
4.035	33.473
4.035	37.134
4.044	20.921
4.044	4.707
4.049	52.301
4.049	63.285
4.082	37.657
4.096	42.364
4.106	0.0230
4.106	70.084
4.110	51.255
4.139	48.117
4.144	17.782
4.144	29.289
4.144	35.565
4.144	42.887
4.148	5.753
4.148	9.937
4.153	58.054
4.158	82.636
4.186	0.000
4.186	73.222
4.191	40.795
4.191	36.611
4.191	33.473
4.191	12.552
4.205	77.406
4.233	4.184
4.238	10.460
4.238	33.996
4.238	43.410
4.243	13.598
4.243	20.397
4.243	23.013
4.243	38.180
4.243	43.410
4.285	17.782
4.290	1.046
4.295	23.536
4.338	42.887
4.338	46.025
4.352	32.427
4.380	31.381
4.390	24.059
4.404	12.552
4.432	18.305
4.437	36.611
4.451	43.410
4.489	0.523
4.489	27.720
4.598	1.046];
units.LdL_f  = {'cm', 'mum/d'};  label.LdL_f = {'SVL', 'change in SVL', 'female'};  
temp.LdL_f   = C2K(25);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'HernRami2019';
comment.LdL_f = 'Data for females';
%
data.LdL_m = [ ... % SVL (cm), change in SVL (mum/d)
2.165	111.060
2.374	58.986
2.442	29.493
2.524	88.018
2.553	50.691
2.592	98.618
2.631	168.203
2.641	47.465
2.694	204.608
2.718	109.677
2.738	84.793
2.748	94.009
2.748	79.724
2.748	77.419
2.748	42.396
2.752	54.378
2.757	45.622
2.762	137.327
2.762	58.986
2.762	61.751
2.796	59.908
2.801	71.889
2.801	68.203
2.801	38.249
2.806	94.009
2.811	46.083
2.816	25.806
2.830	58.065
2.835	47.005
2.835	49.770
2.835	52.535
2.840	40.553
2.845	43.318
2.850	88.018
2.850	83.410
2.850	65.899
2.854	18.433
2.854	35.023
2.854	30.415
2.854	58.065
2.879	53.456
2.888	0.000
2.888	22.120
2.893	24.885
2.908	40.553
2.913	94.470
2.917	35.484
2.932	47.926
2.947	58.065
2.951	15.668
2.951	17.512
2.951	27.650
2.951	35.484
2.951	38.249
2.995	31.336
3.000	68.203
3.010	119.816
3.015	143.318
3.024	111.060
3.024	0.0461
3.049	46.083
3.049	42.857
3.049	42.396
3.049	35.023
3.049	33.180
3.049	29.032
3.049	26.728
3.053	156.682
3.053	23.502
3.058	52.535
3.058	58.065
3.063	17.051
3.087	84.793
3.102	53.456
3.107	65.438
3.107	23.041
3.107	0.461
3.117	17.051
3.126	113.825
3.126	53.456
3.141	63.134
3.141	62.212
3.146	38.249
3.146	41.475
3.146	41.935
3.146	45.161
3.146	49.770
3.150	36.866
3.155	11.060
3.155	8.756
3.160	22.120
3.160	27.650
3.160	32.258
3.184	96.774
3.184	72.350
3.189	1.382
3.194	23.963
3.199	22.120
3.204	67.281
3.204	65.899
3.204	14.747
3.218	36.406
3.238	7.373
3.243	10.599
3.243	18.894
3.252	72.811
3.252	31.336
3.252	36.406
3.257	56.221
3.267	52.074
3.296	142.857
3.296	70.046
3.301	131.336
3.301	0.022
3.340	20.737
3.340	9.677
3.345	35.023
3.345	31.336
3.345	25.806
3.350	52.074
3.350	49.309
3.359	70.968
3.403	38.249
3.403	33.180
3.408	25.806
3.408	42.396
3.413	91.244
3.417	50.230
3.437	39.171
3.447	82.488
3.451	20.737
3.451	51.613
3.451	58.525
3.451	73.733
3.451	75.576
3.456	63.594
3.476	32.719
3.485	0.022
3.490	58.065
3.495	62.212
3.495	65.899
3.500	181.106
3.500	97.696
3.500	89.401
3.500	79.263
3.500	41.475
3.549	115.207
3.549	70.968
3.553	95.392
3.553	49.309
3.553	44.240
3.553	40.553
3.553	36.406
3.553	34.101
3.553	28.111
3.553	18.433
3.592	64.516
3.597	21.659
3.602	59.908
3.607	33.180
3.607	29.032
3.612	53.456
3.612	51.152
3.612	49.770
3.641	55.300
3.646	29.493
3.650	118.894
3.650	100.000
3.650	67.742
3.680	55.300
3.757	47.926
3.757	75.115
3.762	98.618
3.767	59.447
3.806	40.553
3.806	76.959
3.811	147.465
3.820	54.378
3.825	54.839
3.845	11.060
3.845	16.129
3.845	19.355
3.854	29.954
3.854	40.092
3.864	129.493
3.903	60.829
3.903	98.157
3.913	0.000
3.913	41.014
3.951	17.972
3.961	33.641
3.966	18.894
3.976	26.728
4.005	0.000
4.039	20.737
4.044	14.286
4.049	51.613
4.049	44.240
4.049	35.484
4.049	17.512
4.058	66.820
4.058	27.650
4.058	24.424
4.058	9.677
4.068	62.673
4.102	0.000
4.107	80.184
4.112	27.650
4.141	47.465
4.150	12.442
4.150	16.129
4.150	20.276
4.150	33.180
4.155	5.069
4.184	0.000
4.243	9.677
4.243	5.991
4.252	67.281
4.252	44.240
4.252	38.710
4.252	15.207
4.262	32.719
4.262	28.111
4.291	71.429
4.306	7.834
4.311	0.000
4.350	12.442
4.417	72.350
4.510	0.922];
units.LdL_m  = {'cm', 'mum/d'};  label.LdL_m = {'SVL', 'change in SVL', 'male'};  
temp.LdL_m   = C2K(25);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'HernRami2019';
comment.LdL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_f = 2 * weights.LdL_f;
weights.LdL_m = 2 * weights.LdL_m;
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '5V62N'; % Cat of Life
metaData.links.id_ITIS = '585737'; % ITIS
metaData.links.id_EoL = '791314'; % Ency of Life
metaData.links.id_Wiki = 'Anolis_nebulosus'; % Wikipedia
metaData.links.id_ADW = 'Anolis_nebulosus'; % ADW
metaData.links.id_Taxo = '249837'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Anolis&species=nebulosus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anolis}}';
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
bibkey = 'HernRami2019'; type = 'Article'; bib = [ ... 
'doi = {10.1002/ece3.4899}, ' ... 
'author = {Uriel Hern\''{a}ndez-Salinas and Aurelio Ramirez-Bautista and Raciel Cruz-Elizalde and Shai Meiri and Christian Berriozabal-Islas}, ' ... 
'year = {2019}, ' ...
'title = {Ecology of the growth of \emph{Anolis nebulosus} ({S}quamata: {D}actyloidae) in a seasonal tropical environment in the {C}hamela region, {J}alisco, {M}exico}, ' ...
'pages = {2061-2071}, ' ...
'volume = {9}, ' ...
'journal = {Ecol Evol.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'reptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{http://reptile-database.reptarium.cz/species?genus=Anolis&species=nebulosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

