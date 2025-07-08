  function [data, auxData, metaData, txtData, weights] = mydata_Lophius_vomerinus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lophiiformes'; 
metaData.family     = 'Lophiidae';
metaData.species    = 'Lophius_vomerinus'; 
metaData.species_en = 'Devil anglerfish'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 02 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 09]; 

%% set data
% zero-variate data
data.am = 11*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(10.2);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 40;   units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
data.Li = 100;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.7 mm for Lophius piscatorius: pi/6*0.07^3'; 

data.GSI = 0.31; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';          bibkey.GSI = 'MaarBoot1999';
  temp.GSI = C2K(10.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
    
% uni-variate data
% time-length data
data.tL = [ ... % age (yr), total length (cm)
    1 14.2
    2 20.2
    3 26.2
    4 34.3
    5 39.2
    6 44.8
    7 51.3
    8 56.1
    9 50.5
   10 58.0];
data.tL(:,1) = 365 * (1 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(10.2); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'MaarBoot1999'};
 
% length-weight
data.LW_f = [ ... % total length (cm),wet weight (g)
14.607	102.869
26.404	172.121
38.343	1058.859
39.185	1909.270
39.747	928.528
39.888	405.413
44.242	995.392
45.787	1747.941
47.753	1323.516
49.298	2403.040
50.000	1160.763
50.702	1618.758
51.124	1684.291
51.264	2632.566
51.685	1684.475
51.685	2011.450
52.247	2273.214
52.247	2534.795
56.461	2928.543
56.601	2078.453
56.742	2405.474
57.865	1621.100
57.865	1457.613
58.146	3419.557
58.287	2438.677
58.848	2667.743
58.848	2798.534
58.848	2994.719
59.691	3420.062
60.815	4107.078
61.236	3126.290
61.517	3420.659
62.219	3224.704
63.062	3388.467
63.624	3323.256
64.185	3813.903
64.607	3519.762
64.607	3715.948
66.152	3683.755
66.152	4697.379
66.854	3912.868
67.697	4697.884
68.539	4927.043
69.663	4436.947
69.944	5810.336
70.787	5222.056
70.787	5483.636
71.770	5680.143
71.910	5091.633
73.876	6269.387
73.876	7086.826
74.157	6629.152
74.719	6531.243
76.826	6237.654
76.966	7251.324
79.213	7153.966
79.213	7709.825
85.393	7319.475
91.433	11572.131];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'wet weight', 'female'};
bibkey.LW_f = {'MaarBoot1999'};
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % total length (cm),wet weight (g)
17.416	103.787
18.258	169.458
18.961	235.083
18.961	235.083
19.663	235.312
19.663	235.312
19.663	137.219
20.787	202.982
20.927	203.028
21.629	170.560
22.051	301.488
22.472	203.533
23.174	171.065
24.157	302.177
25.000	302.452
25.562	302.636
26.966	303.095
27.528	303.279
27.809	401.463
27.809	336.068
28.933	369.133
29.494	500.107
29.635	369.363
30.618	435.079
31.601	468.098
31.882	598.980
32.725	631.954
32.725	272.281
32.865	533.907
33.146	762.882
34.129	567.018
34.129	861.296
34.129	959.388
34.831	894.223
35.674	894.498
35.674	763.708
36.938	600.634
36.938	862.214
36.938	1091.097
38.062	927.977
38.624	830.068
39.045	1157.181
39.607	830.389
39.607	1157.365
40.730	961.547
41.011	1288.614
41.292	896.335
42.135	1027.401
42.135	1223.586
42.837	1289.211
43.680	1158.696
44.101	1387.717
44.944	1616.875
45.506	1257.386
45.506	1453.571
46.910	1388.635
46.910	1682.913
47.753	1388.911
47.753	1683.189
48.876	1683.556
48.876	1879.742
49.579	1945.366
49.719	1487.647
49.719	1683.832
50.843	1880.385
51.264	1782.430
51.404	2109.451
52.388	1750.100
52.388	1946.285
52.388	2142.470
52.949	2469.629
53.652	1848.605
53.933	2404.556
54.354	2208.508
55.056	2077.948
55.197	2601.154
56.180	2405.290
56.180	2470.685
57.163	2732.587
58.006	2863.653
58.989	2896.672
58.989	2733.184
59.551	2733.368
60.253	3518.339
61.096	2799.268
62.500	3126.703
72.753	6105.532];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'wet weight', 'male'};
bibkey.LW_m = {'MaarBoot1999'};
comment.LW_m = 'data for males';
 
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 3 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed on the basis of preferred temperature from fishbase';
metaData.discussion = struct('D1', D1);
                                 
%% Facts
F1 = 'Lives at 150 to 400 m  deep on bottum';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '72MSP'; % Cat of Life
metaData.links.id_ITIS = '690539'; % ITIS
metaData.links.id_EoL = '46566109'; % Ency of Life
metaData.links.id_Wiki = 'Lophius'; % Wikipedia
metaData.links.id_ADW = 'Lophius_vomerinus'; % ADW
metaData.links.id_Taxo = '179106'; % Taxonomicon
metaData.links.id_WoRMS = '217839'; % WoRMS
metaData.links.id_fishbase = 'Lophius-vomerinus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lophius_vomerinus}}';  
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
bibkey = 'MaarBoot1999'; type = 'Article'; bib = [ ...  
'author = {Lima Maartens and Anthony J. Booth and Thomas Hecht}, ' ...
'year = {1999}, ' ...
'title = {The growth of monkfish \emph{Lophius vomerinus} in {N}amibian waters, with a comparison of otolith and illicia methods of ageing}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = {44}, '...
'pages = {139-148}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lophius-vomerinus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
