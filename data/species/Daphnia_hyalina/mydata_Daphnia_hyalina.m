function [data, auxData, metaData, txtData, weights] = mydata_Daphnia_hyalina

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Daphnia_hyalina'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'T-ab'; 'L-Wd'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 11 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 01 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 

%% set data
% zero-variate data

data.am = 65;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'XianBopi1976';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.06;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
data.Lp  = 0.116; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Vijv1980';
data.Li  = 0.263; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'XianBopi1976';

data.Ri  = 8/1.7; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (d), length (mm)
 0.249	0.584
 6.911	1.369
13.927	1.643
20.788	1.922
28.085	1.969
35.078	2.018];
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Vijv1980';

% T - ab data
data.Tab = [ ... % temperature (C), number of brood per week
 2.5 0.3
 5   0.5
10   0.9
15   1.7
20   2.1
25   1.8];
data.Tab(:,2) = 7./data.Tab(:,2); % convert week to d and ab = 1/N
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Vijv1980';

% L - Wd data
LWW = [ ... % length (mm), dry weight (mug), % ash of dry weight
    0.73  2.28 12.50
    0.89  4.04 11.20
    1.10  7.51 20.25
    1.27 12.45 19.46
    1.38 15.00 20.00
    1.43 16.86 18.39
    1.61 21.33 15.50];
data.LWd = [LWW(:,1)/ 10, LWW(:,2) .* (100 - LWW(:,3))/1e8];
units.LWd   = {'cm', 'g'};  label.LWd = {'length', 'ashfree dry weight'};  
bibkey.LWd = 'BaudRave1972';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Facts
F1 = 'parthenogenetic reproduction, continuous moulting; cladocerans reach maturity in 3-8 moults';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '345BL'; % Cat of Life
metaData.links.id_ITIS = '83882'; % ITIS
metaData.links.id_EoL = '46498267'; % Ency of Life
metaData.links.id_Wiki = 'Daphnia_(subgenus)'; % Wikipedia
metaData.links.id_ADW = 'Daphnia_hyalina'; % ADW
metaData.links.id_Taxo = '33103'; % Taxonomicon
metaData.links.id_WoRMS = '148374'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Daphnia}}';
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
bibkey = 'Vijv1980'; type = 'Article'; bib = [ ... 
'author = {Vijverberg, J.}, ' ... 
'year = {1980}, ' ...
'title = {Effect if temperature in laboratory studies on the development and growth of Cladocera and copepoda from {T}jeukemeer, the {N}etherlands.}, ' ...
'journal = {Freshwater Biol}, ' ...
'volume = {10}, ' ...
'pages = {317-340}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BaudRave1972'; type = 'Techreport'; bib = [ ... 
'author = {Baudouin, M.F. and Ravera, O.}, ' ... 
'year = {1972}, ' ...
'title = {Weight, size, and chemical composition of some freshwater zooplankters: \emph{Daphnia hyalina} ({L}eydig)}, ' ...
'institution = {Biology directorate (DG III), Comm Eur Communities}, ' ...
'howpublished = {\url{http://onlinelibrary.wiley.com/doi/10.4319/lo.1972.17.4.0645/abstract}}, ' ...
'volume = {614}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'XianBopi1976'; type = 'Article'; bib = [ ... 
'author = {Xian, L. and Bo-ping, H}, ' ... 
'year = {1976}, ' ...
'title = {The effect of food from eutrophic lake on the growth and reproduction of \emph{Daphnia hyalina}}, ' ...
'howpublished = {\url{http://118.145.16.229/Jwk_stkx/EN/Y2006/V25/I2/116}}, ' ...
'journal = {Ecol. Sci.}, ' ...
'volume = {25}, ' ...
'pages = {116--121}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
