function [data, auxData, metaData, txtData, weights] = mydata_Speleomantes_ambrosii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Speleomantes_ambrosii'; 
metaData.species_en = 'Ambrosi''s cave salamander'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTc'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 'dLb'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 30]; 


%% set data
% zero-variate data

data.ab = 305;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'amphibiaweb';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'amphibiaweb';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.3;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'amphibiaweb';
data.Lp  = 9.45;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty '; bibkey.Lp  = 'Salv1993'; 
  comment.Lp = 'converted from SVL 5.8 cm: 22/13.5*5.8';
data.Lpm  = 8.14;     units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'Salv1993'; 
  comment.Lpm = 'converted from SVL 4.05 cm: 22/13.5*5';
data.Li  = 12.3;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'amphibiaweb';
data.Lim  = 11.6;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'amphibiaweb';

data.Wwb = 8.71e-2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 5 to 6 mm: pi/6*0.55^3';
data.Wwi = 13.3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on (Lb/Li)^3*Wwb';

data.Ri  = 10/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 to 14 eggs per clutch, 1 clutch per yr';

data.dLb  = 5.6e-3;   units.dLb  = 'cm/d';  label.dLb  = 'change in total length at birth'; bibkey.dLb  = 'Salv1993'; 
  temp.dLb = C2K(12);  units.temp.dLb = 'K'; label.temp.dLb = 'temperature'; 
  comment.dLb = '1 to 1.3 cm SVL/yr: 1.25/365*22/13.5';

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Males slightly smaller than females';
metaData.bibkey.F1 = 'EoL'; 
F2 = 'The larval stage is passed within the egg capsule';
metaData.bibkey.F2 = 'EoL'; 
F3 = 'Lives in caves, 3 to 18 C, but also outside';
metaData.bibkey.F3 = {'amphibiaweb','Wiki'}; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '4YHF8'; % Cat of Life
metaData.links.id_ITIS = '668339'; % ITIS
metaData.links.id_EoL = '47365193'; % Ency of Life
metaData.links.id_Wiki = 'Speleomantes_ambrosii'; % Wikipedia
metaData.links.id_ADW = 'Speleomantes_ambrosii'; % ADW
metaData.links.id_Taxo = '696042'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Hydromantes+ambrosii'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Speleomantes_ambrosii}}';
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
bibkey = 'Salv1993'; type = 'Article'; bib = [ ... 
'author = {Sebastiano Salvidio}, ' ... 
'year = {1993}, ' ...
'title = {Life history of the {E}uropean plethodontid salamander \emph{Speleomantes ambrosii} ({A}mphibia, {C}audata)}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {3}, ' ...
'pages = {55-59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Hydromantes+ambrosii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/330914/articles}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

