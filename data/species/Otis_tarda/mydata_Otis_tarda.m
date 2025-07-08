function [data, auxData, metaData, txtData, weights] = mydata_Otis_tarda

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Otidiformes'; 
metaData.family     = 'Otididae';
metaData.species    = 'Otis_tarda'; 
metaData.species_en = 'Great bustard';

metaData.ecoCode.climate = {'BWk','BSk','Csa','Dwa','Dwb','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTg'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.25); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 24.5;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'avibase';   
  temp.ab = C2K(37.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab =  'temps from TielWill2002';
data.tx = 33.75;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.25);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 101.25;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '';
data.tR = 4.5*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.25);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 28.3*365; units.am = 'd';    label.am = 'life span';                  bibkey.am = 'AnAge';   
  temp.am = C2K(40.25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 143;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 88.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'avibase';
data.Wwi = 3816;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 11975;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'avibase';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.5 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
1.169	87.223
1.485	96.590
1.661	87.812
1.813	95.091
2.157	102.833
2.315	102.489
2.479	105.226
2.669	112.987
2.812	116.537
3.140	107.740
3.298	115.343
3.483	117.590
3.669	117.730
3.822	113.333
4.160	127.238
4.318	130.300
4.481	140.658
4.651	142.259
4.816	130.726
5.170	105.443
5.335	110.084
5.506	122.266
5.677	127.549
5.851	127.057
6.170	129.443
6.497	125.090
6.660	139.197
6.839	141.913
7.159	139.967
7.325	141.882
7.489	122.941
7.663	122.609
7.843	120.030
8.176	119.849
8.327	127.379
8.517	141.805
8.690	145.163
8.855	149.324
9.167	151.710
9.341	149.453
9.501	149.443
9.659	156.812
9.838	158.886
10.160	200.492
10.318	202.252
10.488	209.595
10.667	207.801
10.839	224.027
11.174	215.617
11.344	225.752
11.514	230.557
11.664	241.963
11.853	242.959
12.189	235.565
12.360	247.984
12.525	235.023
12.658	215.466
12.824	205.297
13.192	202.722
13.683	234.652
13.842	239.458
14.167	235.364
14.496	247.006
14.676	250.033
14.846	256.869
16.153	245.242
16.361	246.976
16.478	261.418
16.686	269.721
16.830	288.978
17.173	258.291
17.336	265.284
17.688	291.531
17.850	291.079
18.166	279.226
18.347	297.605
18.491	282.702
18.671	299.766
18.852	306.320
19.177	293.152
19.357	313.721
19.502	313.270
19.664	333.402
19.863	339.078
20.332	325.460
20.513	328.510
20.684	343.823
20.838	342.058
25.208	611.322
25.608	693.966
25.799	697.026
26.215	651.410
26.424	679.254
26.589	679.703
26.797	703.635
27.196	667.582
27.431	681.081
27.812	728.505
28.212	722.018
28.403	725.513
28.594	724.660
28.811	743.810
29.210	722.975
29.410	705.601
29.627	749.098
29.792	744.764];
data.tW(:,1) = data.tW(:,1) - 1; % set origin at hatch
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.25);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'IldiPal1992';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Ww0 = weights.Ww0 * 0;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Ww0 data ignored due to inconsistency with Wwb data';
D3 = 'The high age at first reproduction cannot be captured by the std model';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '4B729'; % Cat of Life
metaData.links.id_ITIS = '176419'; % ITIS
metaData.links.id_EoL = '45513576'; % Ency of Life
metaData.links.id_Wiki = 'Otis_tarda'; % Wikipedia
metaData.links.id_ADW = 'Otis_tarda'; % ADW
metaData.links.id_Taxo = '53470'; % Taxonomicon
metaData.links.id_WoRMS = '1459923'; % WoRMS
metaData.links.id_avibase = 'C6F33176724AC933'; % avibase
metaData.links.id_birdlife = 'great-bustard-otis-tarda'; % birdlife
metaData.links.id_AnAge = 'Otis_tarda'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Otis_tarda}}';
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
bibkey = 'IldiPal1992'; type = 'Article'; bib = [ ... 
'author = {Ildik\''{o}, A. A. and P\''{a}l, A.}, ' ... 
'year = {1992}, ' ...
'title = {Data on the growth of body mass of great bustard (\emph{Otis tarda}) reared by hand}, ' ...
'journal = {Aquila a Madartani Intezet Evkonyve}, ' ...
'volume = {99}, ' ...
'pages = {85–91}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=C6F33176724AC933&sec=lifehistory}}';
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

