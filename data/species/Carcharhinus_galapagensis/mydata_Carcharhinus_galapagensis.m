function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_galapagensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_galapagensis'; 
metaData.species_en = 'Galapagos shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.8); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 15];

%% set data
% zero-variate data

data.ab = 2*365;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(23.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'WethCrow1996 guessed 1 yr, but 2 yr is consistent with growth data';
data.tp = 2829;    units.tp = 'd';   label.tp = 'time since birth at puberty for females';   bibkey.tp = 'AnAge';    
  temp.tp = C2K(23.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2555;    units.tpm = 'd';   label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'AnAge';    
  temp.tpm = C2K(23.8);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 24*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'AnAge';   
  temp.am = C2K(23.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 80;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'WethCrow1996';  
data.Lp  = 230;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'WethCrow1996'; 
  comment.Lp = 'between TL 215 and 245 cm';
data.Lpm  = 220;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'WethCrow1996'; 
  comment.Lpm = 'between TL 205 and 239 cm';
data.Li  = 370;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';
data.Lim  = 329;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';
  comment.Lim = 'based on max TL caught of 267 cm, for max female TL 300 cm: 267/300*370';

data.Wwi = 413e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00479*Li^3.09, see F1';
data.Wwim = 287e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';      bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00479*Lim^3.09, see F1';

data.Ri  = 8.7/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(23.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 till 16 pups per litter, 1 litter each 2 yrs';
 
% univariate data
% length-weight
data.LW_f = [ ... % total length (cm), weight (kg)
87.188	3.597
90.845	4.799
95.473	5.746
99.623	7.683
101.796	6.186
105.690	6.646
112.054	11.277
114.975	11.745
125.404	9.438
125.955	16.090
126.417	13.621
140.073	18.190
156.178	24.710
157.419	27.412
166.445	30.787
184.323	44.689
210.525	64.685
224.330	109.686
225.495	104.499
227.983	110.395
229.836	101.011
240.282	100.429
244.147	97.931
245.780	115.915];
data.LW_f(:,2) = data.LW_f(:,2) * 1e3; % convert kg to g
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f  = 'WethCrow1996'; 
%
data.LW_m = [ ... % total length (cm), weight (kg)
81.105	2.909
107.403	7.864
109.860	10.555
112.750	7.819
114.229	10.025
116.886	8.277
128.118	13.606
130.079	15.316
134.454	15.279
137.890	18.701
138.595	16.230
139.880	23.369
140.573	19.665
142.265	18.664
147.164	22.568
155.237	27.923
159.604	27.147
163.257	27.856
185.185	33.341
215.294	55.276];
data.LW_m(:,2) = data.LW_m(:,2) * 1e3; % convert kg to g
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m  = 'WethCrow1996'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;
weights.Lp = 3 * weights.Lp;
weights.Lpm = 3 * weights.Lpm;
weights.Lb = 3 * weights.Lb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} ans E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww on g = 0.00479*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'R3NH'; % Cat of Life
metaData.links.id_ITIS = '160345'; % ITIS
metaData.links.id_EoL = '46559781'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_galapagensis'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_galapagensis'; % ADW
metaData.links.id_Taxo = '101348'; % Taxonomicon
metaData.links.id_WoRMS = '105790'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-galapagensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_galapagensis}}';
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
bibkey = 'WethCrow1996'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00003099}, ' ...
'author = {Bradley M. Wetherbee and Gerald L. Crow and Christopher G. Lowe}, ' ... 
'year = {1996}, ' ...
'title = {Biology of the {G}alapagos shark, \emph{Carcharhinus galapagensis}, in Hawai''i}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {45}, ' ...
'pages = {299-310}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Carcharhinus-galapagensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Carcharhinus_galapagensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

