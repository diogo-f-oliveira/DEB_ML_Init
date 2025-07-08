function [data, auxData, metaData, txtData, weights] = mydata_Rhizoprionodon_porosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Rhizoprionodon_porosus'; 
metaData.species_en = 'Caribbean sharpnose shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 29];

%% set data
% zero-variate data
data.ab = 155;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(24.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'guess';   
  temp.am = C2K(24.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 35;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
  comment.Lb = '31-39 cm';
data.Lp  = 65;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 113;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwi = 4.7e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00214*Li^3.09, see F1; max published weight: 7.5 kg';

data.Ri  = 4/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(24.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-6 pups per litter, 1 litter per yr assumed';

% uni-variate data
 
% length at t-length at t+1
data.LL_f = [ ... % length at t (cm), length at t+dt (cm)
47.215	51.397
53.418	63.687
63.291	64.246
64.937	65.922
68.987	74.860
73.038	78.212];
units.LL_f   = {'cm', 'cm'};  label.LL_f = {'total length at t','total length at t+1','females'};  
temp.LL_f    = C2K(24.2);  units.temp.LL_f = 'K'; label.temp.LL_f = 'temperature';
bibkey.LL_f  = 'MattPere2002';
%
data.LL_m = [ ... % length at t (cm), length at t+dt (cm)
44.769	53.761
53.960	58.134
57.428	63.511
62.543	64.630
65.405	73.813];
units.LL_m   = {'cm', 'cm'};  label.LL_m = {'total length at t','total length at t+1','males'};  
temp.LL_m    = C2K(24.2);  units.temp.LL_m = 'K'; label.temp.LL_m = 'temperature';
bibkey.LL_m  = 'MattPere2002';

% length-weight
data.LW_f = [ ... % length (cm), weight (g)
43.312	270.558
46.483	415.316
48.698	260.260
49.888	373.367
49.890	462.615
52.980	493.816
54.012	606.988
55.360	695.691
56.467	597.879
57.183	727.406
59.321	718.425
59.561	831.917
61.304	863.665
61.855	701.169
62.492	846.956
63.123	700.655
64.238	1024.746
65.027	886.495
65.029	975.744
66.306	1453.928
66.376	1007.652
66.537	1104.950
66.687	715.436
67.245	869.368
67.805	1169.344
68.041	1055.658
69.152	1160.684
69.620	827.837
69.625	1063.129
70.019	973.720
70.104	1249.547
70.814	1103.214
71.213	1273.438
71.528	1192.174
71.611	1378.753
72.562	1370.254
73.192	1223.953
74.864	1637.069
75.097	1385.453
75.257	1474.637
75.741	1920.689
76.130	1579.760
76.448	1652.653
77.479	1709.030
78.266	1457.189
78.340	1156.957
78.751	1927.581
79.939	1918.985
80.014	1724.229
81.280	1650.693
82.472	1869.276
83.347	2006.852
83.611	3361.715
83.985	2241.887
85.173	2233.292
85.247	2006.081
88.264	2353.742
89.778	2791.262
90.336	2961.421
90.569	2734.146
91.057	3383.035
91.201	2660.867
91.519	2709.419
91.521	2823.009
92.246	3415.007
92.393	2871.336
93.499	2716.730
95.971	3567.654
97.630	3347.914
99.363	2827.941
100.874	3127.531];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','weight','females'};  
bibkey.LW_f  = 'MattPere2002';
%
data.LW_m = [ ... % length (cm), weight (g)
36.816	192.058
41.016	295.830
42.997	335.595
46.959	423.237
49.979	925.054
50.127	430.065
51.079	510.815
51.395	478.232
52.741	453.345
52.902	550.643
53.932	582.680
55.280	655.155
56.388	581.684
56.944	686.934
58.846	718.617
59.482	848.177
60.193	742.412
60.987	831.339
61.462	814.919
61.856	749.850
62.727	717.043
63.047	879.185
64.000	1000.502
64.154	781.373
65.186	894.544
66.061	1097.029
66.929	926.291
67.409	1161.391
68.674	1063.515
69.311	1201.187
70.019	989.947
70.101	1119.731
71.133	1232.902
72.324	1346.010
73.274	1329.397
73.515	1499.685
74.304	1353.320
75.418	1604.389
75.654	1547.498
75.732	1498.785
76.370	1717.593
80.015	1756.683
80.567	1659.095
82.157	1942.426
83.346	1974.398];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','weight','males'};  
bibkey.LW_m  = 'MattPere2002';

%% set weights for all real data
weights = setweights(data, []);
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
set1 = {'LL_f','LL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00214*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4SDDM'; % Cat of Life
metaData.links.id_ITIS = '160206'; % ITIS
metaData.links.id_EoL = '46559823'; % Ency of Life
metaData.links.id_Wiki = 'Rhizoprionodon_porosus'; % Wikipedia
metaData.links.id_ADW = 'Rhizoprionodon_porosus'; % ADW
metaData.links.id_Taxo = '106461'; % Taxonomicon
metaData.links.id_WoRMS = '271328'; % WoRMS
metaData.links.id_fishbase = 'Rhizoprionodon-porosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhizoprionodon_porosus}}';
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
bibkey = 'MattPere2002'; type = 'article'; bib = [ ... 
'doi = {10.32360/acmar.v35i1-2.30901}, ' ...
'author = {S\''{e}rgio Macedo Gomes de Mattos and Jos\''{e} Arlindo Pereira}, ' ... 
'year = {2002}, ' ...
'title = {Growth parameters of the {C}aribbean sharpnose shark, \emph{Rhizoprionodon porosus} ({P}oey 1861), off {P}ernambuco {S}tate, {B}razil}, ' ...
'journal = {Arquivos de Ci\^{e}ncias do Mar}, ' ...
'volume = {35(1-2)}, ' ...
'pages = {8-17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Rhizoprionodon-porosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

