function [data, auxData, metaData, txtData, weights] = mydata_Ichthyomyzon_fossor

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Cephalaspidomorphi'; 
metaData.order      = 'Petromyzontiformes'; 
metaData.family     = 'Petromyzontidae';
metaData.species    = 'Ichthyomyzon_fossor'; 
metaData.species_en = 'Northern brook lamprey'; 

metaData.ecoCode.climate = {'Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'Dt'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(18); % K, body temperature
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2023 12 31];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU University Amsterdam'};      

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 31];

%% set data
% zero-variate data;
data.am = 7*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'Purv1970';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temp is guessed';

data.Lp  = 13.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase';
data.Li  = 17;     units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.66-1.36 mm: pi/6*0.1^3';
data.Wwp = 2.9761;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00107*Lp^3.03, see F2)';
data.Wwi = 5.7233;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00107*Li^3.03, see F2)';

data.NR  = 1400;   units.NR  = '#';   label.NR  = 'eggs at the end of life';bibkey.NR  = 'fishbase';   
  temp.NR = C2K(14); units.temp.NR = 'K'; label.temp.NR = 'temperature';

% uni-variate data at f
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) of yearclass 1960 and 1963
0.877	3.694  3.489
1.208	4.289  5.090
1.294	5.331  5.498
1.339	5.965  NaN
1.373   NaN    7.380
1.381	6.455  NaN
1.710	7.051  8.509
1.783	7.642  NaN
1.887	8.005  9.936
2.213	8.150 10.594];
data.tL(:,1) = 365 * (-0.7+data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
  treat.tL = {1, {'yr class 1960','yr class 1963'}};
bibkey.tL = 'Purv1970';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Temperature of tL data varies as T(t) = 16.5 + 10*sin(2*pi*(t+100)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'spawns once at end of life; no feeding as adult, no parasitic stage';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 0.00107*(TL in cm)^3.03';
metaData.bibkey.F2 = 'fishbase';
F3 = 'Ammocoetes do not have a predetermined sex; instead, they all rapidly produce eggs until about 17 months of age. Sex is determined by environmental factors including stream temperature, population density, average growth rate, and pH. Males then re-absorb the eggs, though it is not uncommon for male ammocoetes to still have eggs in their testes.';
metaData.bibkey.F3 = 'DockBeam1994';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '6N655'; % Cat of Life
metaData.links.id_ITIS = '159726'; % ITIS
metaData.links.id_EoL = '984733'; % Ency of Life
metaData.links.id_Wiki = 'Ichthyomyzon_fossor'; % Wikipedia
metaData.links.id_ADW = 'Ichthyomyzon_fossor'; % ADW
metaData.links.id_Taxo = '41683'; % Taxonomicon
metaData.links.id_WoRMS = '590493'; % WoRMS
metaData.links.id_fishbase = 'Ichthyomyzon-fossor'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ichthyomyzon_fossor}}';  
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
bibkey = 'Purv1970'; type = 'article'; bib = [ ... 
'doi = {10.2307/1441654}, ' ...
'author = {Harold A. Purvis}, ' ...
'year = {1970}, ' ...
'title  = {Growth, Age at Metamorphosis, and Sex Ratio of Northern Brook Lamprey in a Tributary of Southern {L}ake {S}uperior}, ' ...
'journal = {Copeia}, ' ...
'volume = {1970(2)}, ' ...
'page = {326–332}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ichthyomyzon-fossor.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
