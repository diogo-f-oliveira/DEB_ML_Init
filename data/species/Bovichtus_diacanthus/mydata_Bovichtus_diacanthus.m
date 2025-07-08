function [data, auxData, metaData, txtData, weights] = mydata_Bovichtus_diacanthus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Bovichtidae';
metaData.species    = 'Bovichtus_diacanthus'; 
metaData.species_en = 'Tristan klipfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAS','MPS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 04];

%% set data
% zero-variate data

data.ab = 34;  units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(12.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'MesaEast2012';   
  temp.am = C2K(12.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 12; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'MesaCapu2010'; 
data.Li  = 18.9; units.Li  = 'cm';  label.Li  = 'ultimate total length';               bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'MesaCapu2010';
  comment.Wwb = 'based egg diameter of 1.5 mm: pi/6*0.15^3'; 
data.Wwp = 18; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'MesaEast2012';
  comment.Wwp = 'based on LW data';
data.Wwi = 86.8; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MesaEast2012';
  comment.Wwi = 'based on 0.00427*Li^3.16, see F1, gives 46.1 g';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1	11.038
1	8.235
1	6.909
1	9.447
1	7.402
1	6.568
1	5.697
1	9.182
1	8.803
1	7.743
1	6.190
1	12.137
1	4.258
2	10.523
2	15.485
2	14.614
2	13.023
2	15.939
2	12.114
2	16.432
2	14.993
2	13.667
2	13.288
2	12.569
2	9.955
2	8.099
2	11.584
2	11.243
2	14.084
3	16.901
3	17.470
3	16.447
3	15.652
3	15.159
3	14.742
3	13.720
3	13.114
3	12.205
3	17.129
3	17.811
3	18.910
4	18.432
4	18.053
4	17.182
4	19.038
4	16.008
5	18.675];
data.tL(:,1) = 365 * (0 + data.tL(:,1));  % convert yr to d
for i=2:size(data.tL,1);if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-8;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(12.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MesaEast2012';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
9.240	9.363
9.520	9.366
11.077	16.493
12.136	19.089
12.230	25.338
12.945	23.622
13.568	25.568
13.662	29.662
13.725	32.248
14.098	29.236
14.474	41.736
14.565	32.473
14.785	38.938
15.159	42.820
15.501	44.978
15.532	41.532
15.626	46.703
15.908	54.031
16.002	55.971
16.094	51.233
16.404	47.789
16.562	55.546
16.999	60.506
17.216	61.370
17.340	57.709
17.468	72.361
17.564	82.272
17.903	70.857
17.938	86.369
18.123	77.969
18.527	78.404
18.564	98.441
18.716	86.378
18.743	70.435
18.872	86.810];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'MesaEast2012';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
12.115	2722.421
12.197	2046.264
12.344	2455.516
13.049	2633.452
17.590	8256.228
18.590	7508.897];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(12.6);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'MesaEast2012';

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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00427*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'MRS6'; % Cat of Life
metaData.links.id_ITIS = '642648'; % ITIS
metaData.links.id_EoL = '46572940'; % Ency of Life
metaData.links.id_Wiki = 'Bovichtus_diacanthus'; % Wikipedia
metaData.links.id_ADW = 'Bovichtus_diacanthus'; % ADW
metaData.links.id_Taxo = '164472'; % Taxonomicon
metaData.links.id_WoRMS = '279374'; % WoRMS
metaData.links.id_fishbase = 'Bovichtus-diacanthus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bovichtus_diacanthus}}';
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
bibkey = 'MesaEast2012'; type = 'Article'; bib = [ ...
'doi = {10.1017/s0954102011000733}, ' ...
'author = {La Mesa, Mario and Eastman, Joseph T.}, ' ... 
'year = {2012}, ' ...
'title = {First data on age and sexual maturity of the {T}ristan klipfish, \emph{Bovichtus diacanthus} ({B}ovichtidae) from {T}ristan da {C}unha, {S}outh {A}tlantic}, ' ...
'journal = {Antarctic Science}, ' ...
'volume = {24(2)}, ' ...
'pages = {115–120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MesaCapu2010'; type = 'Article'; bib = [ ...
'doi = {10.1007/s00300-009-0710-6}, ' ...
'author = {Mario La Mesa and Vincenzo Caputo and Joseph T. Eastman}, ' ... 
'year = {2010}, ' ...
'title = {Some reproductive traits of the {T}ristan klipfish, \emph{Bovichtus diacanthus} ({C}armichael 1819) ({N}otothenioidei: {B}ovichtidae) from {T}ristan da {C}unha ({S}outh {A}tlantic)}, ' ...
'journal = {Polar Biol}, ' ...
'volume = {33}, ' ...
'pages = {337–346}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bovichtus-diacanthus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
