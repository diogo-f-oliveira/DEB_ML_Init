function [data, auxData, metaData, txtData, weights] = mydata_Cynopterus_sphinx
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Pteropodidae';
metaData.species    = 'Cynopterus_sphinx'; 
metaData.species_en = 'Greater short-nosed fruit bat'; 

metaData.ecoCode.climate = {'Aw', 'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs', 'xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 11 04];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 04]; 

%% set data
% zero-variate data

data.tg = 120;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 42;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(34.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 150;    units.tp = 'd';    label.tp = 'time since birth at puberty female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(34.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 525;    units.tpm = 'd';    label.tpm = 'time since birth at puberty male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(34.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 9.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'ElanPriy2003';
data.Wwx = 25;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';        bibkey.Wwx = 'AnAge';
data.Wwi = 75;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'AnAge';

data.Ri  = 2*1.2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.2 pup per litter; 2 litters per yr';

% univariate data

% time-weight
data.tWw = [ ...
1.254	8.206
4.702	9.882
6.270	10.100
7.837	10.392
8.777	10.464
11.599	10.756
15.361	11.630
17.555	12.432
19.436	13.306
21.317	13.670
23.824	14.690
23.824	13.743
26.959	14.763
30.408	14.909
32.288	15.419
34.169	16.148
35.110	16.439
38.245	16.658
39.498	17.168
41.379	17.386
44.201	17.750
47.649	18.843
50.157	19.353
51.724	19.499
54.232	19.499
56.113	20.082
57.053	20.082
59.248	20.301
62.069	20.883
64.890	20.811
66.458	21.102
67.712	21.539
68.966	22.122
71.473	22.341
75.235	22.413
77.743	22.923
78.997	22.996
81.191	23.652
83.699	23.652
85.266	24.454
87.774	24.454
90.282	24.599
92.790	24.672
95.298	24.891
96.552	25.182
98.119	25.109
100.313	25.109
101.567	25.328
105.329	26.056
108.150	26.202
110.345	26.275
112.226	26.494
114.107	27.222
114.734	27.514
116.614	27.441
120.376	27.514
122.884	27.659
125.705	27.732
128.213	28.097
132.602	28.242
135.110	28.315
137.931	28.315
140.752	28.825
144.201	29.044
147.649	29.627
149.843	29.845
152.978	29.991
155.799	30.137
159.248	30.428
162.382	30.647
165.517	30.719
167.712	30.865
171.473	30.938
173.981	31.157
177.116	31.375
180.564	31.375
183.072	31.375
186.207	31.667
188.715	31.740
191.223	32.031
195.611	32.322
198.119	32.177
200.940	32.760
204.389	32.760
207.524	32.687
210.345	32.905
213.166	32.978
216.301	32.905
219.436	32.905];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'weight'};  
temp.tWw  = C2K(37.5);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'ElanPriy2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '6BVYB'; % Cat of Life
metaData.links.id_ITIS = '631555'; % ITIS
metaData.links.id_EoL = '327321'; % Ency of Life
metaData.links.id_Wiki = 'Cynopterus_sphinx'; % Wikipedia
metaData.links.id_ADW = 'Cynopterus_sphinx'; % ADW
metaData.links.id_Taxo = '63720'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800060'; % MSW3
metaData.links.id_AnAge = 'Cynopterus_sphinx'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynopterus_sphinx}}';
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
bibkey = 'ElanPriy2003'; type = 'Article'; bib = [ ... 
'author = {Vadamalai Elanggovani and Elangovan Yuvana Satya Priya and Hanumanthan Raghurami and Ganapathy Marimuthu}, ' ... 
'year = {2003}, ' ...
'title = {Postnatal development in the {I}ndian short-nosed fruit bat \emph{Cynopterus sphinx}: growth rate and age estimation}, ' ...
'journal = {Acta Chiropterologica}, ' ...
'volume = {5(1)}, ' ...
'pages = {107–116}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cynopterus_sphinx}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

