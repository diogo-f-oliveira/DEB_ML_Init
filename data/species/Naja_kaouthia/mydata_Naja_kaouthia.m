  function [data, auxData, metaData, txtData, weights] = mydata_Naja_kaouthia
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Elapidae';
metaData.species    = 'Naja_kaouthia'; 
metaData.species_en = 'Monocled cobra'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'biTf'};
metaData.ecoCode.embryo  = {'Tnt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};  
metaData.data_1     = {'t-Le'; 'L-dL'; 'L-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 16]; 

%% set data
% zero-variate data
data.ab = 57;         units.ab = 'd';  label.ab = 'age at birth';          bibkey.ab = 'Chai2011';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '50 to 73 s';
data.am = 24.5*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'AnAge';
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 27.5;      units.Lb = 'cm';     label.Lb = 'SVL at birth';  bibkey.Lb = 'Chai2011';
data.Lp = 100;     units.Lp = 'cm';     label.Lp = 'SVL at puberty'; bibkey.Lp = 'Chai2011'; 
data.Li = 165;     units.Li = 'cm';     label.Li = 'ultimate SVL for females';  bibkey.Li = 'Chai2011';
data.Lim = 145;     units.Lim = 'cm';     label.Lim = 'ultimate SVL for males';  bibkey.Lim = 'Chai2011';

data.Ri = 23/365/2;  units.Ri = '#/d';  label.Ri = 'reprod rate at SVL 136.7 cm';  bibkey.Ri = 'Chai2011';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '23 eggs per clutch, 1 clutch every 1 to 3 yrs';
  
  
% univariate data
% length - change in length
data.LdL_f = [ ... % SVL (cm), change in SVL (cm/d)
27.88624	0.25399
94.50215	0.10236
104.05273	0.12593
112.09457	0.12859
115.57693	0.12197
128.46877	0.01612
130.60633	0.07463
142.36245	0.04729
147.60883	0.00061
152.59425	0.02409
153.46225	0.02661
153.90378	0.01576
155.65119	0.00243];
units.LdL_f  = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL', 'female'};  
temp.LdL_f   = C2K(25);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'Chai2011';
comment.LdL_f = 'data for females';
%
data.LdL_m = [ ... % SVL (cm), change in SVL (cm/d)
25.65787	0.34166
27.23874	0.24646
28.32984	0.23980
65.94951	0.22212
85.95084	0.21999
99.71689	0.10664
114.73487	0.07768
118.68989	0.01009
119.97192	0.04603
123.47816	0.00099
123.64574	0.08119
126.93615	0.03363
133.24302	0.02957
138.02816	0.02549
138.26112	0.00043
142.59229	0.02724
148.47112	0.01232
149.56534	0.00064];
units.LdL_m  = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL', 'male'};  
temp.LdL_m   = C2K(25);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'Chai2011';
comment.LdL_m = 'data for males';

data.tLe = [ ... % age (d), total length (cm)
2.014	7.931
3.017	5.129
5.890	6.681
5.972	7.692
8.758	8.544
9.063	7.377
9.913	8.698
10.115	8.076
10.132	6.831
14.923	9.158
15.955	11.257
16.069	10.013
17.891	10.788
19.693	13.041
20.826	14.829
20.944	13.273
21.994	14.049
23.096	11.092
23.903	15.525
23.917	14.513
25.623	16.689
25.838	15.133
25.950	13.966
26.759	18.243
26.867	17.465
26.978	16.376
27.834	17.231
27.975	14.042
29.833	19.172
30.724	17.538
31.821	21.970
31.915	15.125
32.031	20.725
32.856	16.835
34.630	21.111
35.770	22.354
35.884	21.109
35.895	20.331
37.668	24.607
37.824	20.329
38.745	23.516
39.839	21.104
39.847	20.482
44.664	27.942
45.752	25.996
45.822	27.941
45.911	28.485
47.849	27.860
50.669	33.223
50.687	31.901
50.714	22.956
52.623	31.432
52.856	14.476
54.704	27.385
54.851	30.729
56.655	32.827];
data.tLe(:,2) = data.tLe(:,2) - data.tLe(:,1)/ 10; % convert TL to SVL
units.tLe  = {'d', 'cm'};  label.tLe = {'age', 'embryo SVL'};  
temp.tLe   = C2K(25);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'Jack2002';
comment.tLe = 'TL is converted to SVL by subtracting tail length, which grows linearly in time 6/60 cm/d';
subtitle = 'Embryo development';

% length-weight
data.LW_f = [ ... % SVL (cm), 10 * log10 weight (g)
42.740	8.389
42.963	9.243
46.828	11.731
46.843	9.558
51.846	12.746
55.502	12.439
60.287	14.153
61.878	15.319
62.794	14.854
63.032	13.457
63.707	14.933
67.131	15.247
68.259	17.344
68.263	16.723
68.271	15.559
69.180	16.258
69.187	15.249
72.605	16.262
72.605	16.262
74.429	16.730
76.484	16.810
76.490	15.956
77.854	16.889
78.307	17.510
78.985	18.520
80.126	18.599
80.590	17.668
81.259	19.998
81.950	19.067
83.319	19.301
84.688	19.536
85.155	17.984
85.377	18.916
88.553	22.102
88.563	20.704
90.158	21.250
92.445	20.709
92.445	20.709
92.906	20.166
93.124	21.641
95.181	21.410
95.405	22.032
96.095	21.411
97.236	21.413
98.131	24.208
102.707	22.971
111.816	26.940
113.416	26.787
118.210	27.103
121.164	29.357
121.168	28.736
122.557	25.865
124.809	30.681
125.069	25.946
125.520	26.800
125.965	28.586
126.873	29.441
127.562	28.743
130.756	29.290
130.759	28.902
130.762	28.436
133.509	27.508
136.690	29.918
137.157	28.443
138.740	30.696
139.658	30.076
139.662	29.533
146.042	31.713
148.090	32.725
154.949	31.723
156.093	31.414
162.250	32.741];
data.LW_f(:,2) = 10.^(data.LW_f(:,2)/ 10); % remove log transformation
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'wet weight', 'female'};  
bibkey.LW_f = 'Chai2011';
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % SVL (cm), 10 * log10 weight (g)
34.541	5.042
41.401	3.652
43.190	9.321
45.463	10.953
45.926	10.022
47.285	11.809
48.193	12.509
51.401	11.038
51.613	13.444
51.622	12.047
56.867	13.295
57.784	12.753
58.461	13.918
60.510	14.929
62.553	16.717
62.790	15.553
64.615	15.787
69.629	17.346
71.912	17.503
72.141	17.348
73.502	18.825
74.429	16.730
75.794	17.585
75.798	17.042
76.699	18.906
77.378	19.761
78.522	19.529
78.525	19.063
79.203	20.151
81.717	19.843
81.939	20.775
83.305	21.397
84.679	20.855
87.869	21.946
93.579	21.952
94.936	23.894
95.621	23.895
98.586	24.519
100.402	26.151
100.417	23.900
105.425	26.312
109.303	27.093
111.357	27.328
115.693	27.798
116.597	29.197
117.972	28.422
118.892	27.569
119.109	29.200
120.027	28.580
122.757	30.135
124.358	29.749
124.372	27.653
124.829	27.653
126.879	28.510
128.024	27.967
129.379	30.375
129.379	30.375
129.604	30.841
130.524	29.911
133.035	29.991
133.942	31.001
135.542	30.848
135.548	29.916
136.008	29.451
137.603	29.996
138.511	30.851
139.189	31.939
141.020	31.242
142.160	31.554
143.540	30.081
143.987	31.556
144.702	27.210
148.561	30.629
152.664	31.798];
data.LW_m(:,2) = 10.^(data.LW_m(:,2)/ 10); % remove log transformation
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'wet weight', 'male'};  
bibkey.LW_m = 'Chai2011';
comment.LW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_f = 3 * weights.LdL_f;
weights.LdL_m = 3 * weights.LdL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.subtitle = subtitle;
                  
%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'In view of embryo length at zero, embryo development starts while the egg is still in the mother';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '45KX4'; % Cat of Life
metaData.links.id_ITIS = '700628'; % ITIS
metaData.links.id_EoL = '1055811'; % Ency of Life
metaData.links.id_Wiki = 'Naja_kaouthia'; % Wikipedia
metaData.links.id_ADW = 'Naja_kaouthia'; % ADW
metaData.links.id_Taxo = '645759'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Naja&species=kaouthia'; % ReptileDB
metaData.links.id_AnAge = 'Naja_kaouthia'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Naja_kaouthia}}';
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
bibkey = 'Jack2002'; type = 'Article'; bib = [ ...  
'author = {Kate Jackson}, ' ...
'year = {2002}, ' ...
'title = {Post-ovipositional development of the monocled cobra, \emph{Naja kaouthia} ({S}erpentes: {E}lapidae)}, ' ... 
'journal = {Zoology}, ' ...
'volume = {105}, '...
'pages = {203-214}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'Chai2011'; type = 'phdthesis'; bib = [ ...  
'author = {Apinya Chaitae}, ' ...
'year = {2011}, ' ...
'title = {DEMOGRAPHY OF THE MONOCLED COBRA (\emph{Naja kaouthia}) IN THE CENTRAL REGION OF {T}HAILAND}, ' ... 
'school = {University of Louisville Louisville, Kentucky}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Naja_kaouthia}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


