  function [data, auxData, metaData, txtData, weights] = mydata_Thymallus_tugarinae

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Thymallus_tugarinae'; 
metaData.species_en = 'Lower Amur grayling'; 

metaData.ecoCode.climate = {'Dwd'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'};  
metaData.data_1     = {'t-L_f'; 't-Ww_f'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 28]; 

%% set data
% zero-variate data
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp = 18;     units.Lp = 'cm';    label.Lp = 'total length at puberty';  bibkey.Lp = 'MikhOstr2013'; 
data.Li = 35;     units.Li = 'cm';    label.Li = 'ultimate total length';    bibkey.Li = 'MikhOstr2012';

data.Wwb = 4.2e-3;     units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MikhOstr2013';
 comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';

    
% uni-variate data
% time-length
data.tL_Anyui = [... % year, length cm
    1 10.11
    2 16.30
    3 20.00
    4 23.61
    5 25.48
    6 30.25];
data.tL_Anyui(:,1) = 365 * data.tL_Anyui(:,1); % convert year to d
units.tL_Anyui = {'d', 'cm'}; label.tL_Anyui = {'time since birth', 'total length', 'middle Anyui'}; 
  temp.tL_Anyui = C2K(7); units.temp.tL_Anyui = 'K'; label.temp.tL_Anyui = 'temperature';
  bibkey.tL_Anyui = {'MikhOstr2012'};
  comment.tL_Anyui = 'middle Anyui; temp is guessed'; 
%
data.tL_Limuri = [ ... % year, length cm
    1 7.61
    2 13.62
    3 17.90
    4 18.34
    5 21.10
    6 23.21];
data.tL_Limuri(:,1) = 365 * data.tL_Limuri(:,1); % convert year to d
units.tL_Limuri = {'d', 'cm'}; label.tL_Limuri = {'time since birth', 'total length', 'Limuri'}; 
  temp.tL_Limuri = C2K(7); units.temp.tL_Limuri = 'K'; label.temp.tL_Limuri = 'temperature';
  bibkey.tL_Limuri = {'MikhOstr2012'};
  comment.tL_Limuri = 'Limuri; temp is guessed'; 

% time-weight
data.tW_Anyui = [... % year, weight (g)
    1 13.1
    2 61.4
    3 120.6
    4 206.3
    5 260.7
    6 458.8];
data.tW_Anyui(:,1) = 365 * data.tW_Anyui(:,1); % convert year to d
units.tW_Anyui = {'d', 'g'}; label.tW_Anyui = {'time since birth', 'wet weight', 'middle Anyui'}; 
  temp.tW_Anyui = C2K(7); units.temp.tW_Anyui = 'K'; label.temp.tW_Anyui = 'temperature';
  bibkey.tW_Anyui = {'MikhOstr2012'};
  comment.tW_Anyui = 'middle Anyui; temp is guessed'; 
%
data.tW_Limuri = [ ... % year, weight (g)
    1 5.5
    2 33.0
    3 76.9
    4 83.7
    5 128.3
    6 172.5];
data.tW_Limuri(:,1) = 365 * data.tW_Limuri(:,1); % convert year to d
units.tW_Limuri = {'d', 'g'}; label.tW_Limuri = {'time since birth', 'wet weight', 'Limuri'}; 
  temp.tW_Limuri = C2K(7); units.temp.tW_Limuri = 'K'; label.temp.tW_Limuri = 'temperature';
  bibkey.tW_Limuri = {'MikhOstr2012'};
  comment.tW_Limuri = 'Limuri; temp is guessed'; 

% length-fecundity
data.LN_Anyui = [ ... % total length (cm), fecundity (#)
17.929	1638.249
18.150	789.131
18.573	983.836
18.595	1763.934
18.636	708.453
18.723	1167.278
18.997	1040.873
19.025	1270.297
19.182	834.231
19.211	960.404
19.296	1533.953
19.331	1040.617
19.543	1132.234
19.569	1533.744
19.723	1315.652
19.778	1946.586
19.789	799.350
19.873	1499.094
19.898	2107.106
19.929	1980.887
19.999	1131.886
20.027	1292.475
20.061	994.171
20.177	1475.917
20.266	1705.295
20.273	1039.897
20.295	1865.885
20.304	959.568
20.450	1567.487
20.695	1326.382
20.724	1498.444
21.214	1050.650
21.229	2564.979
21.239	1589.828
21.443	2461.565
21.448	1956.781
21.540	1830.515
21.634	1520.692
21.727	1371.482
21.776	2553.089
21.851	1118.997
21.934	1921.992
22.017	2702.043
22.112	2334.858
22.121	1417.069
22.263	2426.521
22.570	2047.701
22.656	2598.305
22.656	2598.305
22.667	1508.430
22.690	2231.166
22.814	1955.736
22.873	2185.137
22.928	2689.874
23.025	2081.770
23.081	2597.980
23.197	3079.726
23.336	1393.196
23.384	2678.054
23.473	2884.487
23.512	2035.508
23.515	1679.865
23.723	2195.959
23.835	3102.183
24.047	3182.327
24.170	2975.731
24.328	2401.997
24.589	3594.914
24.592	3262.215
24.839	2871.969
24.976	4363.260
25.104	3732.188
25.121	5074.431
25.220	4236.879
26.428	4889.874
26.850	5210.776
27.126	4912.285
27.212	5485.834];
units.LN_Anyui = {'cm', '#'}; label.LN_Anyui = {'total length', 'fecundity'}; 
  temp.LN_Anyui = C2K(7); units.temp.LN_Anyui = 'K'; label.temp.LN_Anyui = 'temperature';
  bibkey.LN_Anyui = {'MikhOstr2012'};
  comment.LN_Anyui = 'middle Anyui; temp is guessed'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Anyui = 5 * weights.tL_Anyui;
weights.tL_Limuri = 5 * weights.tL_Limuri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Anyui','tL_Limuri'}; subtitle1 = {'Data for rivers Anyui, Limuri'};
set2 = {'tW_Anyui','tW_Limuri'}; subtitle2 = {'Data for rivers Anyui, Limuri'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Links
metaData.links.id_CoL = '56Q8M'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '993657'; % Ency of Life
metaData.links.id_Wiki = 'Thymallus'; % Wikipedia
metaData.links.id_ADW = 'Thymallus_tugarinae'; % ADW
metaData.links.id_Taxo = '3421129'; % Taxonomicon
metaData.links.id_WoRMS = '1008744'; % WoRMS
metaData.links.id_fishbase = 'Thymallus-tugarinae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Thymallus}}';  
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
bibkey = 'MikhOstr2012'; type = 'Article'; bib = [ ...  
'doi = {10.1134/S0032945212060057}, ' ...
'author = {P. B. Mikheeva and V. I. Ostrovskiia and N. N. Semenchenko and G. V. Novomodnyi and A. P. Shmigirilov and A. L. Antonov and E. I. Barabanshchikov}, ' ...
'year = {2012}, ' ...
'title = {Biological Features of {L}ow {A}mur Grayling \emph{Thymallus tugarinae} ({S}almoniformes: {T}hymallidae): 2. {G}rowth}, ' ... 
'journal = {Journal of Ichthyology}, ' ...
'volume = {52}, '...
'pages = {628-638}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MikhOstr2013'; type = 'Article'; bib = [ ...  
'doi = {10.1134/S0032945213020100}, ' ...
'author = {P. B. Mikheeva and V. I. Ostrovskiia and N. N. Semenchenko and G. V. Novomodnyi and A. P. Shmigirilov and A. L. Antonov and E. I. Barabanshchikov}, ' ...
'year = {2013}, ' ...
'title = {Biological Characteristics of {L}ower {A}mur Grayling \emph{Thymallus tugarinae} ({S}almoniformes: {T}hymallidae): 2. {R}reproductive Biology}, ' ... 
'journal = {Journal of Ichthyology}, ' ...
'volume = {53}, '...
'pages = {281-292}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Thymallus-tugarinae.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

  