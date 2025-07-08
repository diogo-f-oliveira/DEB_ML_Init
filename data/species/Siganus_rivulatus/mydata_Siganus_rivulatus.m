function [data, auxData, metaData, txtData, weights] = mydata_Siganus_rivulatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siganiformes'; 
metaData.family     = 'Siganidae';
metaData.species    = 'Siganus_rivulatus'; 
metaData.species_en = 'Marbled spinefoot'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'aj';'am'; 'L0'; 'Lh';'Lj';'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'JX_L'}; 
metaData.data_1     = {'t-L'; 'L-W'; 'L-N'; 'W-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author_mod_1   = {'Evridiki Klagkou','Orestis Stavrakidis-Zachou','Eleni Livanou','Dina Lika'};    
metaData.date_mod_1     = [2024 06 26];              
metaData.email_mod_1    = {'lika@uoc.gr'};            
metaData.address_mod_1  = {'University of Crete, UoC'};   

metaData.author      = {'Bas Kooijman'};
metaData.date_subm   = [2018 12 22]; 
metaData.email       = {'bas.kooijman@vu.nl'}; 
metaData.address     = {'VU University Amsterdam'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2024 06 27]; 

%% set data
% zero-variate data
data.ah = 30/24;  units.ah = 'd';    label.ah = 'age at hatch';             bibkey.ah = 'PoppGord1973';   
  temp.ah = C2K(26);  units.temp.ah = 'K'; label.temp.ah = 'temperature'; 
data.ab = 98/24;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'PoppGord1973';   
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tj = 32;    units.tj = 'd';    label.tj = 'time at metamorphosis';               bibkey.tj = 'StepGeor2000';   
  temp.tj = C2K(24);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Bari2005';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.L0  = 0.063;  units.L0  = 'cm';   label.L0  = 'egg length'; bibkey.L0  = 'StepGeor2000';
    comment.L0 = 'original unit μm; egg diameter between 630 μm';  
data.Lh = 0.18; units.Lh = 'cm'; label.Lh = 'length at hatch'; bibkey.Lh = 'StepGeor2000';
data.Lj  = 2.5; units.Lj  = 'cm';  label.Lj  = 'total length at metamorphosis'; bibkey.Lj  = 'StepGeor2000'; 
data.Lp  = 13.7; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 27;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'SoykGuls2021';

data.Wwb = 8.7e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on assumed egg diameter of 0.55 mm: pi/6*0.055^3'; 
data.Wwp = 31.3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'MarzJaya2011';
  comment.Wwp = 'based on 0.01318*Lp^2.97, see F1';
data.Wwi = 350; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'StepGeor2000';

data.Ri = 709e3/365;  units.Ri = '#/d';    label.Ri = 'max reprodion rate';   bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

data.JX_L = 3.54/70; units.JX_L = 'g/fish/d'; label.JX_L = 'food uptake'; bibkey.JX_L = 'AbdeRaga2017';
  temp.JX_L = C2K(28); units.temp.JX_L = 'K'; label.temp.JX_L = 'temperature'; 
  length.JX_L = 2.76; units.length.JX_L = 'cm'; label.length.JX_L = 'length';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1  8.45
    2 11.96
    3 14.68
    4 15.58
    5 17.29
    6 18.96
    7 20.10
    8 20.41];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
bibkey.tL = 'BileKaya2002';
%
tT = [... % Month,    Temperatrue (°C)
   0   C2K(24.76633)  % June
   1   C2K(27.4634)   % July
   2   C2K(28.2912)   % August
   3   C2K(25.6730)   % September
   4   C2K(23.5971)   % October
   5   C2K(21.6984)   % November
   6   C2K(19.9398)   % December
   7   C2K(19.1080)   % January
   8   C2K(17.7233)   % February
   9   C2K(16.6937)   % March
   10  C2K(16.5541)   % April
   11  C2K(21.27129)];% May
tT_months = 30 * tT(:,1);
tT = [tT; tT; tT; tT; tT; tT; tT; tT]; % 8 years, same temp
tT(:,1) = [tT_months; 360+tT_months; 2*360+tT_months; 3*360+tT_months; 4*360+tT_months; 5*360+tT_months; 6*360+tT_months; 7*360+tT_months]; % 8 years, same temp
temp.tL = tT;  units.temp.tL = 'K'; label.temp.tL = 'temperature';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
     7     3.2
     7.1   3.7
    20.6  101.2
    21.5  128.7];
units.LW  = {'cm','g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'BileKaya2002';

% time-length
data.tL_1 = [ ... time since birth (d), length (cm)
    0	2.53
    0	2.88
    0	3.58
    0	4.01
    0	4.36
    0	4.70
    0	6.00
    0	7.22
    0	7.22
    1	7.06
    1	8.37
    1	8.89
    1	9.41
    1	9.93
    1	10.53
    1	11.23
    2	11.07
    2	11.68
    2	12.38
    2	13.33
    2	13.85
    2	14.11
    2	15.24
    2	15.76
    2	16.89
    2	17.49
    3	18.12
    3	18.90
    3	19.51
    3	19.68
    3	20.46
    3	20.46
    3	21.24
    3	21.85
    3	22.37
    4	21.87
    4	23.00
    4	23.52
    5	24.06
    5	24.40
    5	25.71
    6	25.72
    6	26.07
    6	27.03];
data.tL_1(:,1) = 365 * data.tL_1(:,1);  % convert yr to d
units.tL_1  = {'d', 'cm'};  label.tL_1 = {'time since birth', 'total length'};  
bibkey.tL_1 = 'Bari2005';
%
tT_1 = [... % Month,    Temperatrue (°C)
   0   C2K(24.4354057312012)  % June
   1   C2K(26.909460067749)   % July
   2   C2K(29.3357830047607)  % August
   3   C2K(28.4272575378418)  % September
   4   C2K(25.6035766601562)  % October
   5   C2K(24.0625247955322)  % November
   6   C2K(21.4332599639893)  % December
   7   C2K(19.1896553039551)  % January
   8   C2K(17.7420177459716)  % February
   9   C2K(17.5158004760742)  % March
   10  C2K(18.1306419372558)  % April
   11  C2K(21.5814533233643)];% May
tT_months_1 = 30 * tT_1(:,1);
tT_1 = [tT_1; tT_1; tT_1; tT_1; tT_1; tT_1]; % 6 years, same temp
tT_1(:,1) = [tT_months_1; 360+tT_months_1; 2*360+tT_months_1; 3*360+tT_months_1; 4*360+tT_months_1; 5*360+tT_months_1]; % 6 years, same temp
temp.tL_1 = tT_1;  units.temp.tL_1 = 'K'; label.temp.tL_1 = 'temperature';
%
data.tL_2 = [... time since birth (d), total length (cm)
    1	10.62
    2	17.28
    3	21.78
    4	26.66
    5	28.81];
data.tL_2(:,1) = 365 * data.tL_2(:,1);  % convert yr to d
units.tL_2  = {'d', 'cm'};  label.tL_2 = {'time since birth', 'total length'};  
bibkey.tL_2 = 'GabrBaka2018';
%
tT_2 = [... % Month,    Temperatrue (°C)
   0   C2K(28.6273555755615)    % June
   1   C2K(29.6908054351807)    % July
   2   C2K(30.4920959472656)    % August
   3   C2K(29.8336181640625)    % September
   4   C2K(29.7049980163574)    % October
   5   C2K(29.65185546875)      % November
   6   C2K(27.6620044708252)    % December
   7   C2K(26.2720508575439)    % January
   8   C2K(25.8177032470703)    % February
   9   C2K(26.1369800567627)    % March
   10  C2K(26.8899040222168)    % April
   11  C2K(28.0264492034912)];  % May
tT_months_2 = 30 * tT_2(:,1);
tT_2 = [tT_2; tT_2; tT_2; tT_2; tT_2]; % 5 years, same temp
tT_2(:,1) = [tT_months_2; 360+tT_months_2; 2*360+tT_months_2; 3*360+tT_months_2; 4*360+tT_months_2]; % 5 years, same temp
temp.tL_2 = tT_2;  units.temp.tL_2 = 'K'; label.temp.tL_2 = 'temperature';

data.LN = [ ... length(cm), fecundity (#)
    16.02	85714.29
    17.99	125000.00
    18.99	144642.86
    19.99	285714.29
    20.99	305357.14
    22.01	317857.14
    23.00	453571.43
    24.05	535714.29
    25.05	439285.71];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(22); units.temp.LN= 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'BariSade2009';
comment.LN = 'temp is an average of the area, 1 spawning a year';

data.LN_1 = [ ... length(cm), fecundity (#)
    16.49	93913.04
    19.77	138260.87
    22.83	101739.13
    24.35	140869.57
    24.39	151304.35
    24.28	172173.91
    24.43	193043.48
    24.61	182608.70
    25.17	221739.13
    25.55	320869.57
    25.47	206086.96
    25.81	200869.57
    26.96	237391.30
    27.45	240000.00
    27.82	292173.91
    28.27	284347.83
    28.71	328695.65
    28.79	284347.83
    30.50	247826.09
    31.96	487826.09];
units.LN_1  = {'cm', '#'};  label.LN_1 = {'total length', 'fecundity'};  
temp.LN_1 = C2K(22); units.temp.LN_1= 'K'; label.temp.LN_1 = 'temperature';
bibkey.LN_1 = 'Shak2008';
comment.LN_1 = 'temp is an average of the area at the time of study, 1 spawning a year';

% weight-fecundity
data.WN = [... total weight (g), fecundity (#)
    75.32	97797.36
    111.86	140088.11
    191.96	103083.70
    194.86	198237.89
    214.71	148017.62
    228.53	153303.96
    242.44	182378.85
    237.53	206167.40
    241.34	219383.26
    251.19	174449.34
    307.91	245814.98
    296.47	208810.57
    320.77	322466.96
    349.44	280176.21
    369.34	243171.81
    392.12	293392.07
    407.12	280176.21
    432.45	340969.16
    441.89	499559.47
    494.81	261674.01];
units.WN  = {'g', '#'};  label.WN = {'total weight', 'fecundity'};  
bibkey.WN = {'Shak2008'};

data.TjO = [ ... % temp (C), metabolic scope (mg O2/h.kg)
       20.1281	562.7907
       22.8018	641.8605
       25.7636	790.6977
       29.0237	837.2093
       31.8036	772.0930];
units.TjO  = {'C', 'mg O2/h.kg'};  label.TjO = {'temp', 'metabolic scope'};  
bibkey.TjO = 'Marras2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tL_1 = 3 * weights.tL_1;
weights.tL_2 = 3 * weights.tL_2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.length = length;
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures, when not specified, are the average of the area at the time of study';
D2 = 'for the tL data, average monthly temperatures were used as described in Stavrakidis et al. (2024)';
D3 = 'The estimation for the temperature parameters (T_A, T_H, T_AH) was performed seperately using the Marras et al. (2015) data and a reference temperature of 16.85oC';
D4 = 'For the data from StepGeor2000 a functional response of f=1.2 was used as the experiment was controlled and the diet was optimal';
D5 = 'mod1: New data added';
metaData.discussion = struct('D1', D1, 'D2',D2, 'D3', D3, 'D4', D4, 'D5', D5);

%% Facts
F1 = 'weight-length relationship: W in g = 0.01318*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 1 - 30 m. Subtropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6YN5N'; % Cat of Life
metaData.links.id_ITIS = '172346'; % ITIS
metaData.links.id_EoL = '46577144'; % Ency of Life
metaData.links.id_Wiki = 'Siganus_rivulatus'; % Wikipedia
metaData.links.id_ADW = 'Siganus_rivulatus'; % ADW
metaData.links.id_Taxo = '46750'; % Taxonomicon
metaData.links.id_WoRMS = '127045'; % WoRMS
metaData.links.id_fishbase = 'Siganus-rivulatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Siganus_rivulatus}}';
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
bibkey = 'AbdeRaga2017'; type = 'Article'; bib = [ ... 
'author = {Abdel-Aziz, M. F.A. and Ragab, M. A.}, ' ... 
'year = {2017}, ' ...
'title = {Effect of Use Fresh Macro Algae (Seaweed) \emph{Ulva fasciata} and \emph{Enteromorpha flaxusa} With or Without Artificial Feed on Growth Performance and Feed Utilization of Rabbitfish (\emph{Siganus rivulatus}) fry}, ' ...
'journal = {J. Aquac. Res. Development}, ' ...
'volume = {8}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bari2005'; type = 'Article'; bib = [ ... 
'author = {Bariche, M.}, ' ... 
'year = {2005}, ' ...
'title = {Age and growth of {L}essepsian rabbitfish from the eastern {M}editerranean}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {21}, ' ...
'pages = {141–145}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BariSade2009'; type = 'Article'; bib = [ ... 
'author = {Bariche, M. and Sadek, R. and Azzuro, E.}, ' ... 
'year = {2009}, ' ...
'title = {Fecundity and condition of succesful invaders: \emph{Siganus rivulatus} and \emph{S. luridus}({A}ctinoterygii:Perciformes:Siganidae) in the {E}astern {M}editerranean {S}ea}, ' ...
'journal = {Acta Ichthyologica et piscatoria}, ' ...
'volume = {39}, ' ...
'pages = {11-18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BileKaya2002'; type = 'Article'; bib = [ ... 
'author = {Bilecenoglu, M. and Kaya, M.}, ' ... 
'year = {2002}, ' ...
'title = {Growth of the marbled spinefoot \emph{Siganus rivulatus} {F}orssk\o{a}l, 1775 ({T}eleostei: {S}iganidae) introduced to {a}ntalya {B}ay, eastern {M}editerranean {S}ea ({T}urkey)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {54}, ' ...
'pages = {279--285}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Siganus-rivulatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GabrBaka2018'; type = 'Article'; bib = [ ... 
'author = {Gabr, M. H. and Bakaili, A. S. and Mal, A. O.}, ' ... 
'year = {2018}, ' ...
'title = {Growth, mortality and yield per recruit of the rabbit fish \emph{Siganus rivulatus} ({F}orsskål 1775) in the red sea coast of {J}eddah, {S}audi {A}rabia}, ' ...
'journal = {International Journal of Fisheries and Aquatic Studies}, ' ...
'volume = {6}, ' ...
'pages = {87-96}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Marras2015'; type = 'article'; bib = [ ...  
'author = {Marras, S. and Cucco, A. and Antognarelli, F. and Azzurro, E. and Milazzo, M. and Bariche, M. and Butensch\ddot{o}m, M. and Kay, S. and Di Bitetto, M. and Quattrocchi, G. and Sinerchia, M. and Domenici, P.}, ' ...
'year = {2015}, ' ...
'title  = {Predicting future thermal habitat suitability of competing native and invasive fish species: from metabolic scope to oceanographic modelling}, ' ...
'journal = {Conservation Physiology}, ' ...
'volume = {3} '];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MarzJaya2011'; type = 'article'; bib = [ ...  
'author = {Al-Marzouqi, A. and Jayabalan, N. and Al-Anbory, I.}, ' ...
'year = {2011}, ' ...
'title  = {Reproductive Biology of the White-spotted Rabbitfish, \textit{Siganus canaliculatus} ({P}ark, 1797) in the {A}rabian Sea coast of {O}man}, ' ...
'journal = {Western Indian Ocean J. Mar. Sci.}, ' ...
'volume = {10}, '...
'pages = {73-82}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PoppGord1973'; type = 'Article'; bib = [ ... 
'author = {Popper, D. and Gordin, H. and Kissil, G. Wm.}, ' ... 
'year = {1973}, ' ...
'title = {Fertilization and hatching of rabbitfish \textit{Siganus rivulatus}}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {2}, ' ...
'pages = {37-44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shak2008'; type = 'MSc thesis'; bib = [ ... 
'author = {Shakman, E.}, ' ... 
'year = {2008}, ' ...
'title = {Lessepsian Migrant fish Species of the Coastal Waters of {L}ibya: {S}tatus, {B}iology, {E}cology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SoykGuls2021'; type = 'article'; bib = [ ...  
'author = {Soykan, O. and G\"{u}l\c{s}ahin, A.  and Cerim, H}, ' ...
'year = {2021}, ' ...
'title  = {Maximum size of marbled spinefoot (\textit{Siganus rivulatus} {F}orsskal \& {N}iebuhr, 1775) for {A}egean sea.}, ' ...
'journal = {Aquat. Sci. Eng.}, ' ...
'volume = {36}, '...
'pages = {42-45}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StavKlag2024'; type = 'article'; bib = [ ...  
'author = {Stavrakidis-Zachou, O. and Klagkou, E. and  Livanou, E. and Lika, K.}, ' ...
'year = {2024}, ' ...
'title  = {Modeling the bioenergetics of two herbivorous fish species in the {M}editerranean sea: the native \textit{Sarpa salpa} and the invasive \textit{Siganus rivulatus}}, ' ...
'journal = {Ecol. Model.}, ' ...
'volume = {}, '...
'pages = {}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StepGeor2000'; type = 'Article'; bib = [ ... 
'author = {Stephanou D., Georgiou G.}, ' ... 
'year = {2000}, ' ...
'title = {Recent experiences on the culture of rabbitfish \emph{Siganus rivulatus} in {C}yprus}, ' ...
'journal = {Cahiers Options Méditerranéennes}, ' ...
'volume = {47}, ' ...
'pages = {295-301}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

