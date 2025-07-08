  function [data, auxData, metaData, txtData, weights] = mydata_Pagetopsis_maculatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Channichthyidae';
metaData.species    = 'Pagetopsis_maculatus'; % fishbase writes Pagetopsis maculata
metaData.species_en = 'Crocodile icefish'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-1.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 29];

%% set data
% zero-variate data
data.ab = 95;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'guess';   
  temp.ab = C2K(0); units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'based on Trematomus_bernacchii';
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'MesaDona2023';   
  temp.am = C2K(-0.9); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 10;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'MesaDona2023'; 
data.Li = 25;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0082;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'MesaDona2023';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwp = 4.35;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','MesaDona2023'};
  comment.Wwp = 'based on 0.00120*Lp^3.56, see F1';
data.Wwi = 113.7; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00120*Li^3.56, see F1';

data.Ri = 1801/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'MesaDona2023';   
  temp.Ri = C2K(-0.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL_f = [ ... % time(yr), total length (cm)
0.145	1.235
0.423	1.875
0.506	2.171
1.011	3.997
2.507	11.944
3.496	11.149
3.507	13.174
4.476	14.948
4.496	14.504
4.497	15.492
4.518	17.369
4.529	17.962
4.538	16.578
5.496	16.920
5.497	18.945
5.504	13.955
5.505	17.414
5.506	17.661
5.507	18.056
5.527	16.475
6.474	16.470
6.506	17.557
6.526	18.051
6.527	20.126
6.537	18.644
6.548	19.138
6.549	19.533
7.505	18.688
7.516	19.083
7.535	16.909
7.537	20.170];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time', 'total length','females'};  
temp.tL_f = C2K(-0.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MesaDona2023'; 
%
data.tL_m = [ ... % time(yr), total length (cm)
2.487	11.154
3.507	14.212
3.517	13.520
4.475	13.960
4.485	13.515
4.506	13.071
4.517	15.096
5.486	16.178
5.515	14.993
5.516	15.585
5.536	14.597
6.504	14.592
6.505	15.926
6.506	17.162
6.516	16.865
6.525	14.889
6.545	14.148
7.505	18.095
7.514	15.180
7.515	17.453
8.514	18.041];
data.tL_m(:,1) = 365 * data.tL_m(:,1);  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time', 'total length','males'};  
temp.tL_m = C2K(-0.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MesaDona2023'; 

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
12.432	14.144
12.988	16.609
17.535	34.596
18.550	38.043
18.615	52.145
19.138	63.766
19.433	66.235
19.466	57.822
19.826	68.208
19.924	69.443
19.989	52.865
20.022	63.256
20.023	65.731
20.054	55.833
20.055	59.792
20.447	58.796
20.480	72.403
20.545	74.629
20.938	68.437
20.971	65.715
21.003	72.890
21.101	79.074
21.134	69.918
21.429	86.738
21.494	90.201
21.495	81.541
21.592	61.498
21.953	96.132
21.985	87.471
22.017	96.873
22.018	64.955
22.214	83.509
22.737	91.418];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'MesaDona2023'; 
%
data.LW_m = [ ... % total length (cm), weight (g)
11.974	12.420
14.885	27.217
15.573	27.701
16.031	31.899
16.063	29.177
16.096	26.455
16.488	25.459
16.489	28.181
16.587	30.901
16.848	35.350
16.914	40.297
16.947	34.111
16.978	54.152
16.979	44.008
16.980	37.575
17.045	22.728
17.405	29.897
17.502	46.226
17.503	36.081
17.535	38.308
17.699	41.521
17.895	48.446
17.928	45.229
17.929	41.765
17.961	43.002
18.026	54.382
18.124	39.535
18.255	43.739
18.419	31.860
18.484	46.704
18.615	42.991
18.942	51.398
18.975	51.892
19.008	46.696
19.073	43.478
19.498	64.007
20.022	45.937];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'MesaDona2023'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  10 * weights.tL_f;
weights.tL_m =  3 * weights.tL_m;
weights.ab =  0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f', 'LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00120*(TL in cm)^3.56';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4BZCY'; % Cat of Life
metaData.links.id_ITIS = '642901'; % ITIS
metaData.links.id_EoL = '46573066'; % Ency of Life
metaData.links.id_Wiki = 'Pagetopsis_maculata'; % Wikipedia
metaData.links.id_ADW = 'Pagetopsis_maculata'; % ADW
metaData.links.id_Taxo = '182489'; % Taxonomicon
metaData.links.id_WoRMS = '234796'; % WoRMS
metaData.links.id_fishbase = 'Pagetopsis-maculata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pagetopsis_maculata}}';  
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
bibkey = 'MesaDona2023'; type = 'Article'; bib = [ ... 
'author = {Mario La Mesa and Fortunata Donato and Emilio Riginella}, ' ...
'year = {2023}, ' ...
'title = {Life history and population structure of the {A}ntarctic icefish, \emph{Pagetopsis maculata} ({N}otothenioidei, {C}hannichthyidae) from the {W}eddell {S}ea}, ' ... 
'journal = {Polar Science}, ' ...
'volume = {35}, ' ...
'pages = {100917}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pagetopsis-maculata.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
