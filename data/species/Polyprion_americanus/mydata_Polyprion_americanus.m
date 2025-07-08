function [data, auxData, metaData, txtData, weights] = mydata_Polyprion_americanus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acropomatiformes'; 
metaData.family     = 'Polyprionidae';
metaData.species    = 'Polyprion_americanus'; 
metaData.species_en = 'Atlantic wreckfish'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MA', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 27]; 

%% set data
% zero-variate data

data.am = 80*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'PereHaim2004';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 55; units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'PereHaim2004'; 
data.Li  = 210;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'Wiki';

data.Wwb = 1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'PaPaPele2018';
  comment.Wwb = 'based egg diameter of 1.25 mm : pi/6*0.125^3'; 
data.Wwp = 1.8e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Wiki';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 100e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri = 11.9e6/365;  units.Ri = '#/d';  label.Ri = 'reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% t-L data 
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.719	46.439
1.933	50.341
2.773	44.488
2.780	54.634
2.988	49.171
2.990	53.073
4.685	62.829
5.954	66.341
7.114	64.780
7.116	67.902
7.866	85.463
7.960	67.902
8.282	75.317
8.594	69.073
8.601	79.610
8.926	92.098
9.019	73.366
9.026	83.122
9.557	88.195
9.761	78.049
10.290	79.610
10.391	72.195
10.926	84.293
11.455	85.854
11.554	75.707
11.775	90.146
11.882	92.488
12.404	84.293
12.714	74.927
12.721	85.463
13.145	87.415
13.570	92.098
14.205	94.829
14.210	101.854
14.516	86.634
14.729	89.366
14.836	91.707
15.049	94.439
15.370	100.293
16.116	112.000
16.210	94.439
16.212	97.951
16.532	103.024
16.833	78.829
18.005	94.829
18.102	83.122
18.630	83.122
18.632	85.463
19.062	97.561
19.172	105.366
19.701	107.317
19.909	101.854
20.008	92.488
20.121	103.805
20.443	110.829
20.642	93.659
20.972	113.561
21.074	107.707
22.867	106.927
22.966	97.171
23.085	116.293
23.286	102.244
23.292	111.220
23.706	97.951
23.920	102.634
24.231	94.049
24.971	96.780
25.922	97.561
26.144	113.951
26.152	126.049
26.865	87.415
27.186	94.439
27.500	90.537
27.936	110.829
28.034	99.512
28.345	90.927
28.578	124.098
28.777	105.366
28.979	92.488
28.981	94.829
29.213	127.220
29.828	99.512
29.940	108.488
30.264	120.976
30.782	105.366
31.623	100.683
31.746	126.439
32.475	111.610
32.787	105.366
33.004	113.951
33.223	126.049
33.738	107.317
34.480	111.220
34.487	122.927
35.954	106.927
35.960	114.732
36.074	128.780
36.172	116.683
36.808	121.366
37.133	133.854
37.222	108.488
37.333	116.293
37.653	122.537
37.757	119.415
37.853	104.976
37.977	133.463
38.174	112.390
38.700	108.488
38.716	133.854
39.236	121.756
39.238	124.878
39.973	119.805
40.602	112.000
40.719	130.732
40.933	134.244
41.343	115.902
41.451	119.024
41.763	112.000
42.296	121.366
42.302	130.341
42.701	95.220
43.126	99.122
43.878	119.024
44.197	122.927
45.043	124.488
45.460	117.463
45.674	121.366
45.904	150.634
46.307	122.146
47.151	120.976
47.265	134.244
48.204	117.463
48.208	123.317
48.534	137.366
49.064	141.268
49.580	123.707
50.736	115.122
50.956	129.171
51.284	145.951
52.008	123.707
52.629	106.146
53.705	136.195
55.801	113.561
55.828	154.927
58.236	126.439
63.084	115.902];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1));  % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(17);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PereHaim2004';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.990	45.740
1.396	49.139
1.906	50.993
2.113	48.830
2.520	51.611
2.524	45.740
2.825	54.393
3.436	58.411
4.453	66.137
4.561	57.792
5.069	63.664
5.471	73.554
5.581	62.428
6.289	73.863
6.600	68.300
6.706	62.428
7.214	67.373
7.413	75.717
7.722	72.936
7.928	70.155
8.340	66.446
8.539	73.863
8.637	79.735
8.747	70.155
9.049	76.026
9.146	84.371
9.767	73.863
10.173	77.572
10.679	86.225
10.684	79.426
11.597	89.007
11.805	84.371
12.004	93.024
12.015	77.881
12.318	82.517
12.321	79.117
13.229	95.497
13.433	97.351
14.364	83.135
14.460	91.788
14.462	88.698
14.470	77.263
15.490	81.589
15.583	94.570
15.590	85.298
15.996	89.316
16.096	92.097
16.496	104.768
16.912	96.115
17.023	83.444
17.427	90.861
17.429	87.770
17.835	93.024
18.552	91.479
18.650	97.042
19.470	95.497
19.478	84.062
19.479	82.517
19.570	98.587
19.761	116.821
20.294	87.770
20.297	83.444
20.575	122.693
20.577	120.530
21.417	90.243
21.929	90.243
22.341	85.916
22.632	108.168
22.846	95.188
23.032	120.839
23.450	108.168
23.465	87.770
25.398	102.605
25.902	112.494
26.320	101.678
26.730	100.442
27.645	107.859
28.369	97.351
28.580	88.698
28.975	107.241
29.799	100.751
29.905	95.188
29.906	93.642
30.708	115.894
30.825	96.115
31.630	114.040
32.562	98.896
33.682	105.695
33.987	109.095
34.195	103.532
34.197	101.369
34.390	116.821
34.611	94.879
34.907	109.713
34.911	104.768
35.326	96.733
35.526	102.605
35.529	99.205
36.030	113.113
37.370	99.823
37.565	112.494
37.775	104.459
37.780	98.587
38.179	111.876
38.700	99.514
38.786	121.766
39.813	116.512
40.330	107.859
40.644	98.896
41.461	100.442
43.601	111.567
43.610	99.205
44.628	106.623
44.830	110.640
45.135	112.185
45.538	121.766
45.553	100.751
46.160	109.404
46.368	106.004
48.005	104.768
48.413	107.241
48.816	115.585
49.738	113.422
49.848	103.223
50.044	114.349
52.186	123.620
54.448	108.168
60.686	111.567
71.119	113.113
77.054	111.567];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1));  % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(17);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PereHaim2004';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Marine; depth range usually 100 - 200 m';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LKMD'; % Cat of Life
metaData.links.id_ITIS = '167914'; % ITIS
metaData.links.id_EoL = '46578882'; % Ency of Life
metaData.links.id_Wiki = 'Polyprion_americanus'; % Wikipedia
metaData.links.id_ADW = 'Polyprion_americanus'; % ADW
metaData.links.id_Taxo = '184389'; % Taxonomicon
metaData.links.id_WoRMS = '126998'; % WoRMS
metaData.links.id_fishbase = 'Polyprion-americanus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Polyprion_americanus}}';
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
bibkey = 'PereHaim2004'; type = 'Article'; bib = [ ... 
'author = {Monica Brick Peres and Manuel Haimovici}, ' ... 
'year = {2004}, ' ...
'title = {Age and growth of southwestern {A}tlantic wreckfish \emph{Polyprion americanus}}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {66}, ' ...
'pages = {157-169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PaPaPele2018'; type = 'Article'; bib = [ ...
'doi = {10.3390/fishes3040043}, ' ...
'author = {Maria Papadaki and Jos\''{e} Benito Peleteiro and Blanca Alvarez-Bl\''{a}zquez and Jos\''{e} Luis Rodr\''{i}guez Villanueva and Fatima Linares and Antonio Vilar and Evaristo P\''{e}rez Rial and Nuria Lluch and Ioannis Fakriadis and Irini Sigelaki and Constantinos C. Mylonas}, ' ... 
'year = {2018}, ' ...
'title = {Age and growth of southwestern {A}tlantic wreckfish \emph{Polyprion americanus}}, ' ...
'journal = {Fishes}, ' ...
'volume = {3}, ' ...
'pages = {43}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Polyprion-americanus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
