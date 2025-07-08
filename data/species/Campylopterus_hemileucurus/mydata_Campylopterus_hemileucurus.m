function [data, auxData, metaData, txtData, weights] = mydata_Campylopterus_hemileucurus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Trochilidae';
metaData.species    = 'Campylopterus_hemileucurus'; 
metaData.species_en = 'Violet sabrewing';

metaData.ecoCode.climate = {'Af','Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biHs','bxCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 06 30];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 20;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Mari2001';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 24;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Mari2001';   
  temp.tx = C2K(38.1); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 72;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(38.1); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(38.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 1.23;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 0.9;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Mari2001';
data.Wwi = 9.3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Mari2001';
data.Wwim = 11.4;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'Mari2001';

data.Ri  = 2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Mari2001';   
  temp.Ri = C2K(38.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 2 eggs per clutch';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time (d), weight (g)
0.000	0.885
0.001	1.201
1.040	1.484
4.022	2.903
4.048	2.239
4.999	4.009
6.003	4.545
7.012	5.903
7.982	5.712
8.965	7.735
8.989	6.723
10.030	8.271
11.006	9.313
11.977	9.185
12.064	8.521
12.986	10.575
14.015	10.163
15.019	10.667
15.023	11.300
16.022	10.919
17.020	10.348
17.997	11.359
18.958	9.650
18.960	10.030
19.031	11.832
19.995	10.597
20.961	9.837
23.024	9.803
24.007	11.920];
units.tW_f = {'d', 'g'};     label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f = C2K(38.1); units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Mari2001';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time (d), weight (g)
0.000	0.885
0.001	1.201
1.011	1.705
6.009	5.525
8.052	7.325
10.065	9.156
12.020	11.399
13.058	12.567
16.033	12.879
17.987	15.090
18.005	12.814
19.041	13.603
20.008	12.874
21.015	13.853
22.038	12.429];
units.tW_m = {'d', 'g'};     label.tW_m = {'time', 'wet weight', 'male'};  
temp.tW_m = C2K(38.1); units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Mari2001';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response turned out to vary, which has been implemented';
D3 = 'Males are assumed to differ from females by {p_Am} only'; 
D4 = 'mod_1: v is reduced';
D5 = 'mod_2: males have equal state variables at b, compared to females';
D6 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6);

%% Links
metaData.links.id_CoL = 'QHJR'; % Cat of Life
metaData.links.id_ITIS = '555064'; % ITIS
metaData.links.id_EoL = '45509510'; % Ency of Life
metaData.links.id_Wiki = 'Campylopterus_hemileucurus'; % Wikipedia
metaData.links.id_ADW = 'Campylopterus_hemileucurus'; % ADW
metaData.links.id_Taxo = '54968'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '66CE83457BE5B655'; % avibase
metaData.links.id_birdlife = 'violet-sabrewing-campylopterus-hemileucurus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Campylopterus_hemileucurus}}';
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
bibkey = 'Mari2001'; type = 'Article'; bib = [ ... 
'author = {Manuel Mar\''{i}n}, ' ... 
'year = {2001}, ' ...
'title = {Postnatal Development of the Violet Sabrewing in {C}osta {R}ica}, ' ...
'journal = {The Wilson Bulletin}, ' ...
'volume = {113(1)}, ' ...
'pages = {110-114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=66CE83457BE5B655&sec=lifehistory}}';
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

