function [data, auxData, metaData, txtData, weights] = mydata_Macrourus_berglax
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Macrourus_berglax'; 
metaData.species_en = 'Roughhead grenadier'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAN', 'MN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2019 03 13];              
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

data.am = 25*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(3.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 54.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'Muru2003 gives PL of 28.5 cm, which convert to TL of 70.1 cm';
data.Li  = 110;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2.6 mm for Coryphaenoides rupestris: pi/6*0.26^3';
data.Wwi = 9.1e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'TL=110 cm converts to PL=TL/2.46=44.7cm, see F1, and Wwi= 0.097*PL^3.0127 g';

data.Ri  = 79221/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(3.2);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on Macrourus_berglax';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), pre-anal length (cm)
  1  3.0
  2  5.6
  3  7.9
  4 10.1
  5 12.2
  6 14.0
  7 15.7
  8 17.1
  9 18.7
 10 20.2
 11 22.0
 12 23.4
 13 24.4
 14 26.1
 15 27.4
 16 28.5
 17 29.6
 18 31.3
 19 35.0
 20 31.0];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr to d
data.tL_f(:,2) = 3.54*data.tL_f(:,2); % convert pre-anal length to total length
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(3.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Muru2003';
comment.tL_f = 'data for females at Flemish Cap';
% time-length  for males
data.tL_m = [ ... % time since birth (yr), pre-anal length (cm)
  1  3.2
  2  5.6
  3  8.1
  4 10.1
  5 12.2
  6 14.1
  7 15.4
  8 16.7
  9 17.9
 10 18.5
 11 19.3
 12 20.1
 13 20.2
 14 21.3
 15 19.3
 16 21.0
 18 23.0
 20 23.0];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr to d
data.tL_m(:,2) = 3.54*data.tL_m(:,2); % convert pre-anal length to total length
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(3.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Muru2003';
comment.tL_m = 'data for males at Flemish Cap';

% time-weight for females
data.tW_f = [ ... % time since birth (yr), wet weight (g)
  3  79
  4  111
  5  183
  6  251
  7  322
  8  491
  9  622
 10  694
 11  894
 12 1111
 13 1351
 14 1583
 15 1831
 16 2203
 17 2460
 18 2772
 19 3771
 20 3911
 22 5739];
data.tW_f(:,1) = 365*data.tW_f(:,1); % convert yr to d
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f   = C2K(3.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'OrloVedi2018';
comment.tW_f = 'data for females in NE Atlantic';
% time-weight  for males
data.tW_m = [ ... % time since birth (yr), wet weight (g)
  3  114
  4  124
  5  171
  6  241
  7  326
  8  484
  9  585
 10  630
 11  703
 12  783
 13 1162];
data.tW_m(:,1) = 365*data.tW_m(:,1); % convert yr to d
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(3.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'OrloVedi2018';
comment.tW_m = 'data for males in NE Atlantic';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

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
D1 = 'Pre-anal length PL of tL-data has been converted to total length TL = 2.46 * PL based on photo';
D2 = 'males are assumed to differ from females by {p_Am} only';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'preferred temp 3.2 C; bathypelagic; depth range 100 - 1000 m, usually 300 - 500 m';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.097*(PL in cm)^3.0127';
metaData.bibkey.F2 = 'Muru2003'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6QRX9'; % Cat of Life
metaData.links.id_ITIS = '165421'; % ITIS
metaData.links.id_EoL = '46564611'; % Ency of Life
metaData.links.id_Wiki = 'Macrourus_berglax'; % Wikipedia
metaData.links.id_ADW = 'Macrourus_berglax'; % ADW
metaData.links.id_Taxo = '44414'; % Taxonomicon
metaData.links.id_WoRMS = '126472'; % WoRMS
metaData.links.id_fishbase = 'Macrourus-berglax'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macrourus_berglax}}';
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
bibkey = 'Muru2003'; type = 'Article'; bib = [ ... 
'doi = {10.1046/j.1095-8649.2003.00158.x}, ' ...
'author = {H. Murua}, ' ... 
'year = {2003}, ' ...
'title = {Population structure, growth and reproduction of roughhead grenadier on the {F}lemish {C}ap and {F}lemish {P}ass}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {63}, ' ...
'pages = {356-373}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OrloVedi2018'; type = 'Article'; bib = [ ... 
'author = {A. M. Orlova and E. V. Vedishcheva and A. O. Trofimova and S. Yu. Orlova}, ' ... 
'year = {2018}, ' ...
'title = {Growth and Age of the Roughhead Grenadier \emph{Macrourus berglax} in Waters off {S}outhwest {G}reenland}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {58}, ' ...
'pages = {389-395}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Macrourus-berglax.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

