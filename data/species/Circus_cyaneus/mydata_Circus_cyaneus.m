function [data, auxData, metaData, txtData, weights] = mydata_Circus_cyaneus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Circus_cyaneus'; 
metaData.species_en = 'Hen harrier'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iTh'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvb', 'biCvm', 'biCva', 'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2022 10 31];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 12 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 03];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 31.5;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'Wiki';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Varyies between 31 and 32 d';
data.tx = 37;       units.tx = 'd';     label.tx = 'time since birth at fledging';  bibkey.tx = 'SchaBalf1971';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 111;       units.tp = 'd';     label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Wiki';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 17.1*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 19.8;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'SchaBalf1971';
data.Wwi = 530;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '390 to 750 g';
data.Wwim = 390;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'Wiki';
 comment.Wwim = '290 to 400 g';  

data.Ri  = 5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 4-8 eggs/clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.739	19.760
1.797	26.313
3.017	33.684
3.833	45.194
4.811	53.400
5.950	60.774
6.849	76.404
7.908	84.607
8.889	102.707
9.869	116.685
10.855	143.855
11.840	171.026
12.822	189.127
13.977	231.133
14.956	245.110
16.108	281.345
16.999	277.185
17.990	317.549
19.131	327.397
20.116	353.743
21.026	392.461
21.992	375.930
23.139	400.620
24.188	389.033
25.170	407.133
26.228	415.335
27.207	426.839
28.176	416.080
29.249	456.440
30.396	481.955
31.198	460.483
32.234	418.386
33.154	481.841
34.377	494.984
35.257	465.263
36.295	427.289
37.321	547.637];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'SchaBalf1971';

data.tW_fm = [ ... % time since birth (d), wet weight (g)
0	 20.000  19.801
1	 21.344  23.122
2	 26.598  30.444
3	 28.385  29.841
4	 36.633  40.084
5	 46.807  57.174
6	 56.605  61.321
7	 68.797  76.036
8	 90.583  94.754
9	116.904 102.648
10	129.851 124.758
11	164.264 136.511
12	171.827 185.215
13	198.649 199.645
14	245.087 230.810
15	283.345 242.648
16	308.492 251.294
17	329.217 277.733
18	351.335 306.953
19	394.170 321.086
20	394.170 332.527
21	414.387 342.658
22	435.640 335.870
23	446.673 354.868
24	462.589 358.435
25	486.315 346.103
26	467.239 356.647
27	506.169 353.097
28	460.281 388.299
29	513.821 371.207
30	462.589 376.819
31	508.707 374.939];
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'wet weight'};  
temp.tW_fm    = C2K(40);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm  = 'Pico1980'; treat.tW_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2; 
weights.tW_fm = weights.tW_fm * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: tW_fm data added';
D3 = 'mod_2: v reduced';
D4 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'VG7Z'; % Cat of Life
metaData.links.id_ITIS = '175430'; % ITIS
metaData.links.id_EoL = '45515823'; % Ency of Life
metaData.links.id_Wiki = 'Circus_cyaneus'; % Wikipedia
metaData.links.id_ADW = 'Circus_cyaneus'; % ADW
metaData.links.id_Taxo = '52512'; % Taxonomicon
metaData.links.id_WoRMS = '159372'; % WoRMS
metaData.links.id_avibase = 'F558C7F96E40C134'; % avibase
metaData.links.id_birdlife = 'hen-harrier-circus-cyaneus'; % birdlife
metaData.links.id_AnAge = 'Circus_cyaneus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Circus_cyaneus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Circus_cyaneus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SchaBalf1971'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1474-919X.1971.tb05162.x}, ' ...
'title = {GROWTH AND DEVELOPMENT OF NESTLING HEN HARRIERS}, ' ...
'author = {W. C. Scharf and E. Balfour}, ' ...
'journal = {Ibis}, ' ...
'year = {1971}, ' ...
'volume = {113}, ' ...
'pages = {323--329}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pico1980'; type = 'Article'; bib = [ ...  
'title = {Food, Growth, Survival and Sex Ratio of Nestling Hen Harriers \emph{Circus c. cyaneus} in {O}rkney}, ' ...
'author = {N. Picozzi}, ' ...
'journal = {Ornis Scandinavica (Scandinavian Journal of Ornithology)}, ' ...
'year = {1980}, ' ...
'volume = {11(1)}, ' ...
'pages = {323--329}'];
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

