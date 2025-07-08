function [data, auxData, metaData, txtData, weights] = mydata_Salvator_merianae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Teiidae';
metaData.species    = 'Salvator_merianae'; 
metaData.species_en = 'Argentine giant tegu'; 

metaData.ecoCode.climate = {'BSk', 'BWk', 'BWh'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTi', '0iTa', '0iTf'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(32); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L0-L1';'Ww0-Wwt'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 12 27];

%% set data
% zero-variate data

data.ab = 64;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Wiki';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 8*30.5;     units.tp = 'd';    label.tp = 'time since birth at pubert';  bibkey.tp = 'Wiki';
  temp.tp = C2K(30); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'eddmaps';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 91;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';  bibkey.Li  = 'Wiki';  
data.Lim = 140;  units.Lim = 'cm';  label.Lim = 'ultimate total length for males';  bibkey.Lim = 'Wiki';  

data.Wwb = 10;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Wiki';
data.Wwp = 1500; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'Wiki';
data.Wwi = 7e3;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Wiki';

data.Ri  = 35/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'eddmaps';   
  temp.Ri = C2K(30);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 18-25 egggs per clutch, 2 clutches per yr';
  
% univariate data
% treat-length
data.LL = [ ... % SVL after 42 d (cm)
1 25.6
2 26.5
3 27.5
4 28.4];
data.LL(:,2) = data.LL(:,2) * 3; % convert SVL to TL
units.LL  = {'#', 'cm'};  label.LL = {'treatment', 'total after 42 d'}; 
init.LL = 3*[21.5; 21.7; 21.6; 21.7 ]; units.init.LL = 'cm'; label.init.LL = 'initial length';
temp.LL   = C2K(38);  units.temp.LL = 'K'; label.temp.LL = 'temperature';
bibkey.LL = 'ManeManl2007'; treat.LL = {0}; units.treat.LL = ''; label.treat.LL = '-';
comment.LL = '1: L 16.92 kJ, P 0.79 g; 2:L 24.79 kJ/d.100 g, P 0.79 g/d.100 g; 3: L 16.92 kJ/d.100 g, P 0.99 g/d.100 g; 4: L 24.79 kJ, P 0.99 g/d.100 g';

% treat-weight
data.WW = [ ... % weight after 42 d (g), initial weight (g), fat energy (kJ), protein (g)
1 552 
2 624
3 635 
4 723];
units.WW  = {'#', 'g'};  label.WW = {'treatment', 'weight after 42 d'};  
init.WW = [304; 303; 300; 301]; units.init.WW = 'g'; label.init.WW = 'initial weight';
temp.WW   = C2K(38);  units.temp.WW = 'K'; label.temp.WW = 'temperature';
bibkey.WW = 'ManeManl2007'; treat.WW = {0}; units.treat.WW = ''; label.treat.WW = '-';
comment.WW = '1: L 16.92 kJ, P 0.79 g; 2:L 24.79 kJ/d.100 g, P 0.79 g/d.100 g; 3: L 16.92 kJ/d.100 g, P 0.99 g/d.100 g; 4: L 24.79 kJ, P 0.99 g/d.100 g';

%% set weights for all real data
weights = setweights(data, []);
weights.WW = 5 * weights.WW;
weights.LL = 5 * weights.LL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.init = init;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'They are the only known reptiles to be partly endothermic during reproductive period';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XFSD'; % Cat of Life
metaData.links.id_ITIS = '1172519'; % ITIS
metaData.links.id_EoL = '790346'; % Ency of Life
metaData.links.id_Wiki = 'Salvator_merianae'; % Wikipedia
metaData.links.id_ADW = 'Salvator_merianae'; % ADW
metaData.links.id_Taxo = '3817477'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Salvator&species=merianae'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Salvator_merianae}}';
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
bibkey = 'ManeManl2007'; type = 'Article'; bib = [ ... 
'doi = {10.1163/157075407781268318}, ' ...
'author = {Manes, M. and Manlla, A. and Parry, H. V.}, ' ... 
'year = {2007}, ' ...
'title = {Growth and feeding conversion responses to different protein and energy supplies in Tupinambis merianae (Squamata: Teiidae)}, ' ...
'journal = {Applied Herpetology}, ' ...
'volume = {4(3)}, ' ...
'pages = {279–285}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'eddmaps'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.eddmaps.org/species/subject.cfm?sub=82961}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
