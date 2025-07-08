function [data, auxData, metaData, txtData, weights] = mydata_Abroscopus_superciliaris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Cisticolidae';
metaData.species    = 'Abroscopus_superciliaris'; 
metaData.species_en = 'Yellow-bellied warbler'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iThf','0iTa','0iTd'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 11;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'BiJian2020';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 14;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'BiJian2020';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 42;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Ww0 = 0.93;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'BiJian2020';
data.Wwb = 0.78;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'BiJian2020';
data.Wwi = 6.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';

data.Ri  = 3.2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.2 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)];
0.000	0.885
0.001	1.119
0.002	0.745
0.975	1.304
0.976	1.141
0.977	1.047
1.000	0.907
1.050	1.958
1.975	0.766
2.000	1.303
2.001	1.910
2.025	2.494
2.050	1.583
3.000	1.956
3.001	1.722
3.025	3.124
3.026	0.951
3.075	2.353
3.076	2.096
4.000	1.674
4.001	2.562
4.002	4.034
4.025	2.982
4.950	4.499
4.975	1.813
5.000	3.612
5.025	3.004
5.026	3.004
5.050	3.308
5.975	2.559
5.976	4.241
6.000	3.820
6.025	3.493
6.026	5.292
7.000	6.085
7.001	5.244
7.002	4.193
7.003	2.440
7.050	3.912
7.051	3.795
8.000	3.163
8.001	4.565
8.002	4.752
8.003	5.570
8.025	4.939
8.026	6.808
9.000	5.966
9.001	5.685
9.002	5.405
9.003	3.793
9.025	7.180
9.975	6.151
9.976	6.899
10.000	4.562
10.025	6.618
10.026	7.062
10.975	6.103
11.000	6.991
11.001	6.687
11.002	5.168
11.975	6.709
12.000	5.027
12.001	6.031
12.002	7.340
12.025	6.452
13.000	6.614
13.001	6.006
13.002	3.717
14.000	6.426
14.001	6.823];
data.tW(:,1) = data.tW(:,1) - 1; % set origin at hatch
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'BiJian2020'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% Discussion points
D1 = 'Food availebility initially lower';
D2 = 'Males are supposed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '8M9L'; % Cat of Life
metaData.links.id_ITIS = '558370'; % ITIS
metaData.links.id_EoL = '1052692'; % Ency of Life
metaData.links.id_Wiki = 'Abroscopus_superciliaris'; % Wikipedia
metaData.links.id_ADW = 'Abroscopus_superciliaris'; % ADW
metaData.links.id_Taxo = '85046'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'A8F5D21FA348AD98'; % avibase
metaData.links.id_birdlife = 'yellow-bellied-warbler-abroscopus-superciliaris'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Abroscopus_superciliaris}}';
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
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=A8F5D21FA348AD98&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BiJian2020'; type = 'Article'; bib = [ ... 
'doi = {10.1186/s40657-020-00228-3}, ' ...
'author = {Jianli Bi and Yuxin Jiang and Canchao Yang}, ' ... 
'year = {2020}, ' ...
'title = {Breeding ecology of the Yellow-bellied Warbler (\emph{Abroscopus superciliaris})}, ' ...
'journal = {Avian Res}, ' ...
'volume = {11:41}, ' ...
'pages = {1-6}'];
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

