function [data, auxData, metaData, txtData, weights] = mydata_Varanus_komodoensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Varanidae';
metaData.species    = 'Varanus_komodoensis'; 
metaData.species_en = 'Komodo dragon'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCvr', 'biCvm', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O', 'Apa'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Tim Jessop'};    
metaData.date_subm = [2012 08 08];              
metaData.email    = {'tjessop@unimelb.edu.au'};            
metaData.address  = {'University of Melbourne'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 09 20];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2018 07 31];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 31];


%% set data
% zero-variate data

data.ab = 49;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(29);    units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = (4+5/12)*365; units.ap = 'd';    label.ap = 'age at puberty for females'; bibkey.ap = {'WalsChis2002', 'AnAge'};
  temp.ap = C2K(20.7);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.apm = 8*365; units.apm = 'd';    label.apm = 'age at puberty for males'; bibkey.apm = 'Kerk2010';
  temp.apm = C2K(20.7);  units.temp.apm = 'K'; label.temp.apm = 'temperature';
data.am = 62*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 40;    units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'WalsChis2002';  
data.Lp  = 200;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'WalsChis2002'; 
data.Li  = 240;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'WalsChis2002';

data.Wwb = 90;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = {'WalsChis2002','LemmEdwa2004'};
  comment.Wwb = 'AnAge: 100 g';
data.Wwp = 18e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'WalsChis2002','BircWals1995'};
data.Wwi = 87e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'AnAge';
data.Wwim = 70e3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'Kerk2010';

data.Ri  = 22/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = {'Sunt2008', 'AnAge'};   
temp.Ri = C2K(30.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), weight (g)
518.246	1466.926
549.133	1614.786
578.835	1731.518
607.938	1887.160
639.382	2284.047
669.066	2525.292
700.514	2891.051
730.211	3046.693
761.049	3521.401
792.529	3677.043
822.229	3809.339
853.104	4035.019
883.960	4392.996
914.834	4626.459
944.583	4431.907];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(19.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LemmEdwa2002';
comment.tW = 'Temperature is guessed';

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
D1 = 'Species data from pers comm. Don Boyer (curator of herpetology, Bronx Zoo)and Steve Conners curator of herpetology, Miami metro zoo) ';
D2 = 'Data obtained from Flores V. komodoensis population that are likely to have different life-history to island populations on Komodo or Rinca Island.';     
D3 = 'All data from captive specimens and corresponding parameters for wild  specimens lacking with exception for some growth information contained within LavePurw2012';
D4 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D5 = 'mod_2: tW data added'; 
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4, 'D5', D5);

%% Facts
F1 = 'Zoological institution study books provide life-history information from captive specimens';
metaData.bibkey.F1 = {'Koor2009','Blijdorp','San_Diego'}; 
F2 = 'Juvenile lives 3 till 4 yr in trees to avoid predation by adults';
metaData.bibkey.F2 = 'Kerk2010'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '7FFW5'; % Cat of Life
metaData.links.id_ITIS = '202168'; % ITIS
metaData.links.id_EoL = '790179'; % Ency of Life
metaData.links.id_Wiki = 'Varanus_komodoensis'; % Wikipedia
metaData.links.id_ADW = 'Varanus_komodoensis'; % ADW
metaData.links.id_Taxo = '170215'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Varanus&species=komodoensis'; % ReptileDB
metaData.links.id_AnAge = 'Varanus_komodoensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Varanus_komodoensis}}';
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
bibkey = 'Koor2009'; type = 'Article'; bib = [ ... 
'author = {Koore, J. van der}, ' ... 
'year = {2009}, ' ...
'title = {A third captive generation of {K}omodo dragons (\emph{Varanus komodoensis}) at {R}otterdam {Z}oo, The {N}etherlands}, ' ...
'journal = {Biawak}, ' ...
'volume = {3}, ' ...
'number = {2}, '...
'pages = {57--60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sunt2008'; type = 'Article'; bib = [ ... 
'author = {Sunter, G.}, ' ... 
'year = {2008}, ' ...
'title = {Management and reproduction of the {K}omodo dragon \emph{Varanus komodoensis} {O}uwens 1912 at {Z}{S}{L} {L}ondon {Z}oo}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {42}, ' ...
'doi = {10.1111/j.1748-1090.2007.00029.x}, '...
'pages = {172-182}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kerk2010'; type = 'Book'; bib = [ ... 
'author = {Kerkstra, A.}, ' ... 
'year = {2010}, ' ...
'title = {De wind lied ons de wereld zien}, ' ...
'publisher = {Alk \& Heijnen}, ' ...
'pages = {p 200}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WalsChis2002'; type = 'Incollection'; bib = [ ... 
'author = {Walsch, T. and Chiszar, D. and Birchard, G. F. and Tirtodiningrat, K. M. T. A.}, ' ... 
'year = {2002}, ' ...
'title = {Captive management and growth.}, ' ...
'booktitle = {Komodo dragons: biology and conservation}, ' ...
'editor = {Murphy, J. B. and Ciofi, C. and de la Panouse, C. and Walsh, T.}, ' ...
'publisher = {Smithsonian Institution Press}, '...
'address = {Washington DC}, '...
'pages = {178-195}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BircWals1995'; type = 'Article'; bib = [ ... 
'author = {Birchard, G. F. and Walsh, T. and Rosscoe, R. and Reiber, C. L.}, ' ... 
'year = {1995}, ' ...
'title = {Oxygen uptake by {K}omodo dragon (\emph{Varanus komodoensis}) eggs: the energetics of prolonged development in a reptile}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {69}, ' ...
'pages = {622--633}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LemmEdwa2004'; type = 'Article'; bib = [ ... 
'author = {Lemm, J. M. and Edwards, M. S. and Grant, T. D. and Alberts, A. C. }, ' ... 
'year = {2004}, ' ...
'title = {Comparison of growth and nutritional status of juvenile {K}omodo monitors (\emph{Varanus komodoensis}) maintained on rodent or poultry-based diets}, ' ...
'journal = {Zoo Biol.}, ' ...
'volume = {23}, ' ...
'doi = {10.1002/zoo.20000}, '...
'pages = {239-252}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LavePurw2012'; type = 'Article'; bib = [ ... 
'author = {Laver, R. J. and Purwandana, D. and Ariefiandy, A. and Imansyah, J. and Forsyth, D. and Ciofi, C. and Jessop, T.}, ' ... 
'year = {2012}, ' ...
'title = {Life-History and Spatial Determinants of Somatic Growth Dynamics in {K}omodo Dragon Populations}, ' ...
'journal = {PLoS ONE}, ' ...
'volume = {7}, ' ...
'number = {9}, ' ...
'doi = {10.1371/journal.pone.0045398}, '...
'pages = {e45398}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LemmEdwa2002'; type = 'Article'; bib = [ ... 
'author = {J. M. Lemm and M. S. Edwards and T. D. Grant and A. C. Alberts}, ' ... 
'year = {2002}, ' ...
'title = {Comparison of Growth and Nutritional Status of Juvenile Komodo Monitors (\emph{Varanus komodoensis}) Maintained on Rodent or Poultry-Based Diets}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {22}, ' ...
'pages = {239--252}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Blijdorp'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.rotterdamzoo.nl/import/assetmanager/5/7045/KOMODO 2009.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'San_Diego'; type = 'Misc'; bib = ...
'howpublished = {\url{http://library.sandiegozoo.org/studbooks/reptiles/komododragon2004.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Varanus_komodoensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

