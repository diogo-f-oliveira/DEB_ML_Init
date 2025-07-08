function [data, auxData, metaData, txtData, weights] = mydata_Fejervarya_multistriata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Dicroglossidae';
metaData.species    = 'Fejervarya_multistriata'; 
metaData.species_en = 'Paddy frog'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', 'jiFm'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 14];

%% set data
% zero-variate data

data.ab = 30; units.ab = 'd';    label.ab = 'age at birth';   bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 365; units.tp = 'd';    label.tp = 'time since metam at puberty for female at f_l';   bibkey.tp = 'ZhanShen2021';   
  temp.tp = C2K(26);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';                        bibkey.am = 'ZhanShen2021';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li  = 4.9;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';         bibkey.Li  = 'ZhanShen2021';
data.Lim  = 4.0;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';         bibkey.Lim  = 'ZhanShen2021';

data.Wwb = 1.9e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.53 mm of Fejervarya_limnocharis: pi/6*0.153^3';
data.Wwj = 1.4;  units.Wwj = 'g';  label.Wwj = 'wet weight at metam for female';     bibkey.Wwj = 'guess';
  comment.Wwj = 'based on Fejervarya_limnocharis';
data.Wwi = 6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Fejervarya_limnocharis';

data.Ri  = 900/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';                bibkey.Ri  = 'LalfVanl2019';
  temp.Ri  = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '488 to 1035 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % LAG (#), SVL (cm)
    1 NaN 2.750
    2 3.784 3.348
    3 4.381 3.623
    4 4.872 4.027];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.75) * 365; % convert LAG to d since metam
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm   = C2K(19);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ZhanShen2021'; treat.tL_fm = {1, {'females','males'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;

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
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6HQQS'; % Cat of Life
metaData.links.id_ITIS = '664964'; % ITIS
metaData.links.id_EoL = '323979'; % Ency of Life
metaData.links.id_Wiki = 'Fejervarya_multistriata'; % Wikipedia
metaData.links.id_ADW = 'Fejervarya_multistriata'; % ADW
metaData.links.id_Taxo = '818306'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Fejervarya+multistriata'; % AmphibiaWeb

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fejervarya_multistriata}}';
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
bibkey = 'ZhanShen2021'; type = 'Article'; bib = [ ...
'doi = {10.33493/scivis.19.04.03}, ' ...
'author = {Lixia Zhang and Yongsun Sheng and Xiangyu Yuan and Xueting Zhong and Xiaohong Chen}, ' ... 
'year = {2021}, ' ...
'title = {A skeletochronological estimation of age structure of a population of the paddy frog, \emph{Fejervarya multistriata}, from the central east of {C}hina}, ' ...
'journal = {Animal Biology}, ' ...
'volume = {71}, ' ...
'pages = {103–113}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Fejervarya+multistriata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

