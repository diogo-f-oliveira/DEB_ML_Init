function [data, auxData, metaData, txtData, weights] = mydata_Setonix_brachyurus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Macropodidae';
metaData.species    = 'Setonix_brachyurus'; 
metaData.species_en = 'Quokka'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'pL'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Jessica Ridenour'};    
metaData.date_subm = [2013 06 11];              
metaData.email    = {'jessroberts09@gmail.com'};            
metaData.address  = {'Melbourne University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2014 07 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 18];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 18]; 

%% set data
% zero-variate data

data.tg = 29;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Tynd1973';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from DawsDenn1969; Bart1956: 24.5 d';
data.tx = 186;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Tynd1973';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '190 d Bart1956; Russ1982';
data.tp = 220;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = {'Russ1982','AnAge'};
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '250 d Russ1982, 190 d Anage';
data.am = 13.8*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'WeigJone2005';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = .404; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = {'Bart1956','Russ1982','AnAge'};
data.Wwx = 726;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'HaysTien1993';
data.Wwp = 1332; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Tynd1973';
  comment.Wwp = '500 g AnAge';
data.Wwi = 5000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 1.4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'HindPool1990';   
  temp.Ri = C2K(37); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
data.pL  = .1*2.08e7*data.Wwi/1000*data.Ri; units.pL  = 'J/d'; label.pL  = 'average yearly milk production'; bibkey.pL  = 'CorkDove1989';   
  temp.pL = C2K(37); units.temp.pL = 'K'; label.temp.pL = 'temperature';

% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.326	0.096
27.279	0.308
38.249	1.461
56.592	5.183
65.578	9.020
75.667	15.520
85.159	23.083
104.420	44.786
124.361	82.530
143.673	142.254
162.129	232.305
223.271	872.039];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Tynd1973';
  
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
D1 = '90 percent of milk production originates from upregulation';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6YM77'; % Cat of Life
metaData.links.id_ITIS = '552754'; % ITIS
metaData.links.id_EoL = '127458'; % Ency of Life
metaData.links.id_Wiki = 'Setonix_brachyurus'; % Wikipedia
metaData.links.id_ADW = 'Setonix_brachyurus'; % ADW
metaData.links.id_Taxo = '60383'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000300'; % MSW3
metaData.links.id_AnAge = 'Setonix_brachyurus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Setonix_brachyurus}}';
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
bibkey = 'Bart1956'; type = 'Article'; bib = [ ... 
'author = {Bartholomew, G. A.}, ' ... 
'year = {1956}, ' ...
'title = {Temperature regulation in the macropod marsupial, \emph{Setonix brachyurus}}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {29}, ' ...
'pages = {26--40}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Russ1982'; type = 'Article'; bib = [ ... 
'author = {Russell, E. M.}, ' ... 
'year = {1982}, ' ...
'title = {Parental investment and desertion of young in marsupials}, ' ...
'journal = {American Naturalist}, ' ...
'volume = {119}, ' ...
'pages = {744--748}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HindPool1990'; type = 'Article'; bib = [ ... 
'author = {Hinds, L. A. and Poole, W. E. and Tindale-Biscoe, C. H. and van Oorschot, R. A. H. and Cooper, D. W.}, ' ... 
'year = {1990}, ' ...
'title = {Reproductive biology and the potential for genetic studies in the tammar wallaby, \emph{Macropus eugenii}}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {37}, ' ...
'pages = {223--234}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tynd1973'; type = 'Book'; bib = [ ... 
'author = {Tyndale-Biscoe, H.}, ' ... 
'year = {1973}, ' ...
'title = {Life of marsupials}, ' ...
'publisher = {E. Arnold}, ' ...
'address = {London}'];
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Setonix_brachyurus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

