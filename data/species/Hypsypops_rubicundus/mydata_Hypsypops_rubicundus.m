function [data, auxData, metaData, txtData, weights] = mydata_Hypsypops_rubicundus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Hypsypops_rubicundus'; 
metaData.species_en = 'Garibaldi damselfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 22];

%% set data
% zero-variate data

data.ab = 12;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(17.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 57*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(17.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 30;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 9.1e-5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 0.7 mm and width 0.5 mm of Dascyllus albisella: pi/6*0.07*0.05^2'; 
data.Wwp = 65.8;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwi = 'based on 0.01950*Lp^3.00, see F1';
data.Wwi = 526.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01950*Li^3.00, see F1';

data.Ri  = 8e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(17.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time (yr), total length (mm)
0.815	133.615
0.825	99.820
1.678	102.932
1.847	107.090
2.006	149.723
2.012	126.846
2.519	146.079
2.946	144.515
3.041	110.199
3.712	152.308
3.791	173.104
3.884	147.107
4.138	152.824
4.212	193.898
5.069	183.492
5.076	158.015
5.920	189.723
6.088	199.081
6.089	195.961
6.178	184.002
6.850	220.911
7.038	161.118
7.959	224.021
8.904	203.216
9.922	222.964
10.949	214.636
11.971	220.867
12.907	232.817
13.079	227.616
14.098	243.725
14.279	210.448
15.034	254.116
15.040	235.398
15.551	236.954
16.323	222.909
16.835	224.984
16.919	230.703
17.169	249.938
19.052	232.764
19.133	246.281
20.928	238.467
21.872	219.221
21.954	231.179
22.972	253.527
28.095	244.644
28.939	279.992
33.727	248.235
33.978	266.950
34.071	240.953
34.667	244.587
35.265	243.542
35.950	236.257
36.722	221.692
36.804	233.650
37.912	237.800
38.077	259.115
39.021	239.870
42.862	239.837];
data.tL_f(:,1) = 365*(data.tL_f(:,1) + 0.4); % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2)/ 10; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(17.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WillEagl2022';
comment.tL_f = 'data from Santa Catalina Island';
%
data.tL_m = [ ... % time (yr), total length (mm)
0.736	110.739
1.253	93.577
1.751	146.085
2.261	150.760
2.356	116.964
2.949	132.037
2.951	128.397
2.954	115.399
3.115	150.753
3.199	153.352
4.057	138.266
4.058	135.147
4.217	178.300
4.981	192.331
6.166	226.116
9.240	221.930
11.109	252.070
11.796	236.986
13.156	255.692
13.500	248.410
13.924	257.245
13.926	247.886
14.101	235.406
14.858	272.315
15.031	263.995
15.379	241.115
15.720	242.671
15.724	230.713
15.802	254.629
15.889	250.989
15.975	245.789
16.830	242.142
17.090	228.621
18.019	263.969
18.959	257.721
19.979	273.310
20.070	254.072
20.833	271.743
20.924	251.465
21.185	232.745
22.033	253.535
22.117	259.254
22.974	246.248
23.140	263.404
24.082	251.958
26.125	269.618
29.971	250.347
33.981	254.991
34.660	270.584
35.089	261.741
35.173	265.380
36.281	271.089
37.221	269.002
37.820	262.237
38.070	284.592
41.064	261.169];
data.tL_m(:,1) = 365*(data.tL_m(:,1) + 0.4); % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2)/ 10; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(17.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WillEagl2022';
comment.tL_m = 'data from Santa Catalina Island';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01950*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3P4S9'; % Cat of Life
metaData.links.id_ITIS = '170120'; % ITIS
metaData.links.id_EoL = '46572595'; % Ency of Life
metaData.links.id_Wiki = 'Hypsypops_rubicundus'; % Wikipedia
metaData.links.id_ADW = 'Hypsypops_rubicundus'; % ADW
metaData.links.id_Taxo = '177387'; % Taxonomicon
metaData.links.id_WoRMS = '281130'; % WoRMS
metaData.links.id_fishbase = 'Hypsypops-rubicundus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hypsypops_rubicundus}}';
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
bibkey = 'WillEagl2022'; type = 'Article'; bib = [ ... 
'doi = {10.3389/fmars.2022.988158}, ' ...
'author = {Chelsea M. Williams and Jacob L. Eagleton and Daniel J. Pondella and Jeremy T. Claisse}, ' ... 
'year = {2022}, ' ...
'title = {Habitat type and environmental conditions influence the age and growth of a temperate marine damselfish}, ' ...
'journal = {Frontiers in Marine Science}, ' ...
'volume = {9}, ' ...
'pages = {988158}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Hypsypops-rubicundus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
