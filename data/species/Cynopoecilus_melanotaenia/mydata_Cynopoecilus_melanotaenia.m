  function [data, auxData, metaData, txtData, weights] = mydata_Cynopoecilus_melanotaenia
  %% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Rivulidae';
metaData.species    = 'Cynopoecilus_melanotaenia'; 
metaData.species_en = 'Killifish'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 01];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU Univ. Amsterdam'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];
metaData.date_acc    = [2020 10 01]; 

%% set data
% zero-variate data
data.am = 0.9*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'ArenPere2001';
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb  = 0.469;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'ArenPere2001';  
data.Lp = 1.855;     units.Lp = 'cm';     label.Lp = 'total length at puberty';  bibkey.Lp = 'ArenCarv1999';
data.Li = 2.5;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'ArenPere2001';
data.Lim = 3.5;     units.Lim = 'cm';     label.Lim = 'ultimate total length for males';  bibkey.Lim = 'ArenPere2001';

data.Wwb = 8e-4; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'ArenCarv1999';
  comment.Wwb = 'based on egg diameter of 1.15 mm : pi/6*0.115^3';
data.Wwp = 0.042; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'ArenPere2001','fishbase'};
  comment.Wwim = 'based on 0.00617*Lp^3.10, see F1';
data.Wwi = 0.106; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';  bibkey.Wwi = {'ArenPere2001','fishbase'};
  comment.Wwi = 'based on 0.00617*Li^3.10, see F1';
data.Wwim = 0.30; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = {'ArenPere2001','fishbase'};
  comment.Wwim = 'based on 0.00617*Lim^3.10, see F1';
   
data.Ni = 219;  units.Ni = '#'; label.Ni = 'cum # eggs at 189 d';   bibkey.Ni = 'ArenCarv1999';
  temp.Ni = C2K(20); units.temp.Ni = 'K'; label.temp.Ni = 'temperature'; 

% uni-variate data
  
% time-length
data.tL_f = [ ... % time since birth (d), total length (cm)
0.044	0.469
20.912	1.247
54.804	1.728
54.824	1.951
84.459	2.143
85.180	2.324
119.738	2.352
145.477	2.346
177.216	2.406
211.418	2.401
242.091	2.362
277.017	2.571];
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ArenPere2001';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), std length (cm)
0.445	0.469
21.116	1.509
54.066	2.689
56.040	2.647
84.164	3.027
86.542	3.068
119.407	3.381
144.715	3.282
177.558	3.373
211.183	3.373
241.644	3.373
276.868	3.546];
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ArenPere2001';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mean temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Discussion points
D1 = 'weight length relationship: Ww in g = 0.00617 * (TL in cm)^3.10'; 
  metaData.bibkey.D1 = 'fishbase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Anual killifish'; 
metaData.bibkey.F1 = 'ArenPere2001'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BVX9'; % Cat of Life
metaData.links.id_ITIS = '647214'; % ITIS
metaData.links.id_EoL = '1157072'; % Ency of Life
metaData.links.id_Wiki = 'Cynopoecilus'; % Wikipedia
metaData.links.id_ADW = 'Cynopoecilus_melanotaenia'; % ADW
metaData.links.id_Taxo = '172606'; % Taxonomicon
metaData.links.id_WoRMS = '1017596'; % WoRMS
metaData.links.id_fishbase = 'Cynopoecilus-melanotaenia'; % fishbase


%% References
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cynopoecilus-melanotaenia.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cynopoecilus_melanotaenia}}';
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
bibkey = 'ArenPere2001'; type = 'Article'; bib = [ ...
'author = {Arenzon, A. and Peret, A. C. and Bohrer, M. B. C.}, ' ...
'year = {2001}, ' ...
'title = {GROWTH OF THE ANNUAL FISH \emph{Cynopoecilus melanotaenia} ({R}EGAN, 1912) BASED IN A TEMPORARY WATER BODY POPULATION IN {R}IO {G}RANDE DO {S}UL {S}TATE, {B}RAZIL ({C}YPRINODONTIFORMES, {R}IVULIDAE)}, ' ...
'journal = {Rev. Brasil. Biol.}, ', ...
'volume = {61(1)}, '...
'pages = {117-123}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArenCarv1999'; type = 'Article'; bib = [ ...
'author = {Alexandre Arenzon and Alberto Carvalho Peret and Maria Beatriz Camino Bohrer}, ' ...
'year = {1999}, ' ...
'title = {Reproduction of the annual fish \emph{Cynopoecilus melanotaenia} ({R}egan, 1912) in a temporary water body in {R}io {G}rande do {S}ul, {B}razil ({C}yprinodontiformes, {R}ivulidae)}, ' ...
'journal = {Hydrobiologia}, ', ...
'volume = {411}, '...
'pages = {65-70}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'itrainsfishes'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.itrainsfishes.net/content/cynopoecilus_melanotaenia_001.php}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

