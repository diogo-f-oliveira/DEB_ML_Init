function [data, auxData, metaData, txtData, weights] = mydata_Globicephala_macrorhynchus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Globicephala_macrorhynchus'; 
metaData.species_en = 'Short-finned pilot whale'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCvm', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 15];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 730;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 730;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 9*365;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'KasuMats1984';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 14.5*365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'KasuMats1984';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 63*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 139.5; units.Lb = 'cm'; label.Lb = 'length at birth';                    bibkey.Lb = 'KasuMats1984';
data.Lp = 315.6; units.Lp = 'cm'; label.Lp = 'length at puberty for females';      bibkey.Lp = 'KasuMats1984';
data.Lpm = 401; units.Lpm = 'cm'; label.Lpm = 'length at puberty for males';       bibkey.Lpm = 'KasuMats1984';
data.Li = 364.7; units.Li = 'cm'; label.Li = 'ultimate length for females';        bibkey.Li = 'KasuMats1984';
data.Lim = 480; units.Lim = 'cm'; label.Lim = 'ultimate length for males';         bibkey.Lim = 'KasuMats1984';

data.Wwb = 37e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'KasuMats1984';
data.Wwp = 391e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';  bibkey.Wwp = 'KasuMats1984';
data.Wwpm = 781e3;   units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males'; bibkey.Wwpm = 'KasuMats1984';
data.Wwi  = 593e3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'KasuMats1984';  
data.Wwim = 1260e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'KasuMats1984';  

data.Ri  = 1/365/5;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calf per litter, 1 litter per 5 yr';
  
% uni-variate data
% time-length
data.tL_f = [ % time since birth (yr), length (cm)
0.507	184.803
1.423	230.113
2.414	247.842
3.076	262.289
4.147	264.916
5.386	283.302
6.458	293.809
7.114	283.959
8.440	319.418
9.264	325.985
10.418	333.208
11.491	343.715
12.475	329.925
13.300	340.432
14.372	348.968
15.525	351.595
16.431	354.221
17.582	346.341
18.408	359.475
19.477	354.221
20.469	372.608
21.535	356.848
22.277	364.071
23.348	368.668
24.417	364.728
25.569	363.415
26.474	359.475
27.545	365.385
28.449	360.788
29.521	367.355
30.425	362.101
31.414	367.355
32.482	359.475
33.556	375.235
34.539	358.161
35.364	364.071
36.187	367.355
37.340	368.011
38.410	368.668
39.640	349.625
40.303	368.668
41.374	371.295
42.359	360.131
43.430	365.385
44.500	365.385
45.571	371.295
46.560	377.861
47.543	357.505
48.530	354.221
49.522	373.265
50.428	373.265
51.493	355.535
52.236	362.101
55.366	372.608
57.420	359.475
62.443	368.668]; 
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d', 'kg'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f  = C2K(37);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KasuMats1984';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), length (cm)
0.254	159.850
1.423	230.113
2.088	258.349
3.571	267.542
4.477	270.826
5.389	296.435
6.129	295.779
7.451	314.165
8.277	328.612
9.349	337.148
10.584	339.775
11.414	369.325
12.405	381.144
13.312	391.651
14.469	408.068
15.624	419.887
16.446	415.947
18.100	450.750
18.589	431.051
19.598	519.043
20.817	454.690
21.556	448.780
22.545	452.720
23.865	467.167
24.521	456.660
25.599	490.807
26.501	475.704
27.653	474.390
28.570	523.640
29.545	472.420
30.778	463.884
31.592	427.111
32.595	490.807
33.495	469.794
34.487	488.180
36.378	477.674
38.690	509.193
39.664	450.094
40.404	450.094
41.645	475.704
42.304	478.330
45.589	446.154]; 
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d', 'kg'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m  = C2K(37);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KasuMats1984';
comment.tL_m = 'Data for males';

% length-weight
data.LW = [ ...
12.536	32.398
23.239	211.169
30.693	502.960
36.205	736.836
52.616	2124.190
58.402	2903.211
65.389	3766.601
65.389	4108.091
69.492	4480.540
71.951	6018.352
93.390	11048.671
121.218	23304.892
142.988	38552.377
256.010	246958.933
262.775	226430.218
265.069	374574.700
274.449	242709.440
274.449	264714.069
281.701	278863.219
281.701	337528.162
284.160	242709.440
284.160	309470.788
284.160	387806.052
286.641	374574.700
312.675	401504.783
326.566	494478.683
338.122	374574.700
338.122	461312.572
341.074	530029.275
356.226	750000.020
405.843	641532.462];
units.LW  = {'cm', 'g'};  label.LW = {'length', 'weight'};  
bibkey.LW = 'KasuMats1984';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 50 * weights.Li;
weights.Lim = 50 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.k = 5 * weights.psd.k_J; weights.psd.k_J = 0;
weights.psd.p_M = 5 * weights.psd.p_M;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3G9Z4'; % Cat of Life
metaData.links.id_ITIS = '180466'; % ITIS
metaData.links.id_EoL = '46559255'; % Ency of Life
metaData.links.id_Wiki = 'Globicephala_macrorhynchus'; % Wikipedia
metaData.links.id_ADW = 'Globicephala_macrorhynchus'; % ADW
metaData.links.id_Taxo = '68767'; % Taxonomicon
metaData.links.id_WoRMS = '137096'; % WoRMS
metaData.links.id_MSW3 = '14300051'; % MSW3
metaData.links.id_AnAge = 'Globicephala_macrorhynchus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Globicephala_macrorhynchus}}';
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
bibkey = 'KasuMats1984'; type = 'article'; bib = [ ... 
'author = {T. Kasuya and S. Matsui}, ' ... 
'year = {1984}, ' ...
'title = {Age determination and growth of the short-finned pilot whale off the {P}acific coast of {J}apan}, ' ...
'journal = {Sci. Rep. Whales Res. Inst.}, ' ...
'volume = {35}, ' ...
'pages = {57--91}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Globicephala_macrorhynchus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Globicephala_macrorhynchus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

