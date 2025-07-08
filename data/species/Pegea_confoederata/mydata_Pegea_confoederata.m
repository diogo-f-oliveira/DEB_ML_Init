function [data, auxData, metaData, txtData, weights] = mydata_Pegea_confoederata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Thaliacea'; 
metaData.order      = 'Salpida'; 
metaData.family     = 'Salpidae';
metaData.species    = 'Pegea_confoederata'; 
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
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L-r'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2022 06 01];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 01]; 

%% set data
% zero-variate data;
data.ab = 1.7;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(22.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 40; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(22.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.35;  units.Lb  = 'cm';  label.Lb  = 'oozoid length at birth';   bibkey.Lb  = 'MadiPurc1998';
data.Lp  = 3.5;  units.Lp  = 'cm';  label.Lp  = 'oozoid length at puberty';   bibkey.Lp  = 'guess';
  comment.Lp = 'based on Lp/Li relationship of Cyclosalpa_bakeri: 7*5/10';
data.Li  = 7;  units.Li  = 'cm';  label.Li  = 'ultimate oozoid length';   bibkey.Li  = 'MadiPurc1998';

data.Wwi  = 15;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on length-volume relationship of Cyclosalpa_bakeri: 44*(7/10)^3';

data.Ri  = 90000/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(22.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.95';

% uni-variate data

% length - growth rate
data.Lr = [ ... % oozoid length (mm), growth exponent g (1/h)  in d/dt L = L*g 
3.9611	0.0436
4.7904	0.0238
7.3054	0.0211
7.9435	0.0272
9.0568	0.0298
10.1691	0.0263
11.0886	0.0178
12.3310	0.0279
13.5865	0.0634
14.5788	0.0529
15.2963	0.0389
16.8312	0.0474
17.7076	0.0364
18.3779	0.0135
20.5654	0.0228
21.6242	0.0284
22.5065	0.0362
23.7625	0.0348
24.7361	0.0417
25.8965	0.0533
27.1370	0.0510
27.3949	0.0228
28.7555	0.0274
30.3296	0.0136
31.4242	0.0336
32.4227	0.0235
33.4806	0.0230
34.2051	0.0155
35.3184	0.0182
36.5239	0.0262
37.2013	0.0099
38.2162	0.0068
39.3642	0.0177
40.2600	0.0139
41.1589	0.0104
42.0434	0.0122
43.0243	0.0072
44.0155	0.0090
45.1472	0.0127
46.1621	0.0097
46.9635	0.0067
50.0212	0.0046
50.0489	0.0062
51.8261	0.0040
53.0122	0.0047
54.0978	0.0058
55.1197	0.0094
57.2509	0.0092
58.9481	0.0025
60.7622	0.0025
63.3325	0.0030
65.1651	0.0041];
data.Lr(:,1) = data.Lr(:,1)/10; % convert mm to cm
data.Lr(:,2) = 24 * 3 * data.Lr(:,2); % 1/d, convert g to specific growth rate r in d/dt L = L*r/3
units.Lr = {'cm', '1/d'}; label.Lr = {'oozoid length', 'specific growth rate'};  
temp.Lr = C2K(22.5); units.temp.Lr = 'K'; label.temp.Lr = 'temperature';
bibkey.Lr = 'MadiPurc1998'; 

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

%% Discussion points
D1 = '';     
metaData.discussion = struct('D1',D1); 

%% Facts
F1 = 'Solitary generation salps would produce asexually aggregate generations of offspring, and each aggregate blastozooid produces one solitary';
metaData.bibkey.F1 = 'MadiPurc1992';
F2 = 'The aggregate generation is protogynous hermaphroditic; external fertilisation';
metaData.bibkey.F2 = 'MadiPurc1992';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6TXXC'; % Cat of Life
metaData.links.id_ITIS = '159663'; % ITIS
metaData.links.id_EoL = '46585556'; % Ency of Life
metaData.links.id_Wiki = 'Pegea'; % Wikipedia
metaData.links.id_ADW = 'Pegea_confoederata'; % ADW
metaData.links.id_Taxo = '114886'; % Taxonomicon
metaData.links.id_WoRMS = '137266'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pegea}}'; 
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
