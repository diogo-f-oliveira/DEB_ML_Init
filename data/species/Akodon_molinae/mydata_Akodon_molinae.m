function [data, auxData, metaData, txtData, weights] = mydata_Akodon_molinae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Akodon_molinae'; 
metaData.species_en = 'Molina''s grass mouse'; 

metaData.ecoCode.climate = {'Cwa','Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 12];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 23;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'MeraLiza1980';   
  temp.tg = C2K(36.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 26;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'MeraLiza1980';   
  temp.tx = C2K(36.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 112;  units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'MeraLiza1980';
  temp.tp = C2K(36.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'MeraVerc1983';   
  temp.am = C2K(36.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 4.1;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MeraVerc1983';
data.Wwi = 56;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MeraVerc1983';

data.Ri  = 3.9/30;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = {'MeraVerc1983','MeraLiza1980'};   
  temp.Ri = C2K(36.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.9 pups per litter; 1 litter per 30 d';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
  0	 4.079
 21	19.573
 56	39.597
112	45.580
266	54.225
365	55.704];
units.tWw_f = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f  = C2K(36.3);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'MeraVerc1983';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
  0	 5.184
 21	20.137
 56	40.473
112	52.093
266	57.752
365	59.008];
units.tWw_m = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m  = C2K(36.3);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'MeraVerc1983';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

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

%% Links
metaData.links.id_CoL = '7QHV8'; % Cat of Life
metaData.links.id_ITIS = '633052'; % ITIS
metaData.links.id_EoL = '1179830'; % Ency of Life
metaData.links.id_Wiki = 'Akodon_molinae'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '88713'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12800318'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Akodon_molinae}}';
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
bibkey = 'MeraVerc1983'; type = 'Article'; bib = [ ...  
'doi = {10.1002/jez.1402280312}, ' ...
'author = {Merani, M. S. and Vercellini, O. and Acu\~{n}a, A. maría and Horgan, C. and Roldan, E. R. S. }, ' ...
'year = {1983}, ' ...
'title  = {Growth and reproduction of two species of \emph{Akodon} and their hybrids}, ' ...
'journal = {Journal of Experimental Zoology}, ' ...
'volume = {228(3)}, ' ...
'pages = {527–535}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MeraLiza1980'; type = 'Article'; bib = [ ...  
'doi = {10.1258/002367780780942944}, ' ...
'author = {Merani, M. S. and M. S. Lizarralde}, ' ...
'year = {1980}, ' ...
'title  = {\emph{Akodon molinae} ({R}odentia {C}ricetidae), a new laboratory animal: breeding, management and reproductive performance}, ' ...
'journal = {Lab Anim}, ' ...
'volume = {14(2)}, ' ...
'pages = {129-131}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

