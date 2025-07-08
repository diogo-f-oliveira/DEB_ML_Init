function [data, auxData, metaData, txtData, weights] = mydata_Chiromantis_rufescens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Rhacophoridae';
metaData.species    = 'Chiromantis_rufescens'; 
metaData.species_en = 'African foam-nest tree frog'; 

metaData.ecoCode.climate = {'Am', 'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Tnp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl', 'bjCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 31];

%% set data
% zero-variate data

data.ab = 6;     units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'Coe1974';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '4-8 d';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365;units.am = 'd';    label.am = 'life span';                      bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guess based on Hyla arborea';

data.Lb  = 0.236;  units.Lb  = 'cm';  label.Lb  = 'TL at birth';                 bibkey.Lb  = 'Coe1974';
data.Lj = 1.8;   units.Lj = 'cm'; label.Lj = 'SVL at metam';                    bibkey.Lj  = 'guess';
data.Lp  = 4;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';               bibkey.Lp  = 'guess';
data.Li  = 6.0;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';                 bibkey.Li  = 'Coe1974';
  comment.Li = 'data for Nigeria, 5.14 cm for Liberia';
data.Lim  = 4.8;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL';                bibkey.Lim = 'Coe1974';
  comment.Lim = 'data for Nigeria, 4.4 cm for Liberia';

data.Wwb = 0.0109; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Coe1974';
  comment.Wwb = 'based on egg diameter 2.5-3.0 mm: pi/6*0.275^3';
data.Wwi = 9.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Wwim*(Li/Lim)^3: 4.75*(6/4.8)^3';
data.Wwim = 4.75;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';       bibkey.Wwim = 'Coe1974';

data.Ri  = 148/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'Coe1974';   
  temp.Ri  = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '113-201 eggs per clutch, 1 clutch per season';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm) of tadpoles
0.016	0.236
1.841	0.496
2.315	0.602
4.850	0.997
5.783	0.992
6.891	0.986
7.838	1.193
7.947	1.087
8.368	1.276
11.840	1.725
14.836	2.038
21.916	2.364
27.931	2.461]; 
units.tL   = {'d', 'cm'};  label.tL = {'time since metam', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'Coe1974'; treat.tL = {1,{'females','males'}}; 
comment.tL = 'tadpoles leave foam nest between 5 and 8 d; fore limbs develop between 45 and 48 d';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Ri = 3 * weights.Ri;
weights.Lim = 3 * weights.Lim;
weights.Li = 3 * weights.Li;
weights.tp = 5 * weights.tp;
weights.Lp = 5 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'the shape of the tadpole seems to vary with size and development seems to start prior to egg laying';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Makes foam nest in tree above water';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5XT6Z'; % Cat of Life
metaData.links.id_ITIS = '665495'; % ITIS
metaData.links.id_EoL = '1047977'; % Ency of Life
metaData.links.id_Wiki = 'Chiromantis_rufescens'; % Wikipedia
metaData.links.id_ADW = 'Chiromantis_rufescens'; % ADW
metaData.links.id_Taxo = '47690'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Chiromantis+rufescens'; % AmphibiaWeb

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chiromantis_rufescens}}';
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
bibkey = 'Coe1974'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1469-7998.1974.tb04091.x}, ' ...
'author = {Malcolm Coe}, ' ... 
'year = {1974}, ' ...
'title = {Observations on the ecology and breeding biology of the genus \emph{Chiromantis} ({A}mphibia: {R}hacophoridae)}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {172(1)}, ' ...
'pages = {13–34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Chiromantis+rufescens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
