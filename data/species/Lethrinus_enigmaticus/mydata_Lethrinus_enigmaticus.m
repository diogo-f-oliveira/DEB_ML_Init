function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_enigmaticus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_enigmaticus'; 
metaData.species_en = 'Blackeye emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 20];

%% set data
% zero-variate data

data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'LebeCuep1975';   
  temp.am = C2K(27.6);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 25; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 55; units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'DegoAli2013';
  comment.Wwb = 'based egg diameter of 0.335 mm : pi/6*0.0335^3'; 
data.Wwp = 223.8;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01479*Lp^2.99, see F1';
data.Wwi = 2.4e3;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^2.99, see F1';

data.Ri  = 166200/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1 13.87 15.09
    2 19.39 20.77
    3 23.44 25.17
    4 26.56 28.86
    5 28.78 31.80
    6 31.33 35.33
    7 34.49 37.00
    8 NaN   38.25
    9 NaN   39.98
   10 NaN   41.74
   11 NaN   43.39
   12 NaN   44.98
   13 NaN   46.62
   14 NaN   48.02
   15 NaN   48.99];
data.tL_fm(:,1) = 365 * data.tL_fm(:,1);  % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(27.6);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'LebeCuep1975'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01479*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'probably protogynous hermaphrodite, like Lethrinus mahsena';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Marine; reef-associated; depth range 2 - 100 m. Tropical';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '6PQP7'; % Cat of Life
metaData.links.id_ITIS = '550902'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_enigmaticus'; % ADW
metaData.links.id_Taxo = '178735'; % Taxonomicon
metaData.links.id_WoRMS = '212072'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-enigmaticus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus}}';
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
bibkey = 'LebeCuep1975'; type = 'Article'; bib = [ ... 
'author = {Lebeau, A. and J. C. Cuepp}, ' ... 
'year = {1975}, ' ...
'title = {Biologie et Peche du Capitaine, \emph{Lethrinus enigmaticus} ({S}mith 1959) du {B}anc de {S}aya de {M}aiha ({O}cean {I}ndien)}, ' ...
'journal = {Rev. Trav. Inst. Pech. marit.}, ' ...
'volume = {39(4)}, ' ...
'pages = {41-52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus_enigmaticus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
