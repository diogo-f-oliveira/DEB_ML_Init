function [data, auxData, metaData, txtData, weights] = mydata_Bosmina_fatalis

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Bosminidae';
metaData.species    = 'Bosmina_fatalis'; 
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
metaData.data_1     = {'t-L'; 'T-ab'; 'T-ap'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 04]; 

%% set data
% zero-variate data

data.am = 40;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.023;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'HanaYasu1985';
data.Lp  = 0.035; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'HanaYasu1985';
data.Li  = 0.055;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'HanaYasu1985';

data.Wdi = 4.68e-6;   units.Wdi = 'mug';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'CulvBouc1985';
  comment.Wdi = 'based on 17.7369*0.55^2.2291 using F2';
  
data.Ri  = 1.5/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 1-2 eggs per brood; 2 d per brood';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (mm)
 0	0.230
 1	0.266
 2	0.305
 3	0.341
 4	0.341
 5	0.419
 6	0.389
 7	0.420
 8	0.489
 9	0.453
10	0.462
11	0.454
12	0.474
13	0.479
14	0.482
15	0.516];
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HanaYasu1985';

% temperature-age at birth
data.Tab = [ ... % temperature (C), number of brood per week
15 3.52
20 2.52
25 1.55];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'HanaYasu1985';

% temperature-timedsince birth at puberty
data.Ttp = [ ... % temperature (C), number of brood per week
15 8
20 6
25 4];
units.Ttp   = {'C', 'd'};  label.Ttp = {'temperature', 'time since birth at puberty'};  
bibkey.Ttp = 'HanaYasu1985';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Li = 3 * weights.Li;

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
metaData.bibkey.F1 = 'VijvFran1976'; 
F2 = 'W (in mug) = 17.7369 * (L in mm) ^ 2.2291 (no eggs)';
metaData.bibkey.F2 = 'CulvBouc1985'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'MLVQ'; % Cat of Life
metaData.links.id_ITIS = '83943'; % ITIS
metaData.links.id_EoL = '1039293'; % Ency of Life
metaData.links.id_Wiki = 'Bosmina'; % Wikipedia
metaData.links.id_ADW = 'Bosmina_fatalis'; % ADW
metaData.links.id_Taxo = '281847'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS

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
bibkey = 'HanaYasu1985'; type = 'Article'; bib = [ ... 
'author = {Takayuki Hanazato and Masayuki Yasuno}, ' ... 
'year = {1985}, ' ...
'title = {Effect of Temperature in the Laboratory Studies on Growth, Egg Development and First Parturition of Five Species of {C}ladocera}, ' ...
'journal = {Jpn. J. Limnol.}, ' ...
'volume = {46(3)}, ' ...
'pages = {185-191}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CulvBouc1985'; type = 'Article'; bib = [ ... 
'author = {Culver, D. A. and Boucherie, M. M. and Bean, D. J. and Fletcher, J. W.}, ' ... 
'year = {1985}, ' ...
'title = {Biomass of freshwater crustacean zooplankton from length-weight regressions}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {42}, ' ...
'pages = {1380--1390}'];
