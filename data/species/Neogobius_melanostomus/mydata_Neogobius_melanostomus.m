function [data, auxData, metaData, txtData, weights] = mydata_Neogobius_melanostomus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Neogobius_melanostomus'; 
metaData.species_en = 'Round goby'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0iMc', '0iMm', 'jiFr', 'jiFm'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 04 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.am = 6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 7.75;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'ShemKiri2009'; 
data.Li  = 24.6;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 8.2e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwp = 6.5; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'ShemKiri2009';

data.Ri  = 5000/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [... %  time since birth (yr), total length (cm)
    0  7.70
    1 10.53
    2 11.88
    3 14.55];
data.tL_f(:,1) = (0.9 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ShemKiri2009';
comment.tL_f = 'data for females';
%
data.tL_m = [... %  time since birth (yr), total length (cm)
    0  7.83
    1 11.96
    2 13.32
    3 15.70];
data.tL_m(:,1) = (0.9 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ShemKiri2009';
comment.tL_m = 'data for males';

% time-weight
data.tW_f = [... %  time since birth (yr), wet weight (g)
    0  6.6
    1 18.8
    2 27.4
    3 58.4];
data.tW_f(:,1) = (0.9 + data.tW_f(:,1)) * 365; % convert yr to d
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(20);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'ShemKiri2009';
comment.tW_f = 'data for females';
%
data.tW_m = [... %  time since birth (yr), wet weight (g)
    0  7.5
    1 28.2
    2 39.7
    3 71.5];
data.tW_m(:,1) = (0.9 + data.tW_m(:,1)) * 365; % convert yr to d
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(20);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'ShemKiri2009';
comment.tW_m = 'data for males';

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

%% Links
metaData.links.id_CoL = '6RW9X'; % Cat of Life
metaData.links.id_ITIS = '172072'; % ITIS
metaData.links.id_EoL = '46575276'; % Ency of Life
metaData.links.id_Wiki = 'Neogobius_melanostomus'; % Wikipedia
metaData.links.id_ADW = 'Neogobius_melanostomus'; % ADW
metaData.links.id_Taxo = '181098'; % Taxonomicon
metaData.links.id_WoRMS = '126916'; % WoRMS
metaData.links.id_fishbase = 'Neogobius-melanostomus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neogobius_melanostomus}}';
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
bibkey = 'ShemKiri2009'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945209060046}, ' ...
'author = {E. V. Shemonaev and E. V. Kirilenko}, ' ... 
'year = {2009}, ' ...
'title = {Some Features of Biology of the Round Goby \emph{Neogobius melanostomus} ({P}erciformes, {G}obiidae) in Waters of {K}uibyshev {R}eservoir}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {49}, ' ...
'pages = {454-459}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Neogobius-melanostomus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

