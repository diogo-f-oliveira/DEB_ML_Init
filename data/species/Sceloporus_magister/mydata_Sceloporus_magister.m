function [data, auxData, metaData, txtData, weights] = mydata_Sceloporus_magister
%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Phrynosomatidae';
metaData.species    = 'Sceloporus_magister';
metaData.species_en = 'Desert spiny lizard';

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L0-L1'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 05];

%% set data
% zero-variate data;
data.ab = 3*30;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'guess';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;     units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(14);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.9*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'AnAge';
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 3.2;     units.Lb  = 'cm';  label.Lb  = 'total SVL';   bibkey.Lb  = 'TannKrog1973';
data.Li  = 10.7; units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'TannKrog1973';
data.Lim = 11.5; units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'TannKrog1973';

data.Wwb = 1; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'TannKrog1973';
data.Wwi = 49.7; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'TannKrog1973';
  comment.Wwi = 'based on LW data: 54*(10.7/11)^3';
data.Wwim = 61.7; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'TannKrog1973';
  comment.Wwim = 'based on LW data: 54*(11.5/11)^3';

data.Ri  = 8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';
temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-24 eggs per season';

% uni-variate data
% length-length
LLt = [... % SVL (mm), SVL (mm), time between meansurments (d), gender
    53 65  35 % f
    60 75  39 % f
    60 72  25 % f
    63 82  52 % f
    59 67  22 % f
    68 70  11 % f
    69 74  24 % f
    57 72  45 % m
    68 83  45 % m
    63 65  21 % f
    62 81 368 % f
    57 82 367 % m
    65 87 376 % f
    66 88 327 % m
    60 86 374 % f
];
growth.LdL = LLt(:,3); units.growth.LdL = 'd'; label.growth.LdL = 'days of growth';
data.LdL = LLt (:,1:2)/10; % convert mm to cm
units.LdL  = {'cm', 'cm'};  label.LdL = {'initial SVL', 'final SVL'};  
temp.LdL   = C2K(30);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'TannKrog1973'; treat.LdL = {0, {'initial SVL','final SVL'}};

% length-weight
data.LW = [... % SVL (cm), weight (g)
    3.2  1
    3.8  1.75
    4.1  2.12
    8.7 24
   11.0 54.0];
units.LW  = {'cm', 'g'};  label.LW = {'SVL', 'weight'};  
bibkey.LW = 'TannKrog1973';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 3 * weights.LdL;
weights.Li = 5 * weights.Li;
weights.Lb = 5 * weights.Lb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.growth = growth;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '6XVYN'; % Cat of Life
metaData.links.id_ITIS = '173873'; % ITIS
metaData.links.id_EoL = '790724'; % Ency of Life
metaData.links.id_Wiki = 'Sceloporus_magister'; % Wikipedia
metaData.links.id_ADW = 'Sceloporus_magister'; % ADW
metaData.links.id_Taxo = '49018'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Sceloporus&species=magister'; % ReptileDB
metaData.links.id_AnAge = 'Sceloporus_magister'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sceloporus_magister}}';   
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
bibkey = 'TannKrog1973'; type = 'Article'; bib = [ ...  
'author = {Wilmer W. Tanner and John E. Krogh}, ' ...
'title = {Ecology of \emph{Sceloporus magister} at the Nevada test site, {N}ye {C}ounty, {N}evada}, ' ...
'journal = {The Great Basin naturalist}, ' ...
'volume = {33}, ' ...
'pages = {133-146}, ' ...
'year = {1973}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Sceloporus_magister}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

