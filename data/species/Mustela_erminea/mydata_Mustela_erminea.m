function [data, auxData, metaData, txtData, weights] = mydata_Mustela_erminea

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Mustelidae';
metaData.species    = 'Mustela_erminea'; 
metaData.species_en = 'Stoat'; 

metaData.ecoCode.climate = {'Cf','Df'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 04 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 43;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(39.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 45;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(39.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 95;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(39.6);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 12.5*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(39.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwx = 26.6;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';    bibkey.Wwx = 'AnAge';
data.Wwi = 200;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'King1989';
  comment.Wwi = 'Wiki: till 180 g';
data.Wwim = 320;units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';    bibkey.Wwim = 'King1989';
  comment.Wwim = 'Wiki: till 258 g';

data.Ri  = 6.77/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_f = [..., % time since birth (d), body weight (g) female
62.991	134.908
86.108	163.642
109.500	181.720
150.928	200.546
194.656	205.189
267.535	204.637
328.824	203.422
393.336	202.251
448.219	199.428];
units.tW_f = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f  = C2K(39.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'King1989';
comment.tW_f = 'Data for females, points from a drawn curve, not measurements';
%
data.tW_m= [..., % time since birth (d), body weight (g) male
64.561	174.015
101.415	220.191
139.793	257.251
185.010	279.172
247.366	286.602
302.893	283.788
347.200	290.977
384.826	307.214
421.898	319.890
451.550	320.285];
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(39.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'King1989';
comment.tW_m = 'Data for males, points from a drawn curve, not measurements';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;
weights.Wwx = 0 * weights.Wwx;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Weight at weaning ignored because of inconsistency with tW data';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'The implantation can be delayed and extend the gestation time up to one year.';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44QWG'; % Cat of Life
metaData.links.id_ITIS = '180555'; % ITIS
metaData.links.id_EoL = '328587'; % Ency of Life
metaData.links.id_Wiki = 'Mustela_erminea'; % Wikipedia
metaData.links.id_ADW = 'Mustela_erminea'; % ADW
metaData.links.id_Taxo = '66689'; % Taxonomicon
metaData.links.id_WoRMS = '1506692'; % WoRMS
metaData.links.id_MSW3 = '14001334'; % MSW3
metaData.links.id_AnAge = 'Mustela_erminea'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mustela_erminea}}';
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
bibkey = 'King1989'; type = 'Book'; bib = [ ... 
'author = {King, C.}, ' ... 
'year = {1989}, ' ...
'title = {The natural history of weasels and stoats}, ' ...
'publisher = {C. Helm}, ' ...
'address = {London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Mustela_erminea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

