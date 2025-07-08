function [data, auxData, metaData, txtData, weights] = mydata_Rana_sakuraii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Rana_sakuraii'; 
metaData.species_en = 'Stream brown frog'; 

metaData.ecoCode.climate = {'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ab = 35;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for R. temporaria';
data.tj = 1.5*30.5;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'guess';
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'value for R. temporaria';
data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'KusaFuku1995';
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.8;  units.Lj  = 'cm';  label.Lj  = 'body length at metam'; bibkey.Lj  = 'KusaFuku1995'; 
data.Li  = 5;    units.Li  = 'cm';  label.Li  = 'ultimate body length for females'; bibkey.Li  = 'KusaFuku1995';
data.Lim  = 4.8; units.Lim  = 'cm'; label.Lim = 'ultimate body length for males';   bibkey.Lim  = 'KusaFuku1995';

data.Wwb = 0.0197; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter 3.1-3.6 mm: pi/6*0.335^3';
data.Wwi = 11.3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on 31 g at 7 cm for Rana lessonae: (5/7)^3*31';
data.Wwim = 10.0;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'guess';
  comment.Wwim = 'based on 31 g at 7 cm for Rana lessonae: (4.8/7)^3*31';

data.Ri  = 300/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Rana lessonae 500-3000 eggs, weight-corrected, usually in 1 clutch';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (d), SVL (cm)
0.250	0.751
0.988	2.112
2.094	3.420
3.084	4.839
4.092	5.076
5.101	5.090];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f    = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KusaFuku1995';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since metam (d), SVL (cm)
1.813	4.395
1.819	3.261
2.810	4.474
3.807	4.628
4.771	4.725];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'male'};  
temp.tL_m    = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KusaFuku1995';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
D3 = 'mod_1: kap and temp for ab increased';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'Males slightly smaller than females';
metaData.bibkey.F1 = 'KusaFuku1995'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6X2X3'; % Cat of Life
metaData.links.id_ITIS = '665409'; % ITIS
metaData.links.id_EoL = '332963'; % Ency of Life
metaData.links.id_Wiki = 'Rana_sakuraii'; % Wikipedia
metaData.links.id_ADW = 'Rana_sakuraii'; % ADW
metaData.links.id_Taxo = '145990'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rana+sakuraii'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rana_sakuraii}}';
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
bibkey = 'KusaFuku1995'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1564752}, ' ...
'author = {Kusano, T. and Fukuyama, K. and Miyashita, N.}, ' ... 
'year = {1995}, ' ...
'title = {Age Determination of the Stream Frog, \emph{Rana sakuraii}, by Skeletochronology}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {29(4)}, ' ...
'pages = {625-628}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+sakuraii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

