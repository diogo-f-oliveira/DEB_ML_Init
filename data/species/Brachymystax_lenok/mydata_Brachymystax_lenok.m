function [data, auxData, metaData, txtData, weights] = mydata_Brachymystax_lenok
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Brachymystax_lenok'; 
metaData.species_en = 'Lenok'; 

metaData.ecoCode.climate = {'BW'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2024 12 26]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 26]; 

%% set data
% zero-variate data

data.ab = 50;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'fishbase';   
  temp.ab = C2K(4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;     units.am = 'd';    label.am = 'life span'; bibkey.am = 'TsogMend2017';   
  temp.am = C2K(4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 30;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess'; 
data.Li  = 70;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 4.8e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.1 mm (1.9 to 2.4 mm) for Prosopium cylindraceum: pi/6*0.21^3';
data.Wwp  = 312; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = {'fishbase','guess'}; 
  comment.Wwp = 'based on 0.00912*Lp^3.07, see F1';
data.Wwi  = 42e3; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00912*Li^3.07, see F1; max published weight 8 kg';

data.Ri  = 5000/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(21.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [... %  time since birth (yr), total length (cm)
2.948	29.489
2.979	26.378
3.009	30.655
3.040	33.376
3.982	41.330
4.103	38.022
4.559	52.014
4.924	41.506
4.954	43.256
4.954	45.978
4.954	47.145
4.985	45.200
5.015	40.144
5.015	48.310
5.015	49.671
5.046	37.810
5.046	39.171
5.046	48.504
5.957	51.792
5.957	46.153
5.988	40.125
6.018	44.985
6.018	44.013
6.049	49.651
6.079	50.040
6.140	47.122
6.565	55.086
7.021	43.605
8.085	58.362
9.970	59.492];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TsogMend2017';
%
data.tL_m = [... %  time since birth (yr), total length (cm)
1.945	31.259
1.976	27.953
2.979	30.850
3.070	27.543
3.921	26.554
4.012	43.858
4.043	36.857
4.043	25.579
4.073	34.912
4.073	31.606
4.954	42.673
5.015	35.477
5.957	42.459
6.018	39.152
6.018	49.652
6.960	54.689
6.991	47.883
7.021	49.438
7.082	50.409
8.997	53.094];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TsogMend2017';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
7.879	12.218
9.016	16.144
9.341	23.872
9.747	16.191
10.478	27.799
11.046	23.982
11.371	24.003
11.858	24.034
12.264	27.913
12.751	27.945
13.158	39.531
13.726	35.714
14.376	35.756
14.701	47.338
16.487	39.745
17.461	51.369
18.924	82.291
20.711	97.820
20.873	78.563
21.604	90.170
21.848	109.454
22.416	101.783
22.580	140.329
22.823	117.224
22.984	86.405
23.310	128.816
23.879	140.413
24.121	109.600
24.529	140.455
24.855	171.304
25.502	117.396
25.503	136.663
25.583	121.255
26.316	179.105
26.558	129.024
27.046	156.030
27.211	206.137
28.102	167.659
28.104	213.902
28.264	163.816
28.347	198.503
29.323	233.248
30.296	217.896
30.537	148.547
30.786	287.292
31.108	221.802
31.273	279.616
32.086	295.082
33.142	314.418
33.630	329.864
34.198	326.047
34.362	372.300
35.499	383.934
36.149	387.829
36.229	349.299
36.232	441.784
37.289	480.388
37.369	430.297
37.697	526.657
38.104	538.244
38.262	445.768
38.507	476.612
39.078	530.599
40.051	511.394
40.541	584.643
40.542	615.471
41.113	657.897
41.276	692.590
41.352	557.720
41.926	692.632
42.082	534.646
42.411	646.420
43.390	769.797
43.473	808.338
44.126	885.451
44.205	839.213
44.284	777.561
44.285	808.390
44.858	931.741
45.260	831.574
45.426	916.363
45.747	808.484
46.074	881.723
46.320	939.542
47.058	1105.293
47.701	958.898
47.706	1082.213
48.429	881.874
48.921	1009.073
49.005	1082.296
49.170	1140.110
49.173	1209.475
49.328	1024.514
50.140	1032.273
50.630	1117.083
51.043	1286.666
52.172	1086.353
52.254	1121.041
52.420	1209.683
53.229	1136.517
54.629	1602.889
56.500	1707.055
56.980	1537.529];
units.LWw   = {'cm', 'g'};  label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'TsogMend2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Data Wwi is ignorned due to incinsistency with LW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00912*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = 'MXRW'; % Cat of Life
metaData.links.id_ITIS = '623479'; % ITIS
metaData.links.id_EoL = '994714'; % Ency of Life
metaData.links.id_Wiki = 'Brachymystax_lenok'; % Wikipedia
metaData.links.id_ADW = 'Brachymystax_lenok'; % ADW
metaData.links.id_Taxo = '42799'; % Taxonomicon
metaData.links.id_WoRMS = '1026966'; % WoRMS
metaData.links.id_fishbase = 'Brachymystax-lenok'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Brachymystax_lenok}}';
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
bibkey = 'Thom2003'; type = 'phdthesis'; bib = [ ... 
'author = {Thompson, Brett W.}, ' ... 
'year = {2003}, ' ...
'title = {An Ecological/Life History Comparison of Two Whitefish Species in {B}ear {L}ake, {U}tah/{I}daho}, ' ...
'school = {Utah State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TsogMend2017'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.13247?msockid=0c7692ac275d65161cc287ef2626644e}, ' ...
'author = {Tsogtsaikhan, P. and B. Mendsaikhan and G. Jargalmaa and B. Ganzorig and B.C. Weidel and C.M. Filosa and C.M. Free and T. Young and O.P. Jensen}, ' ... 
'year = {2017}, ' ...
'title = {Age and growth comparisons of {H}ovsgol grayling (\emph{Thymallus nigrescens} {D}orogostaisky, 1923), {B}aikal grayling (\emph{T. baicalensis} {D}ybowski, 1874), and lenok (\emph{Brachymystax lenok} {P}allas, 1773) in lentic and lotic habitats of {N}orthern {M}ongolia}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {33}, ' ...
'pages = {108-115}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Brachymystax-lenok.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

