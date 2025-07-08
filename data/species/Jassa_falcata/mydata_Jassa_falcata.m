function [data, auxData, metaData, txtData, weights] = mydata_Jassa_falcata

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Amphipoda'; 
metaData.family     = 'Ischyroceridae';
metaData.species    = 'Jassa_falcata'; 
metaData.species_en = 'Scud'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0iMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab_T'; 'ap_T'; 'am_T'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'; 'Ni_T'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data

data.ab10 = 16;  units.ab10 = 'd';    label.ab10 = 'age at birth';             bibkey.ab10 = 'NairAnge1979';   
  temp.ab10 = C2K(10);  units.temp.ab10 = 'K'; label.temp.ab10 = 'temperature';
data.ab15 = 8.8;  units.ab15 = 'd';    label.ab15 = 'age at birth';             bibkey.ab15 = 'NairAnge1979';   
  temp.ab15 = C2K(15);  units.temp.ab15 = 'K'; label.temp.ab15 = 'temperature';
data.ab20 = 10;  units.ab20 = 'd';    label.ab20 = 'age at birth';             bibkey.ab20 = 'NairAnge1979';   
  temp.ab20 = C2K(20);  units.temp.ab20 = 'K'; label.temp.ab20 = 'temperature';
data.tp10 = 142;   units.tp10 = 'd';    label.tp10 = 'time since birth at puberty'; bibkey.tp10 = 'NairAnge1979';   
  temp.tp10 = C2K(10);  units.temp.tp10 = 'K'; label.temp.tp10 = 'temperature'; 
data.tp15 = 110;   units.tp15 = 'd';    label.tp15 = 'time since birth at puberty'; bibkey.tp15 = 'NairAnge1979';   
  temp.tp15 = C2K(15);  units.temp.tp15 = 'K'; label.temp.tp15 = 'temperature'; 
data.tp20 = 69;   units.tp20 = 'd';    label.tp20 = 'time since birth at puberty'; bibkey.tp20 = 'NairAnge1979';   
  temp.tp20 = C2K(20);  units.temp.tp20 = 'K'; label.temp.tp20 = 'temperature'; 
data.am10 = 252;   units.am10 = 'd';    label.am10 = 'life span';                bibkey.am10 = 'NairAnge1979';   
  temp.am10 = C2K(10);  units.temp.am10 = 'K'; label.temp.am10 = 'temperature'; 
data.am15 = 173;   units.am15 = 'd';    label.am15 = 'life span';                bibkey.am15 = 'NairAnge1979';   
  temp.am15 = C2K(15);  units.temp.am15 = 'K'; label.temp.am15 = 'temperature'; 
data.am20 = 153;   units.am20 = 'd';    label.am20 = 'life span';                bibkey.am20 = 'NairAnge1979';   
  temp.am20 = C2K(20);  units.temp.am20 = 'K'; label.temp.am20 = 'temperature'; 

data.Lb  = 0.18;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'NairAnge1979';
data.Lp  = 0.67;  units.Lp  = 'cm';  label.Lp  = 'body length at puberty';  bibkey.Lp  = 'NairAnge1979';
data.Li  = 0.82;  units.Li  = 'cm';  label.Li  = 'ultimate body length for females'; bibkey.Li  = 'NairAnge1979';
data.Lim = 0.89;  units.Lim = 'cm';  label.Lim = 'ultimate body length for males';   bibkey.Lim  = 'NairAnge1979';

data.Wwb = 1.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'JeonYu2007';  
  comment.Wwb = 'value for Jassa slatteryi';
data.Wdi = 4.6e-3;  units.Wdi = 'g'; label.Wdi = 'ultimate dry weight';    bibkey.Wdi = 'Birk1977'; 
  comment.Wdi = 'Calculated from length-weight regressions for Corophium volutatur';

data.Ni10  = 39; units.Ni10  = '#'; label.Ni10  = 'lifetime number of offspring'; bibkey.Ni10  = 'NairAnge1979';   
  temp.Ni10 = C2K(10); units.temp.Ni10 = 'K'; label.temp.Ni10 = 'temperature';
data.Ni15  = 30; units.Ni15  = '#'; label.Ni15  = 'lifetime number of offspring'; bibkey.Ni15  = 'NairAnge1979';   
  temp.Ni15 = C2K(15); units.temp.Ni15 = 'K'; label.temp.Ni15 = 'temperature';
data.Ni20  = 23; units.Ni20  = '#'; label.Ni20  = 'lifetime number of offspring'; bibkey.Ni20  = 'NairAnge1979';   
  temp.Ni20 = C2K(20); units.temp.Ni20 = 'K'; label.temp.Ni20 = 'temperature';

% uni-variate data
% time-length
data.tL_f10 = [ ... % time since birth (d), body length (cm)
    40 0.18
    62 0.26
    82 0.45
   120 0.64
   142 0.67
   173 0.72
   221 0.74
   238 0.79
   246 0.81];
units.tL_f10   = {'d', 'cm'};  label.tL_f10 = {'time since birth', 'body length', '10 C'};  
temp.tL_f10    = C2K(10);  units.temp.tL_f10 = 'K'; label.temp.tL_f10 = 'temperature';
bibkey.tL_f10 = 'NairAnge1979';
comment.tL_f10 = 'data for females';
%
data.tL_m10 = [ ... % time since birth (d), body length (cm)
    40 0.18
    62 0.28
    82 0.48
   120 0.68
   142 0.75
   221 0.88];
units.tL_m10   = {'d', 'cm'};  label.tL_m10 = {'time since birth', 'body length', '10 C'};  
temp.tL_m10    = C2K(10);  units.temp.tL_m10 = 'K'; label.temp.tL_m10 = 'temperature';
bibkey.tL_m10 = 'NairAnge1979';
comment.tL_m10 = 'data for males';
%
data.tL_f15 = [ ... % time since birth (d), body length (cm)
    19 0.15
    51 0.32
    69 0.35
    91 0.48
   110 0.52
   118 0.53
   126 0.60
   150 0.65
   162 0.69];
units.tL_f15   = {'d', 'cm'};  label.tL_f15 = {'time since birth', 'body length', '15 C'};  
temp.tL_f15    = C2K(15);  units.temp.tL_f15 = 'K'; label.temp.tL_f15 = 'temperature';
bibkey.tL_f15 = 'NairAnge1979';
comment.tL_f15 = 'data for females';
%
data.tL_m15 = [ ... % time since birth (d), body length (cm)
    19 0.15
    51 0.34
    69 0.40
    91 0.55
   110 0.60
   150 0.74];
units.tL_m15   = {'d', 'cm'};  label.tL_m15 = {'time since birth', 'body length', '15 C'};  
temp.tL_m15    = C2K(15);  units.temp.tL_m15 = 'K'; label.temp.tL_m15 = 'temperature';
bibkey.tL_m15 = 'NairAnge1979';
comment.tL_m15 = 'data for males';
%
data.tL_f20 = [ ... % time since birth (d), body length (cm)
    18 0.18
    40 0.25
    51 0.38
    69 0.44
    96 0.52
   111 0.60
   147 0.69];
units.tL_f20   = {'d', 'cm'};  label.tL_f20 = {'time since birth', 'body length', '20 C'};  
temp.tL_f20    = C2K(20);  units.temp.tL_f20 = 'K'; label.temp.tL_f20 = 'temperature';
bibkey.tL_f20 = 'NairAnge1979';
comment.tL_f20 = 'data for females';
%
data.tL_m20 = [ ... % time since birth (d), body length (cm)
    18 0.18
    40 0.28
    51 0.41
    69 0.47
   111 0.75];
units.tL_m20   = {'d', 'cm'};  label.tL_m20 = {'time since birth', 'body length', '20 C'};  
temp.tL_m20    = C2K(20);  units.temp.tL_m20 = 'K'; label.temp.tL_m20 = 'temperature';
bibkey.tL_m20 = 'NairAnge1979';
comment.tL_m20 = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f10 = 5 * weights.tL_f10;
weights.tL_m10 = 5 * weights.tL_m10;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f20','tL_f15','tL_f10'}; subtitle1 = {'Data for females at 20, 15, 10 C'};
set2 = {'tL_m20','tL_m15','tL_m10'}; subtitle2 = {'Data for males at 20, 15, 10 C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3QMZF'; % Cat of Life
metaData.links.id_ITIS = '94171'; % ITIS
metaData.links.id_EoL = '46529514'; % Ency of Life
metaData.links.id_Wiki = 'Jassa_falcata'; % Wikipedia
metaData.links.id_ADW = 'Jassa_falcata'; % ADW
metaData.links.id_Taxo = '427787'; % Taxonomicon
metaData.links.id_WoRMS = '102433'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Jassa_falcata}}';
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
bibkey = 'NairAnge1979'; type = 'Article'; bib = [ ... 
'author = {K. K. C. Nair and K. Anger}, ' ... 
'year = {1979}, ' ...
'title = {Experimental studies on the life cycle of \emph{Jassa falcata} ({C}rustacea, {A}mphipoda)}, ' ...
'journal = {Helgol\"{a}nder wiss. Meeresunters.}, ' ...
'volume = {32}, ' ...
'pages = {444-452}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JeonYu2007'; type = 'Article'; bib = [ ... 
'author = {Seung Jin Jeong and Ok Hwan Yu and Hae Lip Suh}, ' ... 
'year = {2007}, ' ...
'title = {LIFE HISTORY AND REPRODUCTION OF \emph{Jassa slatteryi} ({A}MPHIPODA, {I}SCHYROCERIDAE) ON A SEAGRASS BED (\emph{Zostera marina} {L}.) IN SOUTHERN {K}OREA}, ' ...
'journal = {Journal of Crustacean Biology}, ' ...
'volume = {27}, ' ...
'pages = {65-70}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Birk1977'; type = 'article'; bib = [ ...
'author = {Birklund, J},' ...
'year = {1977}, '...
'title = {Biomass, growth and reproduction of the amphipod \emph{Corophium insidiosum} {C}rawford, and preliminary notes on \emph{Corophium volutatur} ({P}allas)},'...
'pages = {187-203},'...
'journal = {Ophelia},'... 
'volume = {16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
