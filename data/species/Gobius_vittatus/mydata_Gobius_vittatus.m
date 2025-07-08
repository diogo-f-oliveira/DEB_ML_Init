function [data, auxData, metaData, txtData, weights] = mydata_Gobius_vittatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Gobius_vittatus'; 
metaData.species_en = 'Striped goby'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.4); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 15];

%% set data
% zero-variate data

data.ab = 6.5;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(18.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(18.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 3.28;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'Kova2007';
data.Li  = 5.8;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 1.6e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.5 mm and width of 0.45 mm of G.niger: pi/6*0.15*0.045^2';
data.Wwp = 0.29;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','Kova2007'};
  comment.Wwp = 'based on 0.00741*Lp^3.09, see F1';
data.Wwi = 1.7;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00741*Li^3.09, see F1';

data.Ri  = 3045/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Kova2007';  
  temp.Ri = C2K(18.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [... %  yr class (yr), total length (cm)
0.17 2.23 NaN
0.25 2.71 2.78
0.33 3.04 2.96
0.42 3.26 3.34
0.50 3.38 3.40
0.58 3.27 3.38
0.67 3.19 3.41
0.75 3.29 3.40
0.83 3.78 3.85
0.92 3.78 3.88
1.00 3.94 4.11
1.08 4.08 4.15
1.17 4.30 4.41
1.25 4.56 4.53
1.33 4.35 4.61
1.42 4.48 4.47
1.50 4.35 4.63
1.58 4.41 4.47
1.67 4.41 4.58
1.75 4.62 4.60
1.83 4.40 NaN
2.00 4.59 NaN
2.08 4.76 NaN
2.17 4.75 4.61
2.25 4.94 4.71
2.33 4.88 NaN
2.42 4.75 NaN
2.50 4.85 NaN
2.83 4.88 4.93
2.92 4.75 NaN
3.00 4.93 NaN
3.08 5.09 NaN
3.83 5.12 NaN
3.92 5.03 NaN];
data.tL_fm(:,1) = 365 * data.tL_fm(:,1); 
units.tL_fm   = {'d', 'cm', 'g'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm   = C2K(18.4);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Kova2006'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 50 * weights.tL_fm;
weights.Wwi = 3 * weights.Wwi;
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

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Weight-length: Ww in g = 0.00741*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3GQ9T'; % Cat of Life
metaData.links.id_ITIS = '172117'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Gobius_vittatus'; % Wikipedia
metaData.links.id_ADW = 'Gobius_vittatus'; % ADW
metaData.links.id_Taxo = '175384'; % Taxonomicon
metaData.links.id_WoRMS = '126896'; % WoRMS
metaData.links.id_fishbase = 'Gobius-vittatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gobius_vittatus}}';
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
bibkey = 'Kova2006'; type = 'Article'; bib = [ ... 
'author = {Kova\v{c}i\''{c}, M.}, ' ... 
'year = {2006}, ' ...
'title = {Age structure, growth and mortality of the striped goby, \emph{Gobius vittatus} ({G}obiidae) in the northern {A}driatic {S}ea}, ' ...
'journal = {Sci. Mar.}, ' ...
'volume = {70(4)}, ' ...
'pages = {635-641}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kova2007'; type = 'Article'; bib = [ ... 
'author = {Kova\v{c}i\''{c}, M.}, ' ... 
'year = {2007}, ' ...
'title = {The reproductive biology of the striped goby, \emph{Gobius vittatus} ({G}obiidae) in the northern {A}driatic {S}ea}, ' ...
'journal = {Sci. Mar.}, ' ...
'volume = {71(1)}, ' ...
'pages = {145-151}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Gobius-vittatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

