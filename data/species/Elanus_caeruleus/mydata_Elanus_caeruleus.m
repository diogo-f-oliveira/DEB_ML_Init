function [data, auxData, metaData, txtData, weights] = mydata_Elanus_caeruleus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Elanus_caeruleus'; 
metaData.species_en = 'Black-winged kite'; 

metaData.ecoCode.climate = {'A','B'};
metaData.ecoCode.ecozone = {'TP'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tncf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvb', 'biCvm', 'biSvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 26;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '27-31 d';
data.tx = 32.5;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '32-35 d';
data.tp = 97.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '32-35 d';
data.tR = 365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 21;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 18.6;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Mend1981';
data.Wwi = 258.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 237; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'avibase';

data.Ri  = 3.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.5 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.000	18.658
2.043	19.071
2.107	22.906
3.164	22.196
3.170	24.941
4.067	27.550
4.168	22.592
4.960	28.512
5.036	37.837
6.059	47.566
6.090	35.479
6.948	46.332
7.064	74.873
7.094	62.786
7.111	71.021
7.806	56.636
7.849	77.499
7.957	75.835
8.507	72.456
9.043	88.850
9.060	70.175
9.093	86.096
10.090	83.198
10.190	104.053
10.193	105.700
11.120	122.584
11.126	98.967
11.166	118.183
11.201	134.654
12.093	135.067
12.100	138.361
12.146	160.322
12.276	115.817
13.144	157.973
13.162	166.208
13.187	151.925
13.211	136.544
13.236	148.622
14.169	168.251
15.091	182.939
15.207	211.480
15.949	193.243
16.189	175.083
16.196	204.738
16.953	220.550
17.019	198.572
17.108	188.123
17.110	215.583
18.048	211.046
18.136	200.049
18.142	256.066
18.197	229.147
19.008	243.852
19.095	232.305
19.110	212.532
19.175	216.915
20.091	228.858
20.223	238.723
20.988	231.467
21.025	249.036
21.059	238.596
21.874	255.497
22.194	248.308
22.826	230.638
23.093	252.016
23.207	253.097
24.109	257.902
24.368	248.526
25.051	255.561
25.151	250.054
25.953	260.367
27.004	256.911
27.999	252.915
28.117	256.192
29.021	235.185
30.163	248.191
31.128	256.831
32.134	258.325
32.945	246.119
33.860	257.513
35.012	248.550
35.977	230.279];
data.tW(:,1) = data.tW(:,1) - 1; % set origin at hatch
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-3;end;end 
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Mend1981';
  
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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Food availability is taken variable in tW data';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '38YJ7'; % Cat of Life
metaData.links.id_ITIS = '175284'; % ITIS
metaData.links.id_EoL = '45515782'; % Ency of Life
metaData.links.id_Wiki = 'Elanus_caeruleus'; % Wikipedia
metaData.links.id_ADW = 'Elanus_caeruleus'; % ADW
metaData.links.id_Taxo = '52413'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '97C47F3E1BA4129A'; % avibase
metaData.links.id_birdlife = 'black-winged-kite-elanus-caeruleus'; % birdlife
metaData.links.id_AnAge = 'Elanus_caeruleus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Elanus_caeruleus}}';
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
bibkey = 'Mend1981'; type = 'phdthesis'; bib = [ ... 
'author = {John Martin Mendelsohn}, ' ... 
'year = {1981}, ' ...
'title = {A study of the blackshouldered kite \emph{Elanus caeruleus}}, ' ...
'school = {Univ of Natal}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=97C47F3E1BA4129A&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KempKirw2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.bkskit1.01}, ' ...
'author = {Kemp, A. C. and G. M. Kirwan and J. S. Marks and A. Motis and E. F. J. Garcia}, ' ...
'year = {2020}, ' ...
'title = {Black-winged Kite (\emph{Elanus caeruleus}), version 1.0. In Birds of the World (J. del Hoyo, A. Elliott, J. Sargatal, D. A. Christie, and E. de Juana, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
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

