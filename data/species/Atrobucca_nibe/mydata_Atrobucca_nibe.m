function [data, auxData, metaData, txtData, weights] = mydata_Atrobucca_nibe
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Atrobucca_nibe'; 
metaData.species_en = 'Blackmouth croaker'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSE', 'MI'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L', 'L-W'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 14];

%% set data
% zero-variate data;

data.ab = 4.5;      units.ab = 'd';      label.ab = 'age at birth';                bibkey.ab = 'guess';    
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';      
data.am = 15*365;       units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';      
  
data.Lp  = 14.5;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty';   bibkey.Lp  = 'fishbase';
data.Li  = 45;   units.Li  = 'cm';   label.Li  = 'ultimate total lenght';     bibkey.Li  = 'fishbase';

data.Wwb = 1.95e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.72 mm for Cynoscion_nebulosus: pi/6*0.072^3';
data.Wwi = 1.12e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01096*Li^3.03, see F1';

data.Ri  = 3.7e6/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';       bibkey.Ri  = 'guess';   
temp.Ri = C2K(24.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Cynoscion_othonopterus: 12e6*1.12e3/3.6e3';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    2.53 23.84
    3.69 29.23
    6.34 37.77
    2.68 24.59
    4.14 31.00
    8.09 41.38
    2.54 23.87
    5.59 35.80
    9.34 43.30
    3.21 27.11
    5.13 34.41
    7.90 41.00
    2.60 24.16
    5.52 35.60
    8.88 42.64];
[~, ind] = sort(data.tL(:,1),1); data.tL = data.tL(ind,:); % order times
data.tL(:,1) = data.tL(:,1)*365; % convert year class to time since birth
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};     
temp.tL = C2K(24.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SalaBehz2022'; 
  
data.LW = [ ... % total length(cm), weight (g)
18.074	54.716
18.865	56.994
19.063	50.040
19.525	68.537
19.921	66.204
20.317	82.390
20.580	77.748
20.844	84.680
21.240	100.865
21.372	110.119
21.570	84.646
21.636	70.754
22.032	114.718
22.559	93.860
22.691	128.576
23.351	147.064
23.549	105.388
24.142	147.027
24.142	128.509
24.538	172.472
24.604	137.747
24.604	158.580
24.868	163.197
25.000	142.358
25.066	267.355
25.264	184.012
25.330	140.028
25.462	174.744
25.923	195.556
26.055	149.254
26.253	183.967
26.319	172.389
26.385	200.164
26.913	174.677
26.913	216.343
27.045	119.115
27.309	209.381
27.375	172.341
27.704	190.844
28.100	244.066
28.100	190.826
28.364	223.221
28.628	262.560
28.694	211.631
28.958	200.045
29.090	267.169
29.354	200.027
29.420	244.005
29.617	355.107
29.683	255.567
29.683	278.715
29.881	218.521
30.079	234.715
30.145	290.268
30.211	276.376
30.277	239.336
30.343	292.574
30.409	352.756
30.475	246.271
30.475	246.271
30.739	313.389
31.135	225.407
31.266	334.197
31.332	313.361
31.398	274.006
31.464	243.911
31.530	368.907
31.662	306.401
31.860	257.781
31.860	343.429
32.058	368.883
32.124	343.417
32.124	276.287
32.520	297.102
32.652	361.911
32.718	371.167
32.718	401.260
32.982	336.433
33.113	317.908
33.377	371.137
33.377	385.026
33.443	317.893
33.509	433.631
33.839	419.727
33.905	350.279
34.103	452.122
34.169	329.433
34.235	317.856
34.301	405.816
34.499	422.011
34.565	459.045
34.631	394.227
34.631	361.819
34.828	489.125
35.026	470.597
35.158	401.147
35.158	401.147
35.158	368.739
35.224	456.699
35.422	361.783
35.488	463.632
35.554	572.425
35.752	470.564
35.752	463.619
35.950	479.814
35.950	435.832
36.082	509.900
36.082	414.993
36.412	477.478
36.544	445.064
36.544	410.342
36.741	489.037
36.873	521.438
36.873	433.475
36.939	458.935
37.071	600.132
37.203	505.219
37.467	796.873
37.467	560.762
37.533	544.555
37.533	583.907
37.533	442.704
37.731	454.269
37.929	667.222
37.929	532.963
37.929	468.148
38.127	435.732
38.193	651.006
38.193	502.858
38.522	604.695
38.522	454.232
38.654	572.281
38.918	646.343
38.918	544.491
38.984	618.562
39.116	688.001
39.578	507.424
39.644	627.791
39.644	602.328
39.710	611.584
39.842	650.930
39.974	669.442
40.106	593.047
40.172	560.637
40.303	653.224
40.303	532.853
40.567	634.693
40.633	421.727
41.029	687.912
41.161	627.721
41.293	562.900
41.359	717.989
41.491	680.946
41.557	738.814
41.821	667.042
41.953	569.814
42.018	685.552
42.084	724.900
42.414	852.200
42.612	636.913
43.404	798.913
43.602	592.886
44.195	822.025
44.987	789.581
45.317	731.695];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'SalaBehz2022';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'JLTW'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46579095'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Atrobucca_nibe'; % ADW
metaData.links.id_Taxo = '162601'; % Taxonomicon
metaData.links.id_WoRMS = '218637'; % WoRMS
metaData.links.id_fishbase = 'Atrobucca-nibeo'; % fishbase

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% References 
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Atrobucca_nibe}}';
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
bibkey = 'SalaBehz2022'; type = 'Article'; bib = [ ... 
'author = {Ali Salarpouri and Siamak Behzadi and Tooraj Valinassab and Farhad Kaymaram and Arezu Vahabnezhad and Mohammad Momeni}, ' ...
'year = {2022}, ' ...
'title = {Growth and mortality of new exploited stock of the blackmouth croaker, \emph{Atrobucca nibe} ({J}ordan \& {T}hompson, 1911) from the {O}man {S}ea}, ' ...
'journal = {Iran. J. Ichthyol.}, ' ...
'volume = {9(1)}, ' ...
'pages = {43-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.se/summary/Atrobucca-nibe.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

