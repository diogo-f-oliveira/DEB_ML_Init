function [data, auxData, metaData, txtData, weights] = mydata_Prosopium_cylindraceum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Prosopium_cylindraceum'; 
metaData.species_en = 'Round whitefish'; 

metaData.ecoCode.climate = {'ME', 'ET', 'Dfc'};
metaData.ecoCode.ecozone = {'MN', 'TH'};
metaData.ecoCode.habitat = {'0jFr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2019 04 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data

data.am = 13*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 30;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'fishbase'; 
data.Li  = 59;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 4.8e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Shes2017';
  comment.Wwb = 'based on egg diameter of 2.1 mm (1.9 to 2.4 mm): pi/6*0.21^3';

% uni-variate data
% time-length
data.tL_f = [... %  time since birth (yr), fork length (cm)
    2 19.0 
    3 22.0
    4 26.8
    5 29.4
    6 31.6
    7 34.1
    8 36.3
    9 37.7
   10 39.9
   11 40.9
   12 41.0];
data.tL_f(:,1) = (0.9 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f    = C2K(3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Shes2017';
comment.tL_f = 'data for females';
%
data.tL_m = [... %  time since birth (yr), fork length (cm)
    1 12.2
    2 18.7
    3 22.9
    4 26.7
    5 28.6
    6 31.3
    7 33.4
    8 35.9
    9 37.1
   10 39.5
   11 41.0];
data.tL_m(:,1) = (0.9 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Shes2017';
comment.tL_m = 'data for males';

% time-weight
data.tW_f = [... %  time since birth (yr), wet weight (g)
    2  72
    3 117
    4 187
    5 246
    6 296
    7 387
    8 461
    9 517
   10 597
   11 589
   12 540];
data.tW_f(:,1) = (0.9 + data.tW_f(:,1)) * 365; % convert yr to d
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(3);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Shes2017';
comment.tW_f = 'data for females';
%
data.tW_m = [... %  time since birth (yr), wet weight (g)
    1  14.5
    2  62
    3 119
    4 183
    5 221
    6 302
    7 352
    8 427
    9 446
   10 549
   11 645];
data.tW_m(:,1) = (0.9 + data.tW_m(:,1)) * 365; % convert yr to d
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(3);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Shes2017';
comment.tW_m = 'data for males';

% length-fecundity
data.LN = [ ... % fork length (cm), fecundity (#)
    32.5 2620
    34.0 5310
    37.0 6850
    37.2 7420
    39.6 9050];
units.LN   = {'cm', '#'};  label.LN = {'fork length', 'fecundity'};  
temp.LN    = C2K(3);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Shes2017';
comment.LN = 'data Anadyr River, aug and Sept';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
D2 = 'Mean temperatures are guessed, ranging from 9.4 to 26.7 C';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4MW95'; % Cat of Life
metaData.links.id_ITIS = '162008'; % ITIS
metaData.links.id_EoL = '46563191'; % Ency of Life
metaData.links.id_Wiki = 'Prosopium_cylindraceum'; % Wikipedia
metaData.links.id_ADW = 'Prosopium_cylindraceum'; % ADW
metaData.links.id_Taxo = '184830'; % Taxonomicon
metaData.links.id_WoRMS = '282373'; % WoRMS
metaData.links.id_fishbase = 'Prosopium-cylindraceum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Prosopium_cylindraceum}}';
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
bibkey = 'Shes2017'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945217020175}, ' ...
'author = {A. V. Shestakov}, ' ... 
'year = {2017}, ' ...
'title = {Biology of Round Whitefish \emph{Prosopium cylindraceum} ({C}oregonidae) of the {A}nadyr {R}iver}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {57}, ' ...
'pages = {257-264}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Prosopium-cylindraceum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

