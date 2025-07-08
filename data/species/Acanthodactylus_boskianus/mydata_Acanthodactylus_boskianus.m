function [data, auxData, metaData, txtData, weights] = mydata_Acanthodactylus_boskianus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Acanthodactylus_boskianus'; 
metaData.species_en = 'Bosc''s fringe-toed lizard'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCvr', 'biCvm', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O', 'Apa'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Eei'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ab = 129;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(15);    units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'UzumIlga2014';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.9;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'guess'; 
  comment.Lb = 'based on Acanthodactylus_erythrurus';
data.Lp  = 5.5;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'UzumIlga2014'; 
data.Li  = 6.945;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'UzumIlga2014';
data.Lim  = 8.66;   units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'UzumIlga2014';

data.Wwi = 4.02;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Lacerta_agilis:  12*(6.945/10)^3';
data.Wwim = 7.8;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Lacerta_agilis: 12*(8.66/10)^3';
 
data.Ri  = 2*5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'UzumIlga2014';   
  temp.Ri = C2K(15);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-7 eggs per clutch, 2 clutches per yr';

% uni-variate data
% time-length
data.tL_f = [ ... % LAG (#), SVL (cm)
2.982	4.472
2.983	3.778
3.985	4.744
4.015	4.556
4.996	6.334
4.996	6.228
5.979	6.653
5.980	6.465
7.012	6.949
7.012	6.866];
data.tL_f(:,1) = (data.tL_f(:,1)-2) * 365; % convert LAG to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'age', 'SVL', 'females'};  
temp.tL_f   = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'UzumIlga2014'; comment.tL_f = 'data for females; 2 LAGs subtracted to match Lb';

data.tL_m = [ ... % LAG (#), SVL (cm)
5.997	7.782
5.998	7.476
6.981	7.901
7.001	7.678
7.983	8.150
7.984	8.021
7.985	7.750
8.977	8.693];
data.tL_m(:,1) = (data.tL_m(:,1)-2) * 365; % convert LAG to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'age', 'SVL', 'males'};  
temp.tL_m   = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'UzumIlga2014'; comment.tL_m = 'data for males; 2 LAGs subtracted to match Lb';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Lp = 10 * weights.Lp;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '8VS2'; % Cat of Life
metaData.links.id_ITIS = '1155194'; % ITIS
metaData.links.id_EoL = '1057284'; % Ency of Life
metaData.links.id_Wiki = 'Acanthodactylus_boskianus'; % Wikipedia
metaData.links.id_ADW = 'Acanthodactylus_boskianus'; % ADW
metaData.links.id_Taxo = '49546'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Acanthodactylus&species=boskianus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthodactylus_boskianus}}';
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
bibkey = 'UzumIlga2014'; type = 'Article'; bib = [ ... 
'doi = {10.3906/zoo-1307-1}, ' ...
'author = {\"{U}z\"{u}m, Nazan and Ilgaz, \c{C}et\''{i}n and Kumlutta\c{s}, Yusuf and G\"{u}m\"{u}\c{s}, \c{C}i\c{c}ek and Avci, Aziz}, ' ... 
'year = {2014}, ' ...
'title = {The body size, age structure, and growth of Bosc''s fringe-toed lizard, \emph{Acanthodactylus boskianus} ({D}audin, 1802)}, ' ...
'journal = {Turkish Journal of Zoology}, ' ...
'volume = {38(4)}, ' ...
'howpublished = {\url{https://journals.tubitak.gov.tr/zoology/vol38/iss4/1}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

