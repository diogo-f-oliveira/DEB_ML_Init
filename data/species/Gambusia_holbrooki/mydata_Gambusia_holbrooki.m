function [data, auxData, metaData, txtData, weights] = mydata_Gambusia_holbrooki
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Poeciliidae';
metaData.species    = 'Gambusia_holbrooki'; 
metaData.species_en = 'Eastern mosquitofish';

metaData.ecoCode.climate = {'BSk', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TP', 'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab';  'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.ab = 30;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'BeadGino2008';   
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 2.5 * 365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.7; units.Lb  = 'cm';  label.Lb = 'total length at birth';                bibkey.Lb  = 'BeadGino2008';  
  comment.Lb = '6 to 8 mm';
data.Lp  = 1.85; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'BeadGino2008';
  comment.Lp = '17 to 20 mm';
data.Li  = 8; units.Li  = 'cm';  label.Li  = 'ultimate total length for felmale';       bibkey.Li  = 'fishbase';
data.Lim = 4.7; units.Lim = 'cm';  label.Lim = 'ultimate total length for male';        bibkey.Lim = 'fishbase';

data.Wwb = 3.1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = {'BeadGino2008','fishbase'};
  comment.Wwb = 'based on 0.00977*Lb^3.18, see F2';
data.Wwi = 7.3;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.18, see F2';
data.Wwim = 1.34; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00977*Lim^3.18, see F2';

data.Ri  = 100*6/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'BeadGino2008';   
temp.Ri = C2K(27.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   comment.Ri = 'based on 100 young per litter, assumed 6 litters per yr';  

% uni-variate data
  
% tL data
% females
data.tL_f = [ ...
0.000	3.203
0.000	3.434
0.000	3.368
24.254	4.193
24.254	4.292
24.611	3.896
54.572	4.094
54.572	4.204
54.572	4.612
54.572	4.799
54.928	5.030
97.373	5.250
98.443	4.392
98.443	4.513
98.443	5.129
98.443	5.426
147.664	5.712
148.021	5.415
148.021	5.525
148.021	5.613
148.378	4.788
148.378	5.118
175.485	5.525
176.199	5.734
176.555	4.997
176.555	5.096
176.555	5.833
176.912	5.635
219.000	4.997
219.000	5.877
219.357	5.206
219.357	5.624
219.357	5.734];
data.tL_f(:,1) = 7 * data.tL_f(:,1); % convert wk to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth','total length', 'female'};  
temp.tL_f = C2K(30);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BeadGino2008';
comment.tL_f = 'Data for females';
% males
data.tL_m = [ ...
0.000	1.959
0.000	2.091
0.000	2.278
0.000	2.399
0.000	2.498
0.000	2.796
0.713	2.608
23.897	2.091
24.254	2.201
24.254	2.289
24.254	2.796
24.611	2.410
24.611	2.476
24.611	2.586
54.215	2.091
54.572	2.509
54.572	2.619
54.572	2.818
55.285	2.223
55.285	2.289
98.443	2.080
98.443	2.267
98.443	2.399
98.443	2.487
98.443	2.597
98.443	2.906
114.493	2.201
114.493	2.300
114.493	2.399
114.493	2.520
114.493	2.597
114.850	2.080
114.850	2.895];
data.tL_m(:,1) = 7 * data.tL_m(:,1); % convert wk to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth','total length', 'male'};  
temp.tL_m = C2K(30);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BeadGino2008';
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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'ovoviviparous, not viviparous, so reproduction is by eggs';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'leight-weight: Ww (in g) = 0.00977*(TL in cm)^3.18';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3F7VR'; % Cat of Life
metaData.links.id_ITIS = '165896'; % ITIS
metaData.links.id_EoL = '46566800'; % Ency of Life
metaData.links.id_Wiki = 'Gambusia_holbrooki'; % Wikipedia
metaData.links.id_ADW = 'Gambusia_holbrooki'; % ADW
metaData.links.id_Taxo = '174687'; % Taxonomicon
metaData.links.id_WoRMS = '276134'; % WoRMS
metaData.links.id_fishbase = 'Gambusia-holbrooki'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gambusia_holbrooki}}';
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
bibkey = 'BeadGino2008'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2008.02101.x}, ' ...
'author = {R. Beadouin and V. Ginot and G. Monod}, ' ... 
'year = {2008}, ' ...
'title = {Growth characteristics of eastern mosquitofish \emph{Gambusia holbrooki} in a northern habitat ({B}rittany, {F}rance)}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {73}, ' ...
'pages = {2468-2484}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Gambusia-holbrooki.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
