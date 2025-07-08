function [data, auxData, metaData, txtData, weights] = mydata_Platichthys_flesus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Platichthys_flesus'; 
metaData.species_en = 'European flounder'; 

metaData.ecoCode.climate = {'MC','MB'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jFe', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 09];

%% set data
% zero-variate data

data.ab = 7;    units.ab = 'd';  label.ab = 'time since hatch at birth';       bibkey.ab = 'fishbase';   
  temp.ab = C2K(10.2); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 15*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(10.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 22.4;  units.Lp  = 'cm';  label.Lp  = 'length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 60;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'NissNybe2017';
  comment.Wwb = 'based on egg diameter 1 mm: pi/6*0.1^3';
data.Wwi = 2.2e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00759*Li^3.07; max published weight 2.9 kg';
  
data.Ri  = 2e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(10.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_fm = [... % time since birth (yr), total length (cm)
    0  5.68  5.68
    1 16.33 15.01
    2 22.34 20.58
    3 27.08 23.08
    4 30.44 25.43
    5 33.65 28.21
    6 35.98 NaN];
data.tL_fm(:,1) = 365 * (.5 + data.tL_fm(:,1)); 
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(10.2); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'GuneSahi2011'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'Data for females';
% 
data.tL = [... % time since July 1 (d), standard length (cm)
0.530	6.069
34.303	7.486
63.931	7.486
90.482	8.632
122.111	10.520
153.018	8.565
186.064	9.239
212.312	8.767
245.485	10.116
272.062	11.397
306.831	12.476
336.751	14.027
371.342	14.162
397.729	14.432
430.484	13.555
458.593	14.229
491.881	16.185
519.533	14.432
549.288	15.106
583.866	15.173
612.444	18.343
641.869	17.264
673.575	19.557
704.849	19.557
733.249	21.782
759.331	20.434
792.315	20.771
821.791	19.961
856.953	23.131
888.417	24.143
919.501	23.131
946.014	24.075
975.312	22.322
1010.322	24.682
1072.163	29.672
1098.486	29.605
1130.509	33.584
1160.603	27.312
1192.575	31.021
1218.923	31.089
1246.461	28.728
1276.317	29.942
1494.677	26.975
1587.792	31.965
1645.884	34.528];
data.tL(:,1) = data.tL(:,1) + 130; % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(10.2); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BeauMann1984';
comment.tL = 'Freshwater population in River Frome, England; sexes combined';

% time-weight
data.tW_fm = [... % time since birth (yr), weight (g)
    0   2.61   2.61
    1  56.74  41.37
    2 130.67  94.64
    3 234.98 131.77
    4 315.86 179.02
    5 417.97 212.00
    6 442.00 NaN];
data.tW_fm(:,1) = 365 * (.5 + data.tW_fm(:,1)); 
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'total length'};  
temp.tW_fm = C2K(10.2); units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'GuneSahi2011'; treat.tW_fm = {1 {'females','males'}};
comment.tW_fm = 'Data for females';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 5 * weights.tW_fm;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for female, male'};
% set2 = {'LW_f', 'LW_m'};  subtitle2 = {'Data for female, male'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00759*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
F2 = '0.7 of the individuals have the eyes on the right side after metam.';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4JNBQ'; % Cat of Life
metaData.links.id_ITIS = '172893'; % ITIS
metaData.links.id_EoL = '46570116'; % Ency of Life
metaData.links.id_Wiki = 'Platichthys_flesus'; % Wikipedia
metaData.links.id_ADW = 'Platichthys_flesus'; % ADW
metaData.links.id_Taxo = '46959'; % Taxonomicon
metaData.links.id_WoRMS = '154781'; % WoRMS
metaData.links.id_fishbase = 'Platichthys-flesus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Platichthys_flesus}}';
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
bibkey = 'BeauMann1984'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1984.tb04907.x}, ' ...
'author = {Beaumont, W. R. C. and Mann, R. H. K.}, ' ...
'year = {1984}, ' ...
'title = {The age, growth and diet of a freshwater population of the flounder, \emph{Platichthys flesus} ({L}.), in southern {E}ngland}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {25(5)}, '...
'pages = {607–616}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GuneSahi2011'; type = 'Article'; bib = [ ... 
'author = {Erdin\c{c} G\"{u}ne\c{s} and Temel \c{S}ahin and Ertu\v{g} D\"{u}zg\"{u}ne\c{s}}, ' ...
'year = {2011}, ' ...
'title = {Age, Growth and Reproduction of Flounder (\emph{Platichthys flesus luscus} {P}allas, 1811) in the South-eastern {B}lack {S}ea}, ' ... 
'journal = {Turkish Journal of Science \& Technology}, ' ...
'volume = {6(2)}, '...
'pages = {53-59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NissNybe2017'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.fishres.2017.02.020}, ' ...
'author = {Anders Nissling and Sofia Nyberg and Christoph Petereit}, ' ...
'year = {2017}, ' ...
'title = {Egg buoyancy of flounder, \emph{Platichthys flesus}, in the {B}altic {S}ea—adaptation to salinity and implications for egg survival}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = {191}, '...
'pages = {179-189}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Platichthys-flesus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

