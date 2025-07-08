function [data, auxData, metaData, txtData, weights] = mydata_Calyptorhynchus_banksii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Cacatuidae';
metaData.species    = 'Calyptorhynchus_banksii'; 
metaData.species_en = 'Red-tailed black cockatoo'; 

metaData.ecoCode.climate = {'Aw','BSh','Cs','Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 05];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 29;    units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 80;    units.tx = 'd';    label.tx = 'time since birth at fledging';     bibkey.tx = 'avibase';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 240;    units.tp = 'd';    label.tp = 'time since birth at puberty';     bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 4*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 45.4*365;    units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 33.5;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';               bibkey.Ww0 = 'avibase';
data.Wwb = 25;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'guess';
data.Wwi = 738.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'avibase';

data.Ri = 1/365/0.75; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 egg per clutch, 1 clutch per 0.75 yr';
 
% uni-variate data
% time-weight
data.tW30 = [ ... % time since birth (d), wet weight (g)
11	186.039
17	253.066
25	381.102
32	477.022
40	508.733
45	534.017
53	533.625
60	536.419
67	519.972];
units.tW30   = {'d', 'g'};  label.tW30 = {'time since birth', 'wet weight', 'nest 30'};  
temp.tW30    = C2K(41.3);  units.temp.tW30 = 'K'; label.temp.tW30 = 'temperature';
bibkey.tW30  = 'JohnKirb2013';
comment.tW30 = 'Data for nest 30 Armadale';
%
data.tW34 = [ ... % time since birth (d), wet weight (g)
 4	97.110
12	202.312
20	275.145
27	360.116
34	420.809
41	509.827
48	602.890
55	582.659
62	615.029
69	538.150];
units.tW34   = {'d', 'g'};  label.tW34 = {'time since birth', 'wet weight', 'nest 34'};  
temp.tW34    = C2K(41.3);  units.temp.tW34 = 'K'; label.temp.tW34 = 'temperature';
bibkey.tW34  = 'JohnKirb2013';
comment.tW34 = 'Data for nest 34 Armadale';

%% set weights for all real data
weights = setweights(data, []);
weights.tW30 = weights.tW30 * 2;
weights.tW34 = weights.tW34 * 2;

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
set1 = {'tW30','tW34'}; subtitle1 = {'Nest 30, 34'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response just after hatch and befor fledge reduced';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = 'Q6YB'; % Cat of Life
metaData.links.id_ITIS = '554835'; % ITIS
metaData.links.id_EoL = '1177834'; % Ency of Life
metaData.links.id_Wiki = 'Calyptorhynchus_banksii'; % Wikipedia
metaData.links.id_ADW = 'Calyptorhynchus_banksii'; % ADW
metaData.links.id_Taxo = '90852'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '122372C72FAA08FC'; % avibase
metaData.links.id_birdlife = 'red-tailed-black-cockatoo-calyptorhynchus-banksii'; % birdlife
metaData.links.id_AnAge = 'Calyptorhynchus_banksii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Calyptorhynchus_banksii}}';
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
bibkey = 'JohnKirb2013'; type = 'Article'; bib = [ ... 
'doi = {10.1071/pc130143}, ' ...
'author = {Johnstone, R. E. and Kirby, T. and Sarti, K.}, ' ... 
'year = {2013}, ' ...
'title = {The breeding biology of the Forest Red-tailed Black Cockatoo \emph{Calyptorhynchus banksii naso} {G}ould in south-western {A}ustralia. {II}. {B}reeding behaviour and diet}, ' ...
'journal = {Pacific Conservation Biology}, ' ...
'volume = {19(2)}, ' ...
'pages = {143-155}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Calyptorhynchus_banksii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=122372C72FAA08FC&sec=lifehistory}}';
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

