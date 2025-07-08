function [data, auxData, metaData, txtData, weights] = mydata_Bufo_gargarizans

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Bufo_gargarizans'; 
metaData.species_en = 'Asiatic toad'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2023 02 13];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 13];

%% set data
% zero-variate data

data.ab = 8;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Anaxyrus americanus';
data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Mi2015';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Mi2015';
  temp.tpm = C2K(17);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 24.2*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.Wwi = 'based on Onychodactylus_japonicus';

data.Lj  = 3.5;     units.Lj  = 'cm';  label.Lj  = 'total length at metam'; bibkey.Lj  = 'guess'; 
  comment.Lj = 'based on Bufo bufo';
data.Li  = 12.5;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'Mi2015';
data.Lim = 11.5;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'Mi2015';

data.Wwb = 4.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwi = 'based on egg diameter of 2 mm of Anaxyrus americanus: pi/6*0.2^3';
data.Wwi = 250;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Mi2015';

data.Ri  = 5e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'amphibiaweb';
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1200-7400 eggs per season';

% univariate data
% time - length
data.tL_fm = [ ... time since birth (yr), SVL (cm)
    2 NaN     9.184 
    3 11.288 10.185
    4 11.745 10.668 
    5 12.030 10.758 
    6 12.089 11.380 
    7 12.466 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.5) * 365; % convert yr to d
units.tL_fm  = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm   = C2K(17); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Mi2015'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'temperature guessed';
%
data.tW_fm = [ ... time since birth (yr), weight (g)
    2 NaN     92.44 
    3 183.42 126.45 
    4 203.53 148.67 
    5 216.11 140.02 
    6 236.41 157.20 
    7 249.61 NaN    ];
data.tW_fm(:,1) = (data.tW_fm(:,1) + 0.5) * 365; % convert yr to d
units.tW_fm  = {'d', 'g'}; label.tW_fm = {'time since birth', 'wet weight'};  
temp.tW_fm   = C2K(17); units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'XionGou2020'; treat.tW_fm = {1, {'females','males'}};
comment.tW_fm = 'temperature guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.tW_fm = 3 * weights.tW_fm;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am}  only'; 
D2 = 'mod_1: tL_fm and tW_fm data added, Wwi revised';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'NP68'; % Cat of Life
metaData.links.id_ITIS = '1107378'; % ITIS
metaData.links.id_EoL = '1047209'; % Ency of Life
metaData.links.id_Wiki = 'Bufo_gargarizans'; % Wikipedia
metaData.links.id_ADW = 'Bufo_gargarizans'; % ADW
metaData.links.id_Taxo = '137224'; % Taxonomicon
metaData.links.id_WoRMS = '1350165'; % WoRMS
metaData.links.id_amphweb = 'Bufo+gargarizans'; % AmphibiaWeb

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bufo_gargarizans}}';
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
bibkey = 'Mi2015'; type = 'Article'; bib = [ ...
'author = {Zhi Ping Mi}, ' ... 
'year = {2015}, ' ...
'title = {Age structure and body size in a breeding population of {A}siatic toad (\emph{Bufo gargarizans}) in southwestern {C}hina}, ' ...
'journal = {North-Western Journal of Zoology}, ' ...
'volume = {11(1)}, ' ...
'pages = {178-182}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Bufo+gargarizans}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

