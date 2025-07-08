function [data, auxData, metaData, txtData, weights] = mydata_Daphnia_cucullata

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Daphnia_cucullata'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(17.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'T-ab'; 'X-Lp'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 12 19];              
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

data.ab = 8;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'BoerVijv1994';   
  temp.ab = C2K(17.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 140;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(17.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.04;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
data.Lp  = 0.085; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Vijv1980';
data.Li  = 0.17;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'nina';

data.Wdi = 23.5;  units.Wdi = 'mug'; label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'Mich2005';
  comment.Wdi = 'cumputed from Li as exp(1.807+2.517 * ln(Li))';
  
data.Ri  = 4/1.5; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'BoerVijv1994';   
  temp.Ri = C2K(17.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 eggs per first brood; ab = 1.5 d (interpolated from Tab-data';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (mm)
0.379	0.480
6.860	0.893
13.727	1.078
20.880	1.156
28.025	1.186
34.714	1.216
42.013	1.258
48.850	1.256
55.686	1.254];
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Vijv1980';

% temperature-age at birth
data.Tab = [ ... % temperature (C), number of brood per week
 2.5 0.2
 5   0.3
10   0.9
15   1.3
20   1.6
25   1.9];
data.Tab(:,2) = 7./data.Tab(:,2); % convert week to d and ab = 1/N
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Vijv1980';

% food density-length at puberty
data.XLp = [ ... % food density (mg C/l), length at puberty (mm)
0.037	0.580
0.130	0.669
0.246	0.695
0.501	0.742
2.502	0.738];
data.XLp(:,2) = data.XLp(:,2)/ 10; % convert mm to cm
units.XLp   = {'mg C/l', 'cm'};  label.XLp = {'food density', 'length at puberty'};  
temp.XLp    = C2K(10);  units.temp.XLp = 'K'; label.temp.XLp = 'temperature';
bibkey.XLp = 'BoerVijv1994';

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
metaData.bibkey.F1 = 'nina'; 
F2 = 'weight W = exp(1.586 + 2.963 * ln(L)); the weight (mug) and L the body length (mm)'; 
metaData.bibkey.F2 = 'Mich2005'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '345B9'; % Cat of Life
metaData.links.id_ITIS = '83883'; % ITIS
metaData.links.id_EoL = '46498263'; % Ency of Life
metaData.links.id_Wiki = 'Daphnia_(subgenus)'; % Wikipedia
metaData.links.id_ADW = 'Daphnia_cucullata'; % ADW
metaData.links.id_Taxo = '33101'; % Taxonomicon
metaData.links.id_WoRMS = '148371'; % WoRMS

%% References
bibkey = 'nina'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.nina.no/archive/nina/PppBasePdf/NINA-Infomateriell/2007/krepsdyrfaktaark/walseng_Daphnia~cucullata.pdf}}';
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
bibkey = 'BoerVijv1994'; type = 'Article'; bib = [ ... 
'author = {Boersma, M. and Vijverberg, J.}, ' ... 
'year = {1994}, ' ...
'title = {Resource depression in \emph{Daphnia galeata}, \emph{Daphnia cucullata} and their interspecific hybrid: life history consequences}, ' ...
'journal = {J. Planton Res.}, ' ...
'volume = {16}, ' ...
'pages = {1714--1758}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mich2005'; type = 'Article'; bib = [ ... 
'author = {Michaloudi, E.}, ' ... 
'year = {2005}, ' ...
'title = {Dry Weights of the Zooplankton of {L}ake {M}ikri {P}respa ({M}acedonia, {G}reece)}, ' ...
'journal = {Belg. J. Zool.}, ' ...
'volume = {135}, ' ...
'pages = {223--227}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

