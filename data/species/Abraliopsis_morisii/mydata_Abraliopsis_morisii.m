function [data, auxData, metaData, txtData, weights] = mydata_Abraliopsis_morisii

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Enoploteuthidae';
metaData.species    = 'Abraliopsis_morisii'; 
metaData.species_en = 'Pfeffer''s firefly squid'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 18];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 27];

%% set data
% zero-variate data

data.am = 300;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'guess';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on ML 3.8 cm in 160d, and max ML 7 cm';

data.Lp  = 2.2;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';   bibkey.Lp  = 'Arkh1996';
data.Li  = 7;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female';      bibkey.Li  = 'sealifebase';

data.Wwb  = 6.8e-4;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'Lapt1999';

data.Ni  = 1e4; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'Lapt1999';   
  temp.Ni = C2K(21);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
85.889	2.383
112.100	2.898
116.147	2.487
121.975	2.795
124.282	3.197
125.971	2.997
127.134	3.082
128.030	2.375
131.173	2.777
132.333	2.904
134.815	3.222
137.008	2.990
141.831	3.308
143.337	3.298
146.014	3.278
146.039	2.982
147.699	3.131
149.047	3.005
152.042	3.185
154.206	3.302];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Arkh1996';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
85.737	2.193
92.083	2.300
104.107	2.494
108.965	2.390
114.011	2.044
123.655	2.701
127.017	2.491];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Arkh1996';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
86.046	0.966
92.484	1.024
116.202	1.215
122.447	1.679
124.178	1.034
126.671	1.904
127.491	2.399
128.180	2.200
131.264	1.610
132.604	1.898
135.971	2.290
137.496	2.299
142.426	2.045
143.768	2.285
146.488	2.142
146.672	1.895
146.819	2.286
148.697	2.039
149.718	1.983
153.092	2.248
154.774	2.488
155.282	2.488];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(21);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Arkh1996';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
85.709	0.942
91.468	0.999
104.338	1.195
109.078	1.300
114.347	1.039
115.999	1.805
124.332	1.305
127.225	1.099];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(21);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Arkh1996';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 8 * weights.Li;
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 2 * weights.psd.p_M;
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8LMR'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '591644'; % Ency of Life
metaData.links.id_Wiki = 'Abraliopsis_morisii'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '230047'; % Taxonomicon
metaData.links.id_WoRMS = '878692'; % WoRMS
metaData.links.id_molluscabase = '878692'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Abraliopsis_morisii}}';
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
bibkey = 'Arkh1996'; type = 'article'; bib = [ ... 
'author = {A.I. Arkhipkin}, ' ... 
'year = {1996}, ' ...
'title = {Age and growth of the squid \emph{Abraliopsis pfefferi} ({O}egopsida: {E}noploteuthidae) from the central-east {A}tlantic based on statolith microstructure}, ' ...
'journal = {SCI. MAR.}, ' ...
'volume = {62(2-3)}, ' ...
'pages = {325-330}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lapt1999'; type = 'article'; bib = [ ... 
'author = {V. V. Laptikhovsky}, ' ... 
'year = {1999}, ' ...
'title = {Fecundity and spawning in squid of families {E}noploteuthidae and {A}ncistrocheiridae ({C}ephalopoda: {O}egopsida) }, ' ...
'journal = {SCI. MAR.}, ' ...
'volume = {63(1)}, ' ...
'pages = {1-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Abraliopsis-morisii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

