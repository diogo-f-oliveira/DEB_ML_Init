function [data, auxData, metaData, txtData, weights] = mydata_Pseudopleuronectes_herzensteini
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Pseudopleuronectes_herzensteini'; 
metaData.species_en = 'Yellow striped flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.2); % in K, body temp
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
data.ab = 5.5;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'guess';    
  temp.ab = C2K(13.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'fishbase';  
  temp.am = C2K(13.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;  units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'fishbase';
data.Li = 50;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 6.55e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 81.1;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00708*Lp^3.12, see F1';
data.Wwi = 1.4e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00708*Li^3.12, see F1';

% uni-variate data
% time-length
data.tL = [ ... % age (years) ~ Length (cm) 
 1	12.423
 2	18.422
 3	25.252
 4	26.900
 5	31.763];
data.tL(:,1) = 365 * (0+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(13.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DagaChan1992'; 

% time-weight
data.tW = [ ... % age (years) ~ weight (g0
 1	 24.810
 2	104.044
 3	208.411
 4	254.150
 5	459.086];
data.tW(:,1) = 365 * (0+data.tW(:,1)); % convert yr to d
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'weight'};  
temp.tW = C2K(13.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DagaChan1992'; 

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
20.460	213510.542
20.871	270338.059
21.936	271090.733
21.990	355934.646
21.993	313533.481
23.468	385247.320
23.518	533692.857
23.533	272219.755
23.581	463066.220
24.767	421501.605
24.893	294381.974
25.119	471220.244
25.293	534947.321
26.126	457797.467
26.246	436680.630
27.005	599761.600
27.011	507892.685
27.057	719939.614
27.111	811850.580
27.135	409040.577
28.131	579355.629
28.163	1031675.196
28.199	416860.078
28.234	833845.543
28.241	706642.284
28.253	508770.812
28.305	636015.648
28.323	325074.559
29.190	671977.224
29.192	650776.759
29.315	558991.235
29.667	608710.117
29.714	827824.105
29.718	750088.832
29.782	679462.201
30.311	729306.525
30.378	602145.080
30.424	814192.252
30.503	482092.276
30.539	870810.451
30.617	559911.176
30.726	715465.354
30.775	892178.413
30.884	1047732.591
30.936	1167910.605
31.014	842877.688
31.065	984256.409
31.079	743983.772
31.264	631039.598
31.315	758284.676
31.427	871437.683
31.437	701833.496
31.447	532229.309
31.534	1055259.383
31.597	998766.389
31.659	942273.395
32.086	737627.810
32.198	836647.180
32.673	815781.239
32.675	773380.073
32.729	872357.624
32.838	1020844.980
32.856	716970.713
32.902	943151.522
32.999	1303644.112
33.010	1112839.342
33.063	1218883.832
34.127	1247903.916
34.150	852160.734
34.192	1141943.053
34.213	795667.740
34.218	703798.825
34.242	1297455.412
34.256	1064249.714
34.265	915845.991
34.319	1000689.904
35.195	1185054.966
35.201	1086119.230
35.225	683309.227
35.264	1022559.414
35.290	584415.304
35.299	1439544.992
35.327	958999.599
35.353	1524388.905
35.407	1609232.813
35.480	1369001.989
36.328	1051579.616
36.366	1404963.447
36.442	1122331.576
36.454	917393.164
36.487	1362646.033
36.491	1291977.583
36.650	1595977.297
37.355	1688347.996
37.464	840368.758
37.565	1144326.539
37.587	1773317.351
37.601	1525977.892
37.605	1469443.084
39.605	1661669.579];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(13.2);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'DagaChan1992'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tW = 3 * weights.tW;
weights.Wwb = 5 * weights.Wwb;
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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00708*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4P884'; % Cat of Life
metaData.links.id_ITIS = '616071'; % ITIS
metaData.links.id_EoL = '46570125'; % Ency of Life
metaData.links.id_Wiki = 'Pseudopleuronectes_herzensteini'; % Wikipedia
metaData.links.id_ADW = 'Pseudopleuronectes_herzensteini'; % ADW
metaData.links.id_Taxo = '185288'; % Taxonomicon
metaData.links.id_WoRMS = '275357'; % WoRMS
metaData.links.id_fishbase = 'Pseudopleuronectes-herzensteini'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudopleuronectes_herzensteini}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Pseudopleuronectes-herzensteini.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
