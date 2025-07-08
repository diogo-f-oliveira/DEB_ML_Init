function [data, auxData, metaData, txtData, weights] = mydata_Pedetes_capensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Pedetidae';
metaData.species    = 'Pedetes_capensis'; 
metaData.species_en = 'South African springhare'; 
metaData.ecoCode.climate = {'BWh', 'BSh', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(39.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author        = {'Bas Kooijman'};    
metaData.date_subm     = [2017 12 25];              
metaData.email         = {'bas.kooijman@vu.nl'};            
metaData.address       = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2018 08 09];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.curator       = {'Starrlight Augustine'};
metaData.email_cur     = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc      = [2018 08 09]; 

%% set data
% zero-variate data

data.tg = 80;     units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(39.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 46;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 8*30.55;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Lair1993';
  temp.tp = C2K(39.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(39.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 260;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Lair1993';
data.Wwx = 1300;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';       bibkey.Wwx = 'AnAge';
data.Wwp = 2500;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'EoL';
data.Wwi = 3500;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'AnAge';

data.Ri  = 3.6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pups per litter; 3.6 litters per yr';

% univariate data
% time-weight
data.tW = [...
 1 273 
 2 268 
 3 274 
 4 263 
 5 268 
 6 265 
 7 275 
 8 293 
 9 276 
10 283 
11 296 
12 299 
13 316 
14 292 
15 301 
16 311 
17 311 
18 325 
19 331 
20 371 
21 371 
22 367 
23 381 
24 385 
25 391 
26 364 
27 426 
28 436 
29 431 
30 441];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Lair1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 50 * weights.tW;
weights.Wwx = 0 * weights.Wwx;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
%weights.psd.t_0 = 0.01;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: additional tW data; change of Wwb and tp';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '768QF'; % Cat of Life
metaData.links.id_ITIS = '573198'; % ITIS
metaData.links.id_EoL = '289798'; % Ency of Life
metaData.links.id_Wiki = 'Pedetes_capensis'; % Wikipedia
metaData.links.id_ADW = 'Pedetes_capensis'; % ADW
metaData.links.id_Taxo = '62191'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13200003'; % MSW3
metaData.links.id_AnAge = 'Pedetes_capensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pedetes_capensis}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pedetes_capensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/289798/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lair1993'; type = 'Article'; bib = [ ... 
'author = {E. W. Laird}, ' ... 
'year = {1993}, ' ...
'title = {A review of the management of the springhaas \emph{Pedetes capensis} in captivity}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {32}, ' ...
'pages = {228--238}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

