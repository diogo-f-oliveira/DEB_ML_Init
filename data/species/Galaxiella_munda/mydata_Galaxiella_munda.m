function [data, auxData, metaData, txtData, weights] = mydata_Galaxiella_munda
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Galaxiiformes'; 
metaData.family     = 'Galaxiidae';
metaData.species    = 'Galaxiella_munda'; 
metaData.species_en = 'Western dwarf galaxias'; 

metaData.ecoCode.climate = {'Cfa', 'BWk'};
metaData.ecoCode.ecozone = {'TA', 'TO'};
metaData.ecoCode.habitat = {'jiFc', 'jiFl', '0jMcp'};
metaData.ecoCode.embryo  = {'Th'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % in K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 28];

%% set data
% zero-variate data
data.am = 1.5*365;   units.am = 'd';    label.am = 'life span';                       bibkey.am = 'PenPott1991';  
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.7;   units.Lp = 'cm';   label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase';
data.Li = 6.0;     units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'PenPott1991';
  comment.Wwb = 'based on egg diameter of 1.1 - 1.4 mm : pi/6*0.125^3';
data.Wwi = 1.3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00490*Li^3.12, see F1'; 

data.Ri = 3*65/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'PenPott1991';
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '65 eggs per clutch, 3 clutches assumed';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % age (d) ~ Length (cm) 
26.729	1.268 NaN
55.021	1.788 NaN
84.994	2.887 NaN
121.428	3.359 NaN
173.629	4.001 3.782
226.879	4.234 3.786
258.426	4.725 4.237
282.853	4.558 4.309
310.576	4.799 4.261
348.040	4.653 4.374
384.433	4.666 4.208
415.409	4.848 4.559
448.513	4.532 4.282
487.083	4.595 4.196
544.157	5.068 4.599];
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(17);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'PenPott1991'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% % Group plots
% set1 = {'tL_Ez','tL_Mo','tL_ME','tL_MW','tL_Gu'}; subtitle1 = {'Data at Ez Mo, ME, MW, Gu'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00490*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3F2XW'; % Cat of Life
metaData.links.id_ITIS = '623472'; % ITIS
metaData.links.id_EoL = '217160'; % Ency of Life
metaData.links.id_Wiki = 'Galaxiella_munda'; % Wikipedia
metaData.links.id_ADW = 'Galaxiella_munda'; % ADW
metaData.links.id_Taxo = '174662'; % Taxonomicon
metaData.links.id_WoRMS = '1012572'; % WoRMS
metaData.links.id_fishbase = 'Galaxiella-munda'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Galaxiella_munda}}';
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
bibkey = 'PenPott1991'; type = 'article'; bib = [ ...
'doi = {10.1111/j.1095-8649.1991.tb04401.x}, ' ...
'author = {Pen, L.J. and I.C. Potter and Hilliard, R. W.}, ' ... 
'year   = {1991}, ' ...
'title  = {Biology of \emph{Galaxiella munda} {M}c{D}owall ({T}eleostei: {G}alaxiidae), including a comparison of the reproductive strategies of this and three other local species}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'page = {717–731}, ' ...
'volume = {39(5)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Galaxiella-munda.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

