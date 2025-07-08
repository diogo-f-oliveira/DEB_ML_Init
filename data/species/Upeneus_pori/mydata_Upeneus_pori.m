function [data, auxData, metaData, txtData, weights] = mydata_Upeneus_pori
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Mullidae';
metaData.species    = 'Upeneus_pori'; 
metaData.species_en = 'Por''s goatfish';

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIW','MAm'};
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

data.Lp  = 10.6;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 19;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';

data.Wwb = 6.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 12.2;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00832*Lp^3.09, see F1';
data.Wwi = 74.4;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^3.09, see F1; max. published weight: 70 g';

data.Ri  = 473.5; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(19.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Upeneus_moluccensis: 170*(28/19.9)^3'; 

% uni-variate data

% time-length
data.tL_fm = [... % time (yr), total length (cm)
    1 10.4 10.2
    2 13.0 12.9
    3 14.3 14.6
    4 15.8 16.0
    5 17.2 17.4]; 
data.tL_fm(:,1) = 365 *(0.3+data.tL_fm(:,1)); %convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(19.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ElDr2013'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW_fm = [... % total length (cm), weight (g)
 7.5	 3.935  4.049
 8.5	 6.193  6.010
 9.5	 8.771  8.732
10.5	12.633 11.150
11.5	16.334 16.151
12.5	20.996 20.849
13.5	26.139 26.001
14.5	31.442 32.523
15.5	39.469 39.348
16.5	48.138 47.845
17.5	58.408 56.645]; 
units.LW_fm   = {'cm', 'g'};  label.LW_fm = {'total length','weight'};  
bibkey.LW_fm = 'ElDr2013'; treat.LW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

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
% set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight (in g) = 0.00832*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DM4K'; % Cat of Life
metaData.links.id_ITIS = '620969'; % ITIS
metaData.links.id_EoL = '46578756'; % Ency of Life
metaData.links.id_Wiki = 'Upeneus_pori'; % Wikipedia
metaData.links.id_ADW = 'Upeneus_pori'; % ADW
metaData.links.id_Taxo = '189741'; % Taxonomicon
metaData.links.id_WoRMS = '273671'; % WoRMS
metaData.links.id_fishbase = 'Upeneus-pori'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Upeneus_pori}}';
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
bibkey = 'ElDr2013'; type = 'article'; bib = [ ...
'doi = {10.1016/j.ejar.2013.11.003}, ' ...
'author = {M.A. El-Drawany}, ' ... 
'year = {2013}, ' ...
'title = {Some biological aspects of the {P}or''s goatfish, (Family: {M}ullidae) from {T}ripoli Cost of {L}ibya}, ' ...
'journal = {Egyptian Journal of Aquatic Research}, ' ...
'pages = {261-266}, ' ...
'volume = {39(4)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Upeneus-pori}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
