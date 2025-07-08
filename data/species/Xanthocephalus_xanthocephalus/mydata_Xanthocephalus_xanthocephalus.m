function [data, auxData, metaData, txtData, weights] = mydata_Xanthocephalus_xanthocephalus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Icteridae';
metaData.species    = 'Xanthocephalus_xanthocephalus'; 
metaData.species_en = 'Yellow-headed blackbird'; 

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tnff'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi','biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 11];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 13];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 13];

%% set data
% zero-variate data

data.ab = 12;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 12;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'NewbReed2009';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 36;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Wiki';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 18*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 38;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'NewbReed2009';
data.Wwim = 56;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'NewbReed2009';

data.Ri  = 4/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 4 eggs per clutch';
  
% uni-variate data

% time-weight
data.tW_f = [ ... % time (d), weight (g)
0.052	4.082
0.053	3.602
0.053	3.002
0.053	2.161
0.079	6.003
0.106	5.523
0.106	4.923
0.913	6.964
0.940	8.405
0.993	8.405
0.994	7.444
1.021	6.484
1.021	5.643
1.022	3.602
1.047	9.125
1.049	4.683
1.935	12.127
1.935	11.767
1.935	11.407
1.935	11.046
1.964	7.204
1.988	12.847
1.990	9.125
1.990	8.765
1.990	8.165
2.017	7.804
2.044	9.485
2.097	10.686
2.903	15.129
2.930	15.609
2.956	18.130
2.957	14.528
2.958	14.048
2.958	13.808
2.958	13.087
2.983	17.050
2.985	13.328
2.985	11.767
3.011	16.329
3.012	11.527
3.013	10.566
3.924	22.453
3.924	21.492
3.925	20.292
3.979	18.971
3.979	18.611
4.007	18.010
4.007	17.890
4.007	16.930
4.007	16.329
4.008	14.288
4.008	13.568
4.036	12.607
4.972	29.057
5.000	26.775
5.001	22.573
5.002	21.372
5.003	19.211
5.003	18.130
5.003	17.650
5.026	27.616
5.027	26.295
5.027	25.815
5.027	24.974
5.028	24.734
5.028	22.813
5.028	22.573
5.054	25.695
5.888	28.096
5.915	28.696
5.915	28.216
5.941	30.017
5.942	29.297
5.967	32.539
5.968	30.617
5.994	34.099
5.994	33.139
5.995	31.218
5.997	26.655
5.997	26.295
5.997	25.695
5.997	24.854
6.024	24.014
6.079	22.333
6.936	35.420
6.963	33.739
6.965	30.978
6.965	30.137
6.990	36.141
6.990	34.820
6.991	32.178
6.991	31.818
6.991	31.578
6.992	29.537
6.992	29.057
6.992	28.816
7.021	25.094
7.074	27.376
7.075	24.254
7.987	34.460
7.987	33.979
7.987	33.859
7.987	33.619
7.987	32.899
7.988	32.419
8.012	38.062
8.012	37.702
8.013	35.901
8.013	35.660
8.013	35.180
8.015	31.338
8.040	36.861
8.071	25.094
8.957	33.139
8.980	42.384
8.981	40.703
8.981	39.983
8.982	38.062
8.982	37.221
8.983	36.501
8.983	35.660
8.983	35.540
8.983	35.300
8.983	34.940
8.983	34.820
8.983	34.460
8.983	34.340
8.984	34.099
9.066	28.696
9.979	36.261
9.980	35.660
9.980	35.300
9.980	35.060
10.007	34.940
10.007	34.820
10.007	34.580
10.007	33.979
10.007	33.259
10.009	29.777
10.032	40.703
10.032	39.022
10.033	38.062
10.976	35.420
10.977	34.820
10.977	34.220
11.002	37.822
11.002	37.461
11.003	37.221
11.003	36.861
11.004	32.419
12.080	38.302];
for i=2:size(data.tW_f,1); if data.tW_f(i,1)<=data.tW_f(i-1,1); data.tW_f(i,1)=data.tW_f(i-1,1)+1e-8; end; end
units.tW_f = {'d', 'g'};     label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f = C2K(41.6); units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'NewbReed2009';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time (d), weight (g)
0.024	6.484
0.025	5.883
0.026	3.362
0.052	5.283
0.052	4.443
0.106	3.962
0.966	8.525
0.993	9.365
1.019	11.647
1.020	10.566
1.021	7.925
1.048	6.964
1.988	14.648
1.988	14.168
1.988	13.688
1.989	12.247
1.989	11.286
1.989	10.806
1.989	10.326
1.990	9.005
2.017	8.405
2.928	21.132
2.928	20.412
2.929	19.331
2.929	18.611
2.930	15.369
2.930	14.648
2.931	13.928
2.931	13.688
3.010	16.930
3.952	19.691
3.976	26.775
3.978	23.293
3.978	22.693
3.978	21.372
3.978	21.252
3.979	20.652
3.979	20.292
3.979	18.851
3.979	18.491
3.980	18.010
4.003	26.175
4.003	26.175
4.004	25.815
4.004	25.575
4.004	25.094
4.004	24.614
4.004	24.134
4.007	17.410
4.943	33.379
4.944	31.218
4.945	30.137
4.945	30.137
4.945	29.777
4.945	29.537
4.945	29.417
4.945	29.057
4.970	34.820
4.970	33.859
4.999	28.576
5.000	27.616
5.000	27.136
5.000	25.695
5.963	43.465
5.963	42.504
5.965	38.062
5.966	37.221
5.966	36.981
5.966	36.381
5.966	35.780
5.966	35.540
5.966	35.300
5.966	35.180
5.991	41.424
5.991	40.583
5.992	39.022
5.994	33.859
5.994	32.899
5.994	32.659
6.048	32.178
6.075	31.458
6.905	45.866
6.905	45.506
6.905	45.386
6.932	46.346
6.932	44.425
6.933	44.185
6.933	43.705
6.933	42.985
6.933	42.504
6.935	37.101
6.961	41.304
6.961	40.103
6.961	39.863
6.961	39.503
6.961	39.142
6.962	38.542
6.962	37.822
6.985	48.388
6.988	40.823
6.988	39.022
6.989	37.942
7.953	51.389
7.953	51.149
7.954	50.669
7.954	50.069
7.954	49.708
7.955	48.268
7.955	47.667
7.955	47.427
7.955	46.467
7.956	45.506
7.956	45.026
7.956	44.666
7.956	43.945
7.957	42.384
7.957	41.063
7.982	47.187
7.982	45.746
8.927	42.024
8.948	55.472
8.949	53.911
8.949	53.310
8.949	53.190
8.949	52.710
8.950	51.750
8.950	51.029
8.950	50.309
8.951	48.388
8.976	54.871
8.976	54.511
8.977	52.110
8.977	51.389
8.977	50.069
8.978	49.588
8.978	49.108
8.978	48.988
8.978	47.787
8.978	47.307
8.979	47.187
8.979	45.626
9.945	54.631
9.945	54.511
9.947	51.149
9.947	50.789
9.947	50.429
9.947	49.949
9.948	48.268
9.948	47.427
9.972	54.151
9.973	53.671
9.973	52.590
9.999	56.072
9.999	55.832
9.999	55.352
10.000	53.431
10.889	51.149
10.916	52.590
10.941	57.153
10.941	56.432
10.941	55.952
10.943	52.710
11.023	54.991
11.026	46.467
11.883	57.993
11.884	55.952
11.887	47.907
11.913	52.110
12.936	52.350
12.960	60.034
13.016	54.871
13.066	64.717
13.935	47.307
13.958	55.832
15.063	55.472];
for i=2:size(data.tW_m,1); if data.tW_m(i,1)<=data.tW_m(i-1,1); data.tW_m(i,1)=data.tW_m(i-1,1)+1e-8; end; end
units.tW_m = {'d', 'g'};     label.tW_m = {'time', 'wet weight', 'male'};  
n=size(data.tW_m,1); for i=2:n; if data.tW_m(i,1)<=data.tW_m(i-1,1); data.tW_m(i,1)=data.tW_m(i-1,1)+1e-3; end; end
temp.tW_m = C2K(41.6); units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'NewbReed2009';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: males have equal state variables at b, compared to females';
D5 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '7FV74'; % Cat of Life
metaData.links.id_ITIS = '179043'; % ITIS
metaData.links.id_EoL = '45511131'; % Ency of Life
metaData.links.id_Wiki = 'Xanthocephalus_xanthocephalus'; % Wikipedia
metaData.links.id_ADW = 'Xanthocephalus_xanthocephalus'; % ADW
metaData.links.id_Taxo = '58485'; % Taxonomicon
metaData.links.id_WoRMS = '1485210'; % WoRMS
metaData.links.id_avibase = '3E2D0C9BADB782DB'; % avibase
metaData.links.id_birdlife = 'yellow-headed-blackbird-xanthocephalus-xanthocephalus'; % birdlife
metaData.links.id_AnAge = 'Xanthocephalus_xanthocephalus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Xanthocephalus_xanthocephalus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Xanthocephalus_xanthocephalus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NewbReed2009'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1600-048X.2008.04420.x}, ' ...
'author = {J. L. Newbrey and W. L. Reed}, ' ... 
'year = {2009}, ' ...
'title = {Growth of yellow-headed blackbird \emph{Xanthocephalus xanthocephalus} nestlings in relation to maternal body condition, egg mass, and yolk carotenoids concentrations}, ' ...
'journal = {J. Avian Biol.}, ' ...
'volume = {40}, ' ...
'pages = {419--429}'];
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

