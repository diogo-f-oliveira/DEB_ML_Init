function [data, auxData, metaData, txtData, weights] = mydata_Gammarus_pseudolimnaeus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Amphipoda'; 
metaData.family     = 'Gammaridae';
metaData.species    = 'Gammarus_pseudolimnaeus'; 
metaData.species_en = 'Northern spring amphipod'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'L-N_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Nika Galic'};    
metaData.date_subm = [2013 05 09];              
metaData.email    = {'ngalic@gmail.com'};            
metaData.address  = {'School Biol. Sci., Univ. Nebraska-Lincoln, USA'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 02 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 28]; 

%% set data
% zero-variate data

data.ab = 25;       units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'HyneHarp1972';   
  temp.ab = C2K(12);units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 130;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(15);units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'approximate for Gammarus pulex (cannot find anything for pseudolimnaeus)';
data.am = 460;      units.am = 'd';    label.am = 'life span';                bibkey.am = 'HyneHarp1972';   
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.19;    units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'WateHoke1980';
data.Lp  = 0.7;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'WateHoke1980';
data.Li  = 1.6;     units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'WateHoke1980';

data.Wdb = 2e-5;    units.Wdb = 'g';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'WateHoke1980';
data.Wdp = 1.53e-3; units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'WateHoke1980';
data.Wdi = 1.15e-2; units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'WateHoke1980';

data.Ri  = 135/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'HyneHarp1972';   
  temp.Ri = C2K(8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'HyneHarp1972 - averaged from field data;number dependent on female size; HyneHarp1972 state that the biotic potential is 135 eggs per female (was 44), divided in 3 batches (assumption)';               %               

% uni-variate data
% L-N data at several temperatures
data.LN_12 = [ ... % length (mm), # of eggs (#)
             8  6.4;
             9 11.5;
            10 17;
            11 21.1;
            12 27.6;
            13 30.7;
            14 35;
            15 38.5;
            16 28.5 ];
data.LN_12(:,1) = data.LN_12(:,1)/10; % convert mm to cm
units.LN_12   = {'cm', '#'};  label.LN_12 = {'length', 'number of eggs per brood', '12 C'};  
temp.LN_12    = C2K(12);  units.temp.LN_12 = 'K'; label.temp.LN_12 = 'temperature';
bibkey.LN_12 = 'Mill1982';
%
data.LN_11 = [ ... % length (mm), # of eggs (#)
             8   0
             9  13
             10 27
             11 38
             12 56
             13 64
             14 66
             15  0  ];
data.LN_11(:,1) = data.LN_11(:,1)/10; % convert mm to cm
units.LN_11   = {'cm', '#'};  label.LN_11 = {'length', 'number of eggs per brood', '11 C'};  
temp.LN_11    = C2K(11);  units.temp.LN_11 = 'K'; label.temp.LN_11 = 'temperature';
bibkey.LN_11 = 'HyneHarp1972';
%
data.LN_13 = [ ... % length (mm), # of eggs (#)
             8   0
             9  28
             10 35
             11 40
             12 53
             13 55
             14 46
             15  0  ];   
data.LN_13(:,1) = data.LN_13(:,1)/10; % convert mm to cm
units.LN_13   = {'cm', '#'};  label.LN_13 = {'length', 'number of eggs per brood', '13.5 C'};  
temp.LN_13    = C2K(13.5);  units.temp.LN_13 = 'K'; label.temp.LN_13 = 'temperature';
bibkey.LN_13 = 'HyneHarp1972';
%
data.LN_19 = [ ... % length (mm), # of eggs (#)
             8   0
             9  16
             10 23
             11 35
             12 40  
             13 38
             14 46
             15  0  ];
data.LN_19(:,1) = data.LN_19(:,1)/10; % convert mm to cm
units.LN_19   = {'cm', '#'};  label.LN_19 = {'length', 'number of eggs per brood', '19.5 C'};  
temp.LN_19    = C2K(19.5);  units.temp.LN_19 = 'K'; label.temp.LN_19 = 'temperature';
bibkey.LN_19 = 'HyneHarp1972';
%
data.LN_18 = [ ... % length (mm), # of eggs (#)
             8  10
             9  12
             10 17
             11 18
             12 35
             13 14
             14  0
             15  0  ];
data.LN_18(:,1) = data.LN_18(:,1)/10; % convert mm to cm
units.LN_18   = {'cm', '#'};  label.LN_18 = {'length', 'number of eggs per brood', '18 C'};  
temp.LN_18    = C2K(18);  units.temp.LN_18 = 'K'; label.temp.LN_18 = 'temperature';
bibkey.LN_18 = 'HyneHarp1972';
%
data.LN_112 = [ ... % length (mm), # of eggs (#)
             8   0
             9   0
             10  0
             11 16
             12 15
             13  0
             14 36
             15  0  ];
data.LN_112(:,1) = data.LN_112(:,1)/10; % convert mm to cm
units.LN_112   = {'cm', '#'};  label.LN_112 = {'length', 'number of eggs per brood', '11.2 C'};  
temp.LN_112    = C2K(11.2);  units.temp.LN_112 = 'K'; label.temp.LN_112 = 'temperature';
bibkey.LN_112 = 'HyneHarp1972';
%
data.LN_0 = [ ... % length (mm), # of eggs (#)
             8   0
             9   0
             10  0
             11 11
             12 36
             13 43
             14 64
             15  0  ];
data.LN_0(:,1) = data.LN_0(:,1)/10; % convert mm to cm
units.LN_0   = {'cm', '#'};  label.LN_0 = {'length', 'number of eggs per brood', '0 C'};  
temp.LN_0    = C2K(0);  units.temp.LN_0 = 'K'; label.temp.LN_0 = 'temperature';
bibkey.LN_0 = 'HyneHarp1972';
%
data.LN_3 = [ ... % length (mm), # of eggs (#)
             8   0
             9  34
             10 39
             11 47
             12 58
             13 62
             14  0
             15  0  ]; 
data.LN_3(:,1) = data.LN_3(:,1)/10; % convert mm to cm
units.LN_3   = {'cm', '#'};  label.LN_3 = {'length', 'number of eggs per brood', '3 C'};  
temp.LN_3    = C2K(3);  units.temp.LN_3 = 'K'; label.temp.LN_3 = 'temperature';
bibkey.LN_3 = 'HyneHarp1972';
%
data.LN_6 = [ ... % length (mm), # of eggs (#)
             8   0
             9  28
             10 35
             11 48
             12 52
             13 66
             14  0
             15 27  ];
data.LN_6(:,1) = data.LN_6(:,1)/10; % convert mm to cm
units.LN_6   = {'cm', '#'};  label.LN_6 = {'length', 'number of eggs per brood', '6 C'};  
temp.LN_6    = C2K(6);  units.temp.LN_6 = 'K'; label.temp.LN_6 = 'temperature';
bibkey.LN_6 = 'HyneHarp1972';
%
data.LN_16 = [ ... % length (mm), # of eggs (#)
             8  15
             9  28
             10 38
             11 48
             12 57
             13 67
             14 49
             15  0  ];
data.LN_16(:,1) = data.LN_16(:,1)/10; % convert mm to cm
units.LN_16   = {'cm', '#'};  label.LN_16 = {'length', 'number of eggs per brood', '16 C'};  
temp.LN_16    = C2K(16);  units.temp.LN_16 = 'K'; label.temp.LN_16 = 'temperature';
bibkey.LN_16 = 'HyneHarp1972';

%% set weights for all real data
weights = setweights(data, []);
weights.LN_19(data.LN_19(:,2) == 0) = 0;
weights.LN_18(data.LN_18(:,2) == 0) = 0;
weights.LN_16(data.LN_16(:,2) == 0) = 0;
weights.LN_13(data.LN_13(:,2) == 0) = 0;
weights.LN_12(data.LN_12(:,2) == 0) = 0;
weights.LN_112(data.LN_112(:,2) == 0) = 0;
weights.LN_11(data.LN_11(:,2) == 0) = 0;
weights.LN_6 = 0 * weights.LN_6;
weights.LN_3 = 0 * weights.LN_3;
weights.LN_0 = 0 * weights.LN_0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LN_19','LN_18','LN_16','LN_13','LN_12','LN_112','LN_11'}; 
subtitle1 = {'Data at 19.5, 18, 16, 13.5, 12, 11.2, 11 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '3F8J8'; % Cat of Life
metaData.links.id_ITIS = '93790'; % ITIS
metaData.links.id_EoL = '344046'; % Ency of Life
metaData.links.id_Wiki = 'Gammarus'; % Wikipedia
metaData.links.id_ADW = 'Gammarus_pseudolimnaeus'; % ADW
metaData.links.id_Taxo = '389323'; % Taxonomicon
metaData.links.id_WoRMS = '490303'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gammarus}}';
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
bibkey = 'HyneHarp1972'; type = 'Article'; bib = [ ... 
'author = {Hynes, H. B. N. and F. Harper}, ' ... 
'year = {1972}, ' ...
'title = {The Life Histories of \emph{Gammarus lacustris} and \emph{G. pseudolimnaeus} in {S}outhern {O}ntario}, ' ...
'journal = {Crustaceana Supplement}, ' ...
'volume = {3}, ' ...
'pages = {329--341}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WateHoke1980'; type = 'Article'; bib = [ ... 
'author = {Waters, T. F. and J. C. Hokenstrom}, ' ... 
'year = {1980}, ' ...
'title = {Annual Production and Drift of the Stream Amphipod \emph{Gammarus pseudolimnaeus} in {V}alley {C}reek, {M}innesota}, ' ...
'journal = {Limnology and Oceanography}, ' ...
'volume = {25}, ' ...
'pages = {700--710}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mill1982'; type = 'Article'; bib = [ ... 
'author = {Miller, S. A.}, ' ... 
'year = {1982}, ' ...
'title = {THE LIFE-HISTORY OF \emph{Gammarus pseudolimnaeus} {B}OUSFIELD IN A {C}ENTRAL {W}ISCONSIN STREAM ({A}MPHIPODA, {G}AMMARIDEA)}, ' ...
'journal = {Crustaceana}, ' ...
'volume = {43}, ' ...
'number = {JUL}, '...
'pages = {89--99}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

