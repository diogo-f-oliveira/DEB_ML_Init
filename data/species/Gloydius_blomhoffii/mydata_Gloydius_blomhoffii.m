function [data, auxData, metaData, txtData, weights] = mydata_Gloydius_blomhoffii

global tJX_f tJX_m

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Viperidae';
metaData.species    = 'Gloydius_blomhoffii'; 
metaData.species_en = 'Mamushi'; 

metaData.ecoCode.climate = {'Cwa', 'Cfa', 'Dfa', 'Dwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'tL_f'; 't-Ww_f'; 'L-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 12];

%% set data
% zero-variate data

data.ab = 5*30.5;     units.ab = 'd';    label.ab = 'age at puberty for females';     bibkey.ab = 'guess';
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Agkistrodon piscivorus';
data.tp = 1095;     units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'MoriHiga1986';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1095;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'MoriHiga1986';
  temp.tpm = C2K(24); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 13.8*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 22.5;    units.Lb  = 'cm';  label.Lb  = 'SVL at birth';  bibkey.Lb  = 'MoriHiga1986';
  comment.Lb = 'Wiki TL = 22 to 35 cm, with mean 28 cm';
data.Lp  = 46;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';  bibkey.Lp  = 'MoriHiga1986';
data.Lpm  = 40;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';  bibkey.Lpm  = 'MoriHiga1986';
data.Li  = 91;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';  bibkey.Li  = 'Wiki';

data.Wwb = 5.9;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'MoriHiga1986';
  
data.Ri  = 8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Agkistrodon piscivorus';

% univariate data
tWLXWLX = [ ... time since Sep 1982 (month), male Ww (g), TL (cm), food (g/month), female Ww (g), TL (cm), food (g/month)
 0  5.9 23.5  0     6.0 21.8  0
 1  5.9 23.8  1.7   6.3 22.3  2.4
 2  6.8 24.4  4.7   6.8 22.7  4.6
 3  8.8 24.8  5.7   7.9 23.2  5.8
 4  9.1 25.4  6.9   8.2 23.8  6.5
 5 11.1 26.6  7.8   9.2 24.6  7.4
 6 11.3 28.0  7.6  10.3 26.0  7.2
 7 13.0 29.5  8.8  11.9 27.6  8.0
 8 15.2 30.8  9.5  13.9 29.4 11.5
 9 18.4 32.6 14.0  16.7 30.7 11.8
10 18.8 33.1  7.4  19.1 31.7 10.2
11 20.6 35.3 16.2  21.7 33.2 18.1
12 25.3 36.6 11.6  25.6 34.5 13.6
13 30.8 37.7 29.0  31.8 36.2 25.7
14 37.7 39.2 28.1  36.5 36.8 21.2
15 42.9 41.5 21.1  40.2 38.2 17.0
16 53.1 42.7 36.9  51.8 40.1 33.5
17 56.1 43.8 27.4  58.9 42.9 34.1
18 62.0 46.6 25.0  64.2 44.5 27.5
19 74.1 49.0 45.9  85.3 47.4 62.8
20 81.6 52.3 44.2 106.2 50.3 56.5
21 79.3 51.0 21.4 115.2 53.1 67.1
22 77.5 52.0 18.7 121.2 54.7 43.8
23 81.2 52.5 30.4 132.8 55.3 44.8];
tWLXWLX(:,1) = 30.5*tWLXWLX(:,1); % convert month to d; start was with hatchlings
tWLXWLX(:,[4 7]) = tWLXWLX(:,[4 7])/ 30.5; % convert food per month to food per d
% time-length
data.tL_f = tWLXWLX(:,[1 6]); % age (d), TL (cm)
tJX_f = tWLXWLX(:,[1 7]); % age (d), food (g/d)
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MoriHiga1986';
comment.tL_f = 'data for females';
%
data.tL_m = tWLXWLX(:,[1 3]); % age (d), TL (cm)
tJX_m = tWLXWLX(:,[1 4]); % age (d),  food (g/d)
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MoriHiga1986';
comment.tL_m = 'data for males';
% time-weight
data.tW_f = tWLXWLX(:,[1 5]); % age (d), Ww (g)
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f   = C2K(25);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'MoriHiga1986';
comment.tW_f = 'data for females';
%
data.tW_m = tWLXWLX(:,[1 2]); % age (d), Ww (g)
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(25);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'MoriHiga1986';
comment.tW_m = 'data for males';

% length = weight
data.LW_f = [ ... % total length (cm), weight (g)
19.954	5.807
22.982	10.244
24.681	11.702
26.177	10.148
26.947	13.898
29.385	12.692
29.590	16.460
30.917	18.684
31.273	14.522
31.504	23.572
32.055	20.913
33.190	22.389
33.580	25.396
33.599	29.546
33.773	26.522
34.323	23.487
35.113	31.765
35.312	34.023
36.230	29.467
36.468	40.026
37.004	33.972
37.363	30.565
37.954	36.207
38.160	39.974
38.176	43.370
38.752	45.994
39.156	52.020
39.259	33.904
39.691	45.966
40.227	39.912
40.504	58.772
40.862	54.987
41.605	53.078
41.805	55.713
41.862	67.787
42.743	55.308
42.762	59.458
44.379	83.560
45.243	67.308
45.633	70.315
45.658	75.597
46.550	65.382
47.335	72.528
48.284	74.386
48.307	79.291
48.598	101.169
48.606	103.055
48.809	106.068
49.262	82.658
49.686	92.834
50.402	85.265
50.406	86.020
50.528	112.054
50.640	95.824
51.362	89.387
51.385	94.292
51.901	84.088
52.154	98.043
52.209	109.739
53.498	144.040
53.787	125.540
54.363	128.165
56.707	146.962
57.590	174.860
58.344	135.214
58.789	189.918
58.814	155.200
59.819	169.132
59.846	174.791
61.434	192.857
62.121	218.874
62.246	165.662
62.727	187.912];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'female'};  
bibkey.LW_f = 'MoriHiga1986';
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % total length (cm), weight (g)
20.702	5.030
21.833	5.750
24.289	8.318
25.218	6.026
25.239	10.553
26.553	10.136
27.496	10.862
28.245	10.085
28.449	13.475
29.957	14.562
30.890	13.024
31.293	18.672
33.161	16.352
34.309	20.468
35.280	27.231
35.824	23.064
36.587	25.305
37.564	33.200
38.862	29.387
39.433	30.879
40.191	32.366
40.984	41.021
41.926	41.370
42.702	46.630
43.466	49.248
44.230	51.867
45.035	63.163
45.387	57.870
47.323	69.887
48.266	70.613
49.592	72.837
49.603	75.101
49.612	76.987
50.323	68.287
50.874	65.628
51.745	90.885
52.105	87.478
52.465	84.071
52.684	90.857
52.695	93.121
53.238	88.576
53.252	91.594
54.211	95.716];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'male'};  
bibkey.LW_m = 'MoriHiga1986';
comment.LW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;
weights.psd.v = 5 * weights.psd.v;
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
set3 = {'LW_f','LW_m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '6KLBS'; % Cat of Life
metaData.links.id_ITIS = '634884'; % ITIS
metaData.links.id_EoL = '2818108'; % Ency of Life
metaData.links.id_Wiki = 'Gloydius_blomhoffii'; % Wikipedia
metaData.links.id_ADW = 'Gloydius_blomhoffii'; % ADW
metaData.links.id_Taxo = '4200567'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Gloydius&species=blomhoffii'; % ReptileDB
metaData.links.id_AnAge = 'Gloydius_blomhoffii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gloydius_blomhoffii}}';
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
bibkey = 'MoriHiga1986'; type = 'Article'; bib = [ ... 
'author = {Akira Moriya and Sueo Higashizono}, ' ... 
'year = {1986}, ' ...
'title = {Growth and Food Consumption in the Mamushi, \emph{Agkistrodon blomhoffii blomhoffii} ({B}oie), in Captivity}, ' ...
'journal = {Japanese Journal of Herpetology}, ' ...
'volume = {11(3)}, ' ...
'pages = {110-123}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Gloydius_blomhoffii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

