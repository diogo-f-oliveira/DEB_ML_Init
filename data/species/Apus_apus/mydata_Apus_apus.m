function [data, auxData, metaData, txtData, weights] = mydata_Apus_apus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Apodidae';
metaData.species    = 'Apus_apus'; 
metaData.species_en = 'Common swift'; 

metaData.ecoCode.climate = {'BSh', 'BSk', 'Csa', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp', 'TPi'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2011 08 20];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 09 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 25];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 11 16];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_4     = [2023 07 10];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 10];

%% set data
% zero-variate data

data.ab = 20.65;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Cram1988';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps from GlutBaue1994';
data.tx = 42.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SnowPerr1998';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 127.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Cram1988';
  temp.tR = C2K(38.1);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 7702;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'TacuCrai2013';   
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 16.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Cram1988';

data.Wwb = 2.9;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = {'BryaHail1983','Cram1988'};
data.Wwi = 40.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'BryaHail1983','Cram1988'};

data.Ri  = 2.3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Cram1988';   
  temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ...  % weight (g) at age (d)
0.15249966 3.340508959;  
5.09382572	12.68054612;
6.13650744	15.90918533;
7.09285198	24.16532748;
8.17662832	29.59143656;
9.06026538	26.99724258;
11.0369497	27.14055599;
12.24097405	32.40989617;
13.06265031	33.56358012;
14.17004406	37.47747267;
15.06112843	40.63524502;
16.027856	39.46891295;
17.07115437	46.78003976;
17.99896933	46.86107018;
19.2456273	43.31734611;
20.10299058	40.49943577;
21.98740834	42.33766648;
23.01365643	46.43800316;
24.11016646	53.95425064;
24.97085019	54.14513665;
26.12955819	56.74627059;
27.0524399	51.58511484;
27.97122111	56.35848225;
28.90939801	53.14229119;
30.16094179	54.33230383;
30.88423236	51.44063773;
31.90070882	46.10960729;
32.93660731	46.69002944;
33.90798352	49.95435514;
35.01172477	51.19548236;
35.9361244	47.85465971;
36.95981099	49.67908395;
37.98022456	48.25050974;
38.99169924	51.34179362;
39.23366575	51.29012763;
39.74249691	49.17088278;
40.8705671	47.84379725;
43.093914	52.76686562];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Weit1983';
  
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
D1 = 'mod_3: v reduced and food availability variable';
D2 = 'mod_4: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'FZD9'; % Cat of Life
metaData.links.id_ITIS = '584443'; % ITIS
metaData.links.id_EoL = '45510773'; % Ency of Life
metaData.links.id_Wiki = 'Apus_apus'; % Wikipedia
metaData.links.id_ADW = 'Apus_apus'; % ADW
metaData.links.id_Taxo = '54867'; % Taxonomicon
metaData.links.id_WoRMS = '212734'; % WoRMS
metaData.links.id_avibase = '4E6EF3F983079D73'; % avibase
metaData.links.id_birdlife = 'common-swift-apus-apus'; % birdlife
metaData.links.id_AnAge = 'Apus_apus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Apus_apus}}';
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
bibkey = 'SnowPerr1998'; type = 'Book'; bib = [ ... 
'author = {Snow, D. W. and Perrins, C. M.}, ' ... 
'year = {1998}, ' ...
'title = {The Birds of the Western Palearctic, Concise Edition}, ' ...
'publisher = {Oxford University Press}, ' ...
'address = {Oxford}'];
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
bibkey = 'Cram1988'; type = 'Incollection'; bib = [ ... 
'author = {Cramp, S.}, ' ... 
'year = {1988}, ' ...
'title = {Tyrant Flycatchers to Thrushes}, ' ...
'booktitle = {Handbook of the Birds of Europe, the Middle East and North Africa, The Birds of the Western Palearctic}, ' ...
'volume = {V}, ' ...
'publisher = {Oxford University Press}, '...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Weit1983'; type = 'Book'; bib = [ ... 
'author = {Weitnauer, E.}, ' ... 
'year = {1983}, ' ...
'title = {Mein Vogel - Aus dem Leben des Mauerseglers (\emph{Apus apus})}, ' ...
'publisher = {Oltingen}, ' ...
'address = {Sissach}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BryaHail1983'; type = 'Article'; bib = [ ... 
'author = {Bryant, D. M. and Hails, C. J.}, ' ... 
'year = {1983}, ' ...
'title = {Energetics and growth patterns of three tropical bird species}, ' ...
'journal = {The Auk}, ' ...
'volume = {100}, ' ...
'pages = {425--439}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GlutBaue1994'; type = 'Incollection'; bib = [ ... 
'author = {Glutz von Blotzheim, U. N. and Bauer, K. M.}, ' ... 
'year = {1994}, ' ...
'title = {Columbiformes - {P}iciformes}, ' ...
'booktitle = {Handbuch der V\"{o}gel Mitteleuropas}, ' ...
'volume = {9}, ' ...
'publisher = {Aula-Verlag}, ' ...
'address = {Wiesbaden}'];
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

