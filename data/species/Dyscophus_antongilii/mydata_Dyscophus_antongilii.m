function [data, auxData, metaData, txtData, weights] = mydata_Dyscophus_antongilii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Microhylidae';
metaData.species    = 'Dyscophus_antongilii'; 
metaData.species_en = 'Madagascar tomato frog'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTh'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L','L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 06 10];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ab = 36/24; units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'Wiki';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 45; units.tj = 'd';    label.tj = 'time since birth at metam';            bibkey.tj = 'Wiki';   
  temp.tj = C2K(25);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 12*365; units.am = 'd';    label.am = 'life span';                        bibkey.am = 'ADW';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 7;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';                    bibkey.Lp  = {'ADW', 'TessGuar2007'};
  comment.Lp = 'based on tp = 3 yr and tL data';
data.Li  = 10.5;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';          bibkey.Li  = {'Wiki','amphibiaweb'};
  comment.Li = '85 to 105 mm';
data.Lim  = 6.5; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';           bibkey.Lim  = {'Wiki','amphibiaweb'};
  comment.Lim = '60 to 65 mm';

data.Wwb = 1e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Hyla exima';
data.Wwp = 68;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';              bibkey.Wwp = {'ADW','TessGuar2007','Wiki'};
  comment.Wwp = 'based on (Lp/Li)^3 * Wwi';
data.Wwi = 230; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'Wiki';
data.Wwim = 41; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'Wiki';

data.Ri  = 1500/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';     bibkey.Ri  = {'Wiki','amphibiaweb'};   
  temp.Ri  = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki gives 1000 till 15000 egges per clutch, amphibiaweb 1000 till 1500';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
2.984579	6.828978
2.984579	7.232779
2.984579	7.410926
2.996441	7.648455
3.969158	8.004750
3.981020	7.577197
3.981020	7.470308
3.992882	7.826603
3.992882	7.743467
3.992882	7.624702
4.016608	7.292161
5.013049	8.349168
5.013049	8.147268
5.013049	7.933491
5.013049	7.755344
5.973903	8.040380
5.985765	8.277909
5.997627	8.384798
6.970344	8.752969
6.970344	8.539192
6.970344	8.420427
6.970344	8.372921
6.982206	8.040380
7.005931	8.194774
7.990510	8.646080
7.990510	8.456057
8.002372	9.216152
8.002372	8.705463
8.975089	9.940617
10.007117	9.287411
11.003559	9.845605];
data.tL_f(:,1) = data.tL_f(:,1) * 365;
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TessGuar2007';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
3.032028	5.760094
3.969158	6.377672
3.981019	5.261282
3.981020	5.558194
3.981021	5.688835
3.981022	5.807600
4.989324	5.855106
4.989325	5.997624
5.001186	6.092636
5.001187	6.353919
5.013049	6.686460
6.009490	6.425177
6.021352	6.330166
6.033215	6.033253
6.033216	6.235154
6.045077	5.866983
6.994068	5.950118
6.994069	6.045130];
data.tL_m(:,1) = data.tL_m(:,1) * 365;
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TessGuar2007';
comment.tL_m = 'data for males';

% length-weight
data.LW_f = [ ... % SVL (cm), weight (g)
 7.63  50
 9.66 110
 6.83  41
 9.89 105
 6.65  26
 9.19  82];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL','wet weight', 'female'};  
bibkey.LW_f = 'TessGuar2007';
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % SVL (cm), weight (g)
 5.25 20
 7.51 47
 5.21 20
 6.42 31
 5.56 22
 6.40 32];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL','wet weight', 'male'};  
bibkey.LW_m = 'TessGuar2007';
comment.LW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'Low ab is inconsistent with slow growth; possibly Wwb is guessed too high; ab is ignored';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '388VL'; % Cat of Life
metaData.links.id_ITIS = '664381'; % ITIS
metaData.links.id_EoL = '333037'; % Ency of Life
metaData.links.id_Wiki = 'Dyscophus_antongilii'; % Wikipedia
metaData.links.id_ADW = 'Dyscophus_antongilii'; % ADW
metaData.links.id_Taxo = '142310'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Dyscophus+antongilii'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dyscophus_antongilii}}';
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
bibkey = 'TessGuar2007'; type = 'Article'; bib = [ ... 
'author = {Giulia Tessa and Fabio M. Guarino and Cristina Giacoma and Fabio Mattioli and Franco Andreone}, ' ... 
'year = {2007}, ' ...
'title = {Longevity and body size in three populations of \emph{Dyscophus antongilii} ({M}icrohylidae, {D}yscophinae), the tomato frog from north-eastern {M}adagascar}, ' ...
'journal = {Acta Herpetologica}, ' ...
'volume = {2(2)}, ' ...
'pages = {139-146}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Dyscophus+antongilii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Dyscophus_antongilii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

