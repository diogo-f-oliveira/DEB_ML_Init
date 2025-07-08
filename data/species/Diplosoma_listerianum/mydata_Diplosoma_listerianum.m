function [data, auxData, metaData, txtData, weights] = mydata_Diplosoma_listerianum

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Ascidiacea'; 
metaData.order      = 'Aplousobranchia'; 
metaData.family     = 'Didemnidae';
metaData.species    = 'Diplosoma_listerianum'; 
metaData.species_en = 'Grey crust tunicate'; % translated from Dutch

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
data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(19.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 50;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Yama1975';
  temp.tp = C2K(19.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on the fact that the colony regresses after first egg liberation; very much site dependent';
data.am = 90; units.am = 'd';    label.am = 'life span';  bibkey.am = 'Yama1975';   
  temp.am = C2K(19.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb  = 4.2e-6;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'MartBuri1988';
  comment.Wwb = 'based on egg diameter of 0.02 cm : pi/6*0.02^3';
data.Wwi  = 3.9e-4;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = {'Mill1970','MartBuri1988'};
  comment.Wwi = 'based on height zooid of 0.2 cm, diameter 0.05 cm, cilindrical shape: pi/4*0.05^2*0.2';

data.Ri  = 60/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(19.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';

% uni-variate data at f
% time-number of zooids
data.tN_spr = [ ... % time since settlement (d), number of zooids
1.747	2.043
7.909	3.931
17.110	12.304
24.026	44.881
30.985	304.803
40.002	2365.029];
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
1.818	2.043
6.959	6.739
11.891	97.792
17.107	1420.157];
units.tN_sum = {'d', '#'}; label.tN_sum = {'time since settlement', 'number of zooids'};  
temp.tN_sum = tT; units.temp.tN_sum = 'K'; label.temp.tN_sum = 'temperature';
settle.tN_sum = 183; units.settle.tN_sum = 'd'; label.settle.tN_sum = 'time at settlement';
bibkey.tN_sum = 'Yama1975'; 
comment.tN_sum = 'July';

data.Tt2 = [ ... temperature (C), doubling time of # of zooids at settlement (d)
15.456	5.455
17.011	3.724
18.448	2.604
19.043	3.140
24.979	1.609
26.184	1.203
27.055	1.513];
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
D2 = 'Uni-var data refers to colonies, not individuals';
D3 = 'Colonies are encrusting, height remaining constant; initial doubling time equals ln(2)/r';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3); 

%% Facts
F1 = 'Colonial tunicate; settlement of larvae (tadpoles) within a few hours after liberation; total length tadpole 1.8 mm; after tail resorption upon settlement 0.3 mm; functional ascian in 4 d after settlement';
metaData.bibkey.F1 = 'Yama1975';
F2 = 'Asexual reproduction till space becomes limiting, then sexual reproduction; Parent colonies regressed and degenerated after liberation of larvae.';
metaData.bibkey.F2 = 'Yama1975';
F3 = 'Hermaphroditic; external fertilisation';
metaData.bibkey.F3 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '36N6W'; % Cat of Life
metaData.links.id_ITIS = '159099'; % ITIS
metaData.links.id_EoL = '46582671'; % Ency of Life
metaData.links.id_Wiki = 'Diplosoma'; % Wikipedia
metaData.links.id_ADW = 'Diplosoma_listerianum'; % ADW
metaData.links.id_Taxo = '41499'; % Taxonomicon
metaData.links.id_WoRMS = '103579'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diplosoma}}'; 
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
bibkey = 'MartBuri1988'; type = 'article'; bib = [ ...
'author = {Martinucci, G. B. and Burighe, P. and Zaniolo, G. and Brunetti, R.}, ' ...
'doi = {10.1007/bf00312222}, ' ...
'year = {1988}, ' ...
'title  = {Ovulation and egg segregation in the tunic of a colonial ascidian, \emph{Diplosoma listerianum} ({T}unicata, {A}scidiacea)}, ' ...
'journal = {Zoomorphology}, ' ...
'volume = {108(4)}, '...
'pages = {219–227}'];
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

