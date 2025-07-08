function [data, auxData, metaData, txtData, weights] = mydata_Herklotsichthys_quadrimaculatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Herklotsichthys_quadrimaculatus'; 
metaData.species_en = 'Bluestripe herring'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW', 'MI'};
metaData.ecoCode.habitat = {'0iMpe', 'piFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 03 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 11]; 


%% set data
% zero-variate data;

data.am = 1.5*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'MiltBlab1993';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 10.1;   units.Lp  = 'cm';   label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 25; units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'Wiki';

data.Wwb = 4.8e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ShirWata2007';
  comment.Wwb = 'based on egg diameter of  0.45 mm of Spratelloides_gracilis: pi/6*0.045^3';
data.Wwi = 202;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.08, see F1';

data.Ri  = 319*202/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(28.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length data
data.tL_Mun = [ % time since birth (d), standard length (cm)
25.402	2.121
31.159	2.518
41.495	3.092
46.082	3.312
46.149	3.666
55.349	4.240
56.451	4.063
56.544	4.550
58.850	4.727
64.590	5.035
68.049	5.300
70.196	4.636
71.416	5.078
73.857	5.964
74.859	5.255
79.580	6.184
87.509	6.049
92.130	6.447
97.837	6.579
104.688	6.755
105.732	6.267
108.081	6.665
114.949	6.930
117.180	6.708
124.031	6.884
124.064	7.061
153.701	7.542
285.732	8.667];  
units.tL_Mun = {'d', 'cm'};  label.tL_Mun = {'time since birth', 'standard length', 'Munda'};  
temp.tL_Mun = C2K(28.8);  units.temp.tL_Mun = 'K'; label.temp.tL_Mun = 'temperature';
bibkey.tL_Mun = 'MiltBlab1993';
comment.tL_Mun = 'Data from Munda';
%
data.tL_Von = [ % time since birth (d), standard length (cm)
41.859	3.652
41.859	3.652
44.790	4.146
45.738	3.994
48.606	3.805
48.666	4.450
51.513	4.033
57.313	4.338
59.283	4.832
64.096	4.871
66.062	5.326
66.992	4.985
69.935	5.593
73.765	5.404
77.587	5.139
80.505	5.481
80.519	5.633
87.213	5.217
87.270	5.824
92.147	6.546
98.838	6.092
100.790	6.396
106.572	6.511
109.458	6.512
110.395	6.246
115.218	6.399
120.071	6.855
121.952	6.400
125.824	6.667
127.734	6.515
131.613	6.858
137.367	6.669
153.744	6.938];  
units.tL_Von = {'d', 'cm'};  label.tL_Von = {'time since birth', 'standard length', 'Vona vona'};  
temp.tL_Von = C2K(28.5);  units.temp.tL_Von = 'K'; label.temp.tL_Von = 'temperature';
bibkey.tL_Von = 'MiltBlab1993';
comment.tL_Von = 'Data from Vona vona';
%
data.tL_Fij = [ % time since birth (d), standard length (cm)
96.542	6.628
112.125	7.433
116.974	7.434
120.878	7.740
139.317	7.896
149.043	8.242
167.483	8.398
196.668	9.511
207.348	9.666
210.211	9.093
278.211	10.480];  
units.tL_Fij = {'d', 'cm'};  label.tL_Fij = {'time since birth', 'standard length', 'Fiji'};  
temp.tL_Fij = C2K(28.5);  units.temp.tL_Fij = 'K'; label.temp.tL_Fij = 'temperature';
bibkey.tL_Fij = 'MiltBlab1993';
comment.tL_Fij = 'Data from Fiji';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_Mun = 5 * weights.tL_Mun;
weights.tL_Von = 5 * weights.tL_Von;
weights.tL_Fij = 5 * weights.tL_Fij;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Mun', 'tL_Von', 'tL_Fij'}; subtitle1 = {'Data for loc Mun, Von, Fij'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.01000*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3KZ75'; % Cat of Life
metaData.links.id_ITIS = '161825'; % ITIS
metaData.links.id_EoL = '46562399'; % Ency of Life
metaData.links.id_Wiki = 'Herklotsichthys_quadrimaculatus'; % Wikipedia
metaData.links.id_ADW = 'Herklotsichthys_quadrimaculatus'; % ADW
metaData.links.id_Taxo = '94362'; % Taxonomicon
metaData.links.id_WoRMS = '212264'; % WoRMS
metaData.links.id_fishbase = 'Herklotsichthys-quadrimaculatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Herklotsichthys_quadrimaculatus}}';
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
bibkey = 'MiltBlab1993'; type = 'Article'; bib = [ ... 
'author = {D. A. Milton and S. J. M. Blaber and N. J. F. Rawlinson}, ' ... 
'year = {1993}, ' ...
'title = {Age and growth of three species of clupeids from {K}iribati, tropical central south {P}acific}, ' ...
'journal = {Journal of fish Biology}, ' ...
'volume = {43}, ' ...
'pages = {89-1008}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShirWata2007'; type = 'Article'; bib = [ ... 
'author = {Norio Shirafuji  and Yoshiro Watanabe and Yasuyuki Takeda and  Tomohiko Kawamura}, ' ... 
'year = {2007}, ' ...
'title = {Maturation and spawning of \emph{Spratelloides gracilis} {C}lupeidae in temperate waters off {C}ape {S}hionomisaki, central {J}apan}, ' ...
'journal = {Fisheries Science}, ' ...
'volume = {73}, ' ...
'pages = {623-632}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Herklotsichthys-quadrimaculatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
