function [data, auxData, metaData, txtData, weights] = mydata_Macropus_agilis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Macropodidae';
metaData.species    = 'Macropus_agilis'; 
metaData.species_en = 'Agile wallaby'; 

metaData.ecoCode.climate = {'Aw', 'BSk'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa', '0iTi', '0iTs', '0iTh'};
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

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2018 09 07];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 09 07]; 

%% set data
% zero-variate data

data.tg = 29.4;   units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'Merc1976';   
  temp.tg = C2K(36.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from DawsDenn1969';
data.tx = 328;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = {'LincRenf1981','Russ1982'};   
  temp.tx = C2K(36.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = {'Merc1976','Russ1982'};
  temp.tp = C2K(36.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16.9*365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'WeigJone2005';   
  temp.am = C2K(36.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.634; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'HaysTien1993';
data.Wwx = 2287;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'LincRenf1981';
  comment.Wwx = '2500 g  LincRenf1981; 2287g Merc1976';
data.Wwp = 3510;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'LincRenf1981';
data.Wwi = 16000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'LincRenf1981';
  comment.Wwi = '10 to 15 kg, MAX 16kg; 12kg LincRenf1981';
  
data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Merc1976';   
  temp.Ri = C2K(36.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
data.pL  = .1*2.08e7/365*data.Wwi/1000; units.pL  = 'J/d'; label.pL  = 'average yearly milk production'; bibkey.pL  = 'CorkDove1989';   
  temp.pL = C2K(36.5);  units.temp.pL = 'K'; label.temp.pL = 'temperature';
  
%  univariate data
% time-weight
data.tW = [ ... % time (d), body weight (g)
      6    63
     34   600
     62   940
     99  1420
    130  2900
    159  4205
    189  7000
    219  8100
    249  9400
    276 10200
    306 11500
    335 11500];
units.tW = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW  = C2K(36.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'NakaNaka1971';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

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
D2 = 'mod_2: additional tW data from , but hand-reared food intake at Ueno Zoo turns out to be higher than typical';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '7VR5B'; % Cat of Life
metaData.links.id_ITIS = '552727'; % ITIS
metaData.links.id_EoL = '133201'; % Ency of Life
metaData.links.id_Wiki = 'Macropus_agilis'; % Wikipedia
metaData.links.id_ADW = 'Macropus_agilis'; % ADW
metaData.links.id_Taxo = '168613'; % Taxonomicon
metaData.links.id_MSW3 = '11000243'; % Mammal Spec World
metaData.links.id_AnAge = 'Macropus_agilis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macropus_agilis}}';
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
bibkey = 'HaysTien1993'; type = 'Book'; bib = [ ... 
'author = {Hayssen, V. D. and Van Tienhoven, A. and Van Tienhoven, A.}, ' ... 
'year = {1993}, ' ...
'title = {Asdells patterns of mammalian reproduction: a compendium of species-specific data}, ' ...
'publisher = {Cornell University Press}, ' ...
'address = {Ithaca, New York}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LincRenf1981'; type = 'Article'; bib = [ ... 
'author = {Lincoln, D. W. and Renfree, M. B.}, ' ... 
'year = {1981}, ' ...
'title = {Mammary gland growth and milk ejection in the agile wallaby, \emph{Macropus agilis}, displaying concurrent asynchronous lactation}, ' ...
'journal = {Journal of reproduction and fertility}, ' ...
'volume = {63}, ' ...
'pages = {193--203}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Merc1976'; type = 'Article'; bib = [ ... 
'author = {Merchant, J. C.}, ' ... 
'year = {1976}, ' ...
'title = {Breeding biology of the agile wallaby, \emph{Macropus agilis} ({G}ould) ({M}arsupialia: {M}acropodidae), in captivity}, ' ...
'journal = {Wildlife Research}, ' ...
'volume = {3}, ' ...
'pages = {93--103}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Russ1982'; type = 'Article'; bib = [ ... 
'author = {Russell, E.M.}, ' ... 
'year = {1982}, ' ...
'title = {Parental investment and desertion of young in marsupials}, ' ...
'journal = {American Naturalist}, ' ...
'volume = {119}, ' ...
'pages = {744--748}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Macropus_agilis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NakaNaka1971'; type = 'Article'; bib = [ ... 
'author = {Nakazato, R. and Nakayama, T. and Nakagawa, S.}, ' ... 
'doi = {10.1111/j.1748-1090.1971.tb01828.x}, ' ...
'year = {1971}, ' ...
'title = {Hand-rearing Agile wallabies at {U}eno {Z}oo, {T}okyo}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {11}, ' ...
'pages = {13-16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

