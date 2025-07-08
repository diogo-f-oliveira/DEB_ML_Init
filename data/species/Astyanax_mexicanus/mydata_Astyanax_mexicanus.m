  function [data, auxData, metaData, txtData, weights] = mydata_Astyanax_mexicanus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Characidae';
metaData.species    = 'Astyanax_mexicanus'; 
metaData.species_en = 'Mexican tetra'; 

metaData.ecoCode.climate = {'Am', 'BSh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc','0iFcc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};                             
metaData.date_subm  = [2020 05 26];                          
metaData.email      = {'bas.kooijman@vu.nl'};                 
metaData.address    = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc   = [2020 05 26]; 


%% set data
% zero-variate data
data.ab = 4.5;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'seriouslyfish';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch after 24 h, 5-7 d yolk absorption: feeding is assumed to start 3.5 d after hatch';
data.am = 18*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data for Astyanax bimaculatus';

data.Lp = 4.7;    units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess';
  comment.Lp = 'based on same relative length, compared to Brycon opalinus: 9.6*14.5/29.8';
data.Li = 9.6;    units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';
  comment.Li = 'converted from TL of 12 cm: 0.8*12';


data.Wwb = 4e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*.1^3';
data.Wwi = 16.8;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0097*Li^3, see F2, where Li = 12 cm TL';
  
data.Ri = 1e3/365; units.Ri = '#/d'; label.Ri = 'reprod rate'; bibkey.Ri = 'seriouslyfish';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% t-L data
data.tL_s = [ ... % age (d), standard length (cm)
0.148	2.815
0.176	2.626
0.204	1.786
0.204	1.996
0.204	1.996
0.220	2.647
0.221	3.487
0.223	4.790
0.234	2.878
0.235	2.983
0.235	3.613
0.237	4.979
0.265	4.118
0.322	3.613
0.338	4.601
0.349	2.626
0.350	3.382
0.352	4.433
0.364	2.815
0.364	2.899
0.364	3.172
0.366	4.286
0.382	5.168
0.393	3.025
0.394	3.529
0.394	3.676
0.395	4.496
0.395	4.853
0.396	5.000
0.409	3.908
0.481	4.097
0.482	5.210
0.483	5.714
0.495	4.328
0.496	4.916
0.498	6.218
0.510	4.496
0.510	4.727
0.526	5.336
0.537	3.529
0.538	3.718
0.538	4.013
0.540	5.021
0.569	5.714
0.570	6.282
0.582	4.727
0.583	4.916
0.583	5.063
0.583	5.210
0.583	5.378
0.584	5.546
0.598	5.819
0.613	5.945
0.614	6.618
0.915	6.239
0.927	4.559
0.972	5.357
1.000	4.727
1.000	4.979
1.000	5.210
1.015	5.651
1.015	5.756
1.245	5.483
1.246	5.630
1.246	5.714
1.246	6.092
1.259	5.168
1.261	6.513
1.261	6.681
1.273	4.706
1.273	4.958
1.994	6.176
2.008	5.735
2.009	5.987
2.010	6.870
2.010	6.996
2.010	7.122
2.010	7.248
2.023	6.324
2.340	6.429
2.341	7.038
2.342	7.605
2.354	6.176
2.386	8.193
2.656	6.134
2.656	6.239
2.672	6.996
2.673	7.563
2.673	7.668
2.673	8.004
2.686	6.429
2.699	5.714
2.700	6.723
4.342	7.647
4.342	7.794
4.355	6.681
4.357	7.899
4.401	8.992
6.025	7.080
6.025	7.227
6.026	7.836
6.026	8.193
6.027	8.971
6.040	7.983
6.053	6.912
7.423	8.845
7.436	8.088
7.451	8.340
7.451	8.487
7.451	8.676
7.463	7.080
7.464	7.269
7.466	9.013
7.467	9.454];
data.tL_s(:,1) = data.tL_s(:,1)* 365; % convert yr to d
units.tL_s   = {'d', 'cm'};  label.tL_s = {'time since birth', 'standard length', 'surface morph'};  
temp.tL_s    = C2K(24);  units.temp.tL_s = 'K'; label.temp.tL_s = 'temperature';
bibkey.tL_s = 'SimoElle2017';
comment.tL_s = 'Surface morph (San Salomon spring), lab data';
% t-L data  cave-morph
data.tL_c = [ ... % age (d), standard length (cm)
0.223	4.011
0.233	2.333
0.245	2.685
0.245	2.836
0.245	2.937
0.246	3.423
0.246	3.490
0.246	3.658
0.257	3.088
0.257	3.272
0.268	2.517
0.303	2.853
0.327	4.128
0.372	3.273
0.383	3.071
0.384	3.541
0.384	3.625
0.395	2.853
0.397	4.816
0.407	3.893
0.430	3.323
0.443	4.716
0.453	3.709
0.454	4.028
0.454	4.514
0.487	3.491
0.557	4.062
0.568	3.793
0.569	4.213
0.579	3.307
0.580	3.491
0.580	3.609
0.581	4.364
0.581	4.515
0.973	5.170
0.985	5.388
0.985	5.522
0.985	5.891
0.985	6.042
0.996	4.985
1.225	4.415
1.225	4.617
1.227	5.590
1.227	5.808
1.229	7.586
1.229	7.721
1.237	4.768
1.237	4.902
1.238	5.154
1.239	5.993
1.239	6.513
1.790	5.373
1.791	5.541
1.791	5.708
1.791	5.927
1.801	4.719
1.802	5.205
1.813	4.819
1.813	4.937
1.823	4.098
1.835	3.813
2.470	5.794
2.482	6.062
2.505	5.928
2.505	6.398
4.277	5.579
4.290	7.123
4.290	7.324
4.291	7.459
4.300	5.798
4.300	5.898
4.301	6.469
4.301	6.737
4.312	6.100
6.177	6.288
6.189	6.490
6.200	6.657
6.201	6.909
6.201	7.077
6.776	6.742
6.776	6.826
6.777	7.296
6.787	5.786
6.787	6.239
6.791	10.031
6.802	9.125
6.802	9.259
6.803	9.964
6.811	7.430
7.259	6.207
7.259	6.408
7.259	6.592
7.260	7.331
7.271	6.777
7.272	7.180
7.281	5.603
7.281	5.787
7.282	6.022];
data.tL_c(:,1) = data.tL_c(:,1)* 365; % convert yr to d
units.tL_c   = {'d', 'cm'};  label.tL_c = {'time since birth', 'standard length', 'cave morph'};  
temp.tL_c    = C2K(24);  units.temp.tL_c = 'K'; label.temp.tL_c = 'temperature';
bibkey.tL_c = 'SimoElle2017';
comment.tL_c = 'Cave morph (Pachon) , lab data';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_s = 3 * weights.tL_s;
weights.tL_c = 3 * weights.tL_c;

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
set1 = {'tL_s', 'tL_c'}; subtitle1 = {'Data for surface, cave morphs'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Surface and cave morphs are assumed to differ in {p_Am} only';
D2 = 'From photo: SL = 0.8 * TL';
metaData.discussion = struct('D1', D1,'D2', D2);

%% Facts
F1 = 'Preferred temp: 22-25 C';
metaData.bibkey.F1    = 'fishbase';
F2 = 'Weight (g) = 0.0097 * TL (in cm)^3';
metaData.bibkey.F2    = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '687DP'; % Cat of Life
metaData.links.id_ITIS = '162853'; % ITIS
metaData.links.id_EoL = '994702'; % Ency of Life
metaData.links.id_Wiki = 'Astyanax_mexicanus'; % Wikipedia
metaData.links.id_ADW = 'Astyanax_mexicanus'; % ADW
metaData.links.id_Taxo = '92902'; % Taxonomicon
metaData.links.id_WoRMS = '1021604'; % WoRMS
metaData.links.id_fishbase = 'Astyanax-mexicanus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Astyanax_mexicanus}}';  
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
bibkey = 'SimoElle2017'; type = 'Article'; bib = [ ...  
'doi = {10.1186/s13227-017-0086-6}, ' ...
'author = {Victor Simon and Romain Elleboode and K\''{e}lig Mah\''{e} and Laurent Legendre and Patricia Ornelas?Garcia and Luis Espinasa and Sylvie R\''{e}taux}, ' ...
'year  = {2017}, ' ...
'title = {Comparing growth in surface and cave morphs of the species \emph{Astyanax mexicanus}: insights from scales}, ' ...  
'journal = {EvoDevo}, ' ...
'volume = {8}, ' ...
'pages = {23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Astyanax-mexicanus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Astyanax_bimaculatus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'seriouslyfish'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.seriouslyfish.com/species/astyanax-mexicanus/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

