function [data, auxData, metaData, txtData, weights] = mydata_Cheirogaleus_medius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Cheirogaleidae';
metaData.species    = 'Cheirogaleus_medius'; 
metaData.species_en = 'Fat-tailed dwarf lemur'; 

metaData.ecoCode.climate = {'Aw', 'BSh'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 15];

%% set data
% zero-variate data

data.tg = 61;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 37;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(38);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 29*365/2; units.am = 'd'; label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(38);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'corrected for torpor by factor 2; can hibernate upto 7 mnth per yr';

data.Wwb = 19;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 380; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2.5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(38);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-4 pups per litter, 1 litter per yr; AnAge gives 22.2 pups per litter';
 
% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
4.954	13.203
23.707	87.375
54.443	166.419
84.228	230.912
114.177	246.214
144.193	241.424
181.154	253.275
212.121	263.036
240.093	271.406
270.141	256.915
305.220	233.428];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(38);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Foer1982';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
2.956	12.507
23.716	84.603
64.212	235.723
92.020	293.283
116.004	298.181
153.004	298.254
190.026	291.399
214.054	283.132
248.056	282.507
278.024	292.266
315.120	263.240
342.148	254.980];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(38);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Foer1982';
comment.tWw_m = 'Data for males';
 
%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'body temp during topor 7C (= ambient in May-August). Females hibernate longer than males';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'body temp can easily drop in response to starvation';
metaData.bibkey.F2 = 'GeniPerr2003'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5XRNX'; % Cat of Life
metaData.links.id_ITIS = '572859'; % ITIS
metaData.links.id_EoL = '310888'; % Ency of Life
metaData.links.id_Wiki = 'Cheirogaleus_medius'; % Wikipedia
metaData.links.id_ADW = 'Cheirogaleus_medius'; % ADW
metaData.links.id_Taxo = '65435'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100012'; % MSW3
metaData.links.id_AnAge = 'Cheirogaleus_medius'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cheirogaleus_medius}}';
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
bibkey = 'Foer1982'; type = 'Article'; bib = [ ... 
'doi = {10.1159/000156068}, ' ...
'author = {Foerg, R.}, ' ... 
'year = {1982}, ' ...
'title = {Reproduction in \emph{Cheirogaleus medius}}, ' ...
'journal = {Folia Primatologica}, ' ...
'volume = {39(1-2)}, ' ...
'pages = {49–62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cheirogaleus_medius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

