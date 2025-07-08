function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_variegatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_variegatus'; 
metaData.species_en = 'Harlequin rockfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNE','MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 24];

%% set data
% zero-variate data

data.am = 47*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(5.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 23;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 38;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 161;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 761;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 1.6e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(5.2);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Sebastes_polyspinis: 203503*761/963';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
2.873	14.414
5.055	17.225
6.091	20.230
7.016	24.835
8.056	30.240
9.200	28.646
10.119	30.251
11.266	30.456
12.194	37.261
13.115	39.866
14.483	35.272
18.277	42.491
19.191	41.096
21.033	45.705
22.407	45.312
23.097	46.315
23.895	44.119
25.171	53.326
27.458	49.937
30.201	45.151
31.008	47.955
32.035	45.160
34.103	48.171
36.046	44.980
37.994	44.590
38.926	53.995
39.720	48.799
40.629	44.203
42.918	42.415
43.841	46.019
47.297	56.436
53.471	47.667
65.405	56.327];
data.tL_f(:,1) = 365*(0.3+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f   = C2K(5.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MaleHans2007';  comment.tL_f = 'females from Gulf of Alaska';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
3.327	12.217
4.133	14.421
4.944	19.825
5.746	19.229
7.133	26.236
7.933	25.240
9.204	31.046
10.353	33.052
11.155	33.056
12.083	39.460
13.456	38.267
14.148	40.871
15.290	38.276
15.987	44.080
17.018	43.685
19.305	40.697
20.341	43.102
23.207	43.916
24.945	55.325
26.306	46.332
27.793	44.539
29.049	41.545
30.890	45.954
32.959	49.565
34.214	45.971
35.247	47.176
36.287	52.381
37.082	47.985
38.115	48.591
39.250	42.196
41.325	49.407
48.242	74.041
73.654	54.168];
data.tL_m(:,1) = 365*(0.3+data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m   = C2K(5.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MaleHans2007'; comment.tL_m = 'males from Gulf of Alaska';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 3 * weights.Wwi;
weights.Li = 3 * weights.Li;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7QK'; % Cat of Life
metaData.links.id_ITIS = '166742'; % ITIS
metaData.links.id_EoL = '46568206'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_variegatus'; % ADW
metaData.links.id_Taxo = '187345'; % Taxonomicon
metaData.links.id_WoRMS = '274863'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-variegatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes}}';
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
bibkey = 'MaleHans2007'; type = 'techreport'; bib = [ ... 
'author = {Malecha, P.W. and D. H. Hanselman and J. Heifetz},' ...
'year = {2007}, ' ...
'title = {Growth and mortality of rockfish ({S}corpaenidae) from {A}laska waters}, ' ...
'institution = {NOAA}, ' ...
'volume = {Tech. Memo. NMFS F/AFSC-172}, ' ...
'pages = {1-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-variegatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
