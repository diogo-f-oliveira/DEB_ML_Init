function [data, auxData, metaData, txtData, weights] = mydata_Macropus_antilopinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Macropodidae';
metaData.species    = 'Macropus_antilopinus'; 
metaData.species_en = 'Antilopine wallaby'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.5); % K, body temp
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

data.tg = 34;     units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'Cala1995';   
  temp.tg = C2K(36.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from DawsDenn1969';
data.tx = 426;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'PoolMerc1987';   
  temp.tx = C2K(36.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 639;    units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'RussRich1971';
  temp.tp = C2K(36.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Hirs2006: 475 d';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'RussRich1971';   
  temp.am = C2K(36.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.703; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'RussRich1971';
data.Wwx = 7500;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'Hirs2006';
data.Wwp = 12500; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Hirs2006';
data.Wwi = 17500; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Cala1995';

data.Ri  = 365/270/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Cala1995';   
  temp.Ri = C2K(36.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
data.pL  = .1*2.08e7/365*data.Wwi/1000; units.pL  = 'J/d'; label.pL  = 'average yearly milk production'; bibkey.pL  = 'CorkDove1989';   
  temp.pL = C2K(36.5);  units.temp.pL = 'K'; label.temp.pL = 'temperature';

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
D1 = '90 percent of milk production originates from upregulation';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7VR5L'; % Cat of Life
metaData.links.id_ITIS = '552728'; % ITIS
metaData.links.id_EoL = '133167'; % Ency of Life
metaData.links.id_Wiki = 'Macropus_antilopinus'; % Wikipedia
metaData.links.id_ADW = 'Macropus_antilopinus'; % ADW
metaData.links.id_Taxo = '168614'; % Taxonomicon
metaData.links.id_MSW3 = '11000248'; % Mammal Spec World
metaData.links.id_AnAge = 'Macropus_antilopinus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macropus_antilopinus}}';
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
bibkey = 'DawsDenn1969'; type = 'Article'; bib = [ ... 
'author = {Dawson, T. J. and Denny, M. J. S. and Hulbert, A. J.}, ' ... 
'year = {1969}, ' ...
'title = {Thermal balance of the macropod marsupial \emph{Macropus eugenii} {D}esmarest}, ' ...
'journal = {Comparative Biochemistry and Physiology}, ' ...
'volume = {31}, ' ...
'pages = {645--653}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PoolMerc1987'; type = 'Article'; bib = [ ... 
'author = {Poole, W. E. and Merchant, J. C.}, ' ... 
'year = {1987}, ' ...
'title = {Reproduction in captive Wallaroos: the Eastern Wallaroo, \emph{Macropus robustus robustus}, the Euro, \emph{Macropus robustus erubescens} and the Antilopine Wallaroo, \emph{M. antilopinus}}, ' ...
'journal = {Wildlife Research}, ' ...
'volume = {14}, ' ...
'pages = {225--242}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RussRich1971'; type = 'Article'; bib = [ ... 
'author = {Russell, E. M. and Richardson, B. J.}, ' ... 
'year = {1971}, ' ...
'title = {Some observations on the breeding, age structure, dispersion and habitat of populations of \emph{Macropus robustus} and \emph{Macropus antilopinus} ({M}arsupialia)}, ' ...
'journal = {Journal of Zoology London}, ' ...
'volume = {165}, ' ...
'pages = {131--142}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cala1995'; type = 'Incollection'; bib = [ ... 
'author = {Calaby, J. H.}, ' ... 
'year = {1995}, ' ...
'title = {Antilopine Wallaroo}, ' ...
'booktitle = {The Australian Museum complete book of Australian Mammals}, ' ...
'editor = {R. Strahan}, ' ...
'publisher = {Reed Books}, '...
'address = {Sydney, Australia}, ' ...
'pages = {324--325}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hirs2006'; type = 'Proceedings'; bib = [ ... 
'author = {Hirst, S.}, ' ... 
'year = {2006}, ' ...
'title = {The Antilopine Wallaroo: an unusual ''roo}, ' ...
'booktitle = {National Wildlife Rehabilitation Conference}, ' ...
'address = {Darwin}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Macropus_antilopinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

