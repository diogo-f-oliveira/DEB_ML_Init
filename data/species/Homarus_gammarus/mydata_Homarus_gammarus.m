function [data, auxData, metaData, txtData, weights] = mydata_Homarus_gammarus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Nephropidae';
metaData.species    = 'Homarus_gammarus'; 
metaData.species_en = 'European lobster'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE', 'MAm'};
metaData.ecoCode.habitat = {'0bMb', 'bjMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiCi', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'ab', 'aj_T', 'ap', 'am', 'Lj', 'Lp', 'Li', 'L_t', 'Wdb', 'Wwp', 'Wwi', 'Ww_t', 'Ri', 'E0'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 08 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 24]; 

%% set data
% zero-variate data

data.ab = 365;  units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'ProdJors2010';   
  temp.ab = C2K(6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'After extrusion, the eggs are held on the pleopods for approximately another year until hatching the following summer';
data.tj_15 = 35;  units.tj_15 = 'd'; label.tj_15 = 'time since birth at metam at 15 C'; bibkey.tj_15 = 'ProdJors2010';   
  temp.tj_15 = C2K(15); units.temp.tj_15 = 'K'; label.temp.tj_15 = 'temperature';
data.tj_20 = 12;  units.tj_20 = 'd'; label.tj_20 = 'time since birth at metam at 20 C'; bibkey.tj_20 = 'ProdJors2010';   
  temp.tj_20 = C2K(20); units.temp.tj_20 = 'K'; label.temp.tj_20 = 'temperature';
data.tp = 6*365;  units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'ProdJors2010';
  temp.tp = C2K(8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '5-8 yr';
data.am = 60*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'Hans2005';   
  temp.am = C2K(8);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'at least 60 years, van der Meeren and Agnalt 2000 in Hans2005';
  
data.Lj  = 0.6;   units.Lj  = 'cm';  label.Lj  = 'carapace length at settle'; bibkey.Lj  = 'ProdJors2010';
data.Lp  = 8.27;  units.Lp  = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'Wiki';
data.Li  = 21.4;  units.Li  = 'cm';  label.Li  = 'ultimate carapace length'; bibkey.Li  = 'Wiki';
  comment.Li = 'Converted from TL = 60 cm by 60 * 7.5/ 20, see ProdJors2010';
data.L2 = 7.5;    units.L2  = 'cm';  label.L2  = 'carapace length at 2yr'; bibkey.L2  = 'ProdJors2010';
  temp.L2 = C2K(20); units.temp.L2 = 'K'; label.temp.L2 = 'temperature'; 

data.Wdb = 1.7e-3; units.Wdb = 'g';   label.Wdb = 'dry weight at birth';       bibkey.Wdb = 'Pand1970';
  comment.Wdb = 'Based on 6172 cal/g and 10.49 cal per egg';
data.Wwj = 0.154;  units.Wwj = 'g';   label.Wwj = 'wet weight at metam';       bibkey.Wwj = 'ProdJors2010';
  comment.Wwj = 'Computed as (Lj/ L2)^3 * Ww2';
data.Wwp = 331;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'ProdJors2010';
  comment.Wwp = 'Computed as (Lp/ L2)^3 * Ww2';
data.Wwi = 6e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'Wiki';
data.Ww2 = 300;    units.Ww2  = 'g';  label.Ww2  = 'wet weight at 2yr'; bibkey.Ww2  = 'ProdJors2010';
  temp.Ww2 = C2K(20); units.temp.Ww2 = 'K'; label.temp.Ww2 = 'temperature'; 

data.E0 = 43.9; units.E0 = 'J';   label.E0 = 'egg energy content';       bibkey.E0 = 'Pand1970';
  comment.E0 = '10.49 cal';

data.Ri  = 30;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.90';


%% set weights for all real data
weights = setweights(data, []);
%weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'During the pelagic stage, larvae undergo four developmental stages until metamorphosis to stage IV (meta-larvae) when they settle to the seabed';
metaData.bibkey.F1 = 'ProdJors2010'; 
F2 = 'Males reach puberty earlier than females';
metaData.bibkey.F2 = 'ProdJors2010'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '7VDPS'; % Cat of Life
metaData.links.id_ITIS = '97315'; % ITIS
metaData.links.id_EoL = '46505673'; % Ency of Life
metaData.links.id_Wiki = 'Homarus_gammarus'; % Wikipedia
metaData.links.id_ADW = 'Homarus_gammarus'; % ADW
metaData.links.id_Taxo = '33906'; % Taxonomicon
metaData.links.id_WoRMS = '107253'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Homarus_gammarus}}';
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
bibkey = 'Hepp1967'; type = 'Article'; bib = [ ... 
'author = {Hepper, B. T.}, ' ... 
'year = {1967}, ' ...
'title = {On the growth at moulting of lobsters (\emph{Homarus vulgaris}) in {C}ornwall and {Y}orkshire}, ' ...
'journal = {J. mar. biol. Ass. U.K.}, ' ...
'volume = {47}, ' ...
'pages = {629--643}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hans2005'; type = 'Techreport'; bib = [ ... 
'author = {B.-I. Hansen}, ' ... 
'year = {2005}, ' ...
'title = {Hummeren i Tysfjord. Unders{\o}kelse av Tysfjordens egnethet med tanke p/a havbeite og oppdrett av verdens nordligste hummer}, ' ...
'institution = {Nordlands Forskning}, ' ...
'address = {Bod/o}, '...
'ISSN = {0805-4460}, ' ...
'ISBN = {82-7321-528-8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ProdJors2010'; type = 'Techreport'; bib = [ ... 
'author = {Prod\"{o}hl, P. A. and J{\o}rstad, K. E.  and Triantafyllidis, A. and Katsares, V.  and Triantaphyllidis, C.}, ' ... 
'year = {2010}, ' ...
'title = {Genetic Impact of Aquaculture Activities on Native Populations}, ' ...
'institution = {Norwegian Institute of Marine Research}, ' ...
'address = {Bergen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pand1970'; type = 'Article'; bib = [ ... 
'author = {T. J. Pandian}, ' ... 
'year = {1970}, ' ...
'title = {Ecophysiological studies on the developing eggs and embryos of the European lobster \emph{Homarus gammarus}}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {5}, ' ...
'pages = {154--167}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

