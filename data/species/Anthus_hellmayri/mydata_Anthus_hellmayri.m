function [data, auxData, metaData, txtData, weights] = mydata_Anthus_hellmayri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Motacillidae';
metaData.species    = 'Anthus_hellmayri'; 
metaData.species_en = 'Hellmayr''s pipit'; 

metaData.ecoCode.climate = {'Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTs', '0iTg'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 11];

%% set data
% zero-variate data

data.ab = 13.5;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'NoraFuen2022';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 11.5;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Colo2022';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '13-15';
data.tp = 34.5;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '13-15';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 8.9*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 2.3;      units.Ww0 = 'g';   label.Ww0 = 'initital wet weight';     bibkey.Ww0 = 'NoraFuen2022';
data.Wwb = 2.0;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Colo2022';
data.Wwi = 18.75;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'NoraFuen2022';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.000	1.940
0.001	2.181
0.002	2.181
0.003	2.421
0.472	2.482
0.473	2.602
0.532	3.023
0.561	2.783
0.915	4.107
0.971	2.542
0.973	3.324
1.500	3.385
1.501	3.686
1.502	4.348
1.503	4.528
1.971	4.047
1.972	4.589
1.973	5.191
1.974	5.793
2.470	3.987
2.471	4.348
2.504	6.455
2.530	5.130
2.971	5.552
2.972	6.274
2.973	6.756
2.974	7.117
2.975	7.538
2.976	8.201
3.007	9.043
3.446	8.441
3.447	8.923
3.502	6.997
3.503	7.298
3.507	9.645
3.942	6.997
3.972	7.478
3.973	7.960
3.974	8.441
3.975	9.104
3.976	9.344
3.977	9.766
3.978	10.127
3.979	10.609
4.442	7.177
4.443	7.960
4.445	9.465
4.448	11.090
4.974	9.826
4.978	12.174
5.008	12.716
5.009	13.137
5.031	8.983
5.035	10.910
5.036	11.813
5.065	11.331
5.447	11.993
5.474	10.488
5.475	11.151
5.508	13.077
5.509	13.318
5.510	13.920
5.974	11.331
5.976	12.294
5.978	13.559
6.006	13.017
6.008	13.980
6.009	14.462
6.010	14.702
6.447	13.077
6.448	14.221
6.449	14.763
6.509	15.605
6.920	15.545
6.948	14.702
6.949	15.064
6.975	12.957
6.999	9.645
7.005	13.498
7.009	16.207
7.010	16.629
7.035	14.100
7.508	16.147
7.509	16.629
7.510	17.351
7.511	18.074
7.535	14.522
7.536	15.425
7.979	17.291
8.004	14.281
8.005	14.943
8.006	15.545
8.007	16.448
8.010	17.893
8.037	16.328
8.062	13.739
8.499	11.813
8.532	14.281
9.025	10.609
9.036	17.231
9.061	14.522
9.448	17.833
9.533	16.147
9.535	17.652
9.562	15.846
9.972	15.304
9.973	16.328
10.002	15.846
10.005	17.592
10.007	18.796
10.009	20.181
10.471	15.666
11.502	18.134];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Colo2022';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'Body temperature is guessed';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '5VKDB'; % Cat of Life
metaData.links.id_ITIS = '558649'; % ITIS
metaData.links.id_EoL = '1051342'; % Ency of Life
metaData.links.id_Wiki = 'Anthus_hellmayri'; % Wikipedia
metaData.links.id_ADW = 'Anthus_hellmayri'; % ADW
metaData.links.id_Taxo = '82735'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'D46D53447DC43885'; % avibase
metaData.links.id_birdlife = 'hellmayrs-pipit-anthus-hellmayri'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anthus_hellmayri}}';
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
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=D46D53447DC43885&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Colo2022'; type = 'PhDthesis'; bib = [ ... 
'author = {Colombo, M.}, ' ... 
'year = {2022}, ' ...
'title =  {Biología reproductiva de la Cachirla (Aves: Motacillidae) en pastizales del noreste de la provincia de Buenos Aires con uso ganadero extensivo}, ' ...
'school = {Universidad Nacional de La Plata, Argentina}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NoraFuen2022'; type = 'Misc'; bib = [ ... 
'doi = {10.2173/bow.helpip1.02}, ' ...
'author = {Norambuena, H. V. and F. Rivas Fuenzalida and S. Tyler and E. de Juana}, ' ... 
'year = {2022}, ' ...
'title = {Hellmayr''s Pipit (\emph{Anthus hellmayri}), version 2.0. In Birds of the World (T. S. Schulenberg and S. M. Billerman, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

