function [data, auxData, metaData, txtData, weights] = mydata_Upeneus_japonicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Mullidae';
metaData.species    = 'Upeneus_japonicus'; 
metaData.species_en = 'Japanese goatfish';

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0pMp', 'piMcb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 19];

%% set data
% zero-variate data

data.am = 5 * 365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Sabr2006';   
  temp.am = C2K(19.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on tL data';

data.Lp  = 14;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 28;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';

data.Wwb = 6.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 37.5;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01023*Lp^3.11, see F1';
data.Wwi = 324;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.11, see F1; max. published weight: 202.00 g';

data.Ri  = 473.5; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(19.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Upeneus_moluccensis: 170*(28/19.9)^3'; 

% uni-variate data

% time-length
data.tL = [... % time (yr), total length (cm)
    1  8.09
    2 13.13
    3 18.00
    4 19.50]; 
data.tL(:,1) = 365 *(0.2+data.tL(:,1)); %convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(19.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Sabr2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
F1 = 'length-weight: weight (in g) = 0.01023*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DLS9'; % Cat of Life
metaData.links.id_ITIS = '620965'; % ITIS
metaData.links.id_EoL = '46578748'; % Ency of Life
metaData.links.id_Wiki = 'Upeneus'; % Wikipedia
metaData.links.id_ADW = 'Upeneus_japonicus'; % ADW
metaData.links.id_Taxo = '189737'; % Taxonomicon
metaData.links.id_WoRMS = '218694'; % WoRMS
metaData.links.id_fishbase = 'Upeneus-japonicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Upeneus}}';
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
bibkey = 'Sabr2006'; type = 'article'; bib = [ ... 
'author = {Manal M. Sabrah}, ' ... 
'year = {2006}, ' ...
'title = {POPULATION DYNAMICS OF \emph{Upeneus japonicus} ({U}TTUYN, 1782), FAMILY: {M}ULLIDAE, FROM THE {G}ULF OF {S}UEZ, {R}ED {S}EA, {E}GYPT. }, ' ...
'journal = {Egyptian Journal of Aquatic Research}, ' ...
'pages = {334-345}, ' ...
'volume = {32(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Upeneus-japonicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
