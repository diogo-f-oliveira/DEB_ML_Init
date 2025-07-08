function [data, auxData, metaData, txtData, weights] = mydata_Hymenocephalus_italicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Hymenocephalus_italicus'; 
metaData.species_en = 'Glass-head grenadier'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 02 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.am = 9*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(12.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'DOngBasa2000'; 
  comment.Lp = 'based on ap = 3 yr, used in tL_f data and converted to TL by multiplication with 3.54';
data.Li  = 25;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2.6 mm of Coryphaenoides rupestris: pi/6*0.26^3';
data.Wwp = 3.8;   units.Wwp = 'g';  label.Wwp = 'wet weight at birth';  bibkey.Wwp = {'fishbase','DOngBasa2000'};
  comment.Wwp = 'based on 0.00229*Lp^3.09, see F2';
data.Wwi = 47.8;   units.Wwi = 'g';  label.Wwi = 'wet weight at birth';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00229*Li^3.09, see F2';

data.Ri  = 807/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(12.6);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on same weight-specific rate, compared to Coryphaenoides rupestris: (25/110)^3*68780 per yr';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), pre-anal length (mm)
0   11.5
.5  18.1
1   20.7
1.5 21.2
2   27.0
2.5 27.2
3   31.1
3.5 31.3
4   35.0
4.5 35.5
5   39.5
5.5 39.9
6   40.9
6.5 41.3
7   42.3
7.5 43.5
8   45.3
8.5 45.5
9   47.5
9.5 48.0];
data.tL_f(:,1) = 365 * (0.7 + data.tL_f(:,1)); % convert yr to d
data.tL_f(:,2) = 0.354*data.tL_f(:,2); % convert pre-anal length in mm to total length in cm
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(12.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'DOngBasa2000';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), pre-anal length (mm)
0   11.5
.5  18.1
1   20.7
1.5 21.2
2   25.0
2.5 25.7
3   30.7
3.5 30.0
4   34.9
4.5 35.4
5   39.1
5.5 40.0
6   41.0
6.5 41.3
7   42.3
7.5 43.5
8   44.5
8.5 44.5 
9   45.0];
data.tL_m(:,1) = 365 * (0.7 + data.tL_m(:,1)); % convert yr to d
data.tL_m(:,2) = 0.354*data.tL_m(:,2); % convert pre-anal length in mm to total length in cm
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(12.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'DOngBasa2000';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Pre-anal length PL of tL-data has been converted to total length TL = 3.54 * PL based on photo';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'preferred temp 12.6 C; bathypelagic; depth range 100 - 1400  m';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00229*(TL in mm)^3.09';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3NJ92'; % Cat of Life
metaData.links.id_ITIS = '165406'; % ITIS
metaData.links.id_EoL = '46564583'; % Ency of Life
metaData.links.id_Wiki = 'Hymenocephalus_(fish)'; % Wikipedia
metaData.links.id_ADW = 'Hymenocephalus_italicus'; % ADW
metaData.links.id_Taxo = '176992'; % Taxonomicon
metaData.links.id_WoRMS = '158961'; % WoRMS
metaData.links.id_fishbase = 'Hymenocephalus-italicus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hymenocephalus}}';
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
bibkey = 'DOngBasa2000'; type = 'Article'; bib = [ ...
'doi = {10.1006/jfbi.2000.1243}, ' ...
'author = {D''Onchia, G. and Basanisi, M. and Tursi, A.}, ' ... 
'year = {2000}, ' ...
'title = {Population structure, age and growth of macrourid fish from the upper slope of the {E}astern-{C}entral {M}editerranean}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {56}, ' ...
'pages = {1217-1238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Hymenocephalus-italicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

