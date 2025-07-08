  function [data, auxData, metaData, txtData, weights] = mydata_Iberochondrostoma_lemmingii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Iberochondrostoma_lemmingii'; 
metaData.species_en = 'Iberian cyprinid'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 17]; 

%% set data
% zero-variate data
data.am = 6*365;   units.am = 'd';  label.am = 'life span';                        bibkey.am = 'VelaRinc1990';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.2;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';   bibkey.Lp = 'VelaRinc1990'; 
data.Li = 25;    units.Li = 'cm'; label.Li = 'ultimate total length';          bibkey.Li = 'fishbase';

data.Wwb = 5.4e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'VelaRinc1990';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 0.64;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';             bibkey.Wwp = {'VelaRinc1990','fishbase'};
  comment.Wwp = 'based on 0.00724*Lp^3.12, see F1';
data.Wwi = 166.5;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';               bibkey.Wwi = {'VelaRinc1990','fishbase'};
  comment.Wwi = 'based on 0.00724*Li^3.12, see F1';

data.GSI = 20;   units.GSI = '-';  label.GSI = 'gonado somatic index';           bibkey.GSI = 'VelaRinc1990';
  temp.GSI = C2K(20); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data

% time-length
data.tL = [ ... % time since may 1 (d), total length (cm)
58.912	2.188
92.485	2.522
119.234	2.540
139.288	2.540
181.841	3.022
206.361	3.040
239.836	3.151
268.605	2.706
297.664	2.909
329.051	3.336
349.346	3.874
367.271	4.096
385.222	4.374
414.173	4.337
445.444	4.503
474.528	4.763
505.857	5.059
536.979	4.892
566.030	5.077
601.807	5.355
623.792	4.687
657.482	5.281
681.861	4.983
711.160	5.725
744.634	5.836
767.000	6.022
798.312	6.281
829.558	6.392
856.248	6.280
892.050	6.614
927.844	6.929
954.559	6.873
985.731	6.817
1012.396	6.650
1045.887	6.798
1068.327	7.150
1104.013	7.224
1139.782	7.483
1164.434	7.799
1193.468	7.947
1226.910	7.983
1253.674	8.039
1282.576	7.890
1309.407	8.094
1345.110	8.205
1373.970	7.963
1405.291	8.241
1429.951	8.575
1465.530	8.408
1492.278	8.426
1521.362	8.685
1561.538	8.834
1615.092	9.000
1639.562	8.907
1673.036	9.018
1731.047	9.184
1762.409	9.555
1789.645	10.668
1822.854	10.185];
data.tL(:,1) = 40 + data.tL(:,1); % birth in april
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VelaRinc1990';
comment.tL = 'Data from River Huebra';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Wwb = 5 * weights.Wwb;
weights.GSI = 5 * weights.GSI;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g =0.00724*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6N4JB'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '225238'; % Ency of Life
metaData.links.id_Wiki = 'Iberochondrostoma_lemmingii'; % Wikipedia
metaData.links.id_ADW = 'Iberochondrostoma_lemmingii'; % ADW
metaData.links.id_Taxo = '1008271'; % Taxonomicon
metaData.links.id_WoRMS = '1020895'; % WoRMS
metaData.links.id_fishbase = 'Iberochondrostoma-lemmingii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Iberochondrostoma_lemmingii}}';  
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
bibkey = 'VelaRinc1990'; type = 'Article'; bib = [ ...  
'author = {J. C. Velasco and P. A. Rinc''{o}n and Lob\''{o}n-Carvi\''{a}}, ' ...
'year = {1990}, ' ...
'title = {The age, growth and reproduction of the cyprinid \emph{Rutilus lemmingii} ({S}teindachner, 1866) in the {R}iver {H}uebra, {C}entral {S}pain}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {36}, '...
'pages = {469-480}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Iberochondrostoma-lemmingii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
