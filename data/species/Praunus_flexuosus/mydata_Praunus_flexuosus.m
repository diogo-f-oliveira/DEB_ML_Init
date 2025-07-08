function [data, auxData, metaData, txtData, weights] = mydata_Praunus_flexuosus 

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Mysida'; 
metaData.family     = 'Mysidae';
metaData.species    = 'Praunus_flexuosus'; 
metaData.species_en = 'Chameleon shrimp'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0iMpe', '0iMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'}; 
metaData.data_1     = {'t-L_T'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2017 09 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 27]; 

%% set data
% zero-variate data

data.ab = 23;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'WinkGrev2002';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3.5*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'WinkGrev2002';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '15 till 16 moults';
data.am = 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.3;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'WinkGrev2002';  
data.Lj  = 0.6;   units.Lj  = 'cm';  label.Lj  = 'length at metam'; bibkey.Lj  = 'WinkGrev2002'; 
  comment.Lj = 'based on inflection point in tL curves';
data.Lp  = 1.8;   units.Lp  = 'cm';  label.Lp  = 'length at puberty'; bibkey.Lp  = 'Wiki'; 
data.Li  = 2.6;   units.Li  = 'cm';  label.Li  = 'ultimate length';   bibkey.Li  = 'Wiki';

data.Wdb = 5.78e-5;   units.Wdb = 'g';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'WinkGrev2002';
  comment.Wdb = 'based on (Lb/Li)^3*Wdi';
data.Wdp = 1.25e-2;   units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'Wiki';
  comment.Wdp = 'based on (Lp/Li)^3*Wdi';
data.Wdi = 3.76e-2;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'Wiki';
  comment.Wdi = 'based on length-weight of Mysis mixta: (2.6/1.470)^3*6.8e-3';
 
% uni-variate data
% t-L data
data.tL_10 = [ ... % time since birth (d), standard length (cm)
8.667	0.325
8.667	0.354
17.333	0.433
17.333	0.455
25.667	0.534
26.667	0.490
27.000	0.555
35.333	0.635
36.000	0.642
37.000	0.577
37.333	0.606
43.000	0.721
43.667	0.685
44.000	0.757
44.667	0.808
45.333	0.714
52.667	0.923
53.333	0.865
53.667	0.822
55.333	0.901
55.667	0.973
56.000	0.807
64.667	1.016
64.667	1.038
64.667	1.067
66.000	0.922
66.333	1.161
66.667	1.125
66.667	1.139
68.667	1.067
76.667	1.211
77.333	1.153
79.333	1.211
80.000	1.103
80.333	1.312
84.000	1.182
93.000	1.500
93.333	1.341
94.000	1.304
94.667	1.247
95.000	1.369
97.000	1.463
98.667	1.449
100.333	1.319
109.333	1.376
110.000	1.622
113.000	1.528
113.667	1.412
115.333	1.578
116.667	1.614
118.000	1.397
124.333	1.787
127.000	1.498
127.000	1.585
129.000	1.563
130.667	1.635
132.000	1.541
134.667	1.700
142.667	1.931
146.333	1.635
149.333	1.700
150.667	1.714
152.000	1.794
152.000	1.678
157.333	1.880
169.667	1.771
170.000	1.836
172.000	1.793
173.333	1.851
174.667	1.894
181.333	2.002
191.000	1.951
191.667	1.872];  
units.tL_10   = {'d', 'cm'};  label.tL_10 = {'time since birth', 'total length', '10 C'};  
temp.tL_10    = C2K(10);  units.temp.tL_10 = 'K'; label.temp.tL_10 = 'temperature';
bibkey.tL_10 = 'WinkGrev2002';
comment.tL_10 = 'no maturation at 10 C in this experiment';
%
data.tL_15 = [ ... % time since birth (d), standard length (cm)
5.512	0.309
6.943	0.314
6.945	0.340
9.811	0.388
10.768	0.426
12.196	0.404
12.198	0.431
15.545	0.527
15.778	0.468
15.780	0.495
16.499	0.532
16.733	0.489
20.078	0.564
20.559	0.617
21.982	0.537
22.226	0.596
22.228	0.617
23.897	0.617
26.524	0.676
27.006	0.729
27.246	0.745
27.950	0.622
27.956	0.691
28.676	0.745
28.678	0.761
32.733	0.787
32.735	0.809
32.741	0.872
33.446	0.761
33.690	0.824
34.162	0.771
34.412	0.894
34.652	0.915
35.361	0.851
35.842	0.888
39.905	1.000
40.132	0.883
40.136	0.926
41.082	0.846
41.328	0.926
41.573	1.000
42.053	1.027
43.244	1.021
43.717	0.979
47.301	1.074
47.535	1.027
48.485	0.989
48.733	1.085
48.740	1.165
49.215	1.138
49.444	1.043
50.644	1.128
50.888	1.186
51.359	1.122
51.594	1.096
52.317	1.170
53.022	1.069
53.028	1.128
55.658	1.213
56.840	1.112
56.847	1.186
57.789	1.064
58.037	1.160
58.518	1.213
58.520	1.229
58.751	1.149
61.384	1.261
61.386	1.282
61.620	1.239
61.626	1.303
62.576	1.261
63.049	1.229
63.293	1.282
63.533	1.303
63.760	1.181
64.957	1.239
65.681	1.324
66.868	1.282
66.872	1.324
67.576	1.207
67.593	1.383
69.498	1.362
69.725	1.239
69.741	1.404
69.744	1.436
70.925	1.330
71.648	1.404
71.895	1.500
72.121	1.372
73.549	1.340
76.889	1.378
76.891	1.399
77.377	1.489
77.595	1.277
79.042	1.457
79.263	1.271
79.525	1.521
80.219	1.293
80.711	1.457
80.959	1.553
80.961	1.574
81.193	1.511
81.666	1.468
81.896	1.383
82.140	1.447
82.393	1.601
82.865	1.548
83.112	1.633
83.332	1.447
84.291	1.505
87.865	1.484
87.867	1.500
87.872	1.553
87.874	1.574
88.811	1.404
89.284	1.367
89.305	1.590
89.308	1.617
89.310	1.638
89.313	1.670
89.542	1.569
91.447	1.553
91.696	1.660
91.699	1.691
92.160	1.527
92.166	1.596
92.635	1.505
92.648	1.644
93.130	1.697
93.831	1.548
95.037	1.702
95.510	1.660
95.743	1.606
97.423	1.723
98.837	1.548
99.071	1.511
99.324	1.665
99.336	1.787
100.021	1.468
100.271	1.596
100.275	1.638
100.518	1.686
102.907	1.734
102.911	1.782
102.916	1.835
104.091	1.654
104.340	1.766
105.281	1.638
105.285	1.676
106.958	1.723
107.680	1.798
108.615	1.596
108.859	1.654
108.867	1.739
110.076	1.920
110.517	1.543
110.770	1.702
110.778	1.787
111.741	1.883
111.968	1.761
114.119	1.819
114.588	1.745
114.599	1.862
115.809	2.043
117.227	1.920
117.929	1.782
117.934	1.835
118.877	1.723
119.135	1.926
120.085	1.894
120.793	1.814
121.964	1.596
121.969	1.649
121.971	1.676
122.220	1.787
122.476	1.963
124.366	1.787
125.563	1.846
126.996	1.867
129.860	1.904
129.871	2.021
130.818	1.957
131.276	1.755
132.233	1.793
132.487	1.957
132.968	2.000
132.972	2.043
133.656	1.718
135.104	1.899
136.281	1.745
136.299	1.931
137.486	1.888
139.387	1.819
140.587	1.904];  
units.tL_15   = {'d', 'cm'};  label.tL_15 = {'time since birth', 'total length', '15 C'};  
temp.tL_15    = C2K(15);  units.temp.tL_15 = 'K'; label.temp.tL_15 = 'temperature';
bibkey.tL_15 = 'WinkGrev2002';

data.LN_15 = [ ... % standard length (cm), hatched juveniles (#) 
2.333	35.626
2.210	29.212
2.205	20.555
2.149	23.779
2.149	17.100
2.144	25.511
2.144	32.437
2.123	25.514
2.123	22.545
2.097	30.464
2.097	29.475
2.082	26.756
2.062	29.727
2.062	24.533
2.031	26.516
2.021	29.485
2.015	20.334
2.010	17.614
2.000	16.131
2.000	27.509
1.990	19.348
1.990	21.080
1.979	27.265
1.969	23.061
1.969	24.793
1.964	8.716
1.964	18.362
1.959	28.999
1.954	20.095
1.949	21.580
1.938	27.518
1.933	17.872
1.923	24.552
1.897	20.350
1.897	16.145
1.897	25.545
1.882	12.190
1.882	8.232
1.877	17.385
1.877	14.911
1.862	25.550
1.856	24.561
1.846	19.863
1.846	21.347
1.841	18.627
1.805	17.642
1.800	27.537
1.779	3.299
1.779	21.109
1.769	29.520
1.764	19.874
1.759	5.776
1.754	12.950
1.749	23.339
1.738	21.114
1.733	6.274
1.733	17.899
1.708	21.861
1.687	20.132
1.672	15.187
1.672	16.918
1.667	18.156
1.667	21.866
1.626	10.246
1.528	7.292
1.487	14.718];   
units.LN_15  = {'cm', 'N'};   label.LN_15 = {'standard length', 'number of young'};  
temp.LN_15   = C2K(15);  units.temp.LN_15 = 'K'; label.temp.LN_15 = 'temperature';
bibkey.LN_15 = 'WinkGrev2002';

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

%% Group plots
set1 = {'tL_15','tL_10'}; subtitle1 = {'Data for 15, 10 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Females release eggs into a brood pouch or marsupium, where they are held until they hatch';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Closely associated with the seaweed Fucus vesiculosus';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6VXD2'; % Cat of Life
metaData.links.id_ITIS = '90181'; % ITIS
metaData.links.id_EoL = '318599'; % Ency of Life
metaData.links.id_Wiki = 'Praunus_flexuosus'; % Wikipedia
metaData.links.id_ADW = 'Praunus_flexuosus'; % ADW
metaData.links.id_Taxo = '545280'; % Taxonomicon
metaData.links.id_WoRMS = '120177'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Praunus_flexuosus}}';
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
bibkey = 'WinkGrev2002'; type = 'Article'; bib = [ ... 
'author = {G. Winkler and W. Greve}, ' ... 
'year = {2002}, ' ...
'title = {Laboratory studies of the effect of temperature on growth, moulting and reproduction in the co-occurring mysids \emph{Neomysis integer} and \emph{Praunus flexuosus}}, ' ...
'journal = {Mar Ecol Prog Ser}, ' ...
'volume = {235}, ' ...
'pages = {177-188}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
