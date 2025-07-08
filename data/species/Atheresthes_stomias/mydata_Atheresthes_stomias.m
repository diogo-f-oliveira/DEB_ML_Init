function [data, auxData, metaData, txtData, weights] = mydata_Atheresthes_stomias

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Atheresthes_stomias'; 
metaData.species_en = 'Arrow-tooth flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.6); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-N'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 10];

%% set data
% zero-variate data

data.ab = 12;    units.ab = 'd';  label.ab = 'age at birth';  bibkey.ab = 'guess';   
  temp.ab = C2K(4.6); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 23*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(4.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 37.9;  units.Lp  = 'cm';  label.Lp  = 'length at puberty for females';  bibkey.Lp  = 'fishbase';
data.Li  = 84;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 2.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BlooMata2007';
  comment.Wwb = 'based on egg diameter 1.64–1.9 mm: pi/6*0.175^3';
data.Wwi = 8.6e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight; based on 0.00851*Li^3.01, see F1 gives 5.33 kg';
    
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
4.204	36.367
4.221	39.116
4.288	38.271
5.200	42.197
5.200	48.010
5.217	41.035
5.217	43.148
5.234	38.181
5.234	45.157
6.180	46.969
6.180	45.912
6.196	57.010
6.196	41.896
6.196	40.945
6.213	50.246
6.213	45.173
6.213	44.116
6.230	51.303
6.230	49.295
6.230	48.238
6.230	43.060
7.176	48.888
7.193	46.141
7.193	47.937
7.193	51.214
7.193	57.766
7.210	53.116
7.210	55.547
7.227	50.263
7.227	52.165
7.227	56.076
7.227	58.929
7.243	54.279
8.189	52.287
8.206	60.002
8.206	56.092
8.206	50.808
8.223	67.929
8.223	66.872
8.223	64.124
8.223	63.173
8.223	62.222
8.223	61.165
8.223	55.141
8.223	47.215
8.240	59.052
8.240	54.190
9.185	58.116
9.202	53.361
9.202	60.970
9.202	67.206
9.219	58.751
9.219	64.775
9.219	66.043
9.236	57.483
9.236	59.914
9.236	62.133
9.236	62.662
9.236	64.036
9.236	68.369
9.236	73.125
10.165	65.425
10.182	69.864
10.182	63.206
10.199	67.962
10.216	70.922
10.216	68.914
10.216	66.906
10.216	66.166
10.216	62.255
10.232	73.036
10.232	64.052
10.232	61.199
11.195	69.987
11.195	74.003
11.263	71.890
11.263	74.955
12.259	69.054];
data.tL_f(:,1) = 365 * (.75 + data.tL_f(:,1)); 
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(4.6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ZimmGodd1996'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.751	33.278
2.819	34.970
2.836	36.345
3.815	36.150
3.849	37.101
3.849	38.053
3.866	33.297
4.829	36.801
4.829	37.646
4.829	40.817
4.845	38.703
4.845	41.768
4.845	42.931
4.862	49.166
5.791	47.068
5.825	44.849
5.842	47.809
5.842	42.842
5.876	45.907
5.892	43.582
6.771	47.824
6.804	41.907
6.804	45.923
6.821	51.102
6.838	40.956
6.838	42.858
6.838	44.021
6.838	44.761
7.818	47.736
7.835	49.111
7.868	51.225
8.831	47.119
8.831	49.233];
data.tL_m(:,1) = 365 * (.75 + data.tL_m(:,1)); 
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(4.6); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ZimmGodd1996'; 

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
47.933	274524.577
49.052	274678.018
51.942	549196.986
57.147	264822.669
59.004	594024.667
63.008	578125.900
76.031	1731226.800
78.100	1863089.379
79.174	1715210.237
79.918	2411584.169
82.108	2066489.570
83.101	2225616.913];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(4.6); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Zimm1997'; 

% weight-fecundity
data.WN = [ ... % total length (cm), fecundity (#)
1135.450	277270.522
1495.786	523239.967
1579.551	287322.522
1877.884	456665.050
1966.765	588061.472
2463.171	603487.989
5273.239	1732579.406
5492.999	1885636.373
5725.663	1715201.676
6135.708	2405147.932
6620.431	2206783.099
7071.023	2057830.448];
units.WN = {'g', '#'}; label.WN = {'weight', 'fecundity'};  
temp.WN = C2K(4.6); units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'Zimm1997'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00851*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '67VC7'; % Cat of Life
metaData.links.id_ITIS = '172862'; % ITIS
metaData.links.id_EoL = '46570139'; % Ency of Life
metaData.links.id_Wiki = 'Atheresthes_stomias'; % Wikipedia
metaData.links.id_ADW = 'Atheresthes_stomias'; % ADW
metaData.links.id_Taxo = '46936'; % Taxonomicon
metaData.links.id_WoRMS = '279792'; % WoRMS
metaData.links.id_fishbase = 'Atheresthes-stomias'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Atheresthes_stomias}}';
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
bibkey = 'ZimmGodd1996'; type = 'Article'; bib = [ ... 
'author = {Mark Zimmermann and Pamela Goddard}, ' ... 
'year = {1996}, ' ...
'title = {Biology and distribution of arrowtooth, \emph{Atheresthes stomias}, and {K}amchatka, \emph{A. evermanni}, flounders in {A}laskan waters}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {94}, ' ...
'pages = {358--370}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Zimm1997'; type = 'Article'; bib = [ ... 
'author = {Mark Zimmermann}, ' ... 
'year = {1997}, ' ...
'title = {Maturity and fecundity of arrowtooth flounder \emph{Atheresthes stomias}, from the {G}ulf of {A}laska}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {95}, ' ...
'pages = {598--611}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BlooMata2007'; type = 'techreport'; bib = [ ... 
'author = {Blood, Deborah M. and Ann C. Matarese and Morgan S. Busby.}, ' ... 
'year = {2007}, ' ...
'title = {Spawning, egg development, and early life history dynamics of arrowtooth flounder (\emph{Atheresthes stomias}) in the {G}ulf of {A}laska}, ' ...
'institution = {NOAA Professional Paper NMFS}, ' ...
'volume = {7}, ' ...
'howpublished = {\url{http://spo.nmfs.noaa.gov}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Atheresthes-stomias.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

