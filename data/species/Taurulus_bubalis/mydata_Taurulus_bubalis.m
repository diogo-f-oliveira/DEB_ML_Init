function [data, auxData, metaData, txtData, weights] = mydata_Taurulus_bubalis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Psychrolutidae';
metaData.species    = 'Taurulus_bubalis'; 
metaData.species_en = 'Longspined bullhead'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp','piMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 10];

%% set data
% zero-variate data

data.am = 5 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'Lamp1965';   
  temp.am = C2K(9.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 11;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Lamp1965'; 
data.Li  = 17.5;     units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Lamp1965';
  comment.Wwb = 'baed on egg diameter of 1.4-1.6 mm: pi/6*0.15^3';
data.Wwp = 31;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Lamp1965';
  comment.Wwp = 'fishbase: based on 0.00794*Lp^3.12, see F1, gives 14 g';
data.Wwi = 87;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Lamp1965';
  comment.Wwi = 'fishbase: based on 0.00794*Li^3.12, see F1, gives 60 g';
 
% uni-variate data
% time-length
data.tL_f = [ ... % age (years), total length (cm) 
0.613	8.504
1.629	11.677
2.626	13.332
3.631	13.849];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(9.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Lamp1965';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % age (years), total length (cm) 
0.613	8.262
1.620	11.125
2.625	12.332
3.136	12.349];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(9.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Lamp1965';
comment.tL_m = 'data for males';

% length-weight
data.LW_f = [ ... % total length (cm), wet weight (g)
    9.5 13.5
   10.5 18.7
   11.5 23.2
   12.3 30.3
   13.9 41.1];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'wet weight', 'female'};  
bibkey.LW_f = 'Lamp1965';
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % total length (cm), wet weight (g)
    9.4 13.3
   10.3 17.8
   11.5 26.6];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'wet weight', 'male'};  
bibkey.LW_m = 'Lamp1965';
comment.LW_m = 'data for males';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#) 
    11.2 1740
    11.6 1970
    12.2 1980
    12.7 2137
    13.2 2309
    14.1 2553
    14.6 2995
    15.2 4380];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(9.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Lamp1965';

% weight-fecundity
data.WN = [ ... % weight (g), fecundity (#) 
    31.2 1855
    37.5 2038
    42.8 2053
    47.9 2228
    52.5 2468
    56.2 2713
    62.1 2920
    68.5 3535
    80.0 4490
    87.0 5050];
units.WN = {'g', '#'}; label.WN = {'weight', 'fecundity'};  
temp.WN = C2K(9.5);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'Lamp1965';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;
weights.Lp = weights.Lp * 5;

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
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: W in g = 0.00794*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '54ZDW'; % Cat of Life
metaData.links.id_ITIS = '167390'; % ITIS
metaData.links.id_EoL = '46569001'; % Ency of Life
metaData.links.id_Wiki = 'Taurulus_bubalis'; % Wikipedia
metaData.links.id_ADW = 'Taurulus_bubalis'; % ADW
metaData.links.id_Taxo = '44983'; % Taxonomicon
metaData.links.id_WoRMS = '127204'; % WoRMS
metaData.links.id_fishbase = 'Taurulus-bubalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Taurulus_bubalis}}';
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
bibkey = 'Lamp1965'; type = 'PhDthesis'; bib = [ ... 
'author = {Lamp, F.}, ' ... 
'year = {1965}, ' ...
'title = {Beiträge zur Bestandskunde und Fortpflanzungsbiologie der Seeskorpione, \emph{Myoxocephalus scorpius} (Linnaeus 1758) und \emph{Taurulus bubalis} (Euphrasen 1786) in der Kieler F\"{o}rde}, ' ...
'school = {Kiel University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Taurulus-bubalis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

