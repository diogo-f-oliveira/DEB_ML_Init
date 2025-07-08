function [data, auxData, metaData, txtData, weights] = mydata_Turdus_merula

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Turdidae';
metaData.species    = 'Turdus_merula'; 
metaData.species_en = 'Common blackbird'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Wwe'; 't-JOe'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2018 10 21];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 10];

%% set data
% zero-variate data

data.ab = 13;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Step1985';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 12.5;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Step1985';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 37.5;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 21.8*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.9;      units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Step1985';
data.Wwi = 100;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
 comment.Wwi = '80 - 125 g';
 
data.Ri  = 2*4.5/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Step1985';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-5 eggs/clutch, 2 clutches per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.043	4.147
1.014	7.464
1.979	13.436
2.973	20.237
3.970	26.374
4.962	34.005
5.950	43.957
6.990	51.588
7.924	57.559
8.919	63.863
9.895	65.024
10.932	67.180
11.957	67.512];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Step1985';
%
data.tW1 = [ ... % time since birth (d), wet weight (g)
0.034	5.109
1.044	8.852
1.957	12.410
2.928	18.879
3.913	26.374
4.957	29.952
5.902	40.515
6.942	45.288
7.914	51.757
8.896	60.447
9.895	62.140
10.891	64.857
11.889	66.720
12.924	67.224];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(41.6);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'Step1985';

% tie-weight for embryo
data.tWe = [ ... % time since start incubation (d), embryo weight (g)
2.938	0.080
4.981	0.114
6.004	0.389
6.408	0.623
6.958	0.961
7.064	0.575
7.467	0.850
8.091	1.222
8.092	1.374
10.078	3.173
10.146	2.614
11.617	3.882];
units.tWe   = {'d', 'g'};  label.tWe = {'age', 'embryo weight'};  
temp.tWe    = C2K(41.6);  units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe  = 'HiptPrin1992';
comment.tWe = 'data for embryo development';

% time-respiratiom
data.tJOe = [ ... % time since start incubation (d), O2 consumption (ml/h)
1.181	0.029
1.459	0.028
1.904	0.005
2.236	0.027
2.514	0.027
2.848	0.026
2.850	0.050
2.852	0.082
3.126	0.015
3.128	0.050
3.463	0.083
3.740	0.084
3.743	0.160
3.856	0.214
3.966	0.182
4.354	0.150
4.642	0.433
4.850	0.053
4.856	0.194
4.857	0.227
4.860	0.303
5.087	0.445
5.694	0.326
5.852	0.087
5.869	0.565
5.878	0.794
5.921	0.446
5.968	0.239
5.971	0.305
5.973	0.370
6.202	0.533
6.431	0.718
6.588	0.458
6.820	0.741
6.825	0.871
6.870	0.578
6.928	0.654
6.930	0.708
7.380	0.839
7.559	1.177
7.775	1.025
7.777	1.079
7.781	1.177
7.829	0.971
7.878	0.808
8.047	0.862
8.460	1.504
8.723	1.124
8.791	1.450
8.830	0.994
8.841	1.287
8.842	1.331
8.848	1.494
8.858	1.755
8.943	1.059
8.945	1.114
9.128	1.549
9.168	1.125
9.346	1.429
9.523	1.723
9.565	1.332
9.860	1.811
9.865	1.941
9.867	2.006
9.900	1.387
9.903	1.463
9.941	1.006
9.951	1.267
9.953	1.333
9.965	1.648
9.968	1.724
10.403	1.464
10.519	1.594
10.633	1.681
10.635	1.747
10.805	1.812
10.841	1.290
10.863	1.899
10.906	1.551
10.908	1.606
10.912	1.704
10.913	1.747
10.978	1.997
11.136	1.758
11.309	1.943
11.656	2.303
11.659	2.379
11.875	2.205
11.878	2.292
11.972	1.825
11.980	2.053
11.982	2.097
11.992	2.379
11.995	2.444
12.000	2.597
12.003	2.684
12.008	1.314
12.032	1.966
12.492	2.380
12.497	2.500
12.500	2.587
12.503	4.163
12.614	2.674
12.730	4.293
12.732	2.859
12.737	2.989
12.745	3.217
12.747	3.261
12.780	4.163
12.819	3.707
12.822	2.294
12.885	2.478
12.888	2.565
12.906	3.044
12.949	2.718
13.108	4.011
13.138	3.327
13.169	4.164
13.457	4.425
13.469	4.762
13.479	5.034
13.508	4.295
13.607	3.990
13.641	4.893
13.672	5.730
13.733	5.871
13.815	5.099
13.848	5.991
13.868	5.023
13.880	5.339
13.943	5.545];
units.tJOe   = {'d', 'ml/h'};  label.tJOe = {'age', 'O_2 consumption'};  
temp.tJOe    = C2K(41.6);  units.temp.tJOe = 'K'; label.temp.tJOe = 'temperature';
bibkey.tJOe  = 'HiptPrin1992';
comment.tJOe = 'data for embryo development';

%% set weights for all real data
weights = setweights(data, []);
weights.tWe = weights.tWe * 2;
weights.tW1 = weights.tW1 * 2;
weights.tW = weights.tW * 2;
weights.tJOe = weights.tJOe * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 1;
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data for different individuals'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: embryo data added, but respiration data ignored because of inconsistency';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '7CYVX'; % Cat of Life
metaData.links.id_ITIS = '179757'; % ITIS
metaData.links.id_EoL = '45510215'; % Ency of Life
metaData.links.id_Wiki = 'Turdus_merula'; % Wikipedia
metaData.links.id_ADW = 'Turdus_merula'; % ADW
metaData.links.id_Taxo = '57002'; % Taxonomicon
metaData.links.id_WoRMS = '558602'; % WoRMS
metaData.links.id_avibase = '6D7A9C93AD1830EB'; % avibase
metaData.links.id_birdlife = 'eurasian-blackbird-turdus-merula'; % birdlife
metaData.links.id_AnAge = 'Turdus_merula'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Turdus_merula}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Turdus_merula}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Step1985'; type = 'Book'; bib = [ ...  
'title = {Die Amsel \emph{Turdus merula}}, ' ...
'publisher = {A. Ziemsen Verlag}, ' ...
'year = {1985}, ' ...
'author = {Stephan, B.}, ' ...
'volume = {95}, ' ...
'series = {Die Neue Brehm B\"{u}cherei}, ' ...
'address = {Wittenberg Lutherstadt}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HiptPrin1992'; type = 'Article'; bib = [ ... 
'author = {Eva Op de Hipt und R. Prinzinger}, ' ... 
'year = {1992}, ' ...
'title = {Embryogenese des {E}nergiestoffwechsels bei der {A}msel \emph{Turdus merula}}, ' ...
'journal = {J. Orn.}, ' ...
'volume = {133}, ' ...
'pages = {82-86}'];
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

