function [data, auxData, metaData, txtData, weights] = mydata_Ihlea_punctata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Thaliacea'; 
metaData.order      = 'Salpida'; 
metaData.family     = 'Salpidae';
metaData.species    = 'Ihlea_punctata'; 
metaData.species_en = 'Salp';

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'Aa'};

metaData.T_typical  = C2K(22.5); % K
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L-Ww', 'Ww-JO'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2022 06 01];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 01]; 

%% set data
% zero-variate data;
data.ab = 1;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(22.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(22.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.35;  units.Lb  = 'cm';  label.Lb  = 'oozoid length at birth';   bibkey.Lb  = 'MadiPurc1998';
data.Lp  = 1.1;  units.Lp  = 'cm';  label.Lp  = 'oozoid length at puberty';   bibkey.Lp  = 'guess';
  comment.Lp = 'based on Lp/Li relationship of Cyclosalpa_bakeri: 2.2*5/10';
data.Li  = 2.2;  units.Li  = 'cm';  label.Li  = 'ultimate oozoid length';   bibkey.Li  = 'MadiPurc1998';
  comment.Li = 'based on finding of considerable growth at L=1.5 cm';

data.Wwi  = 0.22;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on length-volume relationship of Cyclosalpa_bakeri: 44*(1.7/10)^3';

data.Ri  = 2400/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(22.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.95';

% uni-variate data

% length - growth rate
data.Lr = [ ... % oozoid length (mm), growth exponent g (1/h)  in d/dt L = L*g 
5.0294	0.0314
5.9797	0.0247
8.1437	0.0202
9.1841	0.0249
11.1553	0.0155
13.1459	0.0133
13.8766	0.0062
15.2485	0.0054];
data.Lr(:,1) = data.Lr(:,1)/ 10; % convert mm to cm
data.Lr(:,2) = 24 * 3 * data.Lr(:,2); % 1/d, convert g to specific growth rate r in d/dt L = L*r/3
units.Lr = {'cm', '1/d'}; label.Lr = {'oozoid length', 'specific growth rate'};  
temp.Lr = C2K(22.5); units.temp.Lr = 'K'; label.temp.Lr = 'temperature';
bibkey.Lr = 'MadiPurc1998'; 
comment.Lr = 'temperature is guessed';


%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 3 * weights.psd.v;

%% pack data and txt_data for output
auxData.temp   = temp;
txtData.units  = units;
txtData.label  = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Solitary generation salps would produce asexually aggregate generations of offspring, and each aggregate blastozooid produces one solitary';
metaData.bibkey.F1 = 'MadiPurc1992';
F2 = 'The aggregate generation is protogynous hermaphroditic; external fertilisation';
metaData.bibkey.F2 = 'MadiPurc1992';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6N74H'; % Cat of Life
metaData.links.id_ITIS = '655940'; % ITIS, genus only
metaData.links.id_EoL = '46585551'; % Ency of Life
metaData.links.id_Wiki = 'Ihlea'; % Wikipedia
metaData.links.id_ADW = 'Ihlea_punctata'; % ADW
metaData.links.id_Taxo = '840451'; % Taxonomicon
metaData.links.id_WoRMS = '137263'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ihlea}}'; 
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
bibkey = 'MadiPurc1992'; type = 'article'; bib = [ ...
'author = {Laurence P. Madin and Jennifer E. Purcell}, ' ...
'year = {1992}, ' ...
'title  = {Feeding, metabolism, and growth of \emph{Cyclosalpa bakeri} in the subarctic {P}acific}, ' ...
'journal = {Limnol. Oceanogr.}, ' ...
'volume = {37(6)}, '...
'pages = {1236-1251}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MadiPurc1998'; type = 'incollection'; bib = [ ...
'author = {Laurence P. Madin and Jennifer E. Purcell}, ' ...
'year = {1998}, ' ...
'title  = {Feeding and energetics of Thaliacea}, ' ...
'booktitle = {The biology of pelagic tunicates}, ' ...
'editor = {Bone, Q.}, '...
'pages = {81-103}, ' ...
'publisher = {Oxford Univ. Press}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
