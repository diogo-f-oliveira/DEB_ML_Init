  function [data, auxData, metaData, txtData, weights] = mydata_Cyprinodon_diabolis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Cyprinodontidae';
metaData.species    = 'Cyprinodon_diabolis'; 
metaData.species_en = 'Devils Hole pupfish'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(33.5); % K, body temp
metaData.data_0     = {'ab';  'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 'dLb'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine','Bas Kooijman'};                             
metaData.date_subm = [2020 07 26];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromsoe, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 07 27]; 


%% set data
% zero-variate data
data.ab = 7;         units.ab = 'd';  label.ab = 'age at birth';          bibkey.ab = 'ADW';
  temp.ab = C2K(33.5); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 8*7;        units.tp = 'd';  label.tp = 'age at puberty';        bibkey.tp = 'ADW';
  temp.tp = C2K(33.5); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'reaches maturity in 8-10 weeks';
data.am = 1*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'Wiki';
  temp.am = C2K(33.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = '10-14 months';
  
data.Li = 3;     units.Li = 'cm';     label.Li = 'ultimate total length';         bibkey.Li = 'Wiki';

data.Wwb = 5.2e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'DeacTay1995';   
   comment.Wwb = 'based on egg diameter "slightly less than 1 mm": pi/6*0.1^3';
data.Wwi = 0.37; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
   comment.Wwi = 'based on 0.01072*Li^3.22, see discussion.';
   
data.Ri = 25/8;       units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'DeacTay1995';   
  temp.Ri = C2K(33.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

data.dLb = 0.3/20;       units.dLb = 'cm/d';  label.dLb = 'change in length at birth';  bibkey.dLb = 'DeacTay1995';   
  temp.dLb = C2K(30); units.temp.dLb = 'K'; label.temp.dLb = 'temperature';
  comment.dLb = 'TL = 4 mm at 1990/03/03, 8 mm at 1990/04/02, 11 mm at 1990/04/26';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Facts
F1 = 'The temperature of the water stays a constant 33 to 34 degrees';
  metaData.bibkey.F1 = 'ADW';
metaData.discussion = struct('F1', F1);

%% Discussion points
D1 = 'Females are thought to lay a single egg with each spawn, which can occur at any time of year but peaks from mid-February to mid-May with a secondary peak from July-Sept';
  metaData.bibkey.D1 = 'Beis2014';
D2 = 'weight length relationship: Ww in g = 0.01072 * (TL in cm)^3.22';
  metaData.bibkey.D2 = 'fishbase';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '33HLW'; % Cat of Life
metaData.links.id_ITIS = '165633'; % ITIS
metaData.links.id_EoL = '1012044'; % Ency of Life
metaData.links.id_Wiki = 'Cyprinodon_diabolis'; % Wikipedia
metaData.links.id_ADW = 'Cyprinodon_diabolis'; % ADW
metaData.links.id_Taxo = '172741'; % Taxonomicon
metaData.links.id_WoRMS = '1015867'; % WoRMS
metaData.links.id_fishbase = 'Cyprinodon-diabolis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cyprinodon_diabolis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cyprinodon-diabolis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Cyprinodon_diabolis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LemaNevi2006'; type = 'Article'; bib = [ ...  
'author = {Sean C. Lema and Gabrielle A. Nevitt}, ' ...
'year = {2006}, ' ...
'title = {Testing an ecophysiological mechanism of morphological plasticity in pupfish and its relevance to conservation efforts for endangered {D}evils {H}ole pupfish}, ' ... 
'journal = {The Journal of Experimental Biology}, ' ...
'volume = {209}, '...
'pages = {3499--3509}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Beis2014'; type = 'Article'; bib = [ ...  
'doi = {10.7717/peerj.549}, ' ...
'author = {Steven R. Beissinger}, ' ...
'year = {2014}, ' ...
'title = {Digging the pupfish out of its hole: riskanalyses to guide harvest of Devils Holepupfish for captive breeding}, ' ... 
'journal = {PeerJ}, ' ...
'volume = {}, '...
'doi = {10.7717/peerj.549}, '...
'pages = {2:e549}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeacTay1995'; type = 'Article'; bib = [ ...  
'author = {James E. Deacon and Frances R. Taylor and John W. Pedretti}, ' ...
'year = {1995}, ' ...
'title = {Egg viability and ecology of Devils Hole pupfish: {I}nsights from captive propagation}, ' ... 
'journal = {The Southwestern Naturalist}, ' ...
'volume = {40(2)}, '...
'pages = {216-223}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



