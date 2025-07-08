function [data, auxData, metaData, txtData, weights] = mydata_Leydigia_acanthocercoides

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Chydoridae';
metaData.species    = 'Leydigia_acanthocercoides'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-N'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 12]; 

%% set data
% zero-variate data

data.ab = 40/24;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'MuruJob1982';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 3;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'MuruJob1982';   
  temp.tp = C2K(29);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 23;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'MuruJob1982';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0311; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb = 'MuruJob1982';
data.Lp  = 0.068; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp = 'MuruJob1982';
data.Li  = 0.083;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li = 'MuruJob1982';

data.Wdi  = 3.66;  units.Wdi = 'mug'; label.Wdi = 'ultimate dry weight';   bibkey.Wdi = 'guess';
  comment.Wdi = 'based on Ceriodaphnia_pulchella: (0.083/0.09)^3*4.668';
  
% uni-variate data
% time-length
data.tLR = [ ... % time since birth (d), length (mm), cum # of eggs, instar duration (h)
    0 0.34  0  0
    1 0.49  0 24
    2 0.57  0 24
    3 0.64  0 24
    4 0.68  2 40
    5 0.72  4 24
    6 0.75  6 24
    7 0.76  8 30
    8 0.77 10 19
    9 0.77 10 24
   10 0.77 12 48
   11 0.78 14 48
   12 0.79 16 60
   13 0.80 18 60
   14 0.82 18 60
   15 0.83 20 24
   16 0.83 NaN 24];
data.tLR(:,1) = cumsum(data.tLR(:,4)/24); data.tLR(:,4) = []; % time since birth in d
data.tLR(:,2) = data.tLR(:,2)/10; % convert mm to cm
units.tLR  = {'d', 'cm', '#'};  label.tLR = {'time since birth', 'length', 'cum # of eggs'};  
temp.tLR   = C2K(29); units.temp.tLR = 'K'; label.temp.tLR = 'temperature';
bibkey.tLR = 'MuruJob1982'; treat.tLR = {1, {'length','cum reprod'}};
      
%% set weights for all real data
weights = setweights(data, []);
weights.tLR(:,1) = 5 * weights.tLR(:,1);
weights.Lb = 3 * weights.Lb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {}; subtitle1 = {};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'ab is ignored in estimation because of inconsistency with tL data; a delay in the onset of development might be present';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6Q6RQ'; % Cat of Life
metaData.links.id_ITIS = '84027'; % ITIS
metaData.links.id_EoL = '46498239'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Leydigia_acanthocercoides'; % ADW
metaData.links.id_Taxo = '156243'; % Taxonomicon
metaData.links.id_WoRMS = '148396'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MuruJob1982'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00017533}, ' ...
'author = {N. Murugan and S. V. Job}, ' ... 
'year = {1982}, ' ...
'title = {Laboratory studies on the life cycle of \emph{Leydigia acanthocercoides} {F}isher (1854) ({C}ladocera: {C}hydoridae)}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {89(1)}, ' ...
'pages = {9–16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
