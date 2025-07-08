function [data, auxData, metaData, txtData, weights] = mydata_Holothuria_scabra

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Holothuroidea'; 
metaData.order      = 'Aspidochirotida'; 
metaData.family     = 'Holothuriidae';
metaData.species    = 'Holothuria_scabra'; 
metaData.species_en = 'Sandfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MP'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 15]; 

%% set data
% zero-variate data

data.ab = 1;    units.ab = 'd';    label.ab = 'age at birth';    bibkey.ab = 'Wiki';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'all temps are guessed';
data.tj = 15;    units.tj = 'd';    label.tj = 'time since birth at metam';    bibkey.tj = 'Wiki';
  temp.tj = C2K(25);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'temp guessed';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'iucn';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'between 1 and 3 yr, temp guessed';
data.am = 40*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'iucn';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1;     units.Lj  = 'cm';  label.Lj  = 'length at metam';          bibkey.Lj  = 'HameCona2001';
data.Lp  = 17.9;    units.Lp  = 'cm';  label.Lp  = 'length at puberty';  bibkey.Lp  = 'HameCona2001';
  comment.Lp = 'based on (Wwp/Wwi)^(1/3)*Li';
data.Li  = 40;    units.Li  = 'cm';  label.Li  = 'ultimate length';   bibkey.Li  = 'HameCona2001';

data.Wwb = 4.2e-6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'HameCona2001';
  comment.Wwb = 'computed from egg diameter of 200 mum: pi/6*0.02^3';
data.Wwp = 180;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'iucn';
  comment.Wwp = 'computed as (Lp/11.2)^3 * 595.7';
data.Wwi = 2000;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'HameCona2001';
  comment.Wwi = 'computed as (Li/11.2)^3 * 595.7';

data.Ri = 17e6/365;    units.Ri = 'd';    label.Ri = 'max reprod rate';        bibkey.Ri = 'HameCona2001';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
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
F1 = 'Planktontic 9 d auricularian larva, 5 d doliolarian larva, then settle as pentactular larva';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6LZDS'; % Cat of Life
metaData.links.id_ITIS = '201876'; % ITIS
metaData.links.id_EoL = '587665'; % Ency of Life
metaData.links.id_Wiki = 'Holothuria_scabra'; % Wikipedia
metaData.links.id_ADW = 'Holothuria_scabra'; % ADW
metaData.links.id_Taxo = '413828'; % Taxonomicon
metaData.links.id_WoRMS = '210813'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Holothuria_scabra}}';
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
bibkey = 'HameCona2001'; type = 'Article'; bib = [ ... 
'author = {J.-F. Hamel and C. Conand and D. L. Pawson and A. Mercier}, ' ... 
'year = {2001}, ' ...
'title = {The Sea Cucumber \emph{Holothuria scabra} ({H}olothuroidea: {E}chinodermata): {I}ts Biology and Exploitation as Bache-de-Mer}, ' ...
'journal = {Advances in Marine Biology}, ' ...
'volume = {41}, ' ...
'pages = {1-212}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/180257/0}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

