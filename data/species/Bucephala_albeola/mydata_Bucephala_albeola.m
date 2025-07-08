function [data, auxData, metaData, txtData, weights] = mydata_Bucephala_albeola

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Bucephala_albeola'; 
metaData.species_en = 'Bufflehead'; 

metaData.ecoCode.climate = {'Dsa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'biFp', 'biFm', 'biMm'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'xiHl', 'xiHr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 10 15];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 30;   units.ab = 'd';      label.ab = 'age at birth';                    bibkey.ab = 'avibase';   
  temp.ab = C2K(34);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '28-33 d';
data.tx = 52.5;   units.tx = 'd';      label.tx = 'time since birth at fledging';   bibkey.tx = 'avibase';   
  temp.tx = C2K(41.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '50-55 d';
data.tp = 100;   units.tp = 'd';      label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';   
  temp.tp = C2K(41.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;    units.tR = 'd';  label.tR = 'time since birth at 1st brood';   bibkey.tR = 'avibase';
  temp.tR = C2K(41.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 14.9 * 365;  units.am = 'd'; label.am = 'life span';                       bibkey.am = 'avibase';   
  temp.am = C2K(41.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 37; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';               bibkey.Ww0 = 'avibase';
data.Wwb = 23.8;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'avibase';
data.Wwi = 367; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 400; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 9/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'avibase';   
 temp.Ri = C2K(41.2);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 comment.Ri = '6-12 eggs per clutch, 1 clutch per jr';

% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
16.977	89.769
16.978	95.063
18.002	84.505
18.006	114.505
18.007	118.035
20.016	144.564
21.977	141.975
22.023	154.329
22.024	157.859
22.025	162.270
22.026	168.447
23.005	155.240
27.021	185.359
28.002	188.917
28.984	196.887
29.028	192.476
29.068	164.242
29.069	170.419
29.961	174.857
29.962	181.033
30.009	196.035
30.011	210.152
30.014	225.152
30.996	234.005
31.037	215.477
31.038	220.771
31.039	229.594
31.081	211.949
31.125	205.773
32.019	222.564
32.021	232.270
32.022	238.447
32.023	250.800
32.063	216.389
32.114	264.038
33.086	205.831
35.005	217.358
35.009	243.829
35.010	251.770
36.071	190.919
40.046	245.742];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'females'};  
temp.tW_f    = C2K(41.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Gaut1987'; 
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
18.008	126.858
18.009	134.799
20.020	170.153
21.985	195.799
22.072	181.684
22.073	185.213
22.116	177.273
24.126	201.156
25.012	167.652
25.019	214.417
27.118	234.773
28.049	201.271
29.033	227.771
29.034	231.300
29.035	235.712
29.077	223.360
30.016	239.270
30.067	285.154
30.955	259.592
30.997	247.240
30.998	251.652
30.999	254.299
31.050	301.948
31.052	316.065
31.092	280.772
32.025	264.917
32.029	291.388
32.030	297.565
32.031	302.859
32.078	320.507
32.121	309.920
33.095	262.302
34.030	254.388
35.107	301.185
36.052	362.095
36.053	369.154
40.018	351.623];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'males'};  
temp.tW_m    = C2K(41.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Gaut1987'; 
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'Ww0 data is ignored due to inconsistency with tW data';
D4 = 'mod_1: males have equal state variables at b, compared to females';
D5 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);  

%% Links
metaData.links.id_CoL = 'NM24'; % Cat of Life
metaData.links.id_ITIS = '175145'; % ITIS
metaData.links.id_EoL = '45510600'; % Ency of Life
metaData.links.id_Wiki = 'Bucephala_albeola'; % Wikipedia
metaData.links.id_ADW = 'Bucephala_albeola'; % ADW
metaData.links.id_Taxo = '52259'; % Taxonomicon
metaData.links.id_WoRMS = '159179'; % WoRMS
metaData.links.id_avibase = 'FB7383856D0DB2EA'; % Avibase
metaData.links.id_birdlife = 'bufflehead-bucephala-albeola'; % Birdlife
metaData.links.id_AnAge = 'Bucephala_albeola'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bucephala_albeola}}';
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
bibkey = 'Gaut1987'; type = 'Article'; bib = [ ... 
'doi = {10.1139/z87-221}, ' ...
'author = {Gauthier, G.}, ' ... 
'year = {1987}, ' ...
'title = {Brood territories in buffleheads: determinants and correlates of territory size}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {65(6)}, ' ...
'pages = {1402–1410}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Bucephala_albeola}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\urlhttps://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=FB7383856D0DB2EA&sec=lifehistory}}';
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

