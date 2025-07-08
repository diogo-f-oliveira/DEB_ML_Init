function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_nebulosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_nebulosus'; 
metaData.species_en = 'China rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 23];

%% set data
% zero-variate data

data.am = 79*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(8.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 27;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 45;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 265;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 1.3e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 380e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(8.9);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based in fecundity of Sebastes_pinniger: 1.9e6*1.3e3/6.5e3';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) 
  1 NaN
  2 10.6
  3 20.7
  4 14.3
  5 17.9
  6 25.8
  7 27.1
  8 29.6
  9 30.1
 10 31.0
 11 33.3
 12 34.8
 13 35.4
 14 33.8
 15 36.2
 16 36.4
 17 36.9
 18 35.6
 19 36.6
 20 39.9
 21 36.5
 22 34.2
 23 NaN
 24 NaN
 25 NaN
 26 37.0];
data.tL(:,1) = 365*(0.9+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(8.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeaMcAl1999'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
9.617	20.420
11.183	25.686
13.591	50.240
14.096	64.035
15.326	61.030
17.963	124.430
20.602	196.164
22.903	251.293
23.907	239.996
24.368	326.022
25.208	336.978
25.829	375.751
26.224	397.901
27.132	481.066
27.231	403.270
27.299	478.257
27.633	467.084
28.141	497.546
28.197	503.091
28.241	428.083
28.369	525.281
28.712	572.440
29.087	475.148
29.208	527.904
29.659	552.820
29.730	647.251
29.744	733.360
29.996	561.091
30.502	580.442
30.723	566.512
30.844	624.823
30.918	738.698
30.944	549.804
30.958	638.691
31.042	810.897
31.177	608.094
31.578	666.354
31.651	777.451
31.826	819.085
31.853	638.525
32.251	682.896
32.276	838.447
32.371	732.873
32.424	713.419
32.820	746.679
32.831	813.344
32.854	955.006
33.054	813.302
33.224	824.382
33.269	754.929
33.358	963.246
33.513	885.440
33.553	785.432
33.554	793.765
33.627	896.530
33.634	940.973
33.852	907.599
33.971	954.799
34.007	824.237
34.015	874.236
34.032	982.566
34.317	1018.624
34.350	874.174
34.358	924.172
34.377	1040.835
34.469	918.596
34.474	949.151
34.509	821.366
34.693	921.332
34.706	1001.885
34.790	832.425
35.038	982.379
35.110	1085.144
35.146	957.360
35.256	949.006
35.309	926.774
35.372	971.207
35.524	873.956
35.610	1062.829
35.719	1043.365
35.971	873.873
36.113	1062.736
36.399	1104.350
36.492	1334.888
36.496	1009.887
36.500	1034.887
36.724	1040.401
36.826	979.271
36.838	1054.268
37.008	1068.126
37.082	1179.223
37.712	1276.329
37.883	1292.964
39.280	1292.705
39.888	1248.148];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LeaMcAl1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
%weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
%set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
%set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
%metaData.grp.sets = {set2};
%metaData.grp.subtitle = {subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7NR'; % Cat of Life
metaData.links.id_ITIS = '166731'; % ITIS
metaData.links.id_EoL = '46568169'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_nebulosus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_nebulosus'; % ADW
metaData.links.id_Taxo = '187303'; % Taxonomicon
metaData.links.id_WoRMS = '274824'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-nebulosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_nebulosus}}';
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
bibkey = 'LeaMcAl1999'; type = 'techreport'; bib = [ ... 
'author = {Lea, R.N. and R.D. McAllister and D.A. VenTresca},' ...
'year = {1999}, ' ...
'title = {Biological Aspects of Nearshore Rockfishes of the Genus \emph{Sebastes} from {C}entral {C}alifornia With Notes On Ecologically Related Sport Fishes}, ' ...
'institution = {State of California, the Resources Agency, Department of Fish and Game}, ' ...
'volume = {Fish Bulletin 177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-nebulosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
