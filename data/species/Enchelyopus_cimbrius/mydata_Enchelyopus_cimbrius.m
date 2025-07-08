function [data, auxData, metaData, txtData, weights] = mydata_Enchelyopus_cimbrius

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Lotidae';
metaData.species    = 'Enchelyopus_cimbrius'; 
metaData.species_en = 'Fourbeard rockling'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 28];

%% set data
% zero-variate data
data.am = 9*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'fishbase';  
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25;   units.Lp = 'cm';   label.Lp = 'total length at puberty for female';      bibkey.Lp = 'fishbase';
data.Lim = 41;    units.Lim = 'cm';   label.Lim = 'ultimate total length for male';        bibkey.Lim = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'NAFO';
  comment.Wwb = 'based on egg diameter of 1 mm of M. molva: pi/6*0.1^3';
data.Wwp = 77.1;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00407*Lp^3.06, see F3';
data.Wwim = 350.5; units.Wwim = 'g';   label.Wwim = 'ultimate male wet weight';      bibkey.Wwim = 'fishbase';     
  comment.Wwim = 'based on  0.00407*Li^3.06, see F3';

data.Ri = 45e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  
% uni-variate data
% time-length
data.tL = [ ... % age (years) ~ Length (cm) 
    1 11.26
    2 12.74
    3 15.73
    4 18.05
    5 20.43
    6 24.07
    7 25.85
    8 28.36
    9 30.77];
data.tL(:,1) = 365 * (.75+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Dere1999';

% length-weight
data.LW_f = [ ... % total length (cm), weight 
9.999	3.226
10.450	4.539
10.561	6.481
10.618	6.483
10.957	5.856
11.521	6.530
11.633	7.826
12.197	8.500
12.311	6.571
12.423	7.867
12.703	10.462
12.762	7.884
13.042	11.125
13.834	7.295
14.112	13.761
14.506	15.716
14.734	12.502
15.073	11.875
15.240	15.109
15.579	15.127
15.859	17.722
16.086	15.798
16.312	15.810
16.423	17.751
16.763	15.833
16.989	15.199
17.042	21.009
17.381	20.381
17.663	21.686
18.339	23.656
18.391	30.110
18.961	20.462
19.015	24.981
19.182	28.861
19.297	24.996
19.630	34.045
19.807	21.796
19.975	24.386
20.085	28.908
20.145	23.104
20.191	38.590
20.255	27.626
20.645	35.388
20.761	30.878
21.212	30.256
21.826	42.546
22.050	44.493
22.218	47.082
22.508	34.194
22.783	45.176
22.837	49.695
23.283	58.750
24.866	54.316
24.916	63.996
25.266	45.304
25.638	82.743
25.715	49.843
26.161	58.253
26.657	76.989
26.706	88.604
27.892	88.020
28.053	100.287
28.446	104.178
29.799	106.183];
units.LW_f = {'d', 'cm'}; label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'Dere1999';
%
data.LW_m = [ ... % total length (cm), weight 
10.797	4.744
11.249	4.768
11.530	6.126
11.642	7.476
11.810	8.828
12.039	4.810
12.206	7.506
12.490	5.506
12.658	7.530
12.826	8.883
12.997	6.205
13.334	9.582
13.731	6.245
13.784	11.621
13.898	10.284
14.011	8.946
14.461	10.985
14.628	15.024
14.688	8.983
15.591	10.374
15.700	15.082
15.868	17.777
16.150	17.793
16.324	10.414
16.659	16.477
16.883	19.847
17.501	23.238
17.619	15.185
17.668	26.606
17.953	22.591
18.351	17.239
18.458	27.991
18.685	24.645
18.744	21.962
19.359	30.726
19.359	30.726
19.582	34.768
19.585	30.738
19.697	32.088
19.758	23.360
19.986	20.014
20.040	24.718
20.372	35.482
20.715	28.112
20.763	41.548
20.881	33.495
21.048	36.862
21.328	39.563
22.011	31.540
22.403	35.591
22.406	31.562
22.842	55.092
23.181	55.782
23.417	39.004
23.471	42.365
23.685	61.183
23.810	42.383
24.036	41.724
24.361	62.562
24.650	51.831
24.652	49.817
24.703	57.207
25.099	55.885
25.262	65.969
25.315	71.345
25.762	78.085
25.986	82.127
26.048	72.056
26.056	59.967
26.430	93.569
26.448	65.361
26.778	78.811
26.783	70.752
27.106	95.620
27.281	86.226
27.399	78.173
27.607	106.393
28.230	103.069
28.288	100.385
28.301	79.565
28.395	110.465
28.733	111.155
29.234	121.928
29.304	100.440
29.916	113.905
29.985	93.760
30.046	87.047
30.698	126.709
31.151	124.046
31.192	148.899
32.258	159.703];
units.LW_m = {'d', 'cm'}; label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'Dere1999';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 3 * weights.Wwb;
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Preferred temperature 10 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'demersal';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Length-Weight relationship: W in g = 0.00407*(TL in cm)^3.06';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '39NMN'; % Cat of Life
metaData.links.id_ITIS = '164748'; % ITIS
metaData.links.id_EoL = '46564450'; % Ency of Life
metaData.links.id_Wiki = 'Enchelyopus_cimbrius'; % Wikipedia
metaData.links.id_ADW = 'Enchelyopus_cimbrius'; % ADW
metaData.links.id_Taxo = '44307'; % Taxonomicon
metaData.links.id_WoRMS = '126450'; % WoRMS
metaData.links.id_fishbase = 'Enchelyopus-cimbrius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Enchelyopus_cimbrius}}';
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
bibkey = 'Dere1999'; type = 'Article'; bib = [ ...  
'author = {Heather L. Deree}, ' ...
'year = {1999}, ' ...
'title  = {Age and growth, dietary habits, and parasitism of the fourbeard rockling, \emph{Enchelyopus cimbrius}, from the {G}ulf of {M}aine}, ' ...
'publisher = {Fish. Bull.}, ' ...
'volume = {97}, ' ...
'pages = {39–52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Enchelyopus-cimbrius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NAFO'; type = 'Misc'; bib = [ ...
'title = {Early Stages of Fishes in the Western North Atlantic Ocean}, ' ...
'howpublished = {\url{https://www.nafo.int/Library/Fahay}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
