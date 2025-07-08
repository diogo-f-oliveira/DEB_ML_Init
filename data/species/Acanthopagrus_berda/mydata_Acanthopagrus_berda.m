function [data, auxData, metaData, txtData, weights] = mydata_Acanthopagrus_berda

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Acanthopagrus_berda'; 
metaData.species_en = 'Goldsilk seabream'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.72); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author   = {'Rym Jaroudi'};                            
metaData.date_subm = [2015 03 26];                           
metaData.email    = {'rym.jaroudi@gmail.com'};                   
metaData.address  = {'Pasteur Institute of Tunis, 1002, Tunisia'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 10 22];              
metaData.email_mod_1 = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2017 09 12];              
metaData.email_mod_2 = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 11 02]; 

%% set data
% zero-variate data

data.ab = 39/24;  units.ab = 'd';   label.ab = 'age at birth';             bibkey.ab = 'Garr1993';   
  temp.ab = C2K(25.72);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 419.75; units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'SheaMolo1999';
  temp.tp = C2K(25.72);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'MathSamu1991';   
  temp.am = C2K(25.72);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.18; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Garr1993';
data.Lp  = 20;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 90;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SmitSmit1986';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Conn1996';
  comment.Wwb = 'based on egg diameter of 750 mum: pi/6*0.075^3';
data.Wwi = 3200; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'Papa2013';   
  temp.GSI = C2K(17.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Sparus aurata';

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

%% Facts
F1 = 'Protandrous hermaphrodite; Sex change (from male to female) at 19.1 cm total length, 1.95 yr';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8YV2'; % Cat of Life
metaData.links.id_ITIS = '647906'; % ITIS
metaData.links.id_EoL = '46580061'; % Ency of Life
metaData.links.id_Wiki = 'Acanthopagrus_berda'; % Wikipedia
metaData.links.id_ADW = 'Acanthopagrus_berda'; % ADW
metaData.links.id_Taxo = '159910'; % Taxonomicon
metaData.links.id_WoRMS = '218588'; % WoRMS
metaData.links.id_fishbase = 'Acanthopagrus-berda'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthopagrus_berda}}';
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
bibkey = 'Garr1993'; type = 'Article'; bib = [ ... 
'author = {Garratt, P. A.}, ' ... 
'year = {1993}, ' ...
'title = {Spawning of riverbream, \emph{Acanthopagrus berda}, in {K}osi {E}stuary}, ' ...
'journal = {South  African Journal of Zoology}, ' ...
'volume = {28}, ' ...
'number = {1}, '...
'pages = {26-31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/5526}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SmitSmit1986'; type = 'Incollection'; bib = [ ... 
'author = {Smith, J. L. B. and  M. M. Smith}, ' ... 
'year = {1986}, ' ...
'title = {Sparidae}, ' ...
'booktitle = {Smiths sea fishes}, ' ...
'editor = {M. M. Smith and P. C. Heemstra}, ' ...
'publisher = {Springer-Verlag}, ' ...
'pages = {580-594}, '...
'address = {Berlin}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MathSamu1991'; type = 'Article'; bib = [ ... 
'author = {Mathews, C. P. and M. Samuel}, ' ... 
'year = {1991}, ' ...
'title = {Growth, mortality and length-weight parameters for some {K}uwaiti fish and shrimp}, ' ...
'journal = {Fishbyte}, ' ...
'volume = {9}, ' ...
'number = {2}, '...
'pages = {30-33}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SheaMolo1999'; type = 'Article'; bib = [ ... 
'author = {Sheaves, M. J. and Molony, B. W. and Tobin, A. J.}, ' ... 
'year = {1999}, ' ...
'title = {Spawning migrations and local movements of a tropical sparid fish}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {133}, ' ...
'number = {1}, '...
'pages = {123-128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HespPott2004'; type = 'Article'; bib = [ ... 
'author = {S. A. Hesp and I. C. Potter and N. G. Hall}, ' ... 
'year = {2004}, ' ...
'title = {Reproductive Biology and Protandrous Hermaphroditism in \emph{Acanthopagrus latus}}, ' ...
'journal = {Environm. Biol. Fishes}, ' ...
'volume = {70}, ' ...
'number = {3}, '...
'pages = {257-272}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Conn1996'; type = 'Article'; bib = [ ... 
'author = {A.D. Connell}, ' ... 
'year = {1996}, ' ...
'title = {Sea fishes spawning pelagic eggs in the {S}t {L}ucia {E}stuary}, ' ...
'journal = {South African Journal of Zoology}, ' ...
'volume = {31}, ' ...
'number = {1}, '...
'pages = {37-41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Papa2013'; type = 'Misc'; bib = [ ...
'author = {Papandroulakis}, ' ...
'year = {2013}, ' ...
'note = { pers comm.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
