function [data, auxData, metaData, txtData, weights] = mydata_Coryphaenoides_armatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Coryphaenoides_armatus'; 
metaData.species_en = 'Abyssal grenadier'; 

metaData.ecoCode.climate = {'MA','MB','MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 31];

%% set data
% zero-variate data

data.am = 40*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'BergHunt2021';   
  temp.am = C2K(3.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 40;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 102;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of C. rupestris of 2.6 mm: pi/6*0.26^3';
data.Wwp = 293;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00219*Lp^3.20, see F1';
data.Wwi = 5.86e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00219*Li^3.20, see F1';

data.Ri  = 7e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(3.3);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap=0.9';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (mm)
10.852	0.196
10.977	0.281
11.042	0.416
11.283	0.213
11.474	0.484
11.592	0.264
11.595	0.366
12.151	0.450
12.154	0.586
12.642	0.383
12.704	0.417
12.707	0.569
12.896	0.755
13.016	0.620
13.449	0.671
13.628	0.451
13.693	0.570
13.760	0.806
13.999	0.519
14.370	0.587
15.114	0.807
15.173	0.689
16.036	0.723
16.409	0.892
16.465	0.656
16.662	1.163
16.904	1.011
16.961	0.808
17.022	0.757
17.341	1.265
17.584	1.113
17.758	0.656
17.888	0.944
18.014	1.062
18.137	1.062
18.256	0.859
18.629	1.046
18.633	1.198
18.642	1.620
18.875	1.029
18.941	1.232
19.303	0.894
19.434	1.215
19.506	1.688
20.048	1.148
20.053	1.401
20.181	1.604
20.486	1.469
20.917	1.469
20.927	1.926
21.218	1.165
21.285	1.419
21.467	1.301
21.477	1.740
21.535	1.554
21.595	1.504
21.651	1.267
21.726	1.859
21.783	1.622
21.899	1.318
22.034	1.842
22.098	1.977
22.153	1.690
22.207	1.318
22.337	1.656
22.340	1.774
22.454	1.386
22.523	1.673
22.529	1.960
22.965	2.164
23.016	1.724
23.137	1.623
23.139	1.724
23.199	1.657
23.440	1.403
23.522	2.299
23.634	1.792
23.637	1.961
23.815	1.640
23.941	1.792
24.131	1.995
24.307	1.640
24.371	1.725
24.436	1.860
24.564	2.097
24.573	2.486
24.678	1.708
24.689	2.181
24.930	1.962
24.985	1.658
25.051	1.844
25.356	1.742
25.445	2.926
25.554	2.317
25.666	1.810
25.669	1.928
25.737	2.216
25.856	2.064
25.971	1.675
26.228	2.148
26.285	1.963
26.405	1.810
26.411	2.081
26.530	1.912
26.540	2.351
26.782	2.166
27.020	1.777
27.027	2.081
27.147	1.963
27.226	2.741
27.325	1.659
27.399	2.200
27.450	1.743
27.464	2.369
27.580	2.065
27.835	2.420
27.952	2.149
28.010	1.997
28.070	1.930
28.139	2.251
28.251	1.778
28.380	2.048
28.511	2.386
28.621	1.778
28.722	3.536
28.744	1.812
28.776	3.198
28.806	1.829
28.815	2.201
28.881	2.387
28.940	2.285
29.191	2.505
29.243	2.082
29.425	1.964
29.433	2.302
29.866	2.387
29.933	2.624
29.985	2.201
30.060	2.793
30.234	2.320
30.256	3.300
30.287	1.965
30.611	2.658
30.655	1.897
30.659	2.083
30.723	2.185
30.728	2.404
31.033	2.286
31.038	2.506
31.044	2.760
31.087	1.948
31.288	2.658
31.337	2.084
31.346	2.489
31.524	2.202
31.700	1.796
31.835	2.321
31.900	2.473
31.966	2.676
32.016	2.169
32.088	2.625
32.330	2.456
33.017	2.862
33.020	3.014
33.248	2.186
33.264	2.879
33.695	2.913
33.699	3.065
33.940	2.863
33.982	1.967
34.131	3.099
34.170	2.136
34.228	1.967
34.425	2.491
34.742	2.897
35.472	2.508
35.668	3.016
36.573	2.222
36.706	2.644
38.563	3.068];
data.tL(:,1) = 365*(data.tL(:,1)-9); % convert yr to d
data.tL(:,2) = data.tL(:,2)*2.67*10; % convert PAL to TL, see F2
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(3.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BergHunt2021';
comment.tL = 'PAL was converted to TL using TL=2.67*TL, see F2, assuming that the correct unit is cm, not mm';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Li = 3 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';  
D2 = 'I had to subtract 9 yrs from age estimates in tL data to arrive at an acceptable fit';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight Ww in g = 0.00219*(TL in cm)^3.20';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: TL = 2.67*PAL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'YS2J'; % Cat of Life
metaData.links.id_ITIS = '165353'; % ITIS
metaData.links.id_EoL = '46564512'; % Ency of Life
metaData.links.id_Wiki = 'Coryphaenoides_armatus'; % Wikipedia
metaData.links.id_ADW = 'Coryphaenoides_armatus'; % ADW
metaData.links.id_Taxo = '171926'; % Taxonomicon
metaData.links.id_WoRMS = '158952'; % WoRMS
metaData.links.id_fishbase = 'Coryphaenoides_armatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coryphaenoides_armatus}}';
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
bibkey = 'BergHunt2021'; type = 'article'; bib = [ ... 
'doi = {10.1111/jfb.14801}, ' ...
'author = {Odd Aksel Bergstad and Rebecca H. Hunter and Nicola J.Cousins and David M. Bailey and Terje J{/o}rgensen}, ' ... 
'year = {2021}, ' ...
'title = {Notes on age determination, size and age structure, longevity and growth of co-occurring macrourid fishes}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {99}, '...
'pages = {1032–1043}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Coryphaenoides-armatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

