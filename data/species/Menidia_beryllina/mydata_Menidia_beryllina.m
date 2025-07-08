function [data, auxData, metaData, txtData, weights] = mydata_Menidia_beryllina

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinopsidae';
metaData.species    = 'Menidia_beryllina'; 
metaData.species_en = 'Inland silverside'; 

metaData.ecoCode.climate = {'MB','Cfa'};
metaData.ecoCode.ecozone = {'MAW','THn'};
metaData.ecoCode.habitat = {'0iMcp', '0iMm', 'jiFr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.7); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 03 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 6;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'LetcBeng1993';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 68;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ConoRoss1982';
  temp.tp = C2K(23.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tL data at Lp';
data.am = 2*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(23.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 8;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = {'HubeBeng1999','ConoRoss1982'}; 
  comment.Lp = 'based on "reserve accumulation in winter", combined with tL data';
data.Li  = 15;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'EPA2002';
  comment.Wwb = 'based of egg diameter of 0.75 mm: pi/6*0.075^3';

data.Ri = 18e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(23.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'iucn give max fecundity of 1699, fishbase 18e4'; 

% uni-variate data
% time-length
data.tL_f = [ ... time since 1 jan 1977 (d), total length (cm)
182.666	1.855
195.460	3.518
209.554	5.134
223.681	6.383
236.529	7.462
251.160	7.931
264.479	8.595
279.117	8.991
292.889	9.411
307.959	9.807
365+125.345	10.295
365+138.275	10.496
365+153.407	10.209
365+167.605	10.702
365+180.997	10.561
365+193.482	10.908
365+208.113	11.377
365+223.169	11.920
365+237.753	12.901
365+251.523	13.346
365+264.507	12.961
365+280.426	13.504
365+292.519	13.411
365+307.586	13.832];
data.tL_f(:,1) = data.tL_f(:,1) - 182.5; % set origin at birth
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'}; 
temp.tL_f    = C2K(23.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ConoRoss1982';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... time since 1 jan 1977  (d), total length (cm)
183.400	1.879
195.460	3.518
210.480	4.451
223.735	5.798
237.887	6.779
252.085	7.273
264.971	7.936
279.634	8.064
292.503	8.923
307.572	9.319
365+125.889	9.076
365+138.417	8.959
365+153.441	9.843
365+167.270	9.653
365+181.519	9.586
365+195.310	9.811
365+210.330	10.744
365+223.259	10.944
365+237.061	11.047
365+251.642	12.053
365+265.885	12.059
365+281.790	12.748
365+294.286	12.973
365+308.122	12.710];
data.tL_m(:,1) = data.tL_m(:,1) - 182.5; % set origin at birth
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'}; 
temp.tL_m    = C2K(23.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ConoRoss1982';
comment.tL_m = 'Data for males';

% time-weight
data.tW_f = [ ... time since 1 jan 1977 (d), wet weight (g)
184.420	0.069
198.448	0.215
211.140	0.763
224.500	1.396
237.192	1.857
251.220	2.663
263.912	3.124
277.940	3.585
293.972	3.875
309.336	4.595
365+126.972	5.769
365+140.332	6.775
365+155.696	6.433
365+168.388	7.296
365+183.752	6.696
365+197.112	7.416
365+208.468	6.844
365+224.500	8.482
365+239.196	10.866
365+253.224	12.303
365+265.916	11.788
365+279.944	13.311
365+293.304	13.055
365+308.668	14.492];
data.tW_f(:,1) = data.tW_f(:,1) - 183.5; % set origin at birth
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'}; 
temp.tW_f    = C2K(23.7);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'ConoRoss1982';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... time since 1 jan 1977 (d), wet weight (g)
183.752	0.127
197.112	0.215
211.808	0.533
226.504	1.109
237.192	1.513
251.888	1.974
265.248	2.522
278.608	2.639
295.976	3.560
310.004	4.021
365+127.640	4.679
365+141.000	4.451
365+159.036	5.745
365+171.060	4.944
365+183.084	5.090
365+198.448	5.723
365+211.140	5.926
365+223.832	6.101
365+239.196	8.026
365+252.556	8.889
365+265.248	9.665
365+279.944	10.242
365+293.304	11.363
365+308.668	11.566];
data.tW_m(:,1) = data.tW_m(:,1) - 183.5; % set origin at birth
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'}; 
temp.tW_m    = C2K(23.7);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'ConoRoss1982';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'sex determination by temperature';
metaData.bibkey.F1 = 'PowlSand2008';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3ZQKX'; % Cat of Life
metaData.links.id_ITIS = '165993'; % ITIS
metaData.links.id_EoL = '46566700'; % Ency of Life
metaData.links.id_Wiki = 'Menidia_beryllina'; % Wikipedia
metaData.links.id_ADW = 'Menidia_beryllina'; % ADW
metaData.links.id_Taxo = '44708'; % Taxonomicon
metaData.links.id_WoRMS = '159227'; % WoRMS
metaData.links.id_fishbase = 'Menidia-beryllina'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Menidia_beryllina}}'];
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
bibkey = 'ConoRoss1982'; type = 'Article'; bib = [ ... 
'author = {David O. Conover and Michael R. Ross}, ' ... 
'year = {1982}, ' ...
'title = {Patterns in Seasonal Abundance, Growth and Biomass of the {A}tlantic Silverside, \emph{Menidia menidia}, in a {N}ew {E}ngland Estuary}, ' ...
'journal = {Estuaries}, ' ...
'volume = {5}, ' ...
'pages = {275-286}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LetcBeng1993'; type = 'Article'; bib = [ ... 
'author = {B. H. Letcher and D. A. Bengtson}, ' ... 
'year = {1993}, ' ...
'title = {Effect of food density and temperature on feeding and growth of young inland Silversides (\emph{Menidia menidia})}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {43}, ' ...
'pages = {671-686}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HubeBeng1999'; type = 'Article'; bib = [ ... 
'author = {Marina  Huber and David  A. Bengtson}, ' ... 
'year = {1999}, ' ...
'title = {Effects  of  photoperiod  and  temperature  on  the  regulation  of the  onset  of  maturation  in  the  estuarine  fish \emph{Menidia beryllina} ({C}ope) ({A}therinidae)}, ' ...
'journal = {Journal  of  Experimental  Marine  Biology  and  Ecology}, ' ...
'volume = {240}, ' ...
'pages = {285-302}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EPA2002'; type = 'Book'; bib = [ ...  
'author = {EPA}, ' ...
'year = {2002}, ' ...
'title  = {Short-term methods for estimating the chronic toxicity of effluents and receiving waters to marine and estuarine organsims}, ' ...
'volume = {EPA-821-R-02-014}, ' ...
'publisher = {U.S. EPA, Washington}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib =  ...
'howpublished = {\url{https://www.fishbase.de/summary/Menidia-beryllina.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.iucnredlist.org/species/191191/18235182}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PowlSand2008'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-007-9304-8}, ' ...
'author = {Percival M. Powles and Ian M. Sandeman}, ' ... 
'year = {2008}, ' ...
'title = {Growth, summer cohort output, and observations on the reproduction of brook silverside, \emph{Labidesthes sicculus} ({C}ope) in the {K}awartha {L}akes, {O}ntario}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {82}, ' ...
'pages = {421-431}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

