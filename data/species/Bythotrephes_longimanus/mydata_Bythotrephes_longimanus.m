function [data, auxData, metaData, txtData, weights] = mydata_Bythotrephes_longimanus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Onychopoda'; 
metaData.family     = 'Cercopagididae';
metaData.species    = 'Bythotrephes_longimanus'; 
metaData.species_en = 'Spiny water flea'; 

metaData.ecoCode.climate = {'Csa', 'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ap_T'; 'am'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-Wd'; 'T-ab'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 05]; 

%% set data
% zero-variate data

data.tp_12 = 9.2;     units.tp_12 = 'd';    label.tp_12 = 'time since birth at puberty'; bibkey.tp_12 = 'Bran2005';
  temp.tp_12 = C2K(12.7);  units.temp.tp_12 = 'K'; label.temp.tp_12 = 'temperature';
data.tp_21 = 5.4;     units.tp_21 = 'd';    label.tp_21 = 'time since birth at puberty'; bibkey.tp_21 = 'Bran2005';
  temp.tp_21 = C2K(21);  units.temp.tp_21 = 'K'; label.temp.tp_21 = 'temperature';
data.am = 90;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wdb  = 76; units.Wdb  = 'mug';  label.Wdb  = 'dry weight at birth';   bibkey.Wdb  = 'LehmBilk1997';
  comment.Wdb = 'Bran2005: 25–98 mug';
data.Wdp  = 280; units.Wdp  = 'mug'; label.Wdp  = 'dry at puberty'; bibkey.Wdp  = 'Bran2005';
  comment.Wdp = 'core: 97–289 mug; spine: 11–45 mug';
data.Wdi  = 550;  units.Wdi  = 'mug';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'Bran2005';

data.Ri  = 5/5.4;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'LehmBilk1997';   
  temp.Ri = C2K(19);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-7 eggs per clutch; clutch interval is ab';
 
% uni-variate data

% temperature-incubation time
data.Tab = [ ... % temperature (C), ab (h)
15.5  52.3
19.4  36.3
17.2  49.7
19.1  33.6
21.1  29.5
15.3  48.2
19.1  37.1
19.1  36.9
21.1  29.2
19.1  89.5
17.2 113.7
19.1  88.5
19.1  96.0
19.1 106.4];
data.Tab(:,2) = data.Tab(:,2)/24; % convert h to d
units.Tab = {'C', 'd'}; label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'LehmBilk1997';

% time-weight
data.tW = [ ... % time since birth (d), dry weight (mug)  
0     76
1.52 112
4.44 234
7.68 530];
units.tW = {'d', 'mug'}; label.tW = {'time since birth', 'dry weight'};  
temp.tW = C2K(18); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LehmBilk1997';

%% set weights for all real data
weights = setweights(data, []);
weights.Wdb = 5 * weights.Wdb;
weights.Wdi = 5 * weights.Wdi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'a nauplius type of larva hatches from winter eggs; parthenogenetics during summer, males fevelop in autumn';
metaData.bibkey.F1 = 'Bran2005'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'P3NM'; % Cat of Life
metaData.links.id_ITIS = '684624'; % ITIS
metaData.links.id_EoL = '46498366'; % Ency of Life
metaData.links.id_Wiki = 'Bythotrephes_longimanus'; % Wikipedia
metaData.links.id_ADW = 'Bythotrephes_longimanus'; % ADW
metaData.links.id_Taxo = '33127'; % Taxonomicon
metaData.links.id_WoRMS = '412863'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bythotrephes_longimanus}}';
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
bibkey = 'Bran2005'; type = 'Article'; bib = [ ... 
'author = {Donn K. Branstrator}, ' ... 
'year = {2005}, ' ...
'title = {Contrasting life histories of the predatory cladocerans \emph{Leptodora kindtii} and \emph{Bythotrephes longimanus}}, ' ...
'journal = {Journal of Plankton Research}, ' ...
'volume = {27(6)}, ' ...
'pages = {569–585}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LehmBilk1997'; type = 'Article'; bib = [ ... 
'author = {John T. Lehman and Donna Marie Bilkovic and Chris Sullivan}, ' ... 
'year = {1997}, ' ...
'title = {Predicting development, metabolism and secondary production for the invertebrate predator \emph{Bythotrephes}}, ' ...
'journal = {Freshwater Biology}, ' ...
'volume = {38}, ' ...
'pages = {343–352}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlweScho2014'; type = 'Article'; bib = [ ... 
'author = {Frederike Alwes and Gerhard Scholtz}, ' ... 
'year = {2014}, ' ...
'title = {The early development of the onychopod cladoceran \emph{Bythotrephes longimanus} ({C}rustacea, {B}ranchiopoda)}, ' ...
'journal = {Frontiers in Zoology}, ' ...
'volume = {11}, ' ...
'pages = {10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

