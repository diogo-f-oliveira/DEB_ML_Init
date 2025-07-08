function [data, auxData, metaData, txtData, weights] = mydata_Platichthys_bicoloratus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Platichthys_bicoloratus'; 
metaData.species_en = 'Stone flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.2); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 16];

%% set data
% zero-variate data
data.ab = 8.5;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'guess';    
  temp.ab = C2K(17.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'fishbase';  
  temp.am = C2K(17.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 23;  units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'guess';
data.Li = 50;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.08 mm: pi/6*0.08^3';
data.Wwp = 114;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00776*Lp^3.06, see F4';
data.Wwi = 1.22e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00776*Li^3.06, see F4; max published weight 1.2 kg';

% uni-variate data
% time-length
data.tL_fm = [ ... % age (years) ~ Length (cm)
 1 14.135 13.884
 2 24.042 21.685
 3 29.485 27.740
 4 34.803 31.074
 5 36.515 31.298
 6 40.350 33.887
 7 42.438 NaN
 8 43.155 NaN 
 9 46.115 NaN
10 47.083 NaN];
data.tL_fm(:,1) = 365 * (0+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(17.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'DagaChan1992'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % age (years) ~ weight (g)
 1   104.545 100.000
 2	 277.273 281.818
 3	 550.000 531.818
 4	 786.364 609.091
 5	1077.272 681.818
 6  1286.364 704.545
 7  1459.091  NaN
 8  1518.182  NaN
 9  1677.272  NaN
10  1777.273  NaN];
data.tW_fm(:,1) = 365 * (0+data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(17.2);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'DagaChan1992'; treat.tW_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
20.249	305526.848
20.748	243490.542
21.246	311084.084
22.804	297777.326
22.928	371774.250
23.925	216837.738
23.925	451406.153
24.112	315488.312
24.984	617418.672
24.984	426061.034
24.984	364332.417
24.984	253221.237
25.047	716145.332
25.109	524749.235
25.109	469193.230
26.044	437752.418
26.106	579689.033
26.231	511710.877
26.293	363524.730
26.355	320276.320
27.290	832044.940
27.290	597476.939
27.477	510941.655
27.726	492269.971
27.726	634245.046
27.726	770047.093
27.788	560132.742
29.034	911214.895
29.034	775412.433
29.221	688877.150
29.221	658013.255
29.221	639494.587
29.221	577765.970
29.221	546902.075
29.782	602111.102
29.844	657628.647
29.844	725529.463
29.907	540306.389
29.907	774873.975
29.907	867466.487
29.907	935367.718
29.969	460020.643
29.969	503230.593
30.031	824179.618
30.903	724875.621
30.903	558209.679
30.966	1119898.905
30.966	780392.751
31.838	829237.270
32.087	785873.476
32.399	1347409.266
32.523	1032517.889
32.586	896676.967
32.648	1427502.293
32.648	1254662.910
32.648	1168243.425
32.648	1112687.835
32.648	736144.345
32.710	841044.452
32.773	785450.403
33.583	1013345.378
33.645	963924.355
33.707	612034.101
33.769	920637.481
33.769	1161378.095
34.891	1469327.638
34.891	1191550.102
34.891	1117475.843
34.953	845832.461
35.016	1660608.769
35.016	1543324.976
35.016	1043325.080
35.140	1345716.972
35.202	956789.796
36.262	980827.235
36.324	1036344.365
36.386	912849.085
36.449	1110341.704
36.511	1178204.470
36.511	1616475.748
36.573	1326314.112
36.573	1690511.547
36.760	875581.393
36.760	1437309.493
36.885	1523652.472
37.819	1504556.886
37.819	1158878.119
39.003	1621110.326
39.065	1818602.531
39.190	1448155.564
39.751	1497191.972];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(17.2);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'DagaChan1992'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 5 * weights.tW_fm;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only ';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00776*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3R2QR'; % Cat of Life
metaData.links.id_ITIS = '616065'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Platichthys_bicoloratus'; % Wikipedia
metaData.links.id_ADW = 'Platichthys_bicoloratus'; % ADW
metaData.links.id_Taxo = '183973'; % Taxonomicon
metaData.links.id_WoRMS = '305689'; % WoRMS
metaData.links.id_fishbase = 'Platichthys-bicoloratus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Platichthys_bicoloratus}}';
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
bibkey = 'DagaChan1992'; type = 'article'; bib = [ ...
'author = {Chen Dagang and Liu Changan and Dou Shuozeng}, ' ...
'year   = {1992}, ' ...
'title  = {THE BIOLOGY OF FLATFISH ({P}LEURONECTINAE) IN THE COASTAL WATERS OF {C}HINA}, ' ... 
'journal = {Netherlands Journal of Sea Research}, ' ...
'page = {215-221}, ' ...
'volume = {29(1-3)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Platichthys-bicoloratus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
