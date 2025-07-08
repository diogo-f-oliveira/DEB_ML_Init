function [data, auxData, metaData, txtData, weights] = mydata_Merluccius_hubbsi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Merlucciidae';
metaData.species    = 'Merluccius_hubbsi'; 
metaData.species_en = 'Argentine hake'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jpCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % in K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 01 12]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data
data.ab = 10;  units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'fishbase'; 
  temp.ab = C2K(9.1); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = {'VazRoss2007','fishbase'}; 
  temp.tp = C2K(7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on interpolation of Lp in tL_f data';
data.am = 20*365;     units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';  
  temp.am = C2K(7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 31.9;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';  bibkey.Lp = 'fishbase';
data.Li = 95;    units.Li = 'cm';   label.Li = 'ultimate total length';       bibkey.Li = 'fishbase';

data.Wwb = 3.4e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'RodrLeon2018';
  comment.Wwb = 'based on egg diameter of 866 mum: pi/6*0.0866^3';
data.Wwp = 210;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on Wwp = 0.00525*Lp^3.06, see F1';
data.Wwi = 5.9e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on Wwi = 0.00525*Li^3.06, see F1';
  
data.GSI = 25; units.GSI = '-';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'RodrLeon2018';
  temp.GSI = C2K(7); units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 

% uni-variate data
% time-length  
data.tL0 = [ ... % time since birth (d), total length (cm) 
10.348	0.403
11.119	0.315
12.085	0.331
13.054	0.452
15.181	0.484
16.049	0.444
17.307	0.501
18.080	0.517
19.243	0.646
20.110	0.557
21.180	0.863
21.946	0.574
21.953	0.863
22.048	0.791
23.300	0.606
23.880	0.622
24.268	0.711
24.944	0.687
25.045	0.848
25.231	0.550
25.813	0.663
27.360	0.711
28.329	0.808
29.005	0.800
30.065	0.679
30.068	0.816
30.937	0.808
31.038	0.953
31.710	0.800
32.293	0.921
32.389	0.889
33.163	0.937
33.256	0.800
34.040	1.259
34.133	1.098
34.222	0.776
34.321	0.889
35.100	1.146
35.194	1.018
35.210	1.710
35.289	0.953
35.478	0.808
36.058	0.784
36.257	1.042
37.123	0.905
37.417	1.066
37.992	0.889
38.094	1.098
38.190	1.050
38.192	1.155
39.059	1.058
39.254	1.131
40.034	1.421
40.893	0.970
40.983	0.712
41.290	1.397
41.391	1.606
41.670	1.131
43.216	1.147
43.322	1.517
46.305	1.035
47.090	1.534
47.284	1.558
47.285	1.614
49.127	1.864
49.420	1.985
50.186	1.695
50.191	1.904
51.062	1.977
51.152	1.695
52.512	1.977
54.053	1.800
55.118	1.889
55.488	1.197
56.174	1.615
56.286	2.259
57.257	2.420
58.113	1.897
60.242	2.002
60.246	2.179
60.251	2.396
61.007	1.696
61.113	2.067
61.411	2.397
62.000	2.807
63.923	2.413
65.075	2.099
66.046	2.308
70.396	2.389
71.067	2.188
75.128	2.301];
units.tL0 = {'d', 'cm'}; label.tL0 = {'time since birth', 'total length', '2009'};  
temp.tL0 = C2K(10);  units.temp.tL0 = 'K'; label.temp.tL0 = 'temperature';
bibkey.tL0 = 'BettBrow2014';
comment.tL0 = 'data for 2009';
%
data.tL1 = [ ... % age (years) ~ total length (cm) 
0.295	0.209
2.324	0.209
3.387	0.226
5.223	0.218
7.059	0.242
8.024	0.194
8.026	0.258
9.089	0.267
11.118	0.275
13.051	0.323
13.824	0.323
14.309	0.404
14.984	0.331
15.179	0.404
15.180	0.452
15.951	0.388
16.143	0.332
16.146	0.452
16.531	0.372
17.206	0.332
17.401	0.404
17.499	0.477
17.978	0.283
18.176	0.469
18.270	0.364
18.752	0.324
18.850	0.388
18.852	0.493
19.235	0.340
20.397	0.421
20.398	0.469
21.071	0.340
21.265	0.364
21.269	0.549
21.363	0.421
22.038	0.356
22.041	0.477
23.005	0.421
23.202	0.550
23.780	0.485
24.072	0.582
24.261	0.405
24.552	0.469
25.228	0.453
25.229	0.493
25.328	0.582
26.002	0.486
26.392	0.614
26.872	0.486
27.164	0.598
27.167	0.703
28.127	0.454
28.128	0.510
28.130	0.598
29.287	0.494
29.289	0.582
29.291	0.647
30.067	0.792
30.448	0.550
31.122	0.454
31.124	0.542
31.222	0.607
31.225	0.719
31.897	0.542
31.996	0.631
32.094	0.695
33.057	0.551
33.927	0.559
35.086	0.575
35.088	0.631
35.089	0.696
36.248	0.672
36.255	0.945
37.019	0.599
37.119	0.744
37.890	0.648
38.184	0.833
39.047	0.559
39.439	0.769
40.112	0.640
40.114	0.712
41.279	0.938
42.044	0.632
42.438	0.914
43.108	0.664
43.118	1.083
43.208	0.793
44.169	0.616
44.369	0.874
45.047	0.938
45.145	1.019
46.015	1.003
46.114	1.123
46.296	0.673
47.075	0.898
47.175	1.035
47.469	1.204
48.234	0.898
48.238	1.067
48.240	1.124
51.043	1.180
52.208	1.398
54.042	1.325
54.131	1.020
54.912	1.342
57.236	1.567
58.199	1.455
58.294	1.390
61.107	1.833
74.239	1.488];
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'total length', '2004-2005'};  
temp.tL1 = C2K(9);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'BettBrow2014';
comment.tL1 = 'data for 2004-2005';
%
data.tL_f = [ ... % year class (yr), total length (cm)
0.000	3.617
0.000	5.106
0.012	12.553
0.012	13.404
0.012	15.532
0.012	16.383
0.012	17.021
0.024	6.170
0.024	7.234
0.024	8.936
0.024	9.362
0.024	10.426
0.024	11.277
0.024	18.085
0.024	18.936
0.024	19.787
0.024	21.277
0.024	22.553
0.024	23.830
0.965	18.085
0.965	26.383
0.988	34.468
1.000	19.574
1.000	21.277
1.000	21.489
1.000	23.191
1.000	24.255
1.000	24.894
1.000	26.809
1.000	27.234
1.000	28.298
1.000	29.362
1.000	29.574
1.000	30.000
1.000	31.702
1.012	35.745
1.988	51.277
2.000	23.191
2.000	24.468
2.000	25.319
2.000	27.021
2.000	28.298
2.000	30.638
2.000	34.043
2.000	35.319
2.000	36.809
2.000	37.234
2.000	38.936
2.000	46.809
2.000	47.872
2.000	48.936
2.012	29.787
2.012	31.915
2.012	32.979
2.012	37.660
2.012	39.787
2.012	41.064
2.012	42.766
2.012	42.766
2.024	19.362
2.024	44.894
2.976	48.511
2.988	58.298
3.000	43.617
3.000	49.574
3.012	34.255
3.012	36.596
3.012	38.723
3.012	39.574
3.012	41.064
3.012	41.915
3.012	44.043
3.012	44.894
3.012	45.957
3.012	46.596
3.012	51.277
3.012	52.766
3.012	53.617
3.024	31.702
3.024	55.532
3.976	43.617
3.976	45.319
3.976	47.234
3.976	48.511
3.976	49.362
3.976	56.809
3.988	50.000
3.988	59.574
4.000	38.298
4.000	39.149
4.000	41.915
4.000	54.468
4.024	51.915
4.976	52.979
4.976	54.468
4.976	62.766
4.988	51.489
5.000	50.638
5.012	46.170
5.012	49.787
5.012	65.319
6.024	55.532
6.024	57.234];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'VazRoss2007';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % year class (yr), total length (cm)
0.000	3.595
0.012	5.921
0.012	18.399
0.024	10.997
0.024	11.631
0.024	17.130
0.024	21.782
0.024	24.109
0.035	8.882
0.035	13.323
0.035	13.958
0.035	15.015
0.035	16.073
0.047	13.112
0.059	20.302
0.970	21.994
0.970	23.263
0.981	28.550
0.993	17.341
0.993	19.456
0.993	20.302
0.993	21.360
0.993	29.396
0.993	32.568
0.993	34.471
1.005	24.109
1.005	25.801
1.005	31.511
1.986	34.048
1.998	27.492
1.998	28.338
1.998	29.184
1.998	29.607
1.998	32.356
2.010	16.073
2.010	25.801
2.010	30.242
2.010	31.511
2.010	31.722
2.010	42.719
2.034	23.051
2.980	38.278
2.980	38.912
2.980	39.758
2.992	29.607
2.992	30.665
2.992	32.779
2.992	34.471
2.992	37.432
3.003	37.009
3.973	53.927
4.020	43.565
5.014	50.332
5.037	47.795
5.995	52.236
5.995	57.734];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'VazRoss2007';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL0 = 5 * weights.tL0;
weights.tL1 = 5 * weights.tL1;
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL0','tL1'}; subtitle1 = {'Larval growth for 2009, 2004/5'};
set2 = {'tL_f','tL_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00525*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; benthopelagic; oceanodromous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3ZV74'; % Cat of Life
metaData.links.id_ITIS = '164800'; % ITIS
metaData.links.id_EoL = '46564948'; % Ency of Life
metaData.links.id_Wiki = 'Merluccius_hubbsi'; % Wikipedia
metaData.links.id_ADW = 'Merluccius_hubbsi'; % ADW
metaData.links.id_Taxo = '44370'; % Taxonomicon
metaData.links.id_WoRMS = '272455'; % WoRMS
metaData.links.id_fishbase = 'Merluccius-hubbsi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Merluccius_hubbsi}}';
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
bibkey = 'BettBrow2014'; type = 'article'; bib = [ ...
'author = {Paola Betti and Daniel R. Brown and Brenda Temperoni and Laura Machinandiarena and Mart\''{i}n D. Ehrlich}, ' ... 
'year   = {2014}, ' ...
'title  = {Larval growth of hake (\emph{Merluccius hubbsi}) in the {P}atagonian shelf: {A}nalysis of two reproductive seasons}, ' ...
'journal = {Fisheries Research}, ' ...
'page = {69-76}, ' ...
'volume = {160}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RodrLeon2018'; type = 'article'; bib = [ ...
'author = {Karina A. Rodrigues and Ezequiel Leonarduzzi and Gustavo J. Macchi and Maria I. Militelli}, ' ... 
'year   = {2018}, ' ...
'title  = {Maternal condition, fecundity and oocyte quality of Argentine hake (\emph{Merluccius hubbsi}) from the {N}orthern stock}, ' ...
'journal = {Fisheries Research}, ' ...
'page = {105-112}, ' ...
'volume = {197}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VazRoss2007'; type = 'article'; bib = [ ...
'author = {Andr\''{e} M. Vaz-dos-Santos and Carmen L\''{u}cia D. B. Rossi-Wongtschowski}, ' ... 
'year   = {2007}, ' ...
'title  = {Age and growth of the {A}rgentine hake \emph{Merluccius hubbsi} {M}arini, 1933 in the {B}razilian South-{S}outheast {R}egion during 1996-2001}, ' ...
'journal = {Neotropical Ichthyology}, ' ...
'page = {375-386}, ' ...
'volume = {5}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Merluccius-hubbsi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

