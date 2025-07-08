function [data, auxData, metaData, txtData, weights] = mydata_Phalacrocorax_auritus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Suliformes'; 
metaData.family     = 'Phalacrocoracidae';
metaData.species    = 'Phalacrocorax_auritus'; 
metaData.species_en = 'Double-crested cormorant'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA', 'MPE'};
metaData.ecoCode.habitat = {'0xMc'};
metaData.ecoCode.embryo  = {'Tnpfm', 'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 06 11];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2018 10 31];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 11 17];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_4     = [2023 07 01];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 26.5;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from PoweAule1996';
data.tx = 24.5;   units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ADW';   
  temp.tx = C2K(40.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temps from DawsWhit1999';
data.tp = 73.5;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temps from DawsWhit1999';
data.tR = 730;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'ADW';
  temp.tR = C2K(40.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 8213;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'TacuCrai2013';   
  temp.am = C2K(40.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 34.1;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Dunn1975';
data.Wwi = 1899.3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'CramSimm2004';

data.Ri  = 0.010958904; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'TacuCrai2013';   
  temp.Ri = C2K(40.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
0   34.1;
1	42.9;
2	51.1;
3	69.5;
4	84.4;
5	98.6;
6	135.2;
7	184.1;
8	225.5;
9	288.4;
10	343.9;
11	396.5;
12	498.5;
13	447.2;
14	587;
15	689.9;
16	851;
17	893.3;
18	990;
19	1111.3;
20	1110.8;
21	1187.1;
22	1415.5;
23	1376.8;
24	1470.9;
25	1550;
26	1540;
27	1462.5;
28	1850;
29	1850;
30	1833.8;
33	1500;
36	1810.4;
37	1847.2];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Dunn1975';
  
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
D1 = 'mod_2: Feeding is reduced towards just after hatch, imposed k_J = 0.002 1/d';
D2 = 'Long tp cannot be captured by std model';
D3 = 'mod_3: v reduced';
D4 = 'mod_4: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '4FQQ5'; % Cat of Life
metaData.links.id_ITIS = '174717'; % ITIS
metaData.links.id_EoL = '45511372'; % Ency of Life
metaData.links.id_Wiki = 'Phalacrocorax_auritus'; % Wikipedia
metaData.links.id_ADW = 'Phalacrocorax_auritus'; % ADW
metaData.links.id_Taxo = '51681'; % Taxonomicon
metaData.links.id_WoRMS = '159059'; % WoRMS
metaData.links.id_avibase = '3AC46C54EE4A6251'; % avibase
metaData.links.id_birdlife = 'double-crested-cormorant-nannopterum-auritus'; % birdlife
metaData.links.id_AnAge = 'Phalacrocorax_auritus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phalacrocorax_auritus}}';
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
bibkey = 'DawsWhit1999'; type = 'Incollection'; bib = [ ... 
'author = {Dawson, W. R. and Whittow, G. C.}, ' ... 
'year = {1999}, ' ...
'title = {Regulation of Body Temperature}, ' ...
'booktitle = {Sturkie''s Avian Physiology, Fifth Edition.}, ' ...
'editor = {Whittow, G. C.}, ' ...
'publisher = {Academic Press}, ' ...
'address = {San Diego}, '...
'pages = {343--390}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PoweAule1996'; type = 'Article'; bib = [ ... 
'author = {Powell, D. C. and Aulerich, R. J. and Napolitano, A. C. and Stromborg, K. L. and Bursian, S. J.}, ' ... 
'year = {1996}, ' ...
'title = {Incubation of Double-crested Cormorant Eggs (\emph{Phalacrocorax auritus})}, ' ...
'journal = {Colonial Waterbirds}, ' ...
'volume = {19}, ' ...
'pages = {256--259}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dunn1975'; type = 'Article'; bib = [ ... 
'author = {Dunn, E.}, ' ... 
'year = {1975}, ' ...
'title = {Growth, body components and energy content of nestling Double-Crested Cormorants}, ' ...
'journal = {The Condor}, ' ...
'volume = {77}, ' ...
'pages = {431--438}'];
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
bibkey = 'CramSimm2004'; type = 'Book'; bib = [ ... 
'author = {Cramp, S. and Simmons, K. E. L.}, ' ... 
'year = {2004}, ' ...
'title = {BWPi: Birds of the Western Palearctic interactive}, ' ...
'howpublished = {DVD-ROM}, ' ...
'publisher = {BirdGuides Ltd}, '...
'address = {Sheffield}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Phalacrocorax_auritus/}}';
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

