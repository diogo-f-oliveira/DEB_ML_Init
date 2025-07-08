function [data, auxData, metaData, txtData, weights] = mydata_Chromis_verater

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Chromis_verater'; 
metaData.species_en = 'Threespot chromis'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPh'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 03];

%% set data
% zero-variate data

data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(20.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'WinsTayl2017';   
  temp.am = C2K(20.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 8;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 16;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 8.9;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwi = 'based on 0.01778*Lp^2.991, see F1';
data.Wwi = 71;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01778*Li^2.991, see F1';

data.Ri  = 200; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Chromis chromis';
  
% uni-variate data
% time-length
data.tL = [ ... % time (yr), standard length (cm)
0.898	10.816
1.653	11.552
1.703	12.084
2.510	11.938
2.511	11.319
2.533	13.353
3.338	14.710
3.341	13.119
3.365	13.562
3.368	12.236
3.369	11.794
3.370	10.468
4.122	13.414
4.147	14.033
4.199	12.621
4.979	13.888
5.032	12.741
6.642	15.365
6.693	14.660
7.398	15.571
8.361	13.044
9.092	13.337
11.513	13.694
11.613	14.493
12.446	13.994
13.151	14.905
13.984	14.671];
data.tL(:,1) = 365*(data.tL(:,1) + 0); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(20.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WinsTayl2017';
comment.tL = 'data from Johnston Atoll';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01778*(TL in cm)^2.991';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5YHTX'; % Cat of Life
metaData.links.id_ITIS = '170096'; % ITIS
metaData.links.id_EoL = '46572295'; % Ency of Life
metaData.links.id_Wiki = 'Chromis_verater'; % Wikipedia
metaData.links.id_ADW = 'Chromis_verater'; % ADW
metaData.links.id_Taxo = '171095'; % Taxonomicon
metaData.links.id_WoRMS = '273759'; % WoRMS
metaData.links.id_fishbase = 'Chromis-verater'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chromis_verater}}';
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
bibkey = 'WinsTayl2017'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00338-017-1559-8}, ' ...
'author = {M. S. Winston and B. M. Taylor and E. C. Franklin}, ' ... 
'year = {2017}, ' ...
'title = {Intraspecific variability in the life histories of endemic coral-reef fishes between photic and mesophotic depths across the {C}entral {P}acific Ocean}, ' ...
'journal = {Coral Reefs}, ' ...
'volume = {36}, ' ...
'pages = {663–674}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Chromis-verater.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
