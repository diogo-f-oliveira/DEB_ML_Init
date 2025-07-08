function [data, auxData, metaData, txtData, weights] = mydata_Clypeaster_subdepressus

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Echinoidea'; 
metaData.order      = 'Clypeasteroida'; 
metaData.family     = 'Clypeasteridae';
metaData.species    = 'Clypeaster_subdepressus'; 
metaData.species_en = 'Sea Biscuit'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 05]; 

%% set data
% zero-variate data

data.ab = 3;    units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'VellMigo2010';
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 20;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'VellMigo2010';
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 40*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.067;units.Lj  = 'cm';  label.Lj  = 'test length at metam';   bibkey.Lj  = 'Sera1970';
data.Lp  = 10;    units.Lp  = 'cm';  label.Lp  = 'test length at puberty';  bibkey.Lp  = 'Sera1970';
data.Li  = 30;    units.Li  = 'cm';  label.Li  = 'ultimate test length';    bibkey.Li  = 'ADW';

data.Wwb = 5.1e-6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'VellMigo2010';
  comment.Wwb = 'based on egg diameter of 214 mum: pi/6*0.0214^3';
data.Wwp = 18.5;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'guess';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 500;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on photo assuming biscuit-shape with radius 15 cm and mean heigth 2.2 cm, divided by 3 to account for tapering margins';

data.Ri = 4.8e6/365;     units.Ri = '#/d';   label.Ri = 'max reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'guess based on kap = 0.8';
   
%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 0 * weights.Ri;
weights.ab = 3 * weights.tp;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Length at metam ignored';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Respiratory podia are long low sheets that lie in the ambulacral groove (petalloid) extending from one pore to the other';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5ZCNK'; % Cat of Life
metaData.links.id_ITIS = '157989'; % ITIS
metaData.links.id_EoL = '598170'; % Ency of Life
metaData.links.id_Wiki = 'Clypeaster_subdepressus'; % Wikipedia
metaData.links.id_ADW = 'Clypeaster_subdepressus'; % ADW
metaData.links.id_Taxo = '323725'; % Taxonomicon
metaData.links.id_WoRMS = '422499'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Clypeaster}}';
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
bibkey = 'VellMigo2010'; type = 'Article'; bib = [ ... 
'author = {B. C. Vellutini and A. E. Migotto}, ' ... 
'year = {2010}, ' ...
'title = {Embryonic, Larval, and Juvenile Development of the Sea Biscuit \emph{Clypeaster subdepressus} ({E}chinodermata: {C}lypeasteroida)}, ' ...
'journal = {PLoS ONE}, ' ...
'volume = {5}, ' ...
'number = {3}, ' ...
'pages = {e9654}, ' ...
'doi = {10.1371/journal.pone.0009654}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sera1970'; type = 'Techreport'; bib = [ ... 
'author = {D. K. Serafy}, ' ... 
'year = {21970}, ' ...
'title = {A NEW SPECIES OF \emph{Clypeaster} FROM THE {G}ULF AND {C}ARIBBEAN AND A KEY TO THE SPECIES IN THE TROPICAL {N}ORTHWESTERN {A}TLANTIC ({E}CHINODERMATA: {E}CHINOIDEA)}, ' ...
'series = {BIOLOGICAL RESULTS OF THE UNIVERSITY OF {M}IAMI DEEP-SEA EXPEDITIONS}, ' ...
'institution = {University of Miami, Rosenstiel School of Marine and Atmospheric Sciences, and  Florida Department of Natural Resources, Marine Research Laboratory.}, ' ...
'howpublished = {\url{www.vliz.be/imisdocs/publications/150657.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Clypeaster_subdepressus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

