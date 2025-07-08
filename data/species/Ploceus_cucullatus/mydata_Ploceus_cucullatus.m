function [data, auxData, metaData, txtData, weights] = mydata_Ploceus_cucullatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Ploceidae';
metaData.species    = 'Ploceus_cucullatus'; 
metaData.species_en = 'Village weaver'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-JOe'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 21];

%% set data
% zero-variate data

data.ab = 13;   units.ab = 'd';    label.ab = 'age at birth';                       bibkey.ab = 'CraiJuan2020';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 19;    units.tx = 'd';    label.tx = 'time since birth at fledging';   bibkey.tx = 'CraiJuan2020';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '17-21 d';
data.tp = 57;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';    bibkey.tR = 'guess';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 24*365;    units.am = 'd';    label.am = 'life span';                     bibkey.am = 'EoL';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'guess based on Passer domesticus';

data.Wwb = 3.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'Ahme2014';
data.Wwi = 34;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'CraiJuan2020';
  comment.Wwi = '26-37 g';
data.Wwim = 41; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'CraiJuan2020';
  comment.Wwim = '33-46 g';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'Ahme2014';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time (d), weight (g)
0.984	3.603
1.999	5.141
2.985	6.442
3.971	7.390
5.013	9.931
7.973	12.064
8.955	18.736
10.056	17.559
11.013	20.218
11.968	25.415
15.016	23.476
15.999	29.027
17.015	29.148
21.976	32.999
22.963	33.179];
units.tW   = {'d', 'g'};  label.tW = {'time', 'weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Ahme2014';
comment.tW = 'At Ahmed Yousif Farm, Sudan';

% time-respiration for embryo
data.tJOe= [ ... % time (d), rrespiration (cm^3 O2/ h)
1.346	0.052
1.553	0.052
1.801	0.063
1.927	0.104
2.132	0.063
2.298	0.074
2.507	0.145
2.711	0.053
3.211	0.187
3.398	0.218
3.417	0.136
3.604	0.146
3.623	0.105
3.731	0.259
3.769	0.126
3.833	0.239
3.895	0.208
4.434	0.239
4.495	0.208
4.495	0.229
4.578	0.209
4.638	0.137
4.641	0.260
4.786	0.270
4.787	0.321
4.847	0.239
5.450	0.342
5.469	0.291
5.495	0.465
5.534	0.393
5.535	0.424
5.657	0.332
5.660	0.465
5.720	0.373
5.827	0.516
5.931	0.547
6.322	0.466
6.411	0.691
6.424	0.415
6.426	0.476
6.490	0.558
6.509	0.507
6.555	0.681
6.557	0.752
6.594	0.579
6.618	0.722
6.700	0.681
6.702	0.753
6.744	0.763
6.779	0.538
6.849	0.834
6.866	0.691
6.905	0.589
6.923	0.497
6.972	0.783
7.258	0.651
7.383	0.671
7.388	0.866
7.407	0.804
7.412	1.009
7.467	0.753
7.490	0.825
7.513	0.917
7.558	1.040
7.569	0.692
7.577	0.989
7.636	0.856
7.652	0.682
7.721	0.958
7.736	0.723
7.743	1.009
7.782	0.907
7.796	0.661
7.850	1.163
7.944	0.794
8.282	1.040
8.372	1.337
8.428	1.081
8.465	0.918
8.470	1.112
8.493	1.225
8.504	0.846
8.507	0.959
8.540	1.409
8.577	1.245
8.616	1.153
8.632	0.989
8.650	0.887
8.682	1.307
8.716	1.030
8.720	1.174
8.746	1.399
8.763	1.256
9.402	1.154
9.453	1.512
9.454	1.553
9.477	1.665
9.480	1.778
9.492	1.440
9.528	1.236
9.531	1.338
9.550	1.277
9.596	1.461
9.600	1.614
9.610	1.215
9.620	1.573
9.678	1.440
9.700	1.481
9.703	1.594
9.706	1.717
9.711	1.891
9.864	1.420
9.876	1.870
10.450	1.687
10.455	1.861
10.461	2.086
10.547	1.441
10.553	1.646
10.566	1.380
10.580	1.922
10.626	2.065
10.640	1.810
10.694	2.301
10.707	2.004
10.713	1.431
10.850	1.943
10.885	1.687
11.425	2.567
11.437	2.230
11.499	2.240
11.502	2.373
11.542	2.301
11.551	2.639
11.561	3.038
11.567	2.486
11.645	3.069
11.648	2.414
11.685	2.230
11.693	2.537
11.728	2.302
11.729	3.130
11.753	2.455
11.778	2.619
11.901	2.578
12.416	3.284
12.457	4.092
12.532	2.988
12.538	3.203
12.613	4.522
12.643	3.264
12.665	3.336
12.688	3.397
12.753	3.520
12.770	3.377
12.777	3.673
12.805	3.141];
data.tJOe(:,2) = data.tJOe(:,2) * 24; % convert h to d
units.tJOe   = {'d', 'ml O_2/d'};  label.tJOe = {'age', 'O_2 consumption'};  
temp.tJOe    = C2K(36.5);  units.temp.tJOe = 'K'; label.temp.tJOe = 'temperature';
bibkey.tJOe = 'VeckHoyt1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 5;
weights.Wwi = weights.Wwi * 10;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4KH89'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '45510244'; % Ency of Life
metaData.links.id_Wiki = 'Ploceus_cucullatus'; % Wikipedia
metaData.links.id_ADW = 'Ploceus_cucullatus'; % ADW
metaData.links.id_Taxo = '58989'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '1226BBB2A1B2E284'; % avibase
metaData.links.id_birdlife = 'village-weaver-ploceus-cucullatus'; % birdlife
metaData.links.id_AnAge = 'Ploceus_cucullatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ploceus_castaneiceps}}';
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
bibkey = 'Ahme2014'; type = 'phdthesis'; bib = [ ... 
'author = {Noon Bushra Eltahir Ahmed}, ' ... 
'year = {2014}, ' ...
'title = {BREEDING HABITS AND NESTING SUCCESS OF THE VILLAGE WEAVER (BLACK–BACKED) \emph{Ploceus cucullatus}, AT {K}HARTOUM {S}TATE, {S}UDAN}, ' ...
'school = { University of Khartoum}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/919008/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CraiJuan2020'; type = 'Misc'; bib = [ ...
'author = {Craig, A. J. F. and E. de Juana}, ' ...
'year = {2020}, ' ...
'title = {Village Weaver (Ploceus cucullatus), version 1.0. In Birds of the World (J. del Hoyo, A. Elliott, J. Sargatal, D. A. Christie, and E. de Juana, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA.}, ' ...
'doi = {10.2173/bow.vilwea1.01}, ' ...
'howpublished = {\url{https://birdsoftheworld.org/bow/species/vilwea1/cur/introduction}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VlecHoyt1979'; type = 'Article'; bib = [...
'author = {Vleck, C. M. and Hoyt, D. F. and Vleck, D.}, '...
'year = {1979},'...
'title = {Metabolism of avian embryos: patterns in artricial and precocial birds}, '...
'journal = {Physiol. Zool. }, ' ...
'volume = {52}, ' ...
'pages = {363-377}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
