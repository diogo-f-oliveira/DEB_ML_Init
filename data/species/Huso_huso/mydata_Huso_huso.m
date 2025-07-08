function [data, auxData, metaData, txtData, weights] = mydata_Huso_huso


%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Huso_huso'; 
metaData.species_en = 'Beluga'; 

metaData.ecoCode.climate = {'MB', 'BSk', 'BWk'};
metaData.ecoCode.ecozone = {'MAm','THp'};
metaData.ecoCode.habitat = {'0iMcd', '0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Saeid Esmaeilpour Poodeh' ; 'Jaap van der Meer'};    
metaData.date_subm   = [2019 02 18];              
metaData.email       = {'Esmaeilpoorsaeid@yahoo.com'};            
metaData.address     = {'Royal Netherlands Institute for Sea Research (NIOZ)'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 02 21];


%% set data
% zero-variate data

data.ab = 14;   units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'SiddCoss2014';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'curator remark: I could not find this data in SiddCoss2014;data is ignored';
data.tp = 5840;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'KottFrey2007';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'for female: ap = 14-20 yr; for males: ap = 10-16 yr (KottFrey2007)';
data.am = 16790;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Coad2018';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'temp is wild guess';
  
data.Lb  = 2.5; units.Lb  = 'cm';  label.Lb  = 'total length at birth';     bibkey.Lb  = 'MikhElen2013';  
data.Lp  = 200;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'Birs1993'; 
data.Li  = 800;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'KottFrey2007';

data.Wwb = 0.065; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'MikhElen2013';
data.Wwp = 50000;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'FalaAkha2013';
data.Wwi = 3200000;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'KottFrey2007';

data.Ri  = 5479.4;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'SiddCoss2014';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';


% Univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
9 156.2
10 171.6
11 176.8
12 177.3
13 181.6
14 186.3
15 190.2
16 201.6
17 211.5
18 221.1
19 233.6
20 239.7
21 240.1
22 261.7
23 267.6
24 270.6
25 272.6
26 283.1
27 290.7
28 296.7];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Tagh2001';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.p_M = 3 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
F1 = 'Length-weight: Ww (in g) = 0.0139 * (TL in cm)^2.807';
metaData.bibkey.F1 = 'MousGhaf2014';
F2 = 'Growth parameters of Von bertalanffy equation in males is: infinity length = 302 cm, growth coefficien (k) = 0.072, time at 0 age (t0) = -0.574 and for females is: infinity length = 370 cm, growth coefficien (k) = 0.052, time at 0 age (t0) = -0.354';
metaData.bibkey.F2 = 'Tagh2001';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3MV27'; % Cat of Life
metaData.links.id_ITIS = '161084'; % ITIS
metaData.links.id_EoL = '46561184'; % Ency of Life
metaData.links.id_Wiki = 'Huso_huso'; % Wikipedia
metaData.links.id_ADW = 'Huso_huso'; % ADW
metaData.links.id_Taxo = '42449'; % Taxonomicon
metaData.links.id_WoRMS = '126280'; % WoRMS
metaData.links.id_fishbase = 'Huso-huso'; % fishbase


%% References
bibkey = 'Coad2018'; type = 'Misc'; bib = [ ...
'year = {2018}, ' ...
'author = {Brian W. Coad}, ' ...
'howpublished = {\url{http://www.briancoad.com/Species Accounts/Description and Acipenseridae to Chanidae.htm}}'];  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KottFrey2007'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kottelat M. and Freyhof, J.}, ' ...
'year = {2007}, ' ...
'title  = {Handbook of European Freshwater Fishes}, ' ...
'publisher = {Maurice Kottelat (privately published)}, ' ...
'Address = {Berlin},' ...
'pages = {646 pp}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Birs1993'; type = 'Book'; bib = [ ...    
'author = {Birstein, V. J}, ' ...
'year  = {1993}, ' ...
'title = {Sturgeons and paddlefishes: threatened fishes in need of conservation}}, ' ...  
'Publisher = {Conservation Biology}, ' ...
'pages = {787pp}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FalaAkha2013'; type = 'Article'; bib = [ ...    
'author = {Falahatkar, B. and Akhavan, S. and Tolouei Gilani, M. and Abbasalizadeh, A.}, ' ...
'year  = {2013}, ' ...
'title = {Sex identificattion and sexual maturity stages in farmed great sturgeon, \emph{Huso huso} {L}. through biopsy}, ' ...  
'journal = {Iranian Journal of Veterinary Research}, ' ...
'volume = {2}, ' ...
'pages = {133-139}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tagh2001'; type = 'Article'; bib = [ ...    
'author = {A. Taghavi Motlagh}, ' ...
'year  = {2001}, ' ...
'title = {An estimate of growth parameters, moetality rates and yield-per-recruit for Beluga (\emph{Huso huso}) living in {C}aspian {S}ea}, ' ...  
'journal = {Iranian Journal of Fisheries Sciences}, ' ...
'volume = {2}, ' ...
'pages = {25-48}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MousGhaf2014'; type = 'Article'; bib = [ ...    
'author = {Mousavi, S. and A. Ghafor}, ' ...
'year  = {2014}, ' ...
'title = {On the conditions impressing sturgeon fish}, ' ...  
'journal = {International Journal of Advanced and Applied Sciences}, ' ...
'volume = {4}, ' ...
'pages = {1-5}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MikhElen2013'; type = 'Manual'; bib = [ ...    
'author = {Mikhail S. Chebanov and Elena V. Galich}, ' ...
'year  = {2013}, ' ...
'title = {Sturgeon Hatchery Manual}, ' ...  
'journal = {FAO}, ' ...
'pages = {303pp}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SiddCoss2014'; type = 'Article'; bib = [ ...  
'author = {Siddique, M. A. M. and J. Cosson and M. Psenicka and O. Linhart}, ' ...
'year = {2014}, ' ...
'title = {A review of the structure of sturgeon egg membrances and of the associated terminology}, ' ... 
'journal = {Applied Ichthyology}, ' ...
'pages = {1246-1255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
