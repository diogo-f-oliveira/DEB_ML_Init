function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_taczanowskii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_taczanowskii'; 
metaData.species_en = 'White-edged rockfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 03 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 8*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'Kolp2006';   
  temp.am = C2K(3.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 21;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Kolp2006';

data.Wwb = 3e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.833 mm: pi/6*0.0833^3  for Sebastes mentella';
data.Wwi = 160;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Kolp2006';

data.Ri  = 72e3/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 48.3 cm'; bibkey.Ri  = 'Kolp2006';   
temp.Ri = C2K(3.6);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
    3 12.8
    4 15.3
    5 16.7
    6 18.3
    7 19.3
    8 20.5];
data.tL_f(:,1) = 365 * (0.5 + data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(3.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Kolp2006';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
    3 14.0
    4 14.9
    5 15.9
    6 17.1
    7 18.7
    8 19.7];
data.tL_m(:,1) = 365 * (0.5 + data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(3.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Kolp2006';
comment.tL_m = 'data for males';

% time-weight
data.tW_f = [ ... % time since birth (yr), wet weight (g)
    3 37
    4 59.5
    5 81.6
    6 106.8
    7 118.1
    8 155.0];
data.tW_f(:,1) = 365 * (0.5 + data.tW_f(:,1)); % convert yr 
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f   = C2K(3.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Kolp2006';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (yr), wet weight (g)
    3 41.5
    4 45.7
    5 65.2
    6 78.4
    7 117.0
    8 120];
data.tW_m(:,1) = 365 * (0.5 + data.tW_m(:,1)); % convert yr 
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(3.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Kolp2006';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.Lp = 3 * weights.Lp;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.01';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4W7QC'; % Cat of Life
metaData.links.id_ITIS = '644601'; % ITIS
metaData.links.id_EoL = '46568202'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_taczanowskii'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_taczanowskii'; % ADW
metaData.links.id_Taxo = '187341'; % Taxonomicon
metaData.links.id_WoRMS = '274859'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-taczanowskii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_taczanowskii}}';
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
bibkey = 'Kolp2006'; type = 'Article'; bib = [ ... 
'author = {N. V. Kolpakov}, ' ... 
'year = {2006}, ' ...
'title = {On the Biology of Rockfishes \emph{Sebastes minor} and \emph{S. taczanowskii} ({S}ebastidae) from the Coastal Waters of {N}orthern {P}rimorye}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {46}, ' ...
'pages = {311-321}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-taczanowskii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
