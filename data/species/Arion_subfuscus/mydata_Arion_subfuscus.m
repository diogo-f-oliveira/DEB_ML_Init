function [data, auxData, metaData, txtData, weights] = mydata_Arion_subfuscus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Arionidae';
metaData.species    = 'Arion_subfuscus'; 
metaData.species_en = 'Dusky slug'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biH'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 17]; 

%% set data
% zero-variate data

data.ab  = 42;   units.ab  = 'd'; label.ab  = 'age at birth';     bibkey.ab  = 'ADW';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Value for Arion ater, temperature guessed';
data.tp  = 167; units.tp  = 'd'; label.tp  = 'time since birth at puberty'; bibkey.tp  = 'HutcReis2017';   
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am  = 365;   units.am  = 'd'; label.am  = 'life spam';     bibkey.am  = {'ADW','HutcReis2017'};   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb  = 0.02; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'HutcReis2017';
data.Wwp  = 2.3; units.Wwp  = 'g';  label.Wwp  = 'wet weight at puberty';   bibkey.Wwp  = 'HutcReis2017';
data.Wwi  = 10.8; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'HutcReis2017';

data.Ri  = 60/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Value for Arion ater: 20-50 eggs per clutch; 0.5 yr accumulation time';
 
% uni-variate data
% time-weight
data.tWw = [ ... % age (d), wet weight (d)
65.340	0.057
65.808	0.115
72.834	0.094
73.302	0.147
80.796	0.064
80.796	0.238
85.948	0.365
88.290	0.196
95.316	0.242
95.785	0.346
99.063	0.279
100.000	0.645
101.874	0.559
103.747	0.392
106.557	0.392
107.026	0.600
108.431	0.365
108.431	0.842
108.431	1.024
109.368	0.668
112.646	0.460
112.646	0.743
113.115	0.590
113.583	0.358
113.583	0.444
113.583	0.622
113.583	0.988
113.583	0.904
116.393	0.668
116.862	0.328
118.735	0.611
123.419	1.061
123.888	0.024
136.534	1.314
137.471	1.224
137.939	0.798
137.939	0.888
137.939	1.061
158.080	1.061
158.548	2.050
158.548	2.241
158.548	3.498
163.700	0.954
165.105	1.910
165.574	1.436
166.042	2.678
166.979	2.980
169.321	3.376
169.789	1.411
169.789	1.542
170.726	1.160
170.726	2.775
172.131	2.726
172.600	1.910
172.600	2.775
173.068	1.202
174.005	3.498
174.473	1.462
174.941	1.598
175.410	5.268
175.878	1.291
175.878	1.627
175.878	2.407
176.815	2.014
177.283	0.971
182.904	2.407
182.904	2.584
183.372	2.927
189.930	2.450
199.766	2.494
228.806	5.175
260.187	7.258
261.124	10.738
268.618	6.074
276.581	6.074
337.471	9.824];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(13.5);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'HutcReis2017';
comment.tWw = 'reared in captivity';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 10 * weights.tWw;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'GMVP'; % Cat of Life
metaData.links.id_ITIS = '77079'; % ITIS
metaData.links.id_EoL = '403119'; % Ency of Life
metaData.links.id_Wiki = 'Arion_subfuscus'; % Wikipedia
metaData.links.id_ADW = 'Arion_subfuscus'; % ADW
metaData.links.id_Taxo = '38735'; % Taxonomicon
metaData.links.id_WoRMS = '1049809'; % WoRMS
metaData.links.id_molluscabase = '1049809'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Arion_subfuscus}}';
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
bibkey = 'HutcReis2017'; type = 'Article'; bib = [ ... 
'doi = {10.1093/mollus/eyw042}, ' ...
'author = {John M. C. Hutchinson and Heike Reise1 and Grita Skujien\''{e}}, ' ... 
'title = {Life cycles and adult sizes of five co-occurring species of \emph{Arion} slugs}, ' ...
'journal = {Journal of Molluscan Studies}, ' ...
'volume = {83}, ' ...
'year = {2017}, ' ...
'pages = {88-105}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Arion_subfuscus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

