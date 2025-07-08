function [data, auxData, metaData, txtData, weights] = mydata_Leptoscarus_vaigiensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Scaridae';
metaData.species    = 'Leptoscarus_vaigiensis'; 
metaData.species_en = 'Marbled parrotfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 11];

%% set data
% zero-variate data

data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 9; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on same relative length, compared to Scarus coeruleus at given in fishbase: 31/120*35.2 cm';
data.Li  = 35.2;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.75 mm of Chaetodon: 4/3*pi*0.038^3'; 
data.Wwp = 6.6; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00891*Lp^3.01, see F1';
data.Wwi = 403; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.01, see F1';

data.Ri  = 1.8e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'Mwat1997';   
  temp.Ri = C2K(28.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length data 
data.tL = [ ... % time since birth (d), total length (cm)
124.077	16.256
528.731	21.405
616.276	21.804
827.385	23.615];
data.tL(:,1) = data.tL(:,1) + 300; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LochWaki2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: W in g = 0.00891*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6PGZ6'; % Cat of Life
metaData.links.id_ITIS = '170888'; % ITIS
metaData.links.id_EoL = '46572734'; % Ency of Life
metaData.links.id_Wiki = 'Leptoscarus_vaigiensis'; % Wikipedia
metaData.links.id_ADW = 'Leptoscarus_vaigiensis'; % ADW
metaData.links.id_Taxo = '178643'; % Taxonomicon
metaData.links.id_WoRMS = '219091'; % WoRMS
metaData.links.id_fishbase = 'Leptoscarus-vaigiensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leptoscarus_vaigiensis}}';
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
bibkey = 'LochWaki2017'; type = 'Article'; bib = [ ... 
'author = {A.G. Locham and J.G. Wakibia and B. Kaunda-Arara and S. Muya}, ' ... 
'year = {2017}, ' ...
'title = {Spatial variation in growth and mortality parameters of the marbled parrotfish, \emph{Leptoscarus vaigiensis} ({Q}uoy and {G}aimard}, 1824) on different reefs along the {K}enyan coast}, ' ...
'journal = {JAGST}, ' ...
'volume = {18(1)}, ' ...
'pages = {38-54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mwat1997'; type = 'phdthesis'; bib = [ ... 
'author = {Mwatha, Gerald K}, ' ... 
'year = {1997}, ' ...
'title = {Aspects of the reproductive biology and fishery of the blue marbled parrot fish \emph{Leptoscarus vaigiensis} (Quoy and Gaimardi, 1824) in Kenya shallow inshore waters}, ' ...
'school = {University of Nairobi}, ' ...
'howpublished = {\url{http://erepository.uonbi.ac.ke:8080/xmlui/handle/123456789/24940}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Leptoscarus-vaigiensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

