function [data, auxData, metaData, txtData, weights] = mydata_Sphoeroides_maculatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Tetraodontidae';
metaData.species    = 'Sphoeroides_maculatus'; 
metaData.species_en = 'Northern puffer'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 11 09];              
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

data.am = 5 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'Lycz1971';   
  temp.am = C2K(9.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'MerrLaro1977'; 
  comment.Lp = 'based on LN data';
data.Li  = 36;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 3.6e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MerrLaro1977';
  comment.Wwb = 'based on egg diameter of 0.85 - 0.91 mm: pi/6*0.088^3';
data.Wwi = 836;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02754*Li^2.88, see F1';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total lenfth (cm)
1	13.873
2	20.438
3	23.557
4	25.931];
data.tL_f(:,1) = 365 * (0.6 + data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(9.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Lycz1971';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total lenfth (cm)
1	12.616
2	18.250
3	20.857
4	22.579]; 
data.tL_m(:,1) = 365 * (0.6 + data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(9.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MerrLaro1977';
comment.tL_m = 'data for males';

% length - weight
LWN = [ ... % total length (cm), wet weight (g), fecundity (1e3 eggs)
    13.9  68  62
    14.8  73  78
    14.9  87  40.4
    15.5  98  44.6
    16.2  99  59.8
    16.9 110  84.8
    17.2 132  72.6
    18.4 130 100.8
    19.8 154 124.6
    19.8 182 143.4
    21.4 207 154.0
    22.0 207 176.0
    22.6 309 236.0
    22.9 282 236.6
    23.4 278 142.6
    23.5 312 232.4
    23.6 304 227.6
    23.7 270 293.2
    25.9 388 240.8
    26.0 495 383.8
    26.4 463 368.2
    26.5 464 449.2
    27.0 450 334.2
    28.2 501 274.8];
data.LWw = LWN(:,1:2);
units.LWw   = {'cm', 'g'};  label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'MerrLaro1977';
comment.LWw = 'sexes combined';

% length - fecundity
data.LN = LWN(:,[1 3]); data.LN(:,2) = data.LN(:,2) * 1e3;
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
bibkey.LN = 'Lycz1971';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Wwi = 0 * weights.Wwi;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length - weight: Ww in g = 0.02754 * (TL in cm)^2.88';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4Z2G8'; % Cat of Life
metaData.links.id_ITIS = '173290'; % ITIS
metaData.links.id_EoL = '46570972'; % Ency of Life
metaData.links.id_Wiki = 'Sphoeroides_maculatus'; % Wikipedia
metaData.links.id_ADW = 'Sphoeroides_maculatus'; % ADW
metaData.links.id_Taxo = '187919'; % Taxonomicon
metaData.links.id_WoRMS = '158934'; % WoRMS
metaData.links.id_fishbase = 'Sphoeroides-maculatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sphoeroides_maculatus}}';
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
bibkey = 'Lycz1971'; type = 'phdthesis'; bib = [ ... 
'doi = {10.25773/v5-g70a-mf72}, ' ...
'author = {Joanne Lyczkowski-Shultz}, ' ... 
'year = {1971}, ' ...
'volume = {Paper 1539617435}, ' ...
'title = {Age and Growth of the Northern Puffer, \emph{Sphoeroides maculatus} (Bloch and Schneider)}, ' ...
'school = {College of William and Mary - Virginia Institute of Marine Science}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MerrLaro1977'; type = 'article'; bib = [ ...  
'author = {John V. Merriner and Joanne L. Laroche}, ' ...
'year = {1977}, ' ...
'title  = {Fecundity of the Northern Puffer, \emph{Sphoeroides maculatus}, from {C}hesapeake {B}ay}, ' ...
'journal = {Chesapeake Science}, ' ...
'volume = {18(1)}, ' ...
'pages = {81-83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sphoeroides-maculatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

