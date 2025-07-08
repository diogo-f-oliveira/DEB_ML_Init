function [data, auxData, metaData, txtData, weights] = mydata_Faustina_faustina
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Helicidae';
metaData.species    = 'Faustina_faustina'; 
metaData.species_en = 'Snail'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Thw'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biO'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 20]; 

%% set data
% zero-variate data

data.ab  = 20;   units.ab  = 'd'; label.ab  = 'age at birth';     bibkey.ab  = 'Wiki';   
  temp.ab = C2K(21.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for Cepaea nemoralis';
data.am  = 8*365;   units.am  = 'd'; label.am  = 'life span';     bibkey.am  = 'Wiki';   
  temp.am = C2K(21.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'value for Cepaea nemoralis';

data.Lb  = 0.3; units.Lb  = 'cm';  label.Lb  = 'shell breath at birth';   bibkey.Lb  = 'Wiki';
  comment.Lb = 'value for Cepaea nemoralis';
data.Lp  = 1.8; units.Lp  = 'cm';  label.Lp  = 'shell breath at puberty';   bibkey.Lp  = 'guess';
data.Li  = 2.0; units.Li  = 'cm';  label.Li  = 'ultimate shell breath';   bibkey.Li  = 'animalbase';

data.Wdi  = 0.15; units.Wdi  = 'g';  label.Wdi  = 'wet weight at 2.2 cm';   bibkey.Wdi  = 'Will1976';
  comment.Wdi = 'size-corrected value for Cepaea nemoralis: 0.2*(2/2.2)^3';

data.Ri  = 80/365;   units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(21.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for Cepaea nemoralis';
  
% uni-variate data
% time-length
data.tL = [ ... % age (d), number of whorls (#)
0.966	0.280 % 1.485
153.532	0.589 % 2.612
336.997	0.560 % 2.603
518.532	1.168 % 3.929
699.100	1.168 % 3.920
884.497	1.90]; % 5.255
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(21.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Marz2013';
comment.tL = 'Converted from number of whorls, using figure for shell breadth versus whorls';

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

%% discussion
D1 = 'Temperature trajectory in C for tL data is assumed to be  5 + 18 * cos(2*pi*(t-80)/365), with t in d since May 1';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Marz2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3DW84'; % Cat of Life
metaData.links.id_ITIS = '941271'; % ITIS
metaData.links.id_EoL = '4904742'; % Ency of Life
metaData.links.id_Wiki = 'Faustina_faustina'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1688748'; % Taxonomicon
metaData.links.id_WoRMS = '1002192'; % WoRMS
metaData.links.id_molluscabase = '1002192'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Faustina_faustina}}';
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
bibkey = 'Marz2013'; type = 'Article'; bib = [ ... 
'author = {Magdalena Marzec}, ' ... 
'title = {GROWTH RATE OF \emph{Chilostoma faustinum} ({R}ossm\"{a}ssler, 1835) ({G}ASTROPODA: {P}ULMONATA: {H}ELICIDAE) UNDER NATURAL CONDITIONS}, ' ...
'journal = {Folia Malacologica}, ' ...
'volume = {21}, ' ...
'year = {2013}, ' ...
'pages = {275-283}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'animalbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.animalbase.uni-goettingen.de/zooweb/servlet/AnimalBase/home/species?id=1658}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Will1976'; type = 'Article'; bib = [ ... 
'author = {Phillip Williampson}, ' ... 
'title = {Size-weight relationships and field growth rates of the landsnail \emph{Cepaea nemoralis} {L}.}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'number = {3}, ' ...
'volume = {45}, ' ...
'year = {1976}, ' ...
'pages = {875-885}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

