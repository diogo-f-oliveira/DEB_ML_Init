function [data, auxData, metaData, txtData, weights] = mydata_Pseudorca_crassidens

%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Pseudorca_crassidens'; 
metaData.species_en = 'False killer whale'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCvm', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.6); % K, body temperature
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2017 01 09];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data
data.tg = 451;       units.tg = 'd';  label.tg = 'gestation time';         bibkey.tg = 'AnAge';    
  temp.tg = C2K(36.6); units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from AnAge';
data.tx =  730;  units.tx = 'd';  label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';    
  temp.tx = C2K(36.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp =  3468; units.tp = 'd'; label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 6756;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36.6);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am =  62.5 * 365;  units.am = 'd';  label.am = 'life span';          bibkey.am = 'AnAge';   
  temp.am = C2K(36.6);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 174;  units.Lb = 'cm'; label.Lb = 'total length at birth';       bibkey.Lb = 'FerrKasu2014';
data.Li = 510;  units.Li = 'cm'; label.Li = 'ultimate total length for female'; bibkey.Li = 'Wiki';
data.Lim = 610; units.Lim = 'cm'; label.Lim = 'ultimate total length for male'; bibkey.Lim = 'Wiki';
  
data.Wwi = 1200e3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Wiki';
data.Wwim = 2200e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'Wiki';

data.Ri = 0.1/365;   units.Ri = '#/d';label.Ri = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_fSA = [ ... % time since birth (yr), length (cm)
3.259	257.303
4.883	306.742
4.785	319.101
9.225	330.337
10.537	333.708
14.374	355.056
23.553	355.056
12.458	358.427
15.484	358.427
16.393	360.674
29.608	370.786
31.524	370.786
43.628	370.786
53.513	371.910
28.399	379.775
42.520	379.775
46.555	379.775
49.581	379.775
32.434	382.022
43.731	382.022
24.366	384.270
36.469	384.270
44.539	384.270
38.487	385.393
57.551	387.640
63.502	388.764
31.528	391.011
51.399	393.258
34.555	395.506
37.581	396.629
31.530	397.753
43.634	397.753
50.593	397.753
44.542	398.876
46.560	404.494
51.604	407.865
47.672	415.730
36.578	421.348];
data.tL_fSA(:,1) = data.tL_fSA(:,1) * 365; % convert yr to d
units.tL_fSA  = {'d', 'cm'};  label.tL_fSA = {'time since birth', 'length', 'female'};  
temp.tL_fSA  = C2K(36.6);  units.temp.tL_fSA = 'K'; label.temp.tL_fSA = 'temperature';
bibkey.tL_fSA = 'FerrKasu2014';
comment.tL_fSA = 'Data for females, South Africa';
%
data.tL_mSA = [ ... % time since birth (yr), length (cm)
5.284	294.382
3.773	301.124
19.521	366.292
25.475	384.270
17.512	410.112
33.554	432.584
32.547	438.202
37.590	439.326
28.412	442.697
45.660	443.820
25.589	450.562
22.465	460.674
20.548	461.798
41.530	468.539
46.573	470.786
52.524	470.786
54.542	470.786
43.548	471.910
58.681	489.888
41.536	498.876];
data.tL_mSA(:,1) = data.tL_mSA(:,1) * 365; % convert yr to d
units.tL_mSA  = {'d', 'cm'};  label.tL_mSA = {'time since birth', 'length', 'male'};  
temp.tL_mSA  = C2K(36.6);  units.temp.tL_mSA = 'K'; label.temp.tL_mSA = 'temperature';
bibkey.tL_mSA = 'FerrKasu2014';
comment.tL_mSA = 'Data for males, South Africa';
%
data.tL_fJ = [ ... % time since birth (yr), length (cm)
0.116	173.991
0.422	194.170
0.526	212.108
0.228	231.166
2.146	252.466
1.140	259.193
4.171	304.036
3.265	308.520
6.388	313.004
4.174	321.973
4.580	335.426
16.465	337.668
6.192	338.789
9.117	357.848
10.426	358.969
9.422	372.422
10.430	375.785
24.329	378.027
2.574	380.269
19.395	380.269
14.460	381.390
8.316	382.511
34.403	384.753
10.433	391.480
7.412	393.722
18.290	394.843
39.441	394.843
21.513	395.964
26.348	398.206
54.550	402.691
14.464	403.812
52.537	407.175
17.387	411.659
21.516	411.659
35.415	411.659
16.480	412.780
14.466	413.901
20.409	417.265
37.431	417.265
17.388	418.386
43.575	420.628
40.453	421.749
52.540	423.991
21.418	425.112
22.425	425.112
28.469	426.233
37.433	426.233
47.505	426.233
30.383	428.475
62.512	428.475
17.390	429.596
38.440	429.596
24.340	430.717
36.426	430.717
60.398	431.839
50.427	434.081
56.571	434.081
38.442	436.323
14.370	438.565
37.436	440.807
24.342	441.928
30.587	441.928
18.501	444.170
43.379	444.170
50.530	447.534
56.574	449.776
44.488	450.897
53.452	450.897
30.589	452.018
32.402	452.018
55.467	454.260
41.568	455.381
38.446	456.502
53.453	457.623
48.518	458.744
19.512	460.987
30.591	460.987
32.405	466.592
44.491	466.592
56.679	469.955
55.471	474.439];
data.tL_fJ(:,1) = data.tL_fJ(:,1) * 365; % convert yr to d
units.tL_fJ  = {'d', 'cm'};  label.tL_fJ = {'time since birth', 'length', 'female'};  
temp.tL_fJ  = C2K(36.6);  units.temp.tL_fJ = 'K'; label.temp.tL_fJ = 'temperature';
bibkey.tL_fJ = 'FerrKasu2014';
comment.tL_fJ = 'Data for females, Japan';
%
data.tL_mJ = [ ... % time since birth (yr), length (cm)
1.037	246.861
1.345	277.130
2.453	277.130
3.460	277.130
1.851	287.220
1.348	292.825
6.185	306.278
3.167	321.973
3.671	321.973
2.868	336.547
7.300	341.031
4.481	344.395
3.676	348.879
5.390	356.726
5.793	356.726
18.700	430.717
20.717	444.170
27.566	444.170
18.703	447.534
37.641	462.108
23.440	464.350
24.347	465.471
28.480	484.529
39.561	490.134
26.569	496.861
28.483	496.861
33.519	500.224
32.514	508.072
21.436	513.677
43.494	514.798
55.479	515.919
39.366	524.888
23.554	527.130
54.475	528.251
39.470	538.341
30.405	539.462
57.499	543.946
26.379	550.673
47.532	564.126];
data.tL_mJ(:,1) = data.tL_mJ(:,1) * 365; % convert yr to d
units.tL_mJ  = {'yr', 'cm'};  label.tL_mJ = {'time since birth', 'length', 'male'};  
temp.tL_mJ  = C2K(36.6);  units.temp.tL_mJ = 'K'; label.temp.tL_mJ = 'temperature';
bibkey.tL_mJ = 'FerrKasu2014';
comment.tL_mJ = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
 
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fSA','tL_mSA'}; subtitle1 = {'Data for females, males from South Africa'};
set2 = {'tL_fJ','tL_mJ'}; subtitle2 = {'Data for females, males from Japan'};
metaData.grp.sets = {set1, set2};
metaData.grp.subtitle = {subtitle1, subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4P9FG'; % Cat of Life
metaData.links.id_ITIS = '180463'; % ITIS
metaData.links.id_EoL = '46559277'; % Ency of Life
metaData.links.id_Wiki = 'Pseudorca_crassidens'; % Wikipedia
metaData.links.id_ADW = 'Pseudorca_crassidens'; % ADW
metaData.links.id_Taxo = '68779'; % Taxonomicon
metaData.links.id_WoRMS = '137104'; % WoRMS
metaData.links.id_MSW3 = '14300078'; % MSW3
metaData.links.id_AnAge = 'Pseudorca_crassidens'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudorca_crassidens}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'URL = {../../../bib/Kooy2010.html}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FerrKasu2014'; type = 'Article'; bib = [ ... 
'author = {Ferreira, I. M. and Kasuya, T. and Marsh, H. and Brest, P. B.}, ' ... 
'year = {2014}, ' ...
'title = {False killer whales (\emph{Pseudorca crassidens}) from {J}apan and {S}outh {A}frica: Differences in growth and reproduction}, ' ...
'journal = {Marine Mammal Science}, ' ...
'volume = {30}, ' ...
'pages = {64-84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pseudorca_crassidens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Pseudorca_crassidens/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

