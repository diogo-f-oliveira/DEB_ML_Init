function [data, auxData, metaData, txtData, weights] = mydata_Pontinus_kuhlii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Scorpaenidae';
metaData.species    = 'Pontinus_kuhlii'; 
metaData.species_en = 'Offshore rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 05];

%% set data
% zero-variate data

data.ab = 8.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(13.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 18*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AbelSant2001';   
  temp.am = C2K(13.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 22.6; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'MendEsta1998'; 
data.Lpm  = 29.9; units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'MendEsta1998'; 
data.Li  = 38.4;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';
data.Lim  = 52;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males'; bibkey.Lim  = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.8 mm of Sebastes auriculatus: pi/6*0.08^3'; 
data.Wwi = 732; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^3.02, see F1';

data.Ri = 6e5/365;  units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(13.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Sebastes auriculatus';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
 6 16.50 20.30
 7 22.41 23.79
 8 25.31 25.25
 9 26.85 29.11
10 26.96 31.64
11 30.65 32.12
12 31.58 34.09
13 31.50 37.44
14 35.50 39.21
15 NaN   37.58
16 NaN   38.90
17 NaN   40.00
18 NaN   41.00];
data.tL_fm(:,1) = 365 * (data.tL_fm(:,1)-3.2);  % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length', 'female'};  
temp.tL_fm    = C2K(13.9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'AbelSant2001'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.ab = 0 * weights.ab;
weights.Li = 0 * weights.Li;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'I had to subtract 3 yrs from age-estimates in tL data and to ignore Li to arrive at a reasonable fit';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01202*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '787RW'; % Cat of Life
metaData.links.id_ITIS = '166809'; % ITIS
metaData.links.id_EoL = '46567845'; % Ency of Life
metaData.links.id_Wiki = 'Pontinus'; % Wikipedia
metaData.links.id_ADW = 'Pontinus_kuhlii'; % ADW
metaData.links.id_Taxo = '184530'; % Taxonomicon
metaData.links.id_WoRMS = '127240'; % WoRMS
metaData.links.id_fishbase = 'Pontinus_kuhlii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'h274651owpublished = {\url{http://en.wikipedia.org/wiki/Platycephalus}}';
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
bibkey = 'AbelSant2001'; type = 'article'; bib = [ ... 
'author = {L\''{o}pez Abell\''{a}n, L.J. and M.T.G. Santamar\''{i}a and P. Conesa}, ' ... 
'year = {2001}, ' ...
'title = {Age and growth of \emph{Pontinus kuhlii} ({B}owdich, 1825) in the {C}anary {I}slands}, ' ...
'journal = {Sci. Mar.}, ' ...
'volume = {65(4)}, ' ...
'pages = {259-267}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MendEsta1998'; type = 'misc'; bib = [ ... 
'doi = {10.17895/ices.pub.26807491}, ' ...
'author = {Ana Mendon\c{c}a and Susana Est\''{a}cio and Helena Krug and Gui M. Menezes and Jos\''{e} Branco and M\''{a}rio R. Pinho}, ' ... 
'year = {1998}, ' ...
'title = {Reproduction Aspects Of Some Demersal Fishes Captured In {A}zores {A}rchipelago}, ' ...
'journal = {1998 ICES Annual Science Conference, Cascais, Portugal}, ' ...
'volume = {CM 1998/O:83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/latycephalus-richardsoni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
