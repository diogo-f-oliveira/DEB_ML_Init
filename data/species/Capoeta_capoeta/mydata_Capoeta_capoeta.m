  function [data, auxData, metaData, txtData, weights] = mydata_Capoeta_capoeta

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Capoeta_capoeta'; 
metaData.species_en = 'Caucasian scraper'; 

metaData.ecoCode.climate = {'BSk', 'BWk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};        
metaData.date_subm   = [2018 12 22];                           
metaData.email       = {'bas.kooijman@vu.nl'};                 
metaData.address     = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 22]; 

%% set data
% zero-variate data
data.am = 12*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'TurkErdo2002';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'observed max age';

data.Lp = 20.9;  units.Lp = 'cm'; label.Lp = 'fork length at puberty for females'; bibkey.Lp = 'TurkErdo2002';
data.Lpm = 16.9; units.Lpm = 'cm'; label.Lpm = 'fork length at puberty for males'; bibkey.Lpm = 'TurkErdo2002';
data.Li = 46.7;    units.Li = 'cm'; label.Li = 'ultimate fork length';             bibkey.Li = 'fishbase';
  comment.Li = 'TL 50 cm, corresponding with FL 46.7 cm, based on photo';

data.Wwb = 2.6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'TurkErdo2002';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';

data.Ri = 35859/365; units.Ri = '#/d';  label.Ri = 'reprod rate for FL 40.2 cm';  bibkey.Ri = 'TurkErdo2002';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
 1 10.4
 2 14.8
 3 18.5
 4 21.5
 5 25.7
 6 28.5
 7 31.3
 8 33.1
 9 34.2
10 35.2
11 38.7
12 40.2];
data.tL_f(:,1) = 365 * (0.75+data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TurkErdo2002';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
 1 10.9
 2 15.7
 3 18.8
 4 21.7
 5 24.6
 6 27.3
 7 29.4
 8 31.0
 9 32.3
10 35.6];
data.tL_m(:,1) = 365 * (0.75+data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TurkErdo2002';
comment.tL_m = 'data for males';

% time-weight
data.tW_f = [ ... % time since birth (yr), wet weight (g)
 1  15
 2  43
 3  82
 4 134
 5 213
 6 292
 7 398
 8 496
 9 557
10 601
11 853
12 950];
data.tW_f(:,1) = 365 * (0.75+data.tW_f(:,1)); % convert yr to d
units.tW_f = {'d', 'g'}; label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f = C2K(18);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'TurkErdo2002';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (yr), wet weight (g)
 1  18
 2  50
 3  85
 4 134
 5 193
 6 262
 7 332
 8 382
 9 428
10 593];
data.tW_m(:,1) = 365 * (0.75+data.tW_m(:,1)); % convert yr to d
units.tW_m = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m = C2K(18);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'TurkErdo2002';
comment.tW_m = 'data for males';

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'tL and tW data suggests an increasing food density, which is taken into account';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '5X9LR'; % Cat of Life
metaData.links.id_ITIS = '688838'; % ITIS
metaData.links.id_EoL = '1156460'; % Ency of Life
metaData.links.id_Wiki = 'Capoeta_capoeta'; % Wikipedia
metaData.links.id_ADW = 'Capoeta_capoeta'; % ADW
metaData.links.id_Taxo = '43827'; % Taxonomicon
metaData.links.id_WoRMS = '1026485'; % WoRMS
metaData.links.id_fishbase = 'Capoeta-capoeta'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Capoeta_capoeta}}';  
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
bibkey = 'TurkErdo2002'; type = 'article'; bib = [ ...  
'author = {Mustafa T\"{u}rkmen and Orhan Erdogan and Ayhan Yildirim and Ihsam Akyurt}, ' ...
'year = {2002}, ' ...
'title = {Reproduction tactics, age and growth of \emph{Capoeta capoeta umbla} {H}eckel 1843 from the A\c{s}kale {R}egion of the {K}arasu {R}iver, {T}urkey}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = {54}, '...
'pages = {317-328}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Capoeta-capoeta.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

