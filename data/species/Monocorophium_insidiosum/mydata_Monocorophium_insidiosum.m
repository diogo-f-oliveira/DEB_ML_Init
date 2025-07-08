function [data, auxData, metaData, txtData, weights] = mydata_Monocorophium_insidiosum

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Amphipoda'; 
metaData.family     = 'Corophiidae';
metaData.species    = 'Monocorophium_insidiosum'; 
metaData.species_en = 'Amphipod'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0iMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD', 'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab_T'; 'ap_T'; 'am_T'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ni_T'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 08]; 

%% set data
% zero-variate data

data.ab10 = 10;  units.ab10 = 'd';    label.ab10 = 'age at birth';             bibkey.ab10 = 'NairAnge1979';   
  temp.ab10 = C2K(10);  units.temp.ab10 = 'K'; label.temp.ab10 = 'temperature';
data.ab15 = 5;  units.ab15 = 'd';    label.ab15 = 'age at birth';             bibkey.ab15 = 'NairAnge1979';   
  temp.ab15 = C2K(15);  units.temp.ab15 = 'K'; label.temp.ab15 = 'temperature';
data.ab20 = 4;  units.ab20 = 'd';    label.ab20 = 'age at birth';             bibkey.ab20 = 'NairAnge1979';   
  temp.ab20 = C2K(20);  units.temp.ab20 = 'K'; label.temp.ab20 = 'temperature';
data.tp10 = 99;   units.tp10 = 'd';    label.tp10 = 'time since birth at puberty'; bibkey.tp10 = 'NairAnge1979';   
  temp.tp10 = C2K(10);  units.temp.tp10 = 'K'; label.temp.tp10 = 'temperature'; 
data.tp15 = 52;   units.tp15 = 'd';    label.tp15 = 'time since birth at puberty'; bibkey.tp15 = 'NairAnge1979';   
  temp.tp15 = C2K(15);  units.temp.tp15 = 'K'; label.temp.tp15 = 'temperature'; 
data.tp20 = 29;   units.tp20 = 'd';    label.tp20 = 'time since birth at puberty'; bibkey.tp20 = 'NairAnge1979';   
  temp.tp20 = C2K(20);  units.temp.tp20 = 'K'; label.temp.tp20 = 'temperature'; 
data.am10 = 223;   units.am10 = 'd';    label.am10 = 'life span';                bibkey.am10 = 'NairAnge1979';   
  temp.am10 = C2K(10);  units.temp.am10 = 'K'; label.temp.am10 = 'temperature'; 
data.am15 = 152;   units.am15 = 'd';    label.am15 = 'life span';                bibkey.am15 = 'NairAnge1979';   
  temp.am15 = C2K(15);  units.temp.am15 = 'K'; label.temp.am15 = 'temperature'; 
data.am20 = 142;   units.am20 = 'd';    label.am20 = 'life span';                bibkey.am20 = 'NairAnge1979';   
  temp.am20 = C2K(20);  units.temp.am20 = 'K'; label.temp.am20 = 'temperature'; 

data.Lb  = 0.15;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'NairAnge1979';
data.Lp  = 0.41;  units.Lp  = 'cm';  label.Lp  = 'body length at puberty';  bibkey.Lp  = 'NairAnge1979';
data.Li  = 0.56;  units.Li  = 'cm';  label.Li  = 'ultimate body length for females'; bibkey.Li  = 'NairAnge1979';
data.Lim = 0.42;  units.Lim = 'cm';  label.Lim = 'ultimate body length for males';   bibkey.Lim  = 'NairAnge1979';

data.Wdi = 0.502e-3;  units.Wdi = 'g'; label.Wdi = 'ultimate dry weight';    bibkey.Wdi = 'NairAnge1979'; 

data.Ni10  = 46; units.Ni10  = '#'; label.Ni10  = 'lifetime number of offspring'; bibkey.Ni10  = 'NairAnge1979';   
  temp.Ni10 = C2K(10); units.temp.Ni10 = 'K'; label.temp.Ni10 = 'temperature';
data.Ni15  = 88; units.Ni15  = '#'; label.Ni15  = 'lifetime number of offspring'; bibkey.Ni15  = 'NairAnge1979';   
  temp.Ni15 = C2K(15); units.temp.Ni15 = 'K'; label.temp.Ni15 = 'temperature';
data.Ni20  = 83; units.Ni20  = '#'; label.Ni20  = 'lifetime number of offspring'; bibkey.Ni20  = 'NairAnge1979';   
  temp.Ni20 = C2K(20); units.temp.Ni20 = 'K'; label.temp.Ni20 = 'temperature';

% uni-variate data
% time-length data
data.tL_f10 = [ ... % time since birth (d), body length (cm)
    18 0.15
    35 0.26
    64 0.35
    88 0.38
    99 0.40
   118 0.44
   128 0.45
   145 0.50
   150 0.52
   189 0.54
   220 0.56];
units.tL_f10   = {'d', 'cm'};  label.tL_f10 = {'time since birth', 'body length', '10 C'};  
temp.tL_f10    = C2K(10);  units.temp.tL_f10 = 'K'; label.temp.tL_f10 = 'temperature';
bibkey.tL_f10 = 'NairAnge1979';
comment.tL_f10 = 'data for females';
%
data.tL_m10 = [ ... % time since birth (d), body length (cm)
    18 0.15
    35 0.26
    64 0.33
    88 0.36
   136 0.41
   167 0.42];
units.tL_m10   = {'d', 'cm'};  label.tL_m10 = {'time since birth', 'body length', '10 C'};  
temp.tL_m10    = C2K(10);  units.temp.tL_m10 = 'K'; label.temp.tL_m10 = 'temperature';
bibkey.tL_m10 = 'NairAnge1979';
comment.tL_m10 = 'data for males';
%
data.tL_f15 = [ ... % time since birth (d), body length (cm)
    7 0.12
   21 0.22
   30 0.30
   38 0.35
   52 0.37
   64 0.40
   79 0.43
   88 0.44
   97 0.46
  106 0.47
  119 0.51
  133 0.53
  140 0.56];
units.tL_f15   = {'d', 'cm'};  label.tL_f15 = {'time since birth', 'body length', '15 C'};  
temp.tL_f15    = C2K(15);  units.temp.tL_f15 = 'K'; label.temp.tL_f15 = 'temperature';
bibkey.tL_f15 = 'NairAnge1979';
comment.tL_f15 = 'data for females';
%
data.tL_m15 = [ ... % time since birth (d), body length (cm)
    7 0.12
   21 0.21
   30 0.29
   38 0.34
   79 0.37
  119 0.42];
units.tL_m15   = {'d', 'cm'};  label.tL_m15 = {'time since birth', 'body length', '15 C'};  
temp.tL_m15    = C2K(15);  units.temp.tL_m15 = 'K'; label.temp.tL_m15 = 'temperature';
bibkey.tL_m15 = 'NairAnge1979';
comment.tL_m15 = 'data for males';
%
data.tL_f20 = [ ... % time since birth (d), body length (cm)
     5 0.13
    13 0.17
    23 0.26
    29 0.33
    36 0.34
    52 0.35
    67 0.35
    73 0.36
    89 0.37
   100 0.40
   107 0.44
   118 0.50
   131 0.53
   142 0.54];
units.tL_f20   = {'d', 'cm'};  label.tL_f20 = {'time since birth', 'body length', '20 C'};  
temp.tL_f20    = C2K(20);  units.temp.tL_f20 = 'K'; label.temp.tL_f20 = 'temperature';
bibkey.tL_f20 = 'NairAnge1979';
comment.tL_f20 = 'data for females';
%
data.tL_m20 = [ ... % time since birth (d), body length (cm)
    5 0.13
   13 0.17
   23 0.26
   29 0.34
   89 0.37
  118 0.42];
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
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '446DR'; % Cat of Life
metaData.links.id_ITIS = '656759'; % ITIS
metaData.links.id_EoL = '46528510'; % Ency of Life
metaData.links.id_Wiki = 'Monocorophium_insidiosum'; % Wikipedia
metaData.links.id_ADW = 'Monocorophium_insidiosum'; % ADW
metaData.links.id_Taxo = '3512193'; % Taxonomicon
metaData.links.id_WoRMS = '148592'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Monocorophium_insidiosum }}';
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
'title = {Life cycle of \emph{Corophium insidiosum} ({C}rustacea, {A}mphipoda) in laboratory culture}, ' ...
'journal = {Helgol\"{a}nder wiss. Meeresunters.}, ' ...
'volume = {32}, ' ...
'pages = {279-294}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
