function [data, auxData, metaData, txtData, weights] = mydata_Echiichthys_vipera
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Trachinidae';
metaData.species    = 'Echiichthys_vipera'; 
metaData.species_en = 'Lesser weever'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.4); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 23];

%% set data
% zero-variate data

data.ab = 26;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(10.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'ScotHend2015';   
  temp.am = C2K(10.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 6.27;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty';  bibkey.Lp  = 'guess';
  comment.Lp = 'based on Trachinus_draco: 12*27.7/53 cm';
data.Li  = 27.7;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'MunkNiel2005';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 1.91;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.00708*Lp^3.05, see F1';
data.Wwi = 177.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.05, see F1; max published weight 166.17 g';
 
data.GSI = 0.08; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(10.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Trachinus draco';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (mm)
1.127	44.969
2.131	62.165
2.520	69.615
2.868	78.210
2.889	86.227
2.909	74.776
2.930	82.792
2.991	73.346
3.012	67.047
3.134	71.344
3.135	75.639
3.503	89.387
3.524	77.363
3.525	71.924
3.544	81.944
3.585	80.227
3.586	69.921
3.606	74.788
3.851	82.809
3.872	80.233
3.873	95.693
3.892	93.403
4.015	81.953
4.036	110.010
4.056	72.219
4.118	77.660
4.487	94.558
4.528	96.850
4.548	77.668
4.876	83.686
4.917	109.167
4.999	89.128
5.060	81.113
5.122	84.549
5.531	82.553
5.880	107.181
5.900	111.189
5.901	118.347
5.902	122.355
5.982	103.460
6.125	114.915
6.515	111.773
7.027	99.757
7.028	91.455
7.088	114.073
7.109	122.376
7.129	124.381
7.560	104.634
7.580	108.070
7.805	125.538
7.846	122.103
7.887	115.519
7.908	119.814
7.909	114.088
7.928	124.968
7.929	117.524
8.502	103.792
8.503	116.103
8.584	113.527
8.585	125.838
8.830	115.250
8.871	126.702
8.891	96.641
9.055	106.951
9.076	121.839
9.137	119.263
9.506	105.528
9.526	122.420
10.100	115.272
10.120	109.833
10.121	111.265
10.530	114.421
10.551	129.023
10.796	116.716
10.837	118.721
10.878	132.464
10.899	104.407
11.042	119.870
11.063	125.310
11.124	136.477
12.067	132.772
12.558	125.337
13.890	126.220
15.119	129.677];  
data.tL(:,1) = (0+data.tL(:,1))*365; % convert to yr to d
data.tL(:,2) = data.tL(:,2)/ 10; % convert to mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length', 'ScotHend2015'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ScotHend2015'; 
comment.tL = 'temperature oscillates between 4 and 20 C';
%
data.tL1 = [ ... % time since birth (yr), total length (mm)
0.246	3.726
0.266	29.779
0.307	28.921
0.656	29.500
0.922	29.219
1.188	51.268
1.332	59.287
1.639	59.579
1.905	61.015
2.233	74.764
2.356	78.488
2.643	78.493
3.134	86.232
3.318	91.388
3.319	91.388
3.565	91.679
3.913	91.113
4.200	98.561
4.241	100.566
4.589	100.573
4.855	101.150
5.204	105.737
5.327	109.175
5.552	109.179
5.798	108.611
6.187	113.485
6.330	115.205
6.617	116.069
6.883	115.787];
data.tL1(:,1) = (0+data.tL1(:,1))*365; % convert to yr to d
data.tL1(:,2) = data.tL1(:,2)/ 10; % convert to mm to cm
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'total length', 'CreuWitt1989'};  
temp.tL1    = C2K(12);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'CreuWitt1989'; 

%% set weights for all real data
weights = setweights(data, []);
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
set1 = {'tL','tL1'}; subtitle1 = {'Data from ScotHend2015, CreuWitt1989'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'incubation time is ignored';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: weight in g = 0.00708*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '38FML'; % Cat of Life
metaData.links.id_ITIS = '630409'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Echiichthys_vipera'; % Wikipedia
metaData.links.id_ADW = 'Echiichthys_vipera'; % ADW
metaData.links.id_Taxo = '173472'; % Taxonomicon
metaData.links.id_WoRMS = '150630'; % WoRMS
metaData.links.id_fishbase = 'Echiichthys-vipera'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Echiichthys_vipera}}';
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
bibkey = 'MunkNiel2005'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Peter Munk and J{/o}rgen G. Nielsen}, ' ...
'year = {2005}, ' ...
'title  = {Eggs and larvae of North Sea fishes}, ' ...
'publisher = {Biofolia, Frederiksberg}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Echiichthys-vipera.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ScotHend2015'; type = 'article'; bib = [ ...  
'doi = {10.1017/S0025315415001460}, ' ...
'author = {Scott, A.L. and Henderson, P.A.}, ' ...
'year = {2015}, ' ...
'title  = {Seasonal and age-related migrations in the unexpectedly long-lived benthic fish the lesser weever, \emph{Echiichthys vipera} ({C}uvier, 1829)}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'pages = {1-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CreuWitt1989'; type = 'article'; bib = [ ...  
'author = {Creutzberg F. and Witte J.I.}, ' ...
'year = {1989}, ' ...
'title  = {An attempt to estimate the predatory pressure exerted by the lesser weever, \emph{Trachinus vipera} {C}uvier, in the southern {N}orth-{S}ea}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {34}, ' ...
'pages = {429–449}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

