function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_cheni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_cheni'; 
metaData.species_en = 'Japanese white seaperch'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 26];

%% set data
% zero-variate data

data.am = 22*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'KoloOwen2021';   
  temp.am = C2K(17.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
data.Li  = 23;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'KamiKawa2013';
  comment.Li = 'based on tL data';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 16.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 161; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'fishbase','KamiKawa2013'};
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 15e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(17.3);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Sebastes_inermis: 62e3*161/640';
  
data.tL = [ ... % time since birth (yr), total length (cm)
1.378	13.675
1.460	14.403
1.947	16.466
2.067	15.225
2.250	16.377
2.291	16.953
2.331	16.317
2.353	18.257
2.472	15.682
2.473	17.136
2.899	17.896
3.306	20.505
3.427	20.263
3.486	18.991
3.608	19.567
3.609	19.719
3.649	20.113
3.666	17.204
3.689	20.265
3.731	21.386
3.747	17.447
3.772	21.750
3.813	22.478
3.831	19.902
3.833	22.629
3.851	20.387
3.872	20.721
3.973	20.600
3.991	18.630
3.992	19.479
4.014	21.085
4.173	18.631
4.215	20.571
4.255	19.753
4.277	21.147
4.293	17.784
4.339	23.329
4.519	21.209
4.618	19.240
4.823	21.423
4.885	23.212
4.886	24.181
5.026	22.909
5.087	23.122
5.204	19.032
5.330	23.123
6.256	19.280
6.279	22.311
6.583	23.252
7.107	21.680
7.266	18.681
7.838	24.745
7.980	25.261];
data.tL(:,1) = (data.tL(:,1)+0.8) * 365; % set origin at birth
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(17.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KamiKawa2013'; 

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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight for most Sebastes species: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life
metaData.links.id_ITIS = '644574'; % ITIS
metaData.links.id_EoL = '2791069'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_cheni'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '937891'; % Taxonomicon
metaData.links.id_WoRMS = '1398220'; % WoRMS
metaData.links.id_fishbase = ''; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_cheni}}';
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
bibkey = 'KamiKawa2013'; type = 'article'; bib = [ ... 
'doi = {10.1007/s10228-013-0381-8}, ' ...
'author = {Kamimura, Y. and Kawane, M. and Hamaguchi, M. and Shoji, J.},' ...
'year = {2013}, ' ...
'title = {Age and growth of three rockfish species, \emph{Sebastes inermis}, \emph{S. ventricosus} and \emph{S. cheni}, in the central {S}eto {I}nland {S}ea, {J}apan}, ' ...
'journal = {Ichthyological Research}, ' ...
'volume = {61(2)}, ' ...
'pages = {108–114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KoloOwen2021'; type = 'article'; bib = [ ... 
'doi = {10.1126/science.abg5332}, ' ...
'author = {Sree Rohit Raj Kolora and Gregory L. Owens and Juan Manuel Vazquez and Alexander Stubbs and Kamalakar Chatla and Conner Jainese and Katelin Seeto and Merit McCrea and Michael W. Sandel and Juliana A. Vianna and Katherine Maslenikov and Doris Bachtrog and James W. Orr and Milton Love and Peter H. Sudmant},' ...
'year = {2021}, ' ...
'title = {Origins and evolution of extreme life span in {P}acific {O}cean rockfishes}, ' ...
'journal = {Science}, ' ...
'volume = {374(6569)}, '...
'pages = {842-847}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

