function [data, auxData, metaData, txtData, weights] = mydata_Aquila_chrysaetos

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Aquila_chrysaetos'; 
metaData.species_en = 'Golden eagle'; 

metaData.ecoCode.climate = {'BSk', 'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTg', '0iTht', '0iThh'};
metaData.ecoCode.embryo  = {'Tncf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvb', 'biCvm', 'biSvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2011 10 1];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2017 09 11];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 12 06];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_4     = [2023 07 03];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 44;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'CramSimm1980';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from StinByrd1976, AEF for Pandion haliaetus and Haliaeetus leucocephalus';
data.tx = 67.5;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'CramSimm1980';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temps from RudePowe1978';
data.tp = 202.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temps from RudePowe1978';
data.tR = 1460;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'CramSimm1980';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 17520; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Sumn1929';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 105;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'Sumn1929';
data.Wwi = 5194; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 3572; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 2.365/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'CramSimm1980';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
11 391.1942015
13	449.6702861
14	581.3589937
15	558.3226982
16	664.923242
17	664.8843099
18	754.7454725
19	886.4406688
20	936.5802271
21	1013.905238
22	1189.497872
23	1229.187754
24	1296.058763
25	1427.746029
26	1515.525042
27	1594.94518
28	1647.178423
29	1891.767472
30	1854.104946
31	2130.050235
32	2042.198404
33	2343.248439
34	2343.206623
35	2556.432223
36	2581.489385
37	2646.265268
38	2752.858602
39	2842.733463
40	2846.882621
41	2796.660151
42	2945.078147
43	2888.58616
44	2965.91766
45	3011.874175
46	3145.65873
47	3049.443697
48	3250.124494
49	2936.465491
50	3229.148719
51	3009.575016
52	3249.98679
53	3034.597572
54	3203.92213
56	3147.396257
57	3243.533426];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Coll1986';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_2: food availability take variable in tW data';
D3 = 'mod_3: v reduced';
D4 = 'mod_4: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = 'FZLP'; % Cat of Life
metaData.links.id_ITIS = '175407'; % ITIS
metaData.links.id_EoL = '45511389'; % Ency of Life
metaData.links.id_Wiki = 'Aquila_chrysaetos'; % Wikipedia
metaData.links.id_ADW = 'Aquila_chrysaetos'; % ADW
metaData.links.id_Taxo = '52605'; % Taxonomicon
metaData.links.id_WoRMS = '159107'; % WoRMS
metaData.links.id_avibase = '5F8E7CA845BD413F'; % avibase
metaData.links.id_birdlife = 'golden-eagle-aquila-chrysaetos'; % birdlife
metaData.links.id_AnAge = 'Aquila_chrysaetos'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aquila_chrysaetos}}';
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
bibkey = 'CramSimm1980'; type = 'Incollection'; bib = [ ... 
'author = {Cramp, S. and Simmons, K. E. L.}, ' ... 
'year = {1977}, ' ...
'title = {Hawks to Bustards.}, ' ...
'booktitle = {Handbook of the Birds of Europe, the Middle East and North Africa, The Birds of the Western Palearctic}, ' ...
'volume = {II}, ' ...
'publisher = {Oxford University Press}, '...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Coll1986'; type = 'Article'; bib = [ ... 
'author = {Collopy, M. W.}, ' ... 
'year = {1986}, ' ...
'title = {Food consumption and growth energetics of nestling Golden Eagles}, ' ...
'journal = {Wilson Bulletin}, ' ...
'volume = {98}, ' ...
'pages = {445--458}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RudePowe1978'; type = 'Article'; bib = [ ... 
'author = {Rudeen, S. and Powers, L. R.}, ' ... 
'year = {1978}, ' ...
'title = {Body temperature of a nestling Golden Eagle.}, ' ...
'journal = {Condor}, ' ...
'volume = {80}, ' ...
'pages = {447--449}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StinByrd1976'; type = 'Article'; bib = [ ... 
'author = {Stinson, C. H. and Byrd, M. A. and Bean, G.}, ' ... 
'year = {1976}, ' ...
'title = {Osprey incubation temperatures: studies with a telemetering egg}, ' ...
'journal = {Raptor Research}, ' ...
'volume = {10}, ' ...
'pages = {90--91}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sumn1929'; type = 'Article'; bib = [ ... 
'author = {Sumner Jr., E. L.}, ' ... 
'year = {1929}, ' ...
'title = {Notes on the growth and behavior of young Golden Eagles}, ' ...
'journal = {Auk}, ' ...
'volume = {46}, ' ...
'pages = {161--169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AEF'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.eagles.org}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=5F8E7CA845BD413F&sec=lifehistory}}';
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

