function [data, auxData, metaData, txtData, weights] = mydata_Scorpaena_notata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Scorpaenidae';
metaData.species    = 'Scorpaena_notata'; 
metaData.species_en = 'Small red scorpionfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 20];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 20];

%% set data
% zero-variate data

data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(14.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8 * 365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'NeveSequ2015';   
  temp.am = C2K(14.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'guess'; 
data.Li  = 26;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwim = 'based on egg diameter of 1.5 mm of Scorpaenichthys_marmoratus: pi/6*0.15^3';
data.Wwi = 236;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01259*Li^3.02, see F1';
 
data.Ri = 32850/365;     units.Ri = '#/d';    label.Ri = 'max reproduction rate';   bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(14.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length 
data.tL_fm = [ ... %  year class (yr), total length(cm)
    1 10.60 11.40
    2 13.00 12.73
    3 14.99 15.69
    4 16.03 17.08
    5 16.68 17.69
    6 17.40 18.95
    7 NaN   19.84];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.75) * 365; % convert yr to d
units.tL_fm = {'d' 'cm'}; label.tL_fm = {'time since birth', 'total length', 'female'};  
temp.tL_fm = C2K(14.6); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'NeveSequ2015'; treat.tL_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Lp = 5 * weights.Lp;
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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'GrebCail2010 data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Ww in g = 0.01259*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VWSH'; % Cat of Life
metaData.links.id_ITIS = '166837'; % ITIS
metaData.links.id_EoL = '46567904'; % Ency of Life
metaData.links.id_Wiki = 'Scorpaena_notata'; % Wikipedia
metaData.links.id_ADW = 'Scorpaena_notata'; % ADW
metaData.links.id_Taxo = '577542'; % Taxonomicon
metaData.links.id_WoRMS = '274721'; % WoRMS
metaData.links.id_fishbase = 'Scorpaena-notata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scorpaena_notata}}';
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
bibkey = 'NeveSequ2015'; type = 'Article'; bib = [ ... 
'doi = {10.3750/AIP2015.45.1.02}, ' ...
'author = {Ana Neves and Vera Sequeira and Ana R. Vieira and Rafaela B. Paiva and Leonel S. Gordo}, ' ... 
'year = {2015}, ' ...
'title = {AGE AND GROWTH OF SMALL RED SCORPIONFISH, \emph{Scorpaena notata} ({A}CTINOPTERYGII: {S}CORPAENIFORMES: }S}CORPAENIDAE), A COMMON DISCARD SPECIES FROM THE {P}ORTUGUESE FISHERY}, ' ...
'journal = {Acta Ichthyologica et Piscatoria}, ' ...
'volume = {45(1)}, ' ...
'pages = {13–20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scorpaena-notata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

