function [data, auxData, metaData, txtData, weights] = mydata_Symbolophorus_californiensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Symbolophorus_californiensis'; 
metaData.species_en = 'Bigfin lanternfish'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMpm'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.3); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 01 26]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 26]; 

%% set data
% zero-variate data
data.am = 1.5*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'TakaYats2006';  
  temp.am = C2K(4.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.5;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess';
data.Li = 11;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3 for Benthosema_suborbitale';
data.Wwp = 1.7; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.00537*Lp^3.08, see F3';
data.Wwi = 8.67; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based on 0.00537*Li^3.08, see F3';
  
data.Ri = 3.2e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(4.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';

% uni-variate data
% tL data
data.tL = [ ... % time since birth (d), standard length (cm) 
81.132	2.978
83.282	2.252
85.297	3.089
93.616	3.420
93.664	2.869
93.694	2.517
299.957	6.495
343.599	8.612
347.800	8.304
353.040	8.041
355.163	7.622
363.421	8.658
369.688	8.592
370.689	9.077
382.211	8.571
389.537	8.329
397.875	8.440
398.941	8.176
405.066	9.740
407.228	8.881
414.482	9.454
418.706	8.882
433.280	9.279
451.934	10.756
489.538	10.318
510.478	9.505
532.329	10.211
541.679	10.697
552.215	9.530
570.984	9.686];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(4.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TakaYats2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5*weights.tL;
weights.Ri = 0*weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 4.3 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight for Ceratoscopelus_warmingii: Ww in g = 0.00537*(SL in cm)^3.08';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '53NJ4'; % Cat of Life
metaData.links.id_ITIS = '623871'; % ITIS
metaData.links.id_EoL = '46564248'; % Ency of Life
metaData.links.id_Wiki = 'Symbolophorus_californiensis'; % Wikipedia
metaData.links.id_ADW = 'Symbolophorus_californiensis'; % ADW
metaData.links.id_Taxo = '188427'; % Taxonomicon
metaData.links.id_WoRMS = '272733'; % WoRMS
metaData.links.id_fishbase = 'Symbolophorus-californiensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Symbolophorus}}';
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
bibkey = 'TakaYats2006'; type = 'article'; bib = [ ...
'doi = {0.1007/s10228-006-0346-2}, ' ...
'author = {Kaori Takagi and Akihiko Yatsu and Masatoshi Moku and Chiyuki Sassa}, ' ... 
'year   = {2006}, ' ...
'title  = {Age and growth of lanternfishes, \emph{Symbolophorus californiensis} and \emph{Ceratoscopelus warmingii} ({M}yctophidae), in the {K}uroshio-{O}yashio Transition Zone}}, ' ...
'journal = {Ichthyol Res}, ' ...
'page = {281-289}, ' ...
'volume = {53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Symbolophorus-californiensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

