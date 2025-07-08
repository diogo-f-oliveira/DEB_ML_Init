function [data, auxData, metaData, txtData, weights] = mydata_Eurycea_bislineata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Eurycea_bislineata'; 
metaData.species_en = 'Northern two-lined salamander'; 

metaData.ecoCode.climate = {'Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFcc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 15];

%% set data
% zero-variate data

data.ab = 56;       units.ab = 'd';    label.ab = 'age at birth';        bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '4-10 wk';
data.tj = 690;     units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'Wild1924';   
  temp.tj = C2K(15);   units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.tp = 3*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';   
  temp.tp = C2K(15);   units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = '1 yr after metam';
data.am = 9.1*365;     units.am = 'd';    label.am = 'life span';         bibkey.am = 'guess';   
  temp.am = C2K(15);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Eurycea lucifuga';

data.Lb  = 1.3*0.406;  units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'Wild1924';
  comment.Lb = 'ADW gives SVL 1.2-1.4 cm, but this should probably be TL in view of tL data and Wwb';
data.Lj  = 5.4*0.406;       units.Lj  = 'cm';  label.Lj  = 'SVL at metam';    bibkey.Lj  = 'Wild1924';
data.Li  = 3.94;         units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'amphibiaweb';
  comment.Li = 'TL = 9.7 cm, converted to SVL using F1; Wiki gives TL 12 cm';
data.Lim  = 3.74;         units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';  bibkey.Lim  = 'Wiki';
  comment.Li = 'TL = 9.2 cm, converted to SVL using F1';

data.Wwb = 1.09e-2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 2.5-3 mm: pi/6*0.275^3';
data.Wwi = 1.68;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Eurycea lucifuga: 2.6*(3.94/4.56)^3';

data.Ri  = 100/365;   units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '15 - >100 eggs per season';

% univariate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
4.587	1.408
17.712	1.606
86.820	2.220
106.457	2.436
133.548	2.689
168.980	2.914
192.316	3.104
219.228	3.068
238.737	3.077
261.005	3.041
291.732	3.167
323.444	3.383
341.179	3.528
366.283	3.573
399.830	3.753
454.934	4.250
492.358	4.692
530.588	4.935
555.692	4.980
585.395	4.953
644.069	5.215
694.361	5.441];
data.tL(:,2) = data.tL(:,2) * 0.406; % convert TL to SVL using F1
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Wild1924'; comment.tL = 'TL converted to SVL using F1';
food.tL = [180 1; 181 0; 219 0; 220 0.6; 299 0.6; 300 1; 400 1; 401 0.95];
units.food.tL = {'d','-'}; label.food.tL = {'time','scaled functional response'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Lb = weights.Lb * 5;
weights.Li = weights.Li * 10;
weights.Lim = weights.Lim * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.food = food;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'TL = SVL * 0.406, based on photo';
metaData.bibkey.F1 = 'caudata'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3D3GS'; % Cat of Life
metaData.links.id_ITIS = '173685'; % ITIS
metaData.links.id_EoL = '1018896'; % Ency of Life
metaData.links.id_Wiki = 'Eurycea_bislineata'; % Wikipedia
metaData.links.id_ADW = 'Eurycea_bislineata'; % ADW
metaData.links.id_Taxo = '47410'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Eurycea+bislineata'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eurycea_bislineata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'caudata'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.caudata.org/cc/images/species/Eurycea/E_bislineata1WALLAYS.jpghttps://www.caudata.org/cc/images/species/Eurycea/E_bislineata1WALLAYS.jpg}}';
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
bibkey = 'Wild1924'; type = 'Article'; bib = [ ... 
'author = {Inez Whipple Wilders}, ' ... 
'year = {1924}, ' ...
'title = {THE RELATION OF GROWTH TO METAMORPHOSIS IN \emph{Eurycea bislineata}  ({G}REEN)}, ' ...
'journal = {The Journal of Experimental Zoology}, ' ...
'volume = {40(1)}, ' ...
'pages = {1-112}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Eurycea+bislineata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Eurycea_bislineata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

