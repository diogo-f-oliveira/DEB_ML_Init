function [data, auxData, metaData, txtData, weights] = mydata_Pseudomys_novaehollandiae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Pseudomys_novaehollandiae'; 
metaData.species_en = 'New Holland mouse'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 04]; 

%% set data
% zero-variate data

data.tg = 31.5;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Kemp1976';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 24;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Kemp1976';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 13*7;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'Kemp1976';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 20*7;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';   bibkey.tpm = 'Kemp1976';
  temp.tpm = C2K(37.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on P. australis';
    
data.Wwb = 4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on P. australis';
data.Wwp = 14.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'Kemp1976';
data.Wwi = 17;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Kemp1979';

data.Ri  = 3*4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = {'Kemp1976','Wiki'};   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 pups per litter; 3 litters per yr';

% uni-variate data

% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
22.285	7.563
22.635	6.073
23.267	7.052
23.850	6.583
24.299	8.052
24.481	7.541
25.265	7.092
26.098	8.112
26.263	7.050
27.277	7.519
29.124	9.008
29.343	9.579
29.501	8.314
30.591	11.048
31.140	9.537
31.359	10.129
33.136	9.515
33.551	9.985
34.887	8.106
35.967	10.554
36.199	11.513
39.331	9.593
39.364	10.573
39.398	11.613
43.661	13.652
44.376	11.141
44.385	11.406
48.837	13.138
49.030	12.913
49.202	12.077
49.252	13.587
49.547	10.464
50.416	12.545
50.982	11.565
52.215	12.585
52.382	11.605
54.265	14.175
54.378	11.563
54.413	12.624
54.420	12.828
56.022	12.929
56.161	11.113
56.409	12.582
56.429	13.154
58.864	14.295
58.891	15.132
58.939	16.560
59.012	12.744
59.055	14.050
59.059	14.172
59.196	12.295
59.448	13.846
59.543	10.703
59.556	11.090
59.624	13.152
60.938	16.620
61.654	14.109
61.824	13.232
63.604	12.700
63.652	14.129
68.222	13.391
68.227	13.554
68.381	12.166
68.398	12.677
68.413	13.126
68.468	14.779
68.589	12.432
68.862	14.635
69.055	14.411
70.977	12.165
72.307	16.103
72.813	13.306
74.205	13.101
74.590	12.693
76.000	13.019
76.385	12.610
76.754	17.671
77.699	16.079
77.718	16.650
77.875	15.344
77.986	18.691
78.043	14.385
78.769	12.201
78.776	12.425
79.407	13.384
79.789	12.853
80.466	15.179
80.515	16.648
80.597	13.118
81.164	12.158
82.003	13.341
83.226	14.096
86.225	14.175
87.796	13.358
87.844	14.807
89.222	14.194
90.035	14.602
95.817	14.271
97.320	17.434
97.834	14.862
97.841	15.066
98.257	15.576
99.919	17.514
100.424	14.677
100.655	15.615
101.089	16.635
101.180	13.370
101.242	15.247
103.508	17.307
105.605	14.285
106.053	15.734
107.433	15.203
108.360	13.039
110.997	14.241
111.512	17.731
113.510	17.729
114.392	14.219
114.871	16.627
114.890	17.198
116.307	17.768
117.219	15.135
118.751	13.155
118.842	15.889
118.986	14.236
121.184	14.235
121.220	15.337
121.398	14.684
125.212	15.232
129.040	16.230
129.988	14.699
133.236	16.247
139.161	14.244
141.141	13.712
146.784	15.218
148.833	16.748
149.798	15.747
154.376	15.254
155.806	16.213
157.390	15.783
158.824	16.843
173.511	14.018];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'weight'};  
temp.tWw  = C2K(37.5);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Kemp1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4P4JB'; % Cat of Life
metaData.links.id_ITIS = '585503 '; % ITIS
metaData.links.id_EoL = '1179351'; % Ency of Life
metaData.links.id_Wiki = 'Pseudomys_novaehollandiae'; % Wikipedia
metaData.links.id_ADW = 'Pseudomys_novaehollandiae'; % ADW
metaData.links.id_Taxo = '63115'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001721'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudomys_novaehollandiae}}';
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
bibkey = 'Kemp1979'; type = 'Article'; bib = [ ... 
'author = {Catherine  M. Kemper}, ' ... 
'year = {1979}, ' ...
'title = {Growth of an {A}ustralian  Murid  (\emph{Pseudomys  novaehollandiae}) in the Wild}, ' ...
'journal = {Actatheriologica}, ' ...
'volume = {24(20)}, ' ...
'pages = {257-266}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kemp1976'; type = 'Article'; bib = [ ... 
'doi = {10.1071/ZO9760159}, ' ...
'author = {Catherine  M. Kemper}, ' ... 
'year = {1976}, ' ...
'title = {Reproduction of \emph{Pseudomys novaehollandiae} ({M}uridae) in the laboratory}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {24(2)}, ' ...
'pages = {159-167}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

