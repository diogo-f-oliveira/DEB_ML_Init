function [data, auxData, metaData, txtData, weights] = mydata_Columba_livia

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Columbiformes'; 
metaData.family     = 'Columbidae';
metaData.species    = 'Columba_livia'; 
metaData.species_en = 'Rock dove'; 

metaData.ecoCode.climate = {'BSk', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs', 'bxCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.63); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-JOe'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 06 11];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 11 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 25];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2024 02 21];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 21];

%% set data
% zero-variate data

data.ab = 18;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'TacuCrai2013';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 36;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SnowPerr1998';   
  temp.tx = C2K(40.63);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 108;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.63);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 140;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'TacuCrai2013';
  temp.tR = C2K(40.63);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12775;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'TacuCrai2013';   
  temp.am = C2K(40.63);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 32.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SnowPerr1998';

data.Wwb = 15.2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SnowPerr1998';
data.Wwi = 300;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'SnowPerr1998';

data.Ri  = 6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'MagaCost2009';   
temp.Ri = C2K(40.63);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % weight^1/3 (g^1/3) at age (d)
1	2.5198421;
7	4.37951914;
14	5.155136735;
21	5.229321532;
28	5.517848353];
data.tW(:,2) = data.tW(:,2).^3; % convert weight^1/3 to weight
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.63);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GayaShen2004';
  
% time-respiration for embryo
data.tJOe= [ ... % time (d), rrespiration (cm^3 O2/ h)
0.961	0.274
1.517	0.226
1.919	0.140
2.380	0.257
2.860	0.210
3.416	0.244
4.184	0.276
4.472	0.273
5.009	0.225
5.162	0.224
5.260	0.671
6.008	0.499
6.087	1.070
6.180	0.497
6.949	0.814
7.005	0.487
7.028	1.344
7.238	1.219
7.834	1.416
7.970	1.741
8.006	1.291
8.048	2.189
8.162	1.820
8.776	1.976
8.856	2.751
8.911	2.138
8.948	1.607
9.048	2.748
9.736	2.046
9.934	3.758
10.008	3.022
10.108	4.042
10.722	4.075
10.728	5.422
10.759	3.585
10.953	4.236
10.995	5.092
11.066	3.704
11.226	5.334
11.632	6.187
11.643	4.023
11.672	6.513
11.724	5.002
11.859	5.164
11.894	4.510
12.303	5.975
12.595	7.032
12.609	5.767
12.631	6.501
12.713	7.888
12.863	6.907
12.868	8.090
13.478	7.144
13.619	9.020
13.655	8.366
13.730	7.917
13.734	8.896
13.762	6.284
13.806	7.752
13.822	6.813
13.869	9.139
13.877	6.119
13.882	7.343
14.012	6.281
14.075	7.708
14.122	9.994
14.275	9.828
14.363	7.664
14.374	10.766
14.500	8.520
14.513	6.968
14.516	7.662
14.523	9.417
14.545	10.274
14.637	9.293
14.706	7.129
14.738	10.476
14.751	8.802
14.754	9.578
14.768	8.353
14.822	7.495
14.823	7.699
14.917	7.249
15.053	7.615
15.079	9.451
15.130	7.532
15.188	7.858
15.197	10.185
15.263	7.327
15.296	10.877
15.430	15.937
15.447	10.182
15.482	9.487
15.546	10.997
15.606	11.608
15.738	11.035
15.739	11.321
15.765	13.198
15.842	13.075
15.939	13.482
16.018	13.971
16.061	15.236
16.160	16.132
16.178	15.642
16.278	16.866
16.305	18.824
16.347	14.701
16.348	14.946
16.414	17.354
16.488	21.434];
data.tJOe(:,2) = data.tJOe(:,2) * 24; % convert h to d
units.tJOe   = {'d', 'ml O_2/d'};  label.tJOe = {'age', 'O_2 consumption'};  
temp.tJOe    = C2K(37.5);  units.temp.tJOe = 'K'; label.temp.tJOe = 'temperature';
bibkey.tJOe = 'VeckHoyt1979';

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
% txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
D2 = 'mod_3: tJOe data added';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'XBFW'; % Cat of Life
metaData.links.id_ITIS = '177071'; % ITIS
metaData.links.id_EoL = '45509376'; % Ency of Life
metaData.links.id_Wiki = 'Columba_livia'; % Wikipedia
metaData.links.id_ADW = 'Columba_livia'; % ADW
metaData.links.id_Taxo = '53973'; % Taxonomicon
metaData.links.id_WoRMS = '1464527'; % WoRMS
metaData.links.id_avibase = 'BBA263C235B15B88'; % avibase
metaData.links.id_birdlife = 'rock-dove-columba-livia'; % birdlife
metaData.links.id_AnAge = 'Columba_livia'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/my_pet}}';
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
bibkey = 'GayaShen2004'; type = 'Article'; bib = [ ... 
'author = {Gayathri, K. L. and Shenoy, K. B. and Hedge, S.N.}, ' ... 
'year = {2004}, ' ...
'title = {Blood profile of pigeons (\emph{Columba livia}) during growth and breeding}, ' ...
'journal = {Comparative Biochemistry and Physiology, Part A}, ' ...
'volume = {138}, ' ...
'pages = {187--192}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TacuCrai2013'; type = 'Article'; bib = [ ... 
'author = {Tacutu, R. and Craig, T. and Budovsky, A. and Wuttke, D. and Lehmann, G. and Taranukha, D. and Costa, J. and Fraifeld, V. E. and de Magalh\~{a}es, J. P.}, ' ... 
'year = {2013}, ' ...
'title = {Human Ageing Genomic Resources: Integrated databases and tools for the biology and genetics of ageing}, ' ...
'journal = {Nucleic Acids Research}, ' ...
'volume = {41}, ' ...
'pages = {D1027--D1033}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SnowPerr1998'; type = 'Book'; bib = [ ... 
'author = {Snow, D. W. and Perrins, C. M.}, ' ... 
'year = {1998}, ' ...
'title = {The Birds of the Western Palearctic, Concise Edition}, ' ...
'publisher = {Oxford University Press}, ' ...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MagaCost2009'; type = 'Article'; bib = [ ... 
'author = {de Magalh\~{a}es, J. P. and Costa, J.}, ' ... 
'year = {2009}, ' ...
'title = {A database of vertebrate longevity records and their relation to other life-history traits}, ' ...
'journal = {Journal of Evolutionary Biology}, ' ...
'volume = {22}, ' ...
'pages = {1770--1774}'];
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
%
bibkey = 'VlecHoyt1979'; type = 'Article'; bib = [...
'author = {Vleck, C. M. and Hoyt, D. F. and Vleck, D.}, '...
'year = {1979},'...
'title = {Metabolism of avian embryos: patterns in artricial and precocial birds}, '...
'journal = {Physiol. Zool. }, ' ...
'volume = {52}, ' ...
'pages = {363-377}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

