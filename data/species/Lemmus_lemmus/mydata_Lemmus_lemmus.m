function [data, auxData, metaData, txtData, weights] = mydata_Lemmus_lemmus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Lemmus_lemmus'; 
metaData.species_en = 'Norway lemming'; 

metaData.ecoCode.climate = {'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2017 12 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 19;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 14;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 24;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(37.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 44;    units.tpm = 'd';    label.tpm = 'time since birth at puberty male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.8);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 3.3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.8;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'AnAge';
data.Wwi = 70; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'AnAge';

data.Ri  = 2.5*7/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7 pups per litter; 2.5 litters per yr';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
0.182	4.310
1.465	4.764
2.529	5.898
4.023	6.805
5.517	7.713
7.009	8.847
8.716	9.981
9.569	10.662
10.426	10.662
11.707	11.342
12.560	12.023
13.838	13.157
14.900	14.518
15.751	15.425
16.604	16.106
17.240	17.013
17.448	17.921
18.083	19.055
19.577	19.962
20.644	20.643
21.495	21.550
22.778	22.004
23.629	22.911
24.480	23.819
25.334	24.272
26.185	25.180
27.893	26.087
29.180	26.087
30.680	26.087
31.096	27.902
32.585	29.490
33.436	30.397
37.290	31.078
38.988	33.346
40.698	34.026
42.413	34.026
45.835	35.161
48.407	35.161
51.634	33.573
55.046	36.068
57.409	35.388
59.970	36.975
63.835	36.068
66.609	37.883
69.175	38.790
71.524	39.924
75.589	41.059
78.594	40.605
81.168	40.378
83.946	41.512
87.392	39.244
90.390	39.698
93.398	38.790
95.749	39.698
98.948	41.966
102.385	41.059
105.374	42.647
108.585	43.327
110.930	45.142
114.152	44.234
114.340	47.864
116.919	46.957
120.139	46.276
123.788	45.595
126.776	47.410
129.549	49.452
132.772	48.318
135.796	45.142];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(37.8);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'SembMyst2000';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
0.182	4.310
1.251	4.764
2.745	5.671
3.381	6.578
4.877	7.259
5.944	7.940
7.225	8.620
7.647	9.527
8.932	9.754
9.780	11.115
11.491	11.569
12.769	12.703
14.049	13.611
14.471	14.518
15.108	15.425
15.960	16.106
17.024	17.240
17.878	17.694
18.513	18.828
19.152	19.509
19.790	20.189
20.641	21.096
21.493	21.777
22.560	22.457
23.411	23.365
24.477	24.272
25.108	25.860
26.177	26.314
28.106	26.314
30.466	26.087
31.089	28.809
34.297	29.943
35.576	30.851
39.843	33.800
43.704	33.346
45.621	35.161
51.374	39.924
54.379	39.471
57.152	41.285
60.584	41.059
63.159	40.605
65.932	42.647
68.931	42.873
72.364	42.420
75.139	44.008
78.132	45.142
81.130	45.595
84.354	44.461
86.915	46.049
90.125	46.730
93.109	49.225
96.327	48.771
99.090	52.174
102.537	49.679
105.532	50.586
108.319	50.586
111.542	49.452
114.553	48.091
117.754	50.132
120.984	48.091
123.558	47.864
126.338	48.771
129.792	45.369
132.991	47.637
135.775	48.091
138.342	48.771
142.193	49.905
144.327	51.267
147.716	56.938
150.111	51.720
153.731	55.123
157.124	60.340
159.904	61.248
162.700	59.887
165.735	55.123
168.899	62.382
171.687	62.155
174.888	64.197
177.902	62.382
180.890	64.197];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(37.8);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'SembMyst2000';
comment.tW_m = 'Data for males';
  
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
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumend to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3T4QV'; % Cat of Life
metaData.links.id_ITIS = '632854'; % ITIS
metaData.links.id_EoL = '1179632'; % Ency of Life
metaData.links.id_Wiki = 'Lemmus_lemmus'; % Wikipedia
metaData.links.id_ADW = 'Lemmus_lemmus'; % ADW
metaData.links.id_Taxo = '62589'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000233'; % MSW3
metaData.links.id_AnAge = 'Lemmus_lemmus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lemmus_lemmus}}';
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
bibkey = 'SembMyst2000'; type = 'Article'; bib = [ ... 
'author = {A. Semb-Johansson and A. Mysterud and E. {\O}stbye and C. E. Engh}, ' ... 
'year = {2000}, ' ...
'title = {Growth, reproduction and resource allocation in the {N}orwegian lemming \emph{Lemmus lemmus} ({L}.) under controlled conditions}, ' ...
'howpublished = {\url{https://folk.uio.no/atlemy/pdf/art20.pdf}}, ' ...
'journal = {Fauna norv.}, ' ...
'volume = {20}, ' ...
'pages = {9--17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lemmus_lemmus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

