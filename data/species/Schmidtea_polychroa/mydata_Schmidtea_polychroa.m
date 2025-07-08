function [data, auxData, metaData, txtData, weights] = mydata_Schmidtea_polychroa

%% set metaData
metaData.phylum     = 'Platyhelminthes'; 
metaData.class      = 'Turbellaria'; 
metaData.order      = 'Tricladida'; 
metaData.family     = 'Dugesiidae';
metaData.species    = 'Schmidtea_polychroa'; 
metaData.species_en = 'Freshwater flatworm';

metaData.ecoCode.climate = {'C'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCiw', 'biCim'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'Ob'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap_T'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 12 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 11 07];              
metaData.email_mod_1= {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 12 22]; 


%% set data
% zero-variate data

data.ab = 17;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'CardHart2005';   
  temp.ab = C2K(20);     units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp_15 = 217;  units.tp_15 = 'd'; label.tp_15 = 'time since birth at puberty'; bibkey.tp_15 = 'BallReyn1981';
  temp.tp_15 = C2K(15);  units.temp.tp_15 = 'K'; label.temp.tp_15 = 'temperature';
data.tp_23 = 68;   units.tp_23 = 'd'; label.tp_23 = 'time since birth at puberty'; bibkey.tp_23 = 'BallReyn1981';
  temp.tp_23 = C2K(23);  units.temp.tp_23 = 'K'; label.temp.tp_23 = 'temperature';
data.am = 2.5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'BallReyn1981';   
  temp.am = C2K(20);     units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '2-3 yr; D. benazzi lived for 21 yr in the lab';

data.Lb  = 0.14;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'CardHart2005';
  comment.Lb = '  % width : 0.07 mm, CardHart2005';
data.Lp  = 1.1;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'BallReyn1981';
data.Li  = 2.2;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'BallReyn1981';

data.Wwb = 1e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on volume 0.14 * 0.07 * 0.01 cm';
data.Wwp = 0.0475;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'based on (1.1/ 0.14)^3 * Wwb';
data.Wwi = 0.38;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on (2.2/ 0.14)^3 * Wwb';

data.Ri  = 3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'BallReyn1981';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
  
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
D1 = 'Hermaphroditic, so kap_R is halved';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Formerly known as Dugesia p.';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'ectolecithal eggs in cocoon: in these eggs, one or several small yolk-poor oocytes are surrounded by large numbers of yolk cells which are produced by a specialized gland, the vitellarium.';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'Triclads show a unique mode of cleavage called blastomere anarchy. Instead of remaining together and forming an ordered morula of micromeres and macromeres as in other spiralian embryos, blastomeres of triclad embryos lose contact and migrate actively to various positions within the syncytial yolk';
metaData.bibkey.F3 = 'Wiki'; 
F4 = 'Temp range: 10-23 for cocoon prod, 05-23 for egg development, 10-23 for maturtion & life cycle';
metaData.bibkey.F4 = 'Wiki'; 
F5 = 'feeding on wounded living prey';
metaData.bibkey.F5 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5);

%% Links
metaData.links.id_CoL = '7WTBL'; % Cat of Life
metaData.links.id_ITIS = '1042937'; % ITIS
metaData.links.id_EoL = '46979422'; % Ency of Life
metaData.links.id_Wiki = 'Schmidtea_polychroa'; % Wikipedia
metaData.links.id_ADW = 'Dugesia_polychroa'; % ADW
metaData.links.id_Taxo = '3411743'; % Taxonomicon
metaData.links.id_WoRMS = '482205'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Schmidtea_polychroa}}';
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
bibkey = 'CardHart2005'; type = 'Article'; bib = [ ... 
'author = {Cardona, A. and Hartenstein, V. and Romero, R.}, ' ... 
'year = {2005}, ' ...
'title = {The embryonic development of the triclad \emph{Schmidtea polychroa}}, ' ...
'journal = {Dev. Genes Evol.}, ' ...
'howpublished = {\url{http://www.ini.uzh.ch/~acardona/papers/Cardona_2005_embryonic_development_S_polychroa.pdf}}, ' ...
'volume = {215}, ' ...
'doi = {10.1007/s00427-004-0455-8}, '...
'pages = {109-131}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BallReyn1981'; type = 'book'; bib = [ ... 
'author = {Ball, I. R. and T. B. Reynoldson, T. B.}, ' ... 
'year = {1981}, ' ...
'title = {British planarians}, ' ...
'sereis = {Synopses of the British Fauna}, ' ...
'volume = {19}, ' ...
'publisher = {Cambridge University Press}, '...
'address = {Cambridge}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

