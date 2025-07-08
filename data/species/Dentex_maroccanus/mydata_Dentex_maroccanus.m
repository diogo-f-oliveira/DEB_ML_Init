function [data, auxData, metaData, txtData, weights] = mydata_Dentex_maroccanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Dentex_maroccanus'; 
metaData.species_en = 'Morocco dentex'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 09];

%% set data
% zero-variate data

data.ab = 13;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(13.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 17*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(13.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Dentex dentex';

data.Lp  = 15.8;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';  
data.Li  = 45;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwp = 60.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based in 0.01413*Li^3.03, see F1';
data.Wwi = 1443;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based in 0.01413*Li^3.03, see F1';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(13.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1 13.18 13.07
    2 15.98 15.93
    3 18.60 18.56
    4 20.96 20.70
    5 22.91 22.65
    6 24.69 24.74
    7 26.31 26.64];
data.tL_fm(:,1) = 365*(2.5+ data.tL_fm(:,1)); % set origin at birth
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length','females'};  
temp.tL_fm    = C2K(13.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ChemKrai2004'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 50 * weights.tL_fm;
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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01413*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '34TTZ'; % Cat of Life
metaData.links.id_ITIS = '169220'; % ITIS
metaData.links.id_EoL = '46579940'; % Ency of Life
metaData.links.id_Wiki = 'Dentex'; % Wikipedia
metaData.links.id_ADW = 'Dentex_maroccanus'; % ADW
metaData.links.id_Taxo = '172985'; % Taxonomicon
metaData.links.id_WoRMS = '273966'; % WoRMS
metaData.links.id_fishbase = 'Dentex-maroccanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dentex}}';
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
bibkey = 'ChemKrai2004'; type = 'Article'; bib = [ ... 
'author = {Chemmam-Abdelkader, B. and M.M. Kraiem and A. El Abed}, ' ... 
'year = {2004}, ' ...
'title = {\''{E}tude de l''\^{a}ge et de la croissance de deux esp\`{e}ces de dentes (\emph{Dentex dentex} et de \emph{Dentex maroccanus}) des c\^{o}tes tunisiennes}, ' ...
'journal = {Bull. Inst. Natn. Scien. Tech. Mer de Salammb\^{o}}, ' ...
'volume = {31}, ' ...
'pages = {43-51}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Dentex-maroccanus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
