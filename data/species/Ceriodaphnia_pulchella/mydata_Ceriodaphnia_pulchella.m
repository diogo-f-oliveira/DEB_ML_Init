function [data, auxData, metaData, txtData, weights] = mydata_Ceriodaphnia_pulchella

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Ceriodaphnia_pulchella'; 
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
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'T-ab'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 12 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2013 08 21];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 01 09];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2016 10 26];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 

%% set data
% zero-variate data

data.ab = 3.5;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'BoerVijv1995';   
  temp.ab = C2K(17.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BoerVijv1995';   
  temp.tp = C2K(17.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 140;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.004; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
data.Lp  = 0.025; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Vijv1980';
data.Li  = 0.09;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'nina';

data.Wdi = 4.67;   units.Wdi = 'mug';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'Mich2005';
  comment.Wdi = 'cumputed from Li as exp(1.807+2.517 * ln(Li))';
  
data.Ri  = 4/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'cst';   
  temp.Ri = C2K(17.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 eggs per first brood; ab = 2 d (interpolated from Tab-data';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (d), length (0.1 mm)
2.335	0.432
9.436	2.116
16.443	3.067
23.129	3.512
30.114	3.855
37.558	4.419
44.234	4.451
51.221	4.991
58.358	5.479
65.642	5.642
72.626	6.062
79.610	6.512
86.591	6.704
93.421	7.049
100.553	7.258];
data.tL(:,2) = data.tL(:,2)/ 100; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Vijv1980';

% T - ab data
data.Tab = [ ... % temperature (C), number of brood per week
15   1.7
20   2.6
25   2.8];
data.Tab(:,2) = 7./data.Tab(:,2); % convert week to d and ab = 1/N
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Vijv1980';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'parthenogenetic reproduction, continuous moulting; cladocerans reach maturity in 3-8 moults';
metaData.bibkey.F2 = 'VijvFran1976'; 
F2 = 'weight W = exp(1.807 + 2.517 * ln(L)); the weight (mug) and L the body length (mm)'; 
metaData.bibkey.F2 = 'Mich2005'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'SY6W'; % Cat of Life
metaData.links.id_ITIS = '83908'; % ITIS
metaData.links.id_EoL = '46498277'; % Ency of Life
metaData.links.id_Wiki = 'Ceriodaphnia'; % Wikipedia
metaData.links.id_ADW = 'Ceriodaphnia_pulchella'; % ADW
metaData.links.id_Taxo = '156175'; % Taxonomicon
metaData.links.id_WoRMS = '148395'; % WoRMS


%% References
bibkey = 'nina'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.nina.no/archive/nina/PppBasePdf/NINA-Infomateriell/2007/krepsdyrfaktaark/walseng_Ceriodaphnia~pulchella.pdf}}';
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
bibkey = 'Mich2005'; type = 'Article'; bib = [ ... 
'author = {Michaloudi, E.}, ' ... 
'year = {2005}, ' ...
'title = {Dry Weights of the Zooplankton of Lake Mikri Prespa (Macedonia, Greece)}, ' ...
'journal = {Belg. J. Zool.}, ' ...
'volume = {135}, ' ...
'pages = {223--227}'];
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
bibkey = 'BoerVijv1996'; type = 'Article'; bib = [ ... 
'author = {Boersma, M. and Vijverberg, J.}, ' ... 
'year = {1985}, ' ...
'title = {Food effects on life history traits and seasonal dynmaics of \emph{Ceriodaphnia pulchella}}, ' ...
'journal = {Freshwater Biol.}, ' ...
'volume = {35}, ' ...
'pages = {25--34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
