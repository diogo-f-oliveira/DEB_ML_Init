function [data, auxData, metaData, txtData, weights] = mydata_Coryphaena_equiselis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Coryphaenidae';
metaData.species    = 'Coryphaena_equiselis'; 
metaData.species_en = 'Pompano dolphinfish'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 31];

%% set data
% zero-variate data

data.ab = 3.5;   units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'guess';   
  temp.ab = C2K(22.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for C. hippurus';
data.am = 4*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(22.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 22;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 146;       units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.7e-4;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'CastSant1986';
  comment.Wwb = 'based on egg diameter of 0.69 mm: pi/6*0.069^3';
data.Wwp = 123;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01230*Lp^2.98, see F1';
data.Wwi = 34.6e3;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^2.98, see F1';

data.GSI = 0.055; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'CastSant1986';
  temp.GSI = C2K(22.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
22.709	1.759
41.590	4.198
45.056	4.534
58.174	7.146
70.564	11.872
73.633	11.532
115.035	25.878
119.611	24.014
137.076	32.796
138.956	30.596
159.686	29.312
193.640	36.053
204.805	37.059];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(22.38);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'UchiBurc1986';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Wwb = 3 * weights.Wwb;

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
% set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight Ww in g = 0.01230*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'YRZ5'; % Cat of Life
metaData.links.id_ITIS = '168792'; % ITIS
metaData.links.id_EoL = '46578340'; % Ency of Life
metaData.links.id_Wiki = 'Coryphaena_equiselis'; % Wikipedia
metaData.links.id_ADW = 'Coryphaena_equiselis'; % ADW
metaData.links.id_Taxo = '153550'; % Taxonomicon
metaData.links.id_WoRMS = '126845'; % WoRMS
metaData.links.id_fishbase = 'Coryphaena_equiselis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coryphaena_equiselis}}';
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
bibkey = 'UchiBurc1986'; type = 'Article'; bib = [ ... 
'author = {Uchiyama, J.H. and R.K. Burch and S.A. Kraul}, ' ... 
'year = {1986}, ' ...
'title = {Growth of dolphins, \emph{Coryphaena hippurus} and \emph{C. equiselis} in {H}awaiian waters as determined by daily increments on otoliths}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {84(1)}, ' ...
'pages = {186-191}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CastSant1986'; type = 'Article'; bib = [ ... 
'author = {J.J. Castro and J.A. Santiago and V. Hern\''{a}ndez-Gar\''{i}a and C. Pla}, ' ... 
'year = {1986}, ' ...
'title = {Growth and reproduction of the dolphinfish (\emph{Coryphaena equiselis} and \emph{Coryphaena hippurus}) in the {C}anary {I}slands, {C}entral-{E}ast {A}tlantic (preliminary results)}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {84(1)}, ' ...
'pages = {186-191}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Coryphaena-equiselis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

