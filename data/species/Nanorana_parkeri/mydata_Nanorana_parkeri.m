function [data, auxData, metaData, txtData, weights] = mydata_Nanorana_parkeri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Dicroglossidae';
metaData.species    = 'Nanorana_parkeri'; 
metaData.species_en = 'High Himalaya frog'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc','0jTht'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_fT'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 03];

%% set data
% zero-variate data

data.ab = 16.4; units.ab = 'd';    label.ab = 'age at birth=';       bibkey.ab = 'LuMa2016';   
  temp.ab = C2K(11);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5.5*365; units.am = 'd';    label.am = 'life span';                         bibkey.am = 'LuMa2016';   
  temp.am = C2K(11);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj  = 0.8;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';                      bibkey.Lj  = 'guess';
data.Lp  = 1.8;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for female';         bibkey.Lp  = 'MaLu2009';
data.Li  = 5.8;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';         bibkey.Li  = 'amphibiaweb';
  comment.Lim = '3.9-5.8 cm';
data.Lim  = 5.1; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';          bibkey.Lim  = 'amphibiaweb';
  comment.Lim = '4.0-5.1 cm';

data.Wwb = 5.6e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'MaLu2009';
  comment.Wwb = 'based on egg diameter of 2.2 mm: pi/6*0.22^3';
data.Wwp = 0.44;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = 'guess';
  comment.Wwi = 'based on length-weight of Euphlyctis_cyanophlyctis: 12.5*(1.8/5.5)^3';
data.Wwi = 14.7; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Euphlyctis_cyanophlyctis: 12.5*(5.8/5.5)^3';
data.Wwim = 10.0; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'guess';
  comment.Wwim = 'based on length-weight of Euphlyctis_cyanophlyctis: 12.5*(5.1/5.5)^3';

data.Ri  = 189/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';                bibkey.Ri  = 'LuMa2016';
  temp.Ri  = C2K(11);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '189 eggs per clutch, 1, poosibly 2, clutches per yr assumed';
  
% uni-variate data
% time-length
data.tL_3800fm = [ ... % time since metam (yr), SVL (cm)
 3	4.81522 4.28614
 4	5.35335 4.33163
 5	5.40558 4.66357
 6	6.23787 NaN];
data.tL_3800fm(:,1) = 365 * (0.8+data.tL_3800fm(:,1)); % convert yr to d
units.tL_3800fm  = {'d', 'cm'};  label.tL_3800fm = {'time since metam', 'SVL'};  
temp.tL_3800fm   = C2K(12);  units.temp.tL_3800fm = 'K'; label.temp.tL_3800fm = 'temperature';
bibkey.tL_3800fm = 'MaLu2009'; treat.tL_3800fm = {1, {'females','males'}};
comment.tL_3800fm = 'Data for females, males at 3800 m alt Lhasa  area central  Tibet';
%
data.tL_3900fm = [ ... % time since metam (yr), SVL (cm)
 2  NaN     3.59610
 3	3.80499 3.63267
 4	4.41983 4.01832
 5	4.84292 4.09965
 6	5.24039 4.19885
 7	5.27982 4.45918
 8	5.45995 NaN];
data.tL_3900fm(:,1) = 365 * (0.8+data.tL_3900fm(:,1)); % convert yr to d
units.tL_3900fm  = {'d', 'cm'};  label.tL_3900fm = {'time since metam', 'SVL'};  
temp.tL_3900fm   = C2K(11);  units.temp.tL_3900fm = 'K'; label.temp.tL_3900fm = 'temperature';
bibkey.tL_3900fm = 'MaLu2009'; treat.tL_3900fm = {1, {'females','males'}};
comment.tL_3900fm = 'Data for females, males at 3900 m alt Lhasa  area central  Tibet';
%
data.tL_4000fm = [ ... % time since metam (yr), SVL (cm)
 2  NaN     3.02323
 3	4.03517 3.44473
 4	4.24080 3.74084
 5	4.39532 3.83112
 6	4.65217 3.94821
 7	4.76831 3.97582
 8	4.79499 4.41519
 9	5.57604 NaN];
data.tL_4000fm(:,1) = 365 * (0.8+data.tL_4000fm(:,1)); % convert yr to d
units.tL_4000fm  = {'d', 'cm'};  label.tL_4000fm = {'time since metam', 'SVL'};  
temp.tL_4000fm   = C2K(9);  units.temp.tL_4000fm = 'K'; label.temp.tL_4000fm = 'temperature';
bibkey.tL_4000fm = 'MaLu2009'; treat.tL_4000fm = {1, {'females','males'}};
comment.tL_4000fm = 'Data for females, males at 4000 m alt Lhasa  area central  Tibet';
%
data.tL_4300fm = [ ... % time since metam (yr), SVL (cm)
 3	3.44693 3.29250
 4	3.53745 3.49912
 5	3.78151 3.68787
 6	4.03836 3.76918
 7	4.33349 3.83262
 8	4.34739 3.95863
 9	4.60417 3.95043
10	4.69476 4.15707];
data.tL_4300fm(:,1) = 365 * (0.8+data.tL_4300fm(:,1)); % convert yr to d
units.tL_4300fm  = {'d', 'cm'};  label.tL_4300fm = {'time since metam', 'SVL'};  
temp.tL_4300fm   = C2K(7);  units.temp.tL_4300fm = 'K'; label.temp.tL_4300fm = 'temperature';
bibkey.tL_4300fm = 'MaLu2009'; treat.tL_4300fm = {1, {'females','males'}};
comment.tL_4300fm = 'Data for females, males at 4300 m alt Lhasa  area central  Tibet';
%
data.tL_4400fm = [ ... % time since metam (yr), SVL (cm)
 3	3.07606 3.24778
 4	3.03877 3.32011
 5	3.42350 3.50886
 6	3.94885 3.71549
 7	4.03944 3.76992
 8	4.14279 4.18245
 9	4.47634 4.06682
10	4.40069 NaN];
data.tL_4400fm(:,1) = 365 * (0.8+data.tL_4400fm(:,1)); % convert yr to d
units.tL_4400fm  = {'d', 'cm'};  label.tL_4400fm = {'time since metam', 'SVL'};  
temp.tL_4400fm   = C2K(5);  units.temp.tL_4400fm = 'K'; label.temp.tL_4400fm = 'temperature';
bibkey.tL_4400fm = 'MaLu2009'; treat.tL_4400fm = {1, {'females','males'}};
comment.tL_4400fm = 'Data for females, males at 4400 m alt Lhasa  area central  Tibet';
%
data.tL_4700fm = [ ... % time since metam (yr), SVL (cm)
 3	3.21675 3.48945
 4	3.43519 3.56181
 5	3.67921 3.59839
 6	4.29412 4.06461
 7	4.39747 NaN
 8	4.83335 NaN];
data.tL_4700fm(:,1) = 365 * (0.8+data.tL_4700fm(:,1)); % convert yr to d
units.tL_4700fm  = {'d', 'cm'};  label.tL_4700fm = {'time since metam', 'SVL'};  
temp.tL_4700fm   = C2K(3);  units.temp.tL_4700fm = 'K'; label.temp.tL_4700fm = 'temperature';
bibkey.tL_4700fm = 'MaLu2009'; treat.tL_4700fm = {1, {'females','males'}};
comment.tL_4700fm = 'Data for females, males at 4700 m alt Lhasa  area central  Tibet';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab; 

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
metaData.links.id_CoL = '45N7G'; % Cat of Life
metaData.links.id_ITIS = '665088'; % ITIS
metaData.links.id_EoL = '333070'; % Ency of Life
metaData.links.id_Wiki = 'Nanorana_parkeri'; % Wikipedia
metaData.links.id_ADW = 'Nanorana_parkeri'; % ADW
metaData.links.id_Taxo = '145161'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Nanorana+parkeri'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nanorana_parkeri}}';
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
bibkey = 'MaLu2009'; type = 'Article'; bib = [ ... 
'author = {X. Ma and X. Lu and J. Meril\"{a}}, ' ... 
'year = {2009}, ' ...
'title = {Altitudinal decline of body size in a {T}ibetan frog}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {79}, ' ...
'pages = {364–371}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LuMa2016'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00222933.2016.1205155}, ' ...
'author = {Lu, Xin and Ma, Xiaoyan; and Fan, Liqing and Hu, Yigang and Lang, Zedong and Li, Zhibin and Fang, Bohao and Guo, Weibin}, ' ... 
'year = {2016}, ' ...
'title = {Reproductive ecology of a {T}ibetan frog \emph{Nanorana parkeri} ({A}nura: {R}anidae)}, ' ...
'journal = {Journal of Natural History}, ' ...
'pages = {1–14}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Nanorana+parkeri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

