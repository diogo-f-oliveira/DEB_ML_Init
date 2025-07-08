function [data, auxData, metaData, txtData, weights] = mydata_Parabuteo_unicinctus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Parabuteo_unicinctus'; 
metaData.species_en = 'Harris''s hawk';

metaData.ecoCode.climate = {'A','B','Cfa'};
metaData.ecoCode.ecozone = {'THn','TN'};
metaData.ecoCode.habitat = {'0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 03];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 34.5;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'avibase';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '33-36 d';
data.tx = 46;       units.tx = 'd';     label.tx = 'time since birth at fledging';  bibkey.tx = 'avibase';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '43-49 d';
data.tp = 138;       units.tp = 'd';     label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '43-49 d';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'avibase';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 50;      units.Ww0 = 'g';   label.Ww0 = 'initital wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 30;      units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on tW and Ww0 data';
data.Wwi = 1026;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'avibase';
data.Wwim = 715;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'avibase';

data.Ri  = 3*1.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.5 clutch per yr, 1-5 eggs/clutch';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
1.814	10.010
3.706	33.092
3.957	21.682
6.738	120.024
6.753	61.202
7.898	100.543
11.847	154.894
12.730	253.030
12.763	120.680
13.828	153.476
13.892	225.378
14.974	189.549
15.774	290.943
15.844	341.604
15.873	225.594
15.917	380.828
16.756	326.998
16.925	310.676
17.762	263.382
17.901	369.606
17.967	433.339
18.880	415.464
18.956	439.982
18.965	402.402
19.871	412.304
19.895	312.634
20.904	239.214
20.906	566.012
20.994	543.145
22.016	415.806
22.091	443.592
22.137	592.290
22.899	513.941
23.138	548.281
24.136	518.978
24.946	579.524
24.980	442.273
25.085	687.382
25.094	648.167
26.075	685.856
27.155	658.196
27.159	643.490
28.311	655.054
29.131	678.019
29.341	828.368
29.388	642.099
30.184	756.565
30.271	741.868
31.040	635.743
31.113	673.333
31.172	436.411
31.207	625.957
31.223	560.600
31.254	769.753
32.041	593.368
32.171	732.272
32.265	686.530
33.013	665.370
33.185	639.245
33.259	673.566
33.443	596.789
33.973	789.657
34.003	668.746
34.316	737.407
34.985	699.898
35.054	753.827
35.141	737.497
35.156	677.041
36.025	832.365
36.232	665.720
36.310	683.703
36.960	724.623
37.050	693.587
37.060	652.739
37.280	763.874
37.957	698.588
38.112	737.821
38.923	795.099
38.929	770.589
39.084	811.456
40.223	878.573
40.249	775.635
40.997	751.207
41.083	739.778
41.881	847.708
41.976	798.699
43.043	821.691
43.048	800.450
43.883	764.593
43.983	691.075
44.117	816.906
44.140	727.039
44.276	841.433
45.213	725.522
45.856	795.854
46.179	822.033
47.102	761.676
48.916	770.043
50.244	739.142
53.104	855.467];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'females'};  
temp.tW_f    = C2K(40);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'BednHayd1991';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.492	14.768
1.808	31.252
2.636	21.538
4.612	39.727
4.615	29.923
8.712	146.383
8.810	85.936
8.813	72.864
10.686	174.376
12.890	272.655
13.629	289.075
13.819	189.423
13.954	308.719
14.617	297.353
14.695	316.969
14.773	336.585
15.591	364.452
17.567	384.275
17.908	341.829
18.673	250.409
19.717	364.902
19.878	384.527
20.857	428.752
20.870	376.465
20.875	356.858
20.882	327.447
22.826	477.986
22.928	396.297
23.006	415.914
23.901	468.299
23.919	396.405
25.066	427.576
26.052	447.291
26.872	466.988
26.981	360.791
27.013	566.677
28.017	511.231
28.756	527.651
28.998	547.285
29.986	558.831
30.220	612.778
30.802	594.868
30.972	575.278
31.062	545.876
31.152	514.840
32.056	531.279
32.061	511.671
32.880	534.636
32.884	518.297
32.889	498.690
32.981	462.752
33.817	420.359
34.008	645.870
34.012	631.165
34.953	497.280
36.021	518.639
36.834	566.113
37.172	533.470
37.787	718.177
38.746	512.399
38.987	536.936
39.003	474.846
40.065	517.445
41.032	612.322
41.043	568.205
41.221	515.937
41.872	553.590
43.013	610.904
43.103	578.234
43.175	622.359
44.084	617.556
45.252	565.396
46.168	532.816];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'males'};  
temp.tW_m    = C2K(40);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'BednHayd1991';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 2 * weights.tW_f; 
weights.tW_m = 2 * weights.tW_m; 

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
D1 = 'body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'Ww0 data ignored due to inconsistency with tW data';
D4 = 'mod_1: males have equal state variables at b, compared to females';
D5 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);  

%% Links
metaData.links.id_CoL = '4CN4R'; % Cat of Life
metaData.links.id_ITIS = '175397'; % ITIS
metaData.links.id_EoL = '45511415'; % Ency of Life
metaData.links.id_Wiki = 'Parabuteo_unicinctus'; % Wikipedia
metaData.links.id_ADW = 'Parabuteo_unicinctus'; % ADW
metaData.links.id_Taxo = '52731'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'FBED1927FAA44D27'; % avibase
metaData.links.id_birdlife = 'harriss-hawk-parabuteo-unicinctus'; % birdlife
metaData.links.id_AnAge = 'Parabuteo_unicinctus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parabuteo_unicinctus}}';
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
bibkey = 'Schn2020'; type = 'Misc'; bib = [ ... 
'doi = {10.2173/bow.hrshaw.01}, ' ...
'author = {Dwyer, J. F. and J. C. Bednarz}, ' ... 
'year = {2020}, ' ...
'title = {Harris''s Hawk (\emph{Parabuteo unicinctus}), version 1.0. In Birds of the World (A. F. Poole, Editor). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Parabuteo_unicinctus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=FBED1927FAA44D27&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BednHayd1991'; type = 'Article'; bib = [ ...  
'title = {Skewed Brood Sex Ratio and Sex-Biased Hatching Sequence in Harris''s Hawks}, ' ...
'journal = {The American Naturalist}, ' ...
'volume = {137(1)}, ' ...
'year = {1991}, ' ...
'author = {James C. Bednarz and Timothy J. Hayden}, ' ...
'pages = {116-132}'];
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

