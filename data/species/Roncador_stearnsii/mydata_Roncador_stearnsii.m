function [data, auxData, metaData, txtData, weights] = mydata_Roncador_stearnsii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Roncador_stearnsii'; 
metaData.species_en = 'Spotfin croaker'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 12];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 12];

%% set data
% zero-variate data

data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(17.8); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 15*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(17.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Cynoscion_nebulosus';

data.Lp  = 17.9;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
data.Li  = 70;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.72 mm for Cynoscion_nebulosus: pi/6*0.072^3';
data.Wwi = 4.1e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00851*Li^3.08, see F1';

data.Ri = 0.74e6/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(17.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Cynoscion_regalis: 1.7e6*4.1e3/9.4e3';
 
% uni-variate data
% time-length
data.tL = [ ... % yr class (yr), standard length (cm)
 1	9.630
 2	19.598
 3	26.643
 4	31.183
 5	34.222
 6	36.675
 7	39.295
 8	42.250
 9	44.035
10	45.238];
data.tL(:,1) = data.tL(:,1)*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(17.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Jose1962'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
11.200	44.277
11.567	44.217
12.210	47.814
13.131	62.478
13.312	43.929
13.680	51.276
13.682	66.091
13.682	66.091
14.051	77.141
14.511	80.769
15.339	88.040
16.076	102.734
16.811	106.316
17.826	135.779
18.104	150.548
18.748	161.553
19.026	176.322
19.483	165.136
19.579	191.046
19.670	187.327
20.042	213.192
20.314	194.629
20.591	201.990
21.055	231.544
21.056	238.951
21.326	205.573
21.608	246.267
21.881	231.408
22.068	253.599
22.348	279.479
22.529	260.931
22.806	275.700
23.080	260.840
23.174	275.639
23.181	323.786
23.544	294.097
23.551	338.540
24.009	334.761
24.194	338.434
24.658	375.395
24.745	338.344
25.029	397.556
25.211	382.712
25.211	382.712
25.400	419.717
25.773	460.397
26.039	393.686
26.040	404.797
26.042	412.204
26.047	449.240
26.049	460.351
26.235	478.839
26.593	415.817
26.973	497.236
27.258	556.449
27.335	463.843
27.527	515.664
27.625	556.388
27.885	456.345
27.886	463.753
28.082	545.202
28.354	519.231
28.544	559.941
28.645	622.887
28.995	508.014
29.003	563.569
29.492	752.377
29.843	648.616
30.206	618.926
30.481	618.881
30.759	629.946
30.939	607.695
31.238	763.201
31.325	733.557
31.584	626.107
31.863	648.283
31.970	744.562
32.434	777.819
32.522	748.175
32.713	799.995
32.910	888.851
32.976	714.767
33.566	973.929
33.664	1010.950
33.919	877.574
34.206	955.305
34.215	1014.563
34.509	1133.033
34.768	1021.879
34.935	918.148
34.961	1088.514
35.049	1062.573
35.681	992.099
36.051	1006.853
36.152	1066.096
36.164	1143.871
36.258	1162.374
36.270	1236.447
36.610	1062.316
36.616	1095.649
36.973	1028.924
37.629	1114.001
37.811	1102.860
37.826	1206.561
38.091	1132.443
38.363	1113.880
39.344	1521.126
40.003	1624.721
40.559	1661.666
41.487	1720.773
41.747	1624.434
42.651	1527.989
42.669	1642.801
44.050	1668.499
45.226	2153.491
45.526	1708.997
46.070	2264.463];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'Jose1962'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00851*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4TB3T'; % Cat of Life
metaData.links.id_ITIS = '646515'; % ITIS
metaData.links.id_EoL = '46579243'; % Ency of Life
metaData.links.id_Wiki = 'Roncador_stearnsii'; % Wikipedia
metaData.links.id_ADW = 'Roncador_stearnsii'; % ADW
metaData.links.id_Taxo = '186302'; % Taxonomicon
metaData.links.id_WoRMS = '282628'; % WoRMS
metaData.links.id_fishbase = 'Roncador-stearnsii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Roncador_stearnsii}}';
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
bibkey = 'Jose1962'; type = 'Article'; bib = [ ... 
'author = {Joseph, D.}, ' ... 
'year = {1962}, ' ...
'title = {Growth characteristics of two southern, {C}alifornia surffishes, the {C}alifornia Corbina and Sponfin Croaker, family {S}ciaenidae, {C}alif. Fish Game}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {119}, ' ...
'pages = {1-54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Roncador-stearnsii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

