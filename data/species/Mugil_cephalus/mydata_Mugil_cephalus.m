function [data, auxData, metaData, txtData, weights] = mydata_Mugil_cephalus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Mugil_cephalus'; 
metaData.species_en = 'Flathead grey mullet'; 

metaData.ecoCode.climate = {'MA','MB','MC','Cfa'};
metaData.ecoCode.ecozone = {'MC','TH','TN'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 6*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishesoftexas';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 35.4;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 90;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishesoftexas';
data.Lim  = 88;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for male';    bibkey.Lim  = {'fishesoftexas','AguiGall1999'};
  comment.Lim = 'based on tL(6 yr) ratio with females: 90*36.9/37.7 cm ';

data.Wwb = 3.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';      bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwp = 479;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01202*Lp^2.97, see F1';
data.Wwi = 7.66e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^2.97, see F1';
data.Wwim = 7.16e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';      bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.01202*Lim^2.97, see F1';
  
data.Ri  = 1.1e6/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time - length
data.tL_f = [ ... % yr class (yr), total length (cm)
    0 15.6
    1 20.3
    2 24.6
    3 28.3
    4 31.9
    5 35.0
    6 37.7];
data.tL_f(:,1) = (data.tL_f(:,1) + 1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  bibkey.tL_f = 'AguiGall1999';
temp.tL_f    = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % yr class (yr), total length (cm)
    0 16.0
    1 20.7
    2 24.7
    3 28.1
    4 31.5
    5 34.4
    6 36.9];
data.tL_m(:,1) = (data.tL_m(:,1) + 1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  bibkey.tL_m = 'AguiGall1999';
temp.tL_m    = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
comment.tL_m = 'Data for males';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
20.705	75.650
22.028	96.927
22.275	96.927
22.482	101.655
22.689	113.475
22.938	137.116
22.981	189.125
23.226	104.019
23.226	118.203
23.433	118.203
23.886	106.383
24.053	144.208
24.094	125.295
24.383	130.024
24.425	148.936
24.630	113.475
24.673	156.028
24.796	132.388
24.796	137.116
25.085	132.388
25.333	134.752
25.498	139.480
25.623	151.300
25.664	137.116
25.954	163.121
26.077	148.936
26.078	163.121
26.367	170.213
26.407	144.208
26.408	158.392
26.738	141.844
26.739	189.125
26.780	163.121
26.988	217.494
27.193	160.756
27.193	182.033
27.357	146.572
27.525	212.766
27.565	174.941
27.566	191.489
27.605	148.936
27.896	203.310
28.019	182.033
28.062	217.494
28.185	191.489
28.268	210.402
28.475	215.130
28.558	229.314
28.639	182.033
28.640	198.582
28.845	182.033
28.847	224.586
28.888	210.402
28.970	189.125
28.972	236.407
29.095	231.678
29.218	193.853
29.218	210.402
29.260	234.043
29.425	212.766
29.425	226.950
29.430	330.969
29.468	250.591
29.632	238.771
29.673	224.586
29.879	219.858
29.880	243.499
29.881	269.504
30.003	222.222
30.211	243.499
30.211	260.047
30.334	219.858
30.337	312.057
30.378	288.416
30.747	222.222
30.747	236.407
30.748	252.955
30.832	288.416
30.912	226.950
30.913	257.683
30.997	276.596
30.998	309.693
31.082	335.697
31.161	250.591
31.327	269.504
31.370	321.513
31.451	281.324
31.452	300.236
31.532	234.043
31.660	342.790
31.864	274.232
31.868	361.702
31.948	309.693
32.155	328.605
32.197	335.697
32.236	274.232
32.237	304.965
32.278	290.780
32.442	262.411
32.444	321.513
32.567	309.693
32.649	278.960
32.693	354.610
32.772	260.047
32.858	340.426
32.906	503.546
33.063	316.785
33.144	271.868
33.230	342.790
33.272	378.251
33.393	304.965
33.477	323.877
33.519	347.518
33.519	361.702
33.641	293.144
33.729	446.809
33.731	494.090
33.806	309.693
33.807	321.513
33.932	361.702
33.933	375.887
33.975	399.527
34.016	380.615
34.096	316.785
34.305	378.251
34.342	290.780
34.345	354.610
34.346	366.430
34.510	335.697
34.636	394.799
34.719	413.712
34.797	290.780
34.798	309.693
34.801	385.343
34.922	328.605
35.009	432.624
35.049	399.527
35.050	416.076
35.129	335.697
35.134	463.357
35.168	286.052
35.210	293.144
35.253	347.518
35.297	406.619
35.376	321.513
35.381	439.716
35.507	482.270
35.586	392.435
35.587	432.624
35.627	385.343
35.708	366.430
35.918	439.716
35.920	494.090
36.001	449.173
36.040	406.619
36.041	425.532
36.043	468.085
36.080	354.610
36.085	484.634
36.169	508.274
36.249	458.629
36.290	442.080
36.374	482.270
36.409	335.697
36.456	465.721
36.536	404.255
36.616	352.246
36.707	553.191
36.742	392.435
36.946	333.333
36.947	359.338
36.951	451.537
36.953	510.638
36.956	569.740
36.990	390.071
37.196	378.251
37.198	434.988
37.200	486.998
37.235	338.061
37.275	304.965
37.322	437.352
37.363	427.896
37.406	468.085
37.490	505.910
37.529	449.173
37.533	555.556
37.609	380.615
37.737	489.362
37.819	477.541
38.068	505.910
38.278	586.288
38.280	633.570
38.314	449.173
38.356	484.634
38.442	550.827
38.482	524.823
38.518	406.619
38.606	539.007
38.852	484.634
38.979	562.648
38.982	621.749
39.016	453.901
39.018	503.546
39.021	581.560
39.100	496.454
39.180	437.352
39.185	543.735
39.266	520.095
39.270	602.837
39.428	432.624
39.432	539.007
39.468	397.163
39.516	569.740
39.678	489.362
39.718	460.993
39.763	548.463
39.765	581.560
39.929	562.648
40.002	330.969
40.135	548.463
40.178	583.924
40.297	472.813
40.346	661.939
40.588	517.730
40.595	697.400
40.676	640.662
40.760	680.851
40.918	501.182
41.005	607.565
41.008	680.851
41.047	645.390
41.252	588.652
41.253	612.293
41.253	628.842
41.502	657.210
41.672	775.414
41.828	555.556
41.833	671.395
41.835	721.040
41.912	581.560
42.121	635.934
42.167	751.773
42.207	716.312
42.287	652.482
42.287	671.395
42.533	617.021
42.619	699.764
42.907	676.123
42.944	560.284
43.069	588.652
43.075	730.496
43.282	763.593
43.401	631.206
43.443	664.303
43.446	716.312
43.448	770.686
43.494	881.797
43.778	763.593
43.983	739.953
43.987	817.967
43.987	827.423
44.030	869.976
44.229	697.400
44.607	827.423
44.781	1049.645
44.930	666.667
45.311	874.704
45.392	855.792
45.649	1070.922
46.135	846.336];
units.LWw   = {'cm', 'g'};  label.LWw = {'total length','wet weight'};  bibkey.LWw = 'AguiGall1999';
temp.LWw    = C2K(25);  units.temp.LWw = 'K'; label.temp.LWw = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwi = 0 * weights.Wwi;
weights.Wwim = 0 * weights.Wwim;
weights.Wwp = 0 * weights.Wwp;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Ww in g = 0.01202*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44J42'; % Cat of Life
metaData.links.id_ITIS = '170335'; % ITIS
metaData.links.id_EoL = '46571513'; % Ency of Life
metaData.links.id_Wiki = 'Mugil_cephalus'; % Wikipedia
metaData.links.id_ADW = 'Mugil_cephalus'; % ADW
metaData.links.id_Taxo = '46303'; % Taxonomicon
metaData.links.id_WoRMS = '126983'; % WoRMS
metaData.links.id_fishbase = 'Mugil-cephalus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mugil_cephalus}}';
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
bibkey = 'AguiGall1999'; type = 'Article'; bib = [ ... 
'author = {Ana L. Iba\~{n}ez Aguirre and Manuel Gallardo-Cabello and Xavier Chiappa Carrara}, ' ... 
'year = {1999}, ' ...
'title = {Growth analysis of striped mullet, \emph{Mugil cephalus}, and white mullet, \emph{M. curema} ({P}isces: {M}ugilidae), in the {G}ulf of {M}exico}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {97}, ' ...
'pages = {861-872}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Mugil-cephalus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/mugil cephalus.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

