function [data, auxData, metaData, txtData, weights] = mydata_Galaxias_occidentalis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Galaxiiformes'; 
metaData.family     = 'Galaxiidae';
metaData.species    = 'Galaxias_occidentalis'; 
metaData.species_en = 'Western galaxias'; 

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
metaData.date_subm = [2024 10 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 27];

%% set data
% zero-variate data
data.am = 5*365;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'fishbase';  
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'data for G. prognathus';

data.Lp = 7.3;   units.Lp = 'cm';   label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase';
data.Li = 19;     units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 1.0 mm of Galaxias maculatus: pi/6*0.1^3';
data.Wwi = 47.8; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00490*Li^3.12, see F1'; 

data.Ri = 2573/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL_fm = [ ... % age (years) ~ Length (cm) 
    1  7.7  7.0
    2  9.9  8.8
    3 11.6  9.6
    4 12.7 10.0
    5 13.2 NaN];
data.tL_fm(:,1) = 365 * (1.6 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(17);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'PenPott1991'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);

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
D2 = 'I had to add 1 yr to age-estimates to arrive at a good fit';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00490*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3F2WH'; % Cat of Life
metaData.links.id_ITIS = '623457'; % ITIS
metaData.links.id_EoL = '224692'; % Ency of Life
metaData.links.id_Wiki = 'Galaxias_occidentalis'; % Wikipedia
metaData.links.id_ADW = 'Galaxias_occidentalis'; % ADW
metaData.links.id_Taxo = '174650'; % Taxonomicon
metaData.links.id_WoRMS = '1019000'; % WoRMS
metaData.links.id_fishbase = 'Galaxias-occidentalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Galaxias_occidentalis}}';
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
'author = {Pen, L.J. and I.C. Potter}, ' ... 
'year   = {1991}, ' ...
'title  = {Biology of the western minnow, \emph{Galaxias occidentalis} {O}gilby ({T}eleostei: {G}alaxiidae), in a south-western {A}ustralian river. 2. Size and age composition, growth and diet}, ' ...
'journal = {Hydrobiologia}, ' ...
'page = {89-100}, ' ...
'volume = {211(2)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Galaxias-occidentalis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

