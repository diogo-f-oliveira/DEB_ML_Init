function [data, auxData, metaData, txtData, weights] = mydata_Hyperia_galba

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Amphipoda'; 
metaData.family     = 'Hyperiidae';
metaData.species    = 'Hyperia_galba'; 
metaData.species_en = 'Big-eye amphipod'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCij'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Lt'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L_T'; 'T-ab'; 'L-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 04 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 30]; 

%% set data
% zero-variate data

data.am = 365;   units.am = 'd';    label.am = 'life span';               bibkey.am = 'Ditt1988';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.48;  units.Lj  = 'cm';  label.Lj  = 'total length at metam';    bibkey.Lj  = 'Ditt1987';
data.Lp  = 0.65;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Ditt1988';
data.Li  = 1.36;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Ditt1988';
data.L9  = 0.9;  units.L9  = 'cm';  label.L9  = 'total length at 9 month'; bibkey.L9  = 'Ditt1988';
  temp.L9 = C2K(15); units.temp.L9 = 'K'; label.temp.L9 = 'temperature';

data.Wwb = 3.9e-5;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Ditt1987';  
  comment.Wwb = 'based on egg diameter of 0.422 mm: pi/6*0.0422^3';

data.Ri  = 456/60; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Ditt1988';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'max litter size 456 eggs, accumulation period: 60 d assumed';

% uni-variate data
% temp - age at birth
data.Tab = [ ... % temperature (C), age at birth (d)
    0 44.3
    5 31.2
   10 19.0
   15 12.5];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Ditt1988';

% time-length
data.tL05 = [ ... time since birth (d), total length (cm)
   2.3 0.05  % stage 1: pantochelis
  19.3 0.07  % stage 2: Protopleon
  28.4 0.09  % stage 3: Protopleon
  37.1 0.14  % stage 4: Protopleon
  48.1 0.17  % stage 5: Protopleon; hereafter: juvenile
    ];
units.tL05   = {'d', 'cm'};  label.tL05 = {'time since birth', 'body length', '5 C'};  
temp.tL05    = C2K(5);  units.temp.tL05 = 'K'; label.temp.tL05 = 'temperature';
bibkey.tL05 = 'Ditt1987';
%
data.tL10 = [ ... time since birth (d), total length (cm)
   1.4 0.05  % stage 1: pantochelis
   9.9 0.07  % stage 2: Protopleon
  15.9 0.09  % stage 3: Protopleon
  22.9 0.14  % stage 4: Protopleon
  30.0 0.17  % stage 5: Protopleon; hereafter: juvenile
    ];
units.tL10   = {'d', 'cm'};  label.tL10 = {'time since birth', 'body length', '10 C'};  
temp.tL10    = C2K(10);  units.temp.tL10 = 'K'; label.temp.tL10 = 'temperature';
bibkey.tL10 = 'Ditt1987';
%
data.tL15 = [ ... time since birth (d), total length (cm)
   1.1 0.05  % stage 1: pantochelis
   9.2 0.07  % stage 2: Protopleon
  13.6 0.09  % stage 3: Protopleon
  17.5 0.14  % stage 4: Protopleon
  22.7 0.17  % stage 5: Protopleon; hereafter: juvenile
    ];
units.tL15   = {'d', 'cm'};  label.tL15 = {'time since birth', 'body length', '15 C'};  
temp.tL15    = C2K(15);  units.temp.tL15 = 'K'; label.temp.tL15 = 'temperature';
bibkey.tL15 = 'Ditt1987';
%
data.tL20 = [ ... time since birth (d), total length (cm)
  1.0 0.05  % stage 1: pantochelis
  6.5 0.07  % stage 2: Protopleon
 11.1 0.09  % stage 3: Protopleon
 15.4 0.14  % stage 4: Protopleon
 20.9 0.17  % stage 5: Protopleon; hereafter: juvenile
    ];
units.tL20   = {'d', 'cm'};  label.tL20 = {'time since birth', 'body length', '20 C'};  
temp.tL20    = C2K(20);  units.temp.tL20 = 'K'; label.temp.tL20 = 'temperature';
bibkey.tL20 = 'Ditt1987';

% length-dry weight data
data.LW_f = [ ... % body length (cm), dry weight (g)
    0.25 0.1
    0.35 0.3
    0.45 0.6
    0.55 1.0
    0.65 1.7
    0.75 2.7
    0.85 3.8
    0.95 5.1
    1.05 6.9
    1.15 8.9
    1.25 11.2];
data.LW_f(:,2) = data.LW_f(:,2)/1e3; % convert mg to g
units.LW_f   = {'cm', 'g'};  label.LW_f = {'body length','dry weight', 'female'};  
bibkey.LW_f = 'Ditt1991';
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % body length (cm), dry weight (mg)
    0.25 0.1
    0.35 0.3
    0.45 0.5
    0.55 0.9
    0.65 1.3
    0.75 1.8
    0.85 2.6
    0.95 3.7
    1.05 4.7
    1.15 5.9
    1.25 7.3];
data.LW_m(:,2) = data.LW_m(:,2)/1e3; % convert mg to g
units.LW_m   = {'cm', 'g'};  label.LW_m = {'body length','dry weight', 'male'};  
bibkey.LW_m = 'Ditt1991';
comment.LW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL05 = 2 * weights.tL05;
weights.tL10 = 2 * weights.tL10;
weights.tL15 = 2 * weights.tL15;
weights.tL20 = 2 * weights.tL20;
weights.L9 = 2 * weights.L9;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
set2 = {'tL20','tL15','tL10','tL05'}; subtitle2 = {'Data at 20, 15, 10, 5 C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are less bulky, hence they have a different shape coefficient, del_M, compared to females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Obligate parasite on large scyphomedusea, certainly in early stages';
metaData.bibkey.F1 = 'Ditt1987';
F2 = '2 generations per year: a rapidfly growing generation in summer, followed by a slower growing and overwintering generation';
metaData.bibkey.F2 = 'Ditt1988';
F3 = 'dry weight = 0.142 * wet weight';
metaData.bibkey.F3 = 'Ditt1991';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '3NP7C'; % Cat of Life
metaData.links.id_ITIS = '95110'; % ITIS
metaData.links.id_EoL = '46521640'; % Ency of Life
metaData.links.id_Wiki = 'Hyperia_galba'; % Wikipedia
metaData.links.id_ADW = 'Hyperia_galba'; % ADW
metaData.links.id_Taxo = '34341'; % Taxonomicon
metaData.links.id_WoRMS = '103251'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyperia_galba}}';
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
bibkey = 'Ditt1987'; type = 'Article'; bib = [ ... 
'author = {Birgit Dittrich}, ' ... 
'year = {1987}, ' ...
'title = {Postembryonic development of the parasitic amphipod \emph{Hyperia galba}}, ' ...
'journal = {Helgol\"{a}nder Meeresunters}, ' ...
'volume = {41}, ' ...
'pages = {217-232}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ditt1988'; type = 'Article'; bib = [ ... 
'author = {Birgit Dittrich}, ' ... 
'year = {1988}, ' ...
'title = {Studies on the life cycle and reproduction of the parasitic amphipod \emph{Hyperia galba} in the {N}orth {S}ea}, ' ...
'journal = {Helgol\"{a}nder Meeresunters}, ' ...
'volume = {42}, ' ...
'pages = {79-98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ditt1991'; type = 'Article'; bib = [ ... 
'author = {Birgit Dittrich}, ' ... 
'year = {1991}, ' ...
'title = {Biochemical composition of the parasitic amphipod \emph{Hyperia galba} in relation to age and starvation}, ' ...
'journal = {J Comp Physiol B}, ' ...
'volume = {161}, ' ...
'pages = {441-449}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
