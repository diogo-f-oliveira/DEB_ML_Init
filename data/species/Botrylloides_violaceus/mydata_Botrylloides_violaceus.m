function [data, auxData, metaData, txtData, weights] = mydata_Botrylloides_violaceus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Ascidiacea'; 
metaData.order      = 'Stolidobranchia'; 
metaData.family     = 'Styelidae';
metaData.species    = 'Botrylloides_violaceus'; 
metaData.species_en = 'Chain tunicate';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.5); % K
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-N', 'T-t2'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2022 05 27];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 05 27]; 


%% set data
% zero-variate data;
data.ab = 3.5;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(19.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 30;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Yama1975';
  temp.tp = C2K(19.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on the fact that the colony regresses after first egg liberation; very much site dependent';
data.am = 40; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(19.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb  = 1.41e-5;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'ZaniBuri1987';
  comment.Wwb = 'based on egg diameter of 0.3 mm of B. schlosseri : pi/6*0.03^3';
data.Wwi  = 1.4e-2;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'Mill1970';
  comment.Wwi = 'based on diameter and height of 3 mm: pi/6*0.3^3';

data.Ri  = 450/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(19.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';

% uni-variate data at f
% time-number of zooids
data.tN_spr = [ ... % time since settlement (d), number of zooids
7.892	1.020
15.032	3.281
23.027	9.968
32.146	72.052
42.272	427.672];
units.tN_spr = {'d', '#'}; label.tN_spr = {'time since settlement', 'number of zooids'};  
tT = [ ... % time since 1 jan (mnth), temperature (C)
    0 14.2
    1 13.7
    2 13.7
    3 15.0
    4 18.5
    5 21.8
    6 23.6
    7 25.6
    8 24.1
    9 20.7
   10 18.7
   11 15.7];
tT(:,1) = tT(:,1) * 30.5;  % convert mnth to d
tT(:,2) = C2K(tT(:,2));  % convert C to K
temp.tN_spr = tT; units.temp.tN_spr = 'K'; label.temp.tN_spr = 'temperature';
settle.tN_spr = 91.5; units.settle.tN_spr = 'd'; label.settle.tN_spr = 'time at settlement';
bibkey.tN_spr = 'Yama1975'; 
comment.tN_spr = 'Apr - May';
%
data.tN_sum = [ ... % time since settlement (d), number of zooids
6.176	0.994
12.923	3.023
18.230	26.688
22.278	180.827];
units.tN_sum = {'d', 'cm'}; label.tN_sum = {'time since settlement', 'number of zooids'};  
temp.tN_sum = tT; units.temp.tN_sum = 'K'; label.temp.tN_sum = 'temperature';
settle.tN_sum = 183; units.settle.tN_sum = 'd'; label.settle.tN_sum = 'time at settlement';
bibkey.tN_sum = 'Yama1975'; 
comment.tN_sum = 'July-Aug';

data.Tt2 = [ ... temperature (C), doubling time of # of zooids at settlement (d)
12.485	10.746
13.466	6.358
13.944	8.196
14.754	7.605
15.862	5.564
17.640	5.027
18.409	4.470
19.053	3.334
20.645	3.508
22.680	2.366
23.796	2.052
27.342	1.362
27.465	1.576];
units.Tt2 = {'C', 'd'}; label.Tt2 = {'temperature', 'doubling time of # of zooids at settlement'};  
bibkey.Tt2 = 'Yama1975'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tN_spr = 3 * weights.tN_spr;
weights.tN_sum = 3 * weights.tN_sum;
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack data and txt_data for output
auxData.temp   = temp;
auxData.settle = settle;
txtData.units  = units;
txtData.label  = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tN_sum','tN_spr'}; subtitle1 = {'Data for summer, spring populations'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'temperature ranges from 13.6 C in Jan to 25.5 C in August';     
metaData.discussion = struct('D1',D1); 

%% Facts
F1 = 'Colonial tunicate; settlement of larvae (tadpoles) within a few hours after liberation; total length tadpole 1.8 mm; after tail resorption upon settlement 0.3 mm; functional ascian in 4 d after settlement';
metaData.bibkey.F1 = 'Yama1975';
F2 = 'Asexual reproduction till space becomes limiting, then sexual reproduction; Parent colonies regressed and degenerated after liberation of larvae.';
metaData.bibkey.F2 = 'Yama1975';
F3 = 'Hermaphroditic; external fertilisation';
metaData.bibkey.F3 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = 'MPNZ'; % Cat of Life
metaData.links.id_ITIS = '159230'; % ITIS, genus only
metaData.links.id_EoL = '46584914'; % Ency of Life
metaData.links.id_Wiki = 'Botrylloides_violaceus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '41521'; % Taxonomicon, genus only
metaData.links.id_WoRMS = '148715'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Botrylloides_violaceus}}'; 
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
bibkey = 'Yama1975'; type = 'article'; bib = [ ...
'author = {M. Yamaguchi}, ' ...
'year = {1975}, ' ...
'title  = {Growth and Reproductive Cycles of the Marine Fouling Ascidians \emph{Ciona intestinalis}, \emph{Styela plicata}, \emph{Botrylloides violaceus}, and \emph{Leptoclinum mitsukurii} at {A}buratsubo-{M}oroiso {I}nlet ({C}entral {J}apan)}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {29}, '...
'pages = {253-259}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZaniBuri1987'; type = 'article'; bib = [ ...
'author = {Zaniolo, G. and Burighe, P. and Martinucci, G.}, ' ...
'doi = {10.1139/z87-183}, ' ...
'year = {1987}, ' ...
'title  = {Ovulation and placentation in \emph{Botryllus schlosseri} ({A}scidiacea): an ultrastructural study}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {65(5)}, '...
'pages = {1181–1190}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mill1970'; type = 'Book'; bib = [ ... 
'author = {Millar, R. H.}, ' ...
'year = {1970}, ' ...
'title  = {British Ascidians}, ' ...
'publisher = {Academic Press}, ' ...
'series = {Synopses of the British Fauna}, ' ...
'volume = {1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


