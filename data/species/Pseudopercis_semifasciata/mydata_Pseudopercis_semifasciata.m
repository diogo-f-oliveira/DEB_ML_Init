function [data, auxData, metaData, txtData, weights] = mydata_Pseudopercis_semifasciata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Uranoscopiformes'; 
metaData.family     = 'Pinguipedidae';
metaData.species    = 'Pseudopercis_semifasciata'; 
metaData.species_en = 'Argentinian sandperch'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 01 01]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 28*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Gonz2006';   
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 37;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Gonz2006'; 
data.Li  = 125;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'Gonz2006';
data.Limy  = 93;  units.Limy  = 'cm';  label.Limy  = 'ultimate total length for yellow males'; bibkey.Limy  = 'Gonz2006';
data.Limg  = 140;  units.Limg  = 'cm';  label.Limg  = 'ultimate total length for gray males'; bibkey.Limg  = 'Gonz2006';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.9 mm: pi/6*0.09^3'; 
data.Wwp  = 605;  units.Wwp  = 'g';  label.Wwp  = 'weight at puberty'; bibkey.Wwp  = 'Gonz2006';
  comment.Wwp = 'based on 0.00997*Lp^3.05, see F1';
data.Wwi  = 24.8e3;  units.Wwi  = 'g';  label.Wwi  = 'ultimate weight for females'; bibkey.Wwi  = 'Gonz2006';
  comment.Wwi = 'based on 0.00997*Li^3.05, see F1';
data.Wwimy  = 10e3;  units.Wwimy  = 'g';  label.Wwimy  = 'ultimate weight for yellow males'; bibkey.Wwimy  = 'Gonz2006';
  comment.Wwimg = 'based on 0.00997*Limy^3.05, see F1';
data.Wwimg  = 35e3;  units.Wwimg  = 'g';  label.Wwimg  = 'ultimate weight for gray males'; bibkey.Wwimg  = 'Gonz2006';
  comment.Wwimg = 'based on 0.00997*Limg^3.05, see F1';

data.Ri = 7e5/365;  units.Ri = '#/d';    label.Ri = 'max reproduction rate';  bibkey.Ri = 'guess';   
  temp.Ri = C2K(16);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.95; Gonz2006 mentions low fecundity';

% uni-variate data
% time-length
data.tL_f = [  ... % yr class (yr), total length (cm)
     0   7.3
     1  22.0
     2  30.4
     3  36.6
     4  41.4
     5  45.0
     6  50.2
     7  54.5
     8  58.1
     9  63.2
    10  67.5
    11  77.2
    12  76.7
    13  83.3
    14  81.4
    15  90.0
    16  89.8
    17  97.3
    18 103.3
    19  80.2
    20  92.7
    21  95.0
    22  90.0
    23  89.2
    24 101.5
    28 110.0];
data.tL_f(:,1) = 365 * (0.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(16);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Gonz2006';
comment.tL_f = 'data for females';
%
data.tL_my = [  ... % yr class (yr), total length (cm)
     0  7.0
     1 20.9
     2 29.2
     3 36.5
     4 43.1
     5 46.9
     6 52.3
     7 57.2
     8 59.3
     9 65.1
    10 74.7
    11 59.7
    12 67.3
    14 80.5];
data.tL_my(:,1) = 365 * (0.5 + data.tL_my(:,1)); % convert yr to d
units.tL_my   = {'d', 'cm'};  label.tL_my = {'time since birth', 'total length', 'yellow male'};  
temp.tL_my    = C2K(16);  units.temp.tL_my = 'K'; label.temp.tL_my = 'temperature';
bibkey.tL_my = 'Gonz2006';
comment.tL_my = 'data for yellow males';
%
data.tL_mg = [  ... % yr class (yr), total length (cm)
     3  40.3
     4  46.7
     5  47.4
     6  63.9
     7  63.3
     8  70.4
     9  79.5
    10  81.8
    11  84.7
    12  89.1
    13  88.4
    14 101.3
    16  87.5
    17 113.8
    18 115.0
    19 108.7
    20 117.5
    21 118.0
    22 122.0
    23 118.0
    24 123.5
    25 120.0
    26 112.5];
data.tL_mg(:,1) = 365 * (0.5 + data.tL_mg(:,1)); % convert yr to d
units.tL_mg   = {'d', 'cm'};  label.tL_mg = {'time since birth', 'total length', 'gray male'};  
temp.tL_mg    = C2K(16);  units.temp.tL_mg = 'K'; label.temp.tL_mg = 'temperature';
bibkey.tL_mg = 'Gonz2006';
comment.tL_mg = 'data for gray males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_my = 5 * weights.tL_my;
weights.tL_mg = 5 * weights.tL_mg;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
%% Group plots
set1 = {'tL_f','tL_my','tL_mg'}; subtitle1 = {'Data females, yellow and gray males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Yellow and grey males and females are assumed to differ in {p_Am} only';
D2 = 'Temperatures are guessed, vaying from 11 to 18 C over seasons';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00997*(TL in cm)^3.05';
metaData.bibkey.F1 = 'Gonz2006'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4P6F4'; % Cat of Life
metaData.links.id_ITIS = '630463'; % ITIS
metaData.links.id_EoL = '46573471'; % Ency of Life
metaData.links.id_Wiki = 'Pseudopercis'; % Wikipedia
metaData.links.id_ADW = 'Pseudopercis_semifasciata'; % ADW
metaData.links.id_Taxo = '185249'; % Taxonomicon
metaData.links.id_WoRMS = '282463'; % WoRMS
metaData.links.id_fishbase = 'Pseudopercis-semifasciata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudopercis_semifasciata}}';
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
bibkey = 'Gonz2006'; type = 'Article'; bib = [ ... 
'author = {Ra\''{u}l A.C. Gonz\''{a}alez}, ' ... 
'year = {2006}, ' ...
'title = {Age and growth of the {A}rgentine Sandperch \emph{Pseudopercis semifasciata} ({C}uvier, 1829) {B}erg, 1899 in the {S}an {M}at\''{i}?as {G}ulf ({P}atagonia, {A}rgentina)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {79}, ' ...
'pages = {120-128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Pseudopercis-semifasciata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

