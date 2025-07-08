function [data, auxData, metaData, txtData, weights] = mydata_Pagurus_bernhardus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Paguridae';
metaData.species    = 'Pagurus_bernhardus'; 
metaData.species_en = 'Common hermit crab'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0bMb', 'bjMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiCi', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab', 'aj', 'ap', 'am', 'Lj', 'Lp', 'Li', 'Wwb', 'Wwj', 'Wwp', 'Wwi', 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 08 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 29]; 

%% set data
% zero-variate data

data.ab = 365;  units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'Lanc1988';   
  temp.ab = C2K(8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 60;  units.tj = 'd'; label.tj = 'time since birth at metam'; bibkey.tj = 'Lanc1988';   
  temp.tj = C2K(10); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 365;  units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'ADW';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'applies to both females and males';
data.am = 4*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'ADW';   
  temp.am = C2K(10);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lj  = 0.45;   units.Lj  = 'cm';  label.Lj  = 'carapace length at settle'; bibkey.Lj  = 'guess';
  comment.Lp = 'computed as (Wwj/Wwi)^(1/3)*Li';
data.Lp  = 3.62;  units.Lp  = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'computed as (Wwp/Wwi)^(1/3)*Li';
data.Li  = 8;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'ADW';

data.Wwb = 1.8e-5; units.Wwb = 'g';   label.Wwb = 'dry weight at birth';       bibkey.Wwb = 'Lanc1988';
  comment.Wwb = 'Based on egg diameter of 0.7 mm: pi/6*0.07^3';
data.Wwj = 0.01;  units.Wwj = 'g';   label.Wwj = 'wet weight at metam';       bibkey.Wwj = 'guess';
data.Wwp = 5;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'guess';
data.Wwi = 54;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'ADW';

data.Ri  = 600/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Two broods per yr, Lanc1988, 300 eggs per brood, ADW';

%% set weights for all real data
weights = setweights(data, []);
%weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Growth might be limited by the availability of shells for housing';
metaData.bibkey.F1 = 'Lanc1988'; 
F2 = 'Two conspicuously different larval forms: zoeal form (swimming thoracic appendages) with typically has four stages, and glaucothocal form (corresponding to brachyuran megalopa, swimming with abdominal appendages) with a single stage';
metaData.bibkey.F2 = 'Lanc1988'; 
F3 = 'The polychaete Nereis fucata may live in the same shell stealing food'; 
metaData.bibkey.F3 = 'Waza';
F4 = 'The hydroid Hydractinia echinata is frequnetly found on shells ocupied by hermit crabs';
metaData.bibkey.F4 = 'anemoon';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '97805'; % ITIS
metaData.links.id_EoL = '46504486'; % Ency of Life
metaData.links.id_Wiki = 'Pagurus_bernhardus'; % Wikipedia
metaData.links.id_ADW = 'Pagurus_bernhardus'; % ADW
metaData.links.id_Taxo = '169175'; % Taxonomicon
metaData.links.id_WoRMS = '107232'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pagurus_bernhardus}}';
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
bibkey = 'Lanc1988'; type = 'Article'; bib = [ ... 
'author = {Lancaster, I.}, ' ... 
'year = {1988}, ' ...
'title = {\emph{Pagurus bernhardus} ({L}.):  AN INTRODUCTION TO THE NATURAL HISTORY OF HERMIT CRABS}, ' ...
'journal = {Field Studies}, ' ...
'volume = {7}, ' ...
'pages = {189--238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Pagurus_bernhardus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Waza'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.waza.org/en/zoo/choose-a-species/invertebrates/other-aquatic-invertebrates/pagurus-bernhardus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'anemoon'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.anemoon.org/flora-en-fauna/soorteninformatie/soorten/id/41/ruwe-zeerasp}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

