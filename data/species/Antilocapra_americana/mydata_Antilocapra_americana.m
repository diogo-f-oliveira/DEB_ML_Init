function [data, auxData, metaData, txtData, weights] = mydata_Antilocapra_americana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Antilocapridae';
metaData.species    = 'Antilocapra_americana'; 
metaData.species_en = 'Pronghorn'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww';'t-Ww_e'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 10];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 10]; 

%% set data
% zero-variate data

data.tg = 235;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(39.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 91;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 547;    units.tp = 'd';    label.tp = 'time since birth at puberty of females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 547;    units.tpm = 'd';    label.tpm = 'time since birth at puberty of males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(39.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 15.5*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(39.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 3000;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwx = 8900;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';       bibkey.Wwx = 'AnAge';
data.Wwi = 45e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '34 till 48 kg ';
data.Wwim = 60e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'Wiki';
  comment.Wwim = '40 till 65 kg';
  
data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 calves per litter, 1 litter per yr';

% uni-variate data
% time-weight data
data.tW = [ % time since birth (d), weight (kg)
0.914	3.992
4.722	4.194
6.395	3.546
8.053	4.395
9.950	5.294
12.333	4.995
14.956	4.597
18.032	6.594
19.467	5.996
21.125	6.845
26.591	7.995
27.778	8.345
28.971	7.996
33.713	10.094
35.618	10.095
35.623	9.546
41.798	11.245
42.504	12.044
43.699	11.595
49.641	12.645
49.887	11.847
56.064	13.297
58.200	13.996
62.718	14.597
68.430	14.799
68.897	15.797
71.042	15.549
75.090	15.550
76.030	16.898
76.752	16.000
81.756	15.603
83.647	17.101
91.010	18.950
96.743	16.956
98.636	18.255
100.046	20.151
105.041	20.702
105.545	17.808
107.919	18.508
110.540	18.309
111.921	23.300
112.679	18.660]; 
units.tW  = {'d', 'kg'};  label.tW = {'time since birth', 'weight', 'full diet'};  
temp.tW  = C2K(39.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MartPark1997';
comment.tW = 'Data for full diet';
% 
data.tW1 = [ ... % time since birth (d), weight (kg)
1.645	2.296
1.861	4.592
2.109	3.594
3.766	4.542
7.831	2.698
9.958	4.395
11.632	3.598
11.637	3.099
14.727	3.699
21.866	4.101
26.604	6.548
26.620	4.901
33.733	7.998
37.541	8.149
39.919	8.550
40.151	9.099
40.173	6.853
43.721	9.300
48.001	9.850
57.065	8.207
60.849	10.854
60.853	10.405
63.013	8.609
64.654	11.354
66.559	11.355
66.563	10.856
69.432	9.610
71.313	12.155
73.466	11.108
74.166	12.556
77.741	12.158
85.131	11.213
88.690	12.562
89.159	13.311
92.714	15.059
94.175	11.666
97.729	13.414
98.930	12.317
101.995	15.561
102.727	13.616
105.819	14.016
106.516	15.813
109.385	14.616
112.480	14.568]; 
units.tW1  = {'d', 'kg'};  label.tW1 = {'time since birth', 'weight', 'restricted diet'};  
temp.tW1  = C2K(39.5);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'MartPark1997';
comment.tW1 = 'Data for restricted diet';

% time-weight for foetus
data.tWe = [ ... % gestational age (d), foetal mass (kg)
55.577	0.002
85.278	0.006
99.642	0.007
121.870	0.034
136.980	0.136
164.749	0.269
171.832	0.568
252.012	3.702];
units.tWe  = {'d', 'kg'};  label.tWe = {'gestational age', 'weight'};  
temp.tWe  = C2K(39.5);  units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'Byer1997';
subtitle.tWe = 'foetal development';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.subtitle = subtitle;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data for full and restricted diets'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Slow/fast parameter for foetal development point to slow development';
D2 = 'Males are assumend to differ from females by {p_Am} and E_Hp only';
D3 = 'Body temperature is guessed based on Rupicapra';
D4 = 'Scaled functional respons for growth data is allowed to exceed 1, since calves were bottle-raised';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Links
metaData.links.id_CoL = '5VLCR'; % Cat of Life
metaData.links.id_ITIS = '180717'; % ITIS
metaData.links.id_EoL = '328661'; % Ency of Life
metaData.links.id_Wiki = 'Antilocapra_americana'; % Wikipedia
metaData.links.id_ADW = 'Antilocapra_americana'; % ADW
metaData.links.id_Taxo = '68131'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200468'; % MSW3
metaData.links.id_AnAge = 'Antilocapra_americana'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Antilocapra_americana}}';
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
bibkey = 'Byer1997'; type = 'Book'; bib = [ ...  
'author = {Byers, J. A.}, ' ...
'year = {1997}, ' ...
'title  = {american pronghorn}, ' ...
'publisher = {Univ Chicago Press}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MartPark1997'; type = 'article'; bib = [ ... 
'author = {S. K. Martin and K. L. Parker}, ' ... 
'year = {1999}, ' ...
'title = {Rates of growth and morphological dimensions of bottle-raised pronghorns}, ' ...
'journal = {J Mammol}, ' ...
'volume = {78}, ' ...
'pages = {23--30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Antilocapra_americana}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Antilocapra_americana/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

