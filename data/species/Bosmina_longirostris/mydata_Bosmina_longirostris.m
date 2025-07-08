function [data, auxData, metaData, txtData, weights] = mydata_Bosmina_longirostris

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Bosminidae';
metaData.species    = 'Bosmina_longirostris'; 
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
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'T-ab'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 12 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2012 01 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 01 09];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2016 10 26];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 15]; 

%% set data
% zero-variate data

data.am = 140;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.02;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'estimate based on egg size, where 4 * egg length is adult length';
data.Lp  = 0.037; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Vijv1980';
data.Li  = 0.07;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'nina';

data.Wdi = 8;   units.Wdi = 'mug';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'CulvBouc1985';
  comment.Wdi = 'Computed from Li using F2';
  
data.Ri  = 12/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'cst';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '9-12 eggs per brood; 2 d per brood';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (d), length (mm)
0.503	0.211
7.087	0.406
13.897	0.458
21.158	0.531
28.129	0.562
34.950	0.584
41.923	0.607
48.900	0.615
55.722	0.633
62.852	0.636];
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Vijv1980';

% T - ab data
data.Tab = [ ... % temperature (C), number of brood per week
 2.5 0.5
 5   0.7
10   1.0
15   2.0
20   3.0];
data.Tab(:,2) = 7./data.Tab(:,2); % convert week to d and ab = 1/N
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Vijv1980';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 15 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'parthenogenetic reproduction, continuous moulting; cladocerans reach maturity in 3-8 moults';
metaData.bibkey.F1 = 'VijvFran1976'; 
F2 = 'W (in mug) = 17.7369 * (L in mm) ^ 2.2291 (no eggs)';
metaData.bibkey.F2 = 'CulvBouc1985'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'MLVB'; % Cat of Life
metaData.links.id_ITIS = '83938'; % ITIS
metaData.links.id_EoL = '340964'; % Ency of Life
metaData.links.id_Wiki = 'Bosmina_longirostris'; % Wikipedia
metaData.links.id_ADW = 'Bosmina_longirostris'; % ADW
metaData.links.id_Taxo = '33116'; % Taxonomicon

%% References
bibkey = 'nina'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.nina.no/archive/nina/PppBasePdf/NINA-Infomateriell/2007/krepsdyrfaktaark/walseng_Bosmina~longirsotris.pdf}}';
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
bibkey = 'VijvFran1976'; type = 'Article'; bib = [ ... 
'author = {Vijverberg, J. and Frank, T. H.}, ' ... 
'year = {1976}, ' ...
'title = {The chemical composition and the energy contents of copepods and cladocerans in relation to their size}, ' ...
'journal = {Freshwater Biol}, ' ...
'volume = {6}, ' ...
'pages = {333--345}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CulvBouc1985'; type = 'Article'; bib = [ ... 
'author = {Culver, D. A. and Boucherie, M. M. and Bean, D. J. and Fletcher, J. W.}, ' ... 
'year = {1985}, ' ...
'title = {Biomass of freshwater crustacean zooplankton from length-weight regressions}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {42}, ' ...
'pages = {1380--1390}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'cst'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.cst.cmich.edu/users/mcnau1as/zooplankton~web/bosmina/bosmina.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
