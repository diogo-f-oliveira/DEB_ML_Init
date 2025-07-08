function [data, auxData, metaData, txtData, weights] = mydata_Pseudochromis_flavivertex
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pseudochromidae';
metaData.species    = 'Pseudochromis_flavivertex'; 
metaData.species_en = 'Sunrise dottyback'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MINW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 15]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 15]; 

%% set data
% zero-variate data

data.ab = 4;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'OlivRoll2006';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.356; units.Lb  = 'cm';  label.Lb  = 'standard length at birth'; bibkey.Lb  = 'OlivRoll2006'; 
data.Lp  = 4.5; units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'OlivRoll2006'; 
  comment.Lp = '5 cm individuals are mature, but puberty is problably earlier';
data.Li  = 6.5;  units.Li  = 'cm';  label.Li  = 'ultimate standard length for females'; bibkey.Li  = 'wiki';
data.Lim  = 7.35;  units.Lim  = 'cm';  label.Lim  = 'ultimate standard length for males'; bibkey.Lim  = 'wiki';

data.Wwb = 1.3e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'OlivRoll2006';
  comment.Wwb = 'based egg diameter of 1.35 mm: 4/3*pi*0.067^3'; 
data.Wwp = 1.1; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'OlivRoll2006';
  comment.Wwp = 'based on 0.01175 * Lp^3.01, see F1';
data.Wwi = 3.3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'wiki';
  comment.Wwi = 'based on 0.01175 * Li^3.01, see F1';
data.Wwim = 4.8; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'wiki';
  comment.Wwim = 'based on 0.01175 * Li^3.01, see F1';

data.Ri = 1200/56; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'MiesGuth2004';
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '1200 eggs per ball, 1 ball per 8 weeks';

% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (d), standard length (cm)
  1 0.38
 11 0.65
 18 0.95
 22 1.20];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OlivRoll2006';

%% set weights for all real data
weights = setweights(data, []);
weight3.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am}  only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W = 0.01175*SL^3.01';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; depth range 2 - 30 m, usually 2 - 30 m.   Tropical; 24 C - 28 C';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4NTL8'; % Cat of Life
metaData.links.id_ITIS = '645975'; % ITIS
metaData.links.id_EoL = '46580269'; % Ency of Life
metaData.links.id_Wiki = 'Pseudochromis_flavivertex'; % Wikipedia
metaData.links.id_ADW = 'Pseudochromis_flavivertex'; % ADW
metaData.links.id_Taxo = '105954'; % Taxonomicon
metaData.links.id_WoRMS = '218331'; % WoRMS
metaData.links.id_fishbase = 'Pseudochromis-flavivertex'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pseudochromis_flavivertex}}';
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
bibkey = 'OlivRoll2006'; type = 'Article'; bib = [ ... 
'author = {I. Olivotto and A. Rollo and R. Sulpizio and M. Avella and L. Tosti and O. Carnevali}, ' ... 
'year = {2006}, ' ...
'title = {Breeding and rearing the Sunrise Dottyback \emph{Pseudochromis flavivertex}: the importance of live prey enrichment during larval development}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {255}, ' ...
'pages = {480-487}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MiesGuth2004'; type = 'Article'; bib = [ ... 
'author = {M. Mies and A. Z. Guth and M S. Scozzafave and P. Y. G. Sumida }, ' ... 
'year = {2004}, ' ...
'title = {Spawning behaviour and activity in seven species of ornamental dottybacks}, ' ...
'journal = {J.  Zoo and Aquarium Res}, ' ...
'volume = {2}, ' ...
'pages = {117-122}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Summary/SpeciesSummary.php?ID=12738&genusname=Pseudochromis&speciesname=flavivertex&AT=Pseudochromis+flavivertex&lang=English}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
