  function [data, auxData, metaData, txtData, weights] = mydata_Rhodeus_ocellatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Rhodeus_ocellatus'; 
metaData.species_en = 'Rosy bitterling'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 06];

%% set data
% zero-variate data
data.ab = 18;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Rhodeus amarus';
data.am = 5*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.25;    units.Lp = 'cm'; label.Lp = 'standard length at puberty';bibkey.Lp = 'Wiki'; 
  comment.Lp = 'based on Rhodeus amarus';
data.Li = 9.2;    units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 0.002;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'BattStoi2005';
  comment.Wwb = 'based on Rhodeus amarus';
data.Wwp = 0.45;    units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01148*Lp^3.11, see F1';
data.Wwi = 11.4;    units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^3.11, see F1';
  
data.Ri = 136/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at 4 cm';   bibkey.Ri = 'guess';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Rhodeus amarus';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (d), std length (cm)
88.293	1.806
91.771	2.121
95.526	2.561
99.567	1.879
109.183	2.040
109.640	2.662
113.576	1.933
115.937	2.162
117.203	2.315
120.138	1.970
121.170	2.851
121.223	2.458
127.722	2.466
129.073	2.657
133.444	2.541
139.369	2.290
150.495	3.130
151.165	3.015
151.792	2.881
155.951	2.669
157.110	2.774
157.430	2.084
169.193	2.378
172.757	3.564
175.097	2.951
183.414	2.527
185.627	2.689
185.861	2.795
187.424	3.082
191.562	2.860
196.072	3.223
196.603	2.629
198.327	3.404
207.070	3.172
303.659	3.721
304.797	2.983
316.359	3.602
316.731	4.186
330.644	3.780
333.090	4.048
335.036	3.674
340.578	3.251
345.311	4.131
351.087	3.813
354.278	4.416
366.180	3.522
372.413	3.826
373.498	4.315
378.571	3.681
381.645	3.814
382.326	4.121
383.347	4.580];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SoloMats1985';

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
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01148*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase';
F2 = 'eggs are deposited in mussels and stay there 15-30 d post fertilisation';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '796MB'; % Cat of Life
metaData.links.id_ITIS = '689965'; % ITIS
metaData.links.id_EoL = '225104'; % Ency of Life
metaData.links.id_Wiki = 'Rhodeus_ocellatus'; % Wikipedia
metaData.links.id_ADW = 'Rhodeus_ocellatus'; % ADW
metaData.links.id_Taxo = '562880'; % Taxonomicon
metaData.links.id_WoRMS = '1015520'; % WoRMS
metaData.links.id_fishbase = 'Rhodeus-ocellatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rhodeus_ocellatus}}';  
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
bibkey = 'BattStoi2005'; type = 'Article'; bib = [ ...  
'author = {K. W. Battes and I. Stoica}, ' ...
'year = {2005}, ' ...
'title = {BITTERLING GROWTH BIOLOGY (\emph{Rhodeus amarus} {L}.) IN THE {B}ISTRIA {R}IVER}, ' ... 
'journal = {Analele Univ. Oradea, Fasc. Biologie}, ' ...
'volume = {12}, '...
'pages = {21--29}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SoloMats1985'; type = 'Article'; bib = [ ...  
'author = {Solomon, G. and K. Matsushita and M. Shimizu and Y. Nose}, ' ...
'year = {1985}, ' ...
'title = {Age and growth of rose bitterling in {S}hin {T}one {R}iver}, ' ... 
'journal = {Bull. Jap. Soc. Sci. Fish.}, ' ...
'volume = {51(1)}, '...
'pages = {55-62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Rhodeus-ocellatus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

