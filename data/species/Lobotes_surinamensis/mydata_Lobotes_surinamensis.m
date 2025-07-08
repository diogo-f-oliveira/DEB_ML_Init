function [data, auxData, metaData, txtData, weights] = mydata_Lobotes_surinamensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lobotiformes'; 
metaData.family     = 'Lobotidae';
metaData.species    = 'Lobotes_surinamensis'; 
metaData.species_en = 'Atlantic tripletail';

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'t-Ww';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 12]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 12]; 

%% set data
% zero-variate data

data.ab = 1;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'iucn';   
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Mick2016';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 48.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'iucn'; 
data.Lpm  = 29; units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'iucn'; 
data.Li  = 110;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Mick2016';
  comment.Wwb = 'based egg diameter of 0.5 mm: 4/3*pi*0.025^3'; 
data.Wwp = 2624; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'iucn';
  comment.Wwp = 'based on 0.0428 * Lp^2.840, see F1';
data.Wwpm = 609; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';   bibkey.Wwpm = 'iucn';
  comment.Wwp = 'based on 0.0428 * Lpm^2.840, see F1';
data.Wwi = 26853; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0428 * Li^2.840, see F1';

data.Ri = 8e6/365; units.Ri = '#/d';  label.Ri = 'reprod rate at 61 cm';   bibkey.Ri = 'Mick2016';
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% t-L data 
data.tL = [ ... % time (d), total length (g)
1.000	7.313
60.714	19.636
120.429	28.480
210.000	35.487];
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FranOgle2001';
% t-W data 
data.tW = [ ... % time (d), wet weight (g)
0.590	14.611
60.831	188.572
120.253	507.730
210.410	1010.155];
units.tW  = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(27);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'FranOgle2001';

data.LW = [ ... % total length (cm), wet weight (g)
23.889	242.368
25.517	243.167
25.879	346.396
26.240	312.224
28.049	416.163
29.587	588.674
30.943	589.340
31.757	589.739
32.571	693.193
33.385	727.942
33.475	934.093
34.109	831.350
34.832	831.705
34.922	797.399
35.103	969.243
35.556	1072.519
35.917	832.238
36.189	1072.830
36.641	832.593
37.093	1073.273
37.183	935.912
37.997	1039.366
38.088	1211.166
38.540	1177.037
39.083	1246.005
40.168	1280.889
40.168	1486.996
40.258	1658.796
40.891	1246.893
41.072	1418.738
41.796	1419.093
42.158	1728.430
42.429	1488.106
42.610	1900.408
42.881	2003.594
43.786	1763.581
43.786	1591.824
44.238	2210.367
44.419	1489.082
44.419	1935.647
44.961	1661.103
45.323	1833.037
45.504	2210.989
45.594	1970.575
46.589	1421.445
46.589	1902.361
46.680	2177.215
46.770	1936.800
47.403	2177.570
47.765	2383.853
47.765	2624.312
48.398	2178.058
48.398	1181.874
48.579	2452.955
48.941	2659.240
49.302	2281.555
49.574	2728.253
49.664	2109.976
49.755	2419.181
50.026	2384.963
50.026	3071.986
50.026	2865.879
50.568	2591.337
51.021	2969.421
51.835	3141.576
52.196	2901.295
52.196	2592.135
52.377	3141.842
52.739	3004.615
53.101	3417.007
53.101	3726.167
53.372	4035.460
53.824	3417.362
53.824	3589.117
54.096	3761.006
54.819	3623.956
55.000	3933.205
55.271	4929.522
55.543	4139.579
55.543	3796.067
55.814	4105.361
56.537	4380.525
57.351	4415.275
57.351	4209.169
57.713	4415.453
57.713	4140.644
57.894	4587.298
58.527	4278.448
58.708	4553.346
60.065	4725.767
60.336	4485.443
60.336	4897.657
60.879	5619.297
60.969	4760.562
61.240	5207.261
61.240	5894.283
61.331	5756.923
61.421	5001.242
62.235	6169.581
62.326	5207.793
62.326	5482.602
62.416	5310.891
62.506	5997.959
62.778	5723.282
63.049	6101.278
63.230	5586.099
63.773	6135.984
65.672	6377.374
66.848	7374.134
68.475	7168.827
68.837	8233.889
69.289	7375.332
70.736	8337.875
71.189	7822.829
71.460	8441.283
72.997	10949.671
77.881	12463.518
80.866	15522.235
82.313	14148.899];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Mick2016';

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

%% Facts
F1 = 'weight-length relationship: W = 0.0428 * TL^2.840';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; benthopelagic; oceanodromous; depth range 0 - 70 m, usually 0 - 70 m. Subtropical, preferred 27 C';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Discussion points
D1 = 'males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '3VTVW'; % Cat of Life
metaData.links.id_ITIS = '169007'; % ITIS
metaData.links.id_EoL = '46578720'; % Ency of Life
metaData.links.id_Wiki = 'Lobotes_surinamensis'; % Wikipedia
metaData.links.id_ADW = 'Lobotes_surinamensis'; % ADW
metaData.links.id_Taxo = '45277'; % Taxonomicon
metaData.links.id_WoRMS = '126973'; % WoRMS
metaData.links.id_fishbase = 'Lobotes-surinamensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lobotes_surinamensis}}';
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
bibkey = 'FranOgle2001'; type = 'Article'; bib = [ ... 
'author = {J. S. Franks and J. T. Ogle and J. R. Hendon and D. N. Barnes and L. C. Nicholson}, ' ... 
'year = {2001}, ' ...
'title = {GROWTH OF CAPTIVE JUVENILE TRIPLETAIL \emph{Lobotes surinamensis}}, ' ...
'journal = {Gulf and Caribbean Research}, ' ...
'volume = {13}, ' ...
'pages = {67--70}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1077}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/198670/0}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mick2016'; type = 'Techreport'; bib = [ ... 
'author = {P. Mickle and many others}, ' ... 
'year = {2016}, ' ...
'institution = {Gulf States Marine Fisheries Commission}, ' ...
'number = {258}, ' ...
'title = {Biological Profile for Tripletail in the {G}ulf of {M}exico and the {W}estern {C}entral {A}tlantic}, ' ...
'publisher = {Gulf States Marine Fisheries Commission 2404 Government St. Ocean Springs, Mississippi 39564}, ' ...
'howpublished = {\url{http://www.gsmfc.org/publications/GSMFC Number 258.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

