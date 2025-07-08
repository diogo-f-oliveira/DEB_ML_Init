function [data, auxData, metaData, txtData, weights] = mydata_Falco_sparverius
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Falconiformes'; 
metaData.family     = 'Falconidae';
metaData.species    = 'Falco_sparverius'; 
metaData.species_en = 'American kestrel'; 

metaData.ecoCode.climate = {'BSk', 'BWk', 'Cfb', 'Csa', 'Dfb', 'Dwc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTg', '0iTa'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 22];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 05];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 30;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 31;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 93;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 17*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 10.6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'NegrChas1994';
data.Wwi = 141; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'NegrChas1994';
data.Wwim = 135; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'NegrChas1994';

data.Ri  = 1.5*4.6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.6 eggs per clutch;1-2 clutches/yr';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % scaled time since birth (d), wet weight (g)
1.012	10.599
1.856	14.042
2.882	18.517
4.029	24.020
4.997	31.228
5.966	38.436
7.058	48.041
8.030	59.009
9.062	68.954
9.855	79.576
11.008	90.892
12.159	100.156
12.948	107.359
14.036	113.886
14.156	113.890
15.004	121.094
15.668	124.191
16.694	129.349
17.958	131.437
18.861	133.857
20.005	137.309
20.907	138.703
21.989	139.418
23.071	140.818
23.912	141.184
25.470	138.837
26.130	138.172
27.030	138.199
27.989	136.517
31.099	126.352
34.222	126.785
37.221	124.480];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight','female'};  
temp.tW_f    = C2K(40);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'NegrChas1994';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % scaled time since birth (d), wet weight (g)
0.952	10.939
1.856	13.700
2.882	18.859
4.029	24.362
4.997	30.544
6.088	39.807
6.938	48.379
7.970	59.008
9.003	69.636
10.035	79.581
10.946	89.180
11.979	100.151
13.007	107.019
14.096	114.572
15.062	119.386
16.148	123.521
17.111	126.284
18.015	129.046
18.978	131.467
20.061	133.208
20.961	133.235
21.983	134.632
23.063	133.296
23.965	134.690
24.921	131.299
25.880	129.960
27.020	128.968
27.919	127.968
31.265	113.707
34.147	113.792
37.027	112.509];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight','male'};  
temp.tW_m    = C2K(40);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'NegrChas1994';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = weights.tW_f * 2;
weights.tW_m = weights.tW_m * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Food vailability taken variable in tW data';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: males have equal state variables at b, compared to females';
D5 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '3DTGT'; % Cat of Life
metaData.links.id_ITIS = '175622'; % ITIS
metaData.links.id_EoL = '45510789'; % Ency of Life
metaData.links.id_Wiki = 'Falco_sparverius'; % Wikipedia
metaData.links.id_ADW = 'Falco_sparverius'; % ADW
metaData.links.id_Taxo = '52848'; % Taxonomicon
metaData.links.id_WoRMS = '159072'; % WoRMS
metaData.links.id_avibase = '20C2214E655A79AB'; % avibase
metaData.links.id_birdlife = 'american-kestrel-falco-sparverius'; % birdlife
metaData.links.id_AnAge = 'Falco_sparverius'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Falco_sparverius}}';
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
bibkey = 'NegrChas1994'; type = 'Article'; bib = [ ... 
'author = {Juan J. Negro and Alain Chastin and David M. Bird}, ' ... 
'year = {1994}, ' ...
'title = {Effects of Short-Term Food Deprivation on Growth of Hand-Reared American Kestrels}, ' ...
'journal = {The Condor}, ' ...
'volume = {96(3)}, ' ...
'pages = {749-760}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Falco_sparverius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=20C2214E655A79AB&sec=lifehistory}}';
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

