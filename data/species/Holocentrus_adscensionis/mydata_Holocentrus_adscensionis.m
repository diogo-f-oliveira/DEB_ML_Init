function [data, auxData, metaData, txtData, weights] = mydata_Holocentrus_adscensionis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Holocentriformes'; 
metaData.family     = 'Holocentridae';
metaData.species    = 'Holocentrus_adscensionis'; 
metaData.species_en = 'Squirrelfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 'rB'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 05 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 30]; 


%% set data
% zero-variate data

data.ab = 1.5;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 220;  units.L0  = 'mum'; label.Lb  = 'diam ripe oocyte';         bibkey.Lb  = 'ShinoHazi2007';  
data.Lb  = 0.2;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'guess'; 
data.Lp  = 14.6;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = {'ShinoHazi2007'}; 
data.Li  = 61;    units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwi = 2408;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ShinoHazi2007';
  comment.Wwi = 'computed from 0.0948 * Li^2.4673';

data.Ri  = 249863/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ShinoHazi2007';   
temp.Ri = C2K(24);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

data.rB = 0.94/365; units.rB  = '1/d';   label.rB  = 'von Bert growth rate';    bibkey.rB  = 'fishbase';   
temp.rB = C2K(27);  units.temp.rB = 'K'; label.temp.rB = 'temperature';

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
D1 = 'Author_mod_1: I found information on the number of eggs per female as a function of length in Anon2013 that was much higher than in Anon2015 but chose to not include it as the temperature was not provided';
D2 = 'Author_mod_1: I was surprised to observe that the weights coefficient for ab changed so much the parameter values';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = ['EW = 0.9011 * TW + 1.8591, eviscerated and total weight in g (females); ' ...
      'EW = 0.0948 * FL ^2.4673, eviscerated weight (g), fork length for females (cm)'];
metaData.bibkey.F1 = 'ShinoHazi2007'; 
F2 = ['Occurs in shallow coral reefs, as well as deeper offshore waters. ' ...
      'A nocturnal species, hiding in deep crevices or under coral edges during the day; '...
      'at night it usually moves over sand and grass beds, taking mainly crabs and other small crustaceans (Ref. 3634). '...
      'Capable of producing sounds.']; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3M8HL'; % Cat of Life
metaData.links.id_ITIS = '166172'; % ITIS
metaData.links.id_EoL = '46567291'; % Ency of Life
metaData.links.id_Wiki = 'Holocentrus_adscensionis'; % Wikipedia
metaData.links.id_ADW = 'Holocentrus_adscensionis'; % ADW
metaData.links.id_Taxo = '176795'; % Taxonomicon
metaData.links.id_WoRMS = '159378'; % WoRMS
metaData.links.id_fishbase = 'Holocentrus-adscensionis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Holocentrus_adscensionis}}';
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
bibkey = 'ShinoHazi2007'; type = 'Article'; bib = [ ... 
'author = {R. Shinozaki-Mends and F. H. V. Hazin and P. Guilherme de Oliviera and F. Correia de Carvalho}, ' ... 
'year = {2007}, ' ...
'title = {Reproductive biology of the squirrelfish, \emph{Holocentrus adscensionis} ({O}sbeck, 1765), caught off the coast of {P}ernambuco, {B}razil}, ' ...
'journal = {Scientia Marina, Barcelona (Spain)}, ' ...
'volume = {71}, ' ...
'number = {4}, '...
'pages = {715--722}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1061}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

