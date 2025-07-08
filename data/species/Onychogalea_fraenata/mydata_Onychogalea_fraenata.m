function [data, auxData, metaData, txtData, weights] = mydata_Onychogalea_fraenata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Macropodidae';
metaData.species    = 'Onychogalea_fraenata'; 
metaData.species_en = 'Bridled nail-tail wallaby'; 

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa', '0iTd', '0iTs', '0iTh'};
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
metaData.date_mod_1     = [2016 10 18];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 18]; 

%% set data
% zero-variate data

data.tg = 23;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'John1997';   
  temp.tg = C2K(36.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from DawsDenn1969';
data.tx = 165;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Fish1999';   
  temp.tx = C2K(36.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 185;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'John1997';
  temp.tp = C2K(36.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7.8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = {'FishOwen2000','WeigJone2005'};   
  temp.am = C2K(36.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = .3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Fish1999';
data.Wwx = 1900; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'Fish1999';
data.Wwp = 2300; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Fish1999';
data.Wwi = 3400; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Fish1999';

data.Ri  = 2.92/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Fish1999';   
  temp.Ri = C2K(36.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
data.pL  = .1*2.08e7/365*data.Wwi/1000; units.pL  = 'J/d'; label.pL  = 'average yearly milk production'; bibkey.pL  = 'CorkDove1989';   
  temp.pL = C2K(36.5);  units.temp.pL = 'K'; label.temp.pL = 'temperature';
  
%% set weights for all real data
weights = setweights(data, []);

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

%% Discussion points
D1 = '90% of milk production originates from upregulation';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '74LX7'; % Cat of Life
metaData.links.id_ITIS = '552741'; % ITIS
metaData.links.id_EoL = '999120'; % Ency of Life
metaData.links.id_Wiki = 'Onychogalea_fraenata'; % Wikipedia
metaData.links.id_ADW = 'Onychogalea_fraenata'; % ADW
metaData.links.id_Taxo = '60360'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000274'; % MSW3
metaData.links.id_AnAge = 'Onychogalea_fraenata'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Onychogalea_fraenata}}';
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
'title = {Lactation in the tammar wallaby (\emph{Mucropus eugenii}). II. {I}ntake of milk components and maternal allocation of energy}, ' ...
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
bibkey = 'Fish1999'; type = 'Article'; bib = [ ... 
'author = {Fisher, D. O.}, ' ... 
'year = {1999}, ' ...
'title = {Offspring sex-ratio variation in the bridled nailtail wallaby, \emph{Onychogalea fraenata}}, ' ...
'journal = {Behavioural Ecology and Sociobiology}, ' ...
'volume = {45}, ' ...
'pages = {411--419}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'John1997'; type = 'Article'; bib = [ ... 
'author = {Johnson, P. M.}, ' ... 
'year = {1997}, ' ...
'title = {Reproduction in the Bridled Nailtail Wallaby, \emph{Onychogalea fraenata} {G}ould ({M}arsupialia: {M}acropodidae), in captivity}, ' ...
'journal = {Wildlife Research}, ' ...
'volume = {24}, ' ...
'pages = {411--415}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FishLara1999'; type = 'Article'; bib = [ ... 
'author = {Fisher, D. O. and Lara, M. C.}, ' ... 
'year = {1999}, ' ...
'title = {Effects of body size and home range area on access to mates and paternity in male bridled nailtail wallabies}, ' ...
'journal = {Animal Behaviour}, ' ...
'volume = {58}, ' ...
'pages = {121--130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FishOwen2000'; type = 'Article'; bib = [ ... 
'author = {Fisher, D. O. and Owens, I. P. F.}, ' ... 
'year = {2000}, ' ...
'title = {Female home range size and the evolution of social organization in macropod marsupials}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {69}, ' ...
'pages = {1083--1098}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WeigJone2005'; type = 'Book'; bib = [ ... 
'author = {Weigl, R. and Jones, M. L.}, ' ... 
'year = {2005}, ' ...
'title = {Longevity of mammals in captivity: from the living collections of the world: a list of mammalian longevity in captivity}, ' ...
'series = {Kleine Senckenberg-Reihe}, ' ...
'volume = {48}, ' ...
'publisher = { E. Schweizerbartsche.}, '...
'isbn = {ISBN 978-3-510-61379-3}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Onychogalea_fraenata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

