function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_ventricosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_ventricosus'; 
metaData.species_en = 'Japanese black seaperch'; 

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

data.am = 20*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(17.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
data.Li  = 25;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'KamiKawa2013';
  comment.Li = 'based on tL data';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 21.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 209; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'fishbase','KamiKawa2013'};
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 20e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(17.3);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Sebastes_inermis: 62e3*209/640';
  
data.tL = [ ... % time since birth (yr), total length (cm)
1.700	12.465
1.907	16.921
1.988	17.073
2.008	17.346
2.009	17.679
2.029	17.225
2.229	15.559
2.432	16.378
2.474	18.015
2.716	17.077
2.757	17.259
2.758	18.380
2.776	16.956
2.777	17.653
2.778	18.108
2.779	19.199
2.799	19.290
2.899	17.806
2.919	17.775
2.920	19.018
2.942	20.776
2.982	20.442
3.020	17.655
3.041	19.079
3.042	19.837
3.043	20.594
3.062	19.685
3.063	20.201
3.080	17.716
3.081	18.170
3.082	18.988
3.101	18.322
3.102	19.322
3.122	18.504
3.144	20.383
3.162	18.050
3.182	18.656
3.201	17.050
3.222	17.474
3.245	20.626
3.261	16.626
3.263	18.171
3.265	20.323
3.300	14.747
3.308	22.899
3.344	18.323
3.366	20.687
3.387	20.596
3.548	20.294
3.668	19.931
3.669	20.356
3.791	20.417
3.810	19.266
3.811	20.114
3.829	18.538
3.831	20.175
3.952	20.357
4.013	19.903
4.033	19.873
4.034	21.297
4.035	21.449
4.074	20.419
4.092	18.661
4.132	17.692
4.196	20.935
4.277	21.026
4.279	22.996
4.338	22.087
4.359	22.542
4.398	21.269
4.560	21.452
4.640	20.604
4.641	20.816
4.680	20.483
4.702	21.938
4.826	24.302
5.152	26.728
5.207	21.607
5.653	22.913
5.673	22.731
6.237	20.947
6.321	23.644
6.360	22.039
6.441	22.069
6.522	22.615
6.542	22.131
6.563	23.313
6.583	22.495
6.584	23.131
6.605	24.525
6.666	24.525
7.069	23.831
7.312	23.954
7.352	23.620
7.371	22.530
9.555	23.664
9.617	24.180
10.004	27.152
10.569	26.367
10.626	22.640
10.650	26.246
12.609	24.652];
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
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7MJ'; % Cat of Life
metaData.links.id_ITIS = '644580'; % ITIS
metaData.links.id_EoL = '46568149'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_inermis'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_inermis'; % ADW
metaData.links.id_Taxo = '187283'; % Taxonomicon
metaData.links.id_WoRMS = '274803'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-inermis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_inermis}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-inermis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
