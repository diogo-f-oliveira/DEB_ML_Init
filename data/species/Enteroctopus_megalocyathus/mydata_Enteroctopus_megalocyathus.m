function [data, auxData, metaData, txtData, weights] = mydata_Enteroctopus_megalocyathus
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Enteroctopodidae';
metaData.species    = 'Enteroctopus_megalocyathus'; 
metaData.species_en = 'Southern red octopus'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'Ww-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 04 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 04 01]; 

%% set data
% zero-variate data

data.ab = 187;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(10);     units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 3*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'ADW';   
  temp.am = C2K(10);     units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '3-5 yr but speculative based on Enteroctopus_dofleini';
  
data.Wwb = 0.15; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'OrtiRe2006';
  comment.Wwb = 'based on egg length of 10.7 mm and width 3.52 mm: pi/6*1.07*0.52^2';
data.Wwp = 815;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'PereLope2006';
data.Wwi = 4e3;   units.Wwi = 'g';   label.Wwi = 'wet weight at death'; bibkey.Wwi = 'Wiki';

data.Ni  = 5e3; units.Ni  = '#';   label.Ni  = 'cum reprod at death';     bibkey.Ni  = 'ADW';   
  temp.Ni = C2K(10);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% weight-weight data
data.WW = [ ... % wet weight (g), wet weight (g)
     283.0 1026
     158.8  601.03
     200.1  357];
units.WW   = {'g', 'g'};  label.WW = {'wet weight', 'wet weight after some time'};  
temp.WW    = C2K(14.5);  units.temp.WW = 'K'; label.temp.WW = 'temperature';
time.WW = [95; 120; 48]; units.time.WW = 'd'; label.time.WW = 'growth period';
treat.WW = {0}; units.treat.WW = '-'; label.treat.WW = '';
bibkey.WW = 'PereLope2006'; 
comment.WW = 'temperature between 12 and 17 C';

%% set weights for all real data
weights = setweights(data, []);
weights.WW = 5 * weights.WW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.time = time;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'semelparous: death at first spawning, female ventilates eggs and dies after hatching; No food intake during this period';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '39Y4X'; % Cat of Life
metaData.links.id_ITIS = '556144'; % ITIS
metaData.links.id_EoL = '591405'; % Ency of Life
metaData.links.id_Wiki = 'Enteroctopus_megalocyathus'; % Wikipedia
metaData.links.id_ADW = 'Enteroctopus_megalocyathus'; % ADW
metaData.links.id_Taxo = '158322'; % Taxonomicon
metaData.links.id_WoRMS = '342307'; % WoRMS
metaData.links.id_molluscabase = '342307'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Enteroctopus_megalocyathus}}';
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
bibkey = 'PereLope2006'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1365-2109.2006.01454.x}, ' ...
'author = {Margarita C P\''{e}rez and Daniel A. L\''{o}opez and Karina Aguila and Mar\''{i}a Luisa Gonz\''{a}lez}, ' ... 
'year = {2006}, ' ...
'title = {Feeding and growth in captivity of the octopus \emph{Enteroctopus megalocyathus} {G}ould, 1852}, ' ...
'journal = {Aquaculture Research}, ' ...
'volume = {37},' ...
'pages = {550-555}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OrtiRe2006'; type = 'article'; bib = [ ... 
'doi = {10.1093/plankt/fbl023}, ' ...
'author = {Nicolas Ortiz and Mar\''{i}a Edith R\''{e} and Federico M\''{a}rquez}, ' ... 
'year = {2006}, ' ...
'title = {First description of eggs, hatchlings and hatchling behaviour of \emph{Enteroctopus megalocyathus} ({C}ephalopoda: {O}ctopodidae)}, ' ...
'journal = {Journal of Plankton Research}, ' ...
'volume = {28},' ...
'pages = {881-890}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Enteroctopus_megalocyathus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

