function [data, auxData, metaData, txtData, weights] = mydata_Lagorchestes_conspicillatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Macropodidae';
metaData.species    = 'Lagorchestes_conspicillatus'; 
metaData.species_en = 'Spectacled hare wallaby'; 
metaData.ecoCode.climate = {'Aw', 'BSk'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa', '0iTi', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'pL'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Jessica Ridenour'};    
metaData.date_subm = [2013 06 11];              
metaData.email    = {'jessroberts09@gmail.com'};            
metaData.address  = {'Melbourne University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 14]; 

%% set data
% zero-variate data

data.tg = 30;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'JohnLyon1985';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from DawsDenn1969';
data.tx = 205;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'John1993';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 363;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'John1993';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8.8*365;    units.am = 'd';    label.am = 'life span';           bibkey.am = 'McCo1998';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = .567; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'McCo1998';
data.Wwx = 950;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'McCo1998';
data.Wwp = 1900; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'McCo1998';
data.Wwi = 4400; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'John1993';

data.Ri  = 365/153/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'JohnLyon1985';   
  temp.Ri = C2K(36);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
data.pL  = 0.1*data.Ri*2.08e7*data.Wwi/1000; units.pL  = 'J/d'; label.pL  = 'average yearly milk production'; bibkey.pL  = 'CorkDove1989';   
  temp.pL = C2K(36);  units.temp.pL = 'K'; label.temp.pL = 'temperature';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '90% of milk production originates from upregulation';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3RXRF'; % Cat of Life
metaData.links.id_ITIS = '552723'; % ITIS
metaData.links.id_EoL = '127000'; % Ency of Life
metaData.links.id_Wiki = 'Lagorchestes_conspicillatus'; % Wikipedia
metaData.links.id_ADW = 'Lagorchestes_conspicillatus'; % ADW
metaData.links.id_Taxo = '60310'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000236'; % MSW3
metaData.links.id_AnAge = 'Lagorchestes_conspicillatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lagorchestes_conspicillatus}}';
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
bibkey = 'CorkDove1989'; type = 'Article'; bib = [ ... 
'author = {Cork, S. J. and Dove, H.}, ' ... 
'year = {1989}, ' ...
'title = {Lactation in the tammar wallaby (\emph{Macropus eugenii}). II. {I}ntake of milk components and maternal allocation of energy}, ' ...
'journal = {Journal of Zoology, London}, ' ...
'volume = {219}, ' ...
'pages = {399--409}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McCo1998'; type = 'Phdthesis'; bib = [ ... 
'author = {McCosker, J.}, ' ... 
'year = {1998}, ' ...
'title = {Conservation and ecology of Spectacled Hare Wallabies in Central {Q}ueensland}, ' ...
'school = {Unpublished MSc thesis, University of Queensland}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JohnLyon1985'; type = 'Article'; bib = [ ... 
'author = {Johnson, P. M. and Lyon, B. J.}, ' ... 
'year = {1985}, ' ...
'title = {The spectacled hare-wallaby in {Q}ueensland.}, ' ...
'journal = {Queensland Agricultural Journal}, ' ...
'volume = {111}, ' ...
'pages = {116}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'John1993'; type = 'Article'; bib = [ ... 
'author = {Johnson, P. M.}, ' ... 
'year = {1993}, ' ...
'title = {Reproduction of the spectacled hare-wallaby, \emph{Lagorchestes conspicillatus} {G}ould ({M}arsupialia: {M}acropodidae), in captivity, with an age estimation of the pouch young}, ' ...
'journal = {Wildlife Research}, ' ...
'volume = {20}, ' ...
'pages = {97--101}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

