function [data, auxData, metaData, txtData, weights] = mydata_Notropis_chalybaeus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notropis_chalybaeus'; 
metaData.species_en = 'Ironcolor shiner'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'jpCi','bjHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 24]; 

%% set data
% zero-variate data

data.am = 5*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'PerkShat2012';   
  temp.am = C2K(17.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 3.0;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'PerkShat2012';
data.Li = 6.5;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishbase'; 
  
data.Wwb = 9e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'PerkShat2012';
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwp = 0.2;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00708*Lp^3.08, see F1';
data.Wwi = 2.26;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.08, see F1';


%% univariate data
 
% time-length
data.tL = [ ... % time since birth (d), standard length (cm)
152.500	3.091
213.016	3.181
244.000	3.439
365-60.516	3.249
365-30.984	3.298
365-0.484	3.598
365+30.016	3.237
365+121.032	4.096
365+152.016	4.304
365+181.548	4.580
365+212.532	4.520
365+244.484	4.418
730-91.500	4.003
730-61.000	3.969
730-30.500	4.210
730+0.000	4.151
730+30.500	4.150
730+61.000	4.316
730+92.468	4.650
730+122.000	4.916
730+152.016	5.116
730+183.484	5.224
1095-91.500	4.823
1095+0.000	5.121];
data.tL(:,1) = data.tL(:,1) - 60; % guess time origin
data.tL(:,2) = data.tL(:,2)/ 0.84; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(17.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PerkShat2012'; 
comment.tL = 'Data from the upper San Marcos River during 2007; time origin guessed';

% length - fecundity
data.LN = [ ... % std length (cm), fecundity (#)
2.602	119.191
2.676	39.095
2.802	60.549
2.879	100.569
2.893	114.237
2.947	59.537
2.955	83.949
2.977	134.725
3.011	95.654
3.026	122.018
3.061	158.142
3.206	113.185
3.302	59.450
3.345	128.776
3.429	133.638
3.487	223.468
3.638	167.767
3.775	101.327
3.919	290.745
4.060	122.742];
data.LN(:,2) = data.LN(:,2)/ 0.84; % convert SL to TL
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(17.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'PerkShat2012'; 
comment.LN = 'Data from Marshalls Creek';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperature varies from 8 to 25 C, mean is guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.84*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZFX'; % Cat of Life
metaData.links.id_ITIS = '163403'; % ITIS
metaData.links.id_EoL = '212358'; % Ency of Life
metaData.links.id_Wiki = 'Notropis_chalybaeus'; % Wikipedia
metaData.links.id_ADW = 'Notropis_chalybaeus'; % ADW
metaData.links.id_Taxo = '181494'; % Taxonomicon
metaData.links.id_WoRMS = '1020810'; % WoRMS
metaData.links.id_fishbase = 'Notropis-chalybaeus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notropis_chalybaeus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notropis-chalybaeus.html}}';  
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
bibkey = 'PerkShat2012'; type = 'Article'; bib = [ ... 
'author = {Joshuah S. Perkin and Zachary R. Shattuck and Timothy H. Bonner}, ' ... 
'year = {2012}, ' ...
'title = {Life History Aspects of a Relict Ironcolor Shiner \emph{Notropis chalybaeus} Population in a Novel Spring Environment}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {167(1)}, ' ...
'pages = {111-126}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cobu1986'; type = 'Article'; bib = [ ... 
'author = {Coburn, Miles M.}, ' ... 
'year = {1986}, ' ...
'title = {Egg Diameter Variation in {E}astern {N}orth {A}merican {M}innows ({P}isces: {C}yprinidae): {C}orrelation with Vertebral Number, Habitat and Spawning Behavior}, ' ...
'journal = {The Ohio Journal of Science}, ' ...
'volume = {86(1)}, ' ...
'pages = {110-120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

