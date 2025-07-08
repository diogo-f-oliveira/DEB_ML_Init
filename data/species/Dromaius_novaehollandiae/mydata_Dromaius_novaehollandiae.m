function [data, auxData, metaData, txtData, weights] = mydata_Dromaius_novaehollandiae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Casuariiformes'; 
metaData.family     = 'Dromaiidae';
metaData.species    = 'Dromaius_novaehollandiae'; 
metaData.species_en = 'Emu'; 

metaData.ecoCode.climate = {'BWh', 'BSh', 'Cfa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTg', '0iTs', '0iTd'};
metaData.ecoCode.embryo  = {'Tnsm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.98); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 06 11];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Carlos MGL Teixeira'};    
metaData.date_mod_1     = [2015 05 06];              
metaData.email_mod_1    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address_mod_1  = {'Lisbon University'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 23];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 11 16];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_4     = [2023 06 20];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 20];

%% set data
% zero-variate data

data.ab = 53;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'NagaMak2011';   
  temp.ab = C2K(35.95);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'obtained from average incubation time; temp from KuehGood1990';
data.tx = 4.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ARKive';   
  temp.tx = C2K(37.98);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 15 * 30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'FolcChri2020';   
  temp.tp = C2K(37.98);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'end of immature juv period around 15 months';
data.tR = 912;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';   bibkey.tR = 'FolcChri2020';
  temp.tR = C2K(37.98);  units.temp.tR = 'K'; label.temp.tR = 'temperature'; comment.tR = 'starting to breed (aka sex. maturity) around 2-3 years';
data.am = 14600;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Swar2009';   
  temp.am = C2K(37.98);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 134;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Swar2009';

data.Wwb = 420;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Swar2009';
data.Wwi = 55000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Swar2009';

data.Ri  = 0.02739726;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Swar2009';   
  temp.Ri = C2K(37.98); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... time since birth (d), wet weight (g):
 7   500;
17.5 800;
24.5 1300;
35	2300;
49	3900;
63	5900;
77	7800;
98	10700;
126	14600;
154	18200;
182	23800;
210	23800;
238	26100;
266	28000;
294	30000;
322	32500;
350	35700;
378	38800;
406	41500;
427	43100;
437.5 44000];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37.98);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Sale2002';
  
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
D1 = 'mod_3: v reduced';
D2 = 'mod_4: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '37PLM'; % Cat of Life
metaData.links.id_ITIS = '174385'; % ITIS
metaData.links.id_EoL = '45517716'; % Ency of Life
metaData.links.id_Wiki = 'Dromaius_novaehollandiae'; % Wikipedia
metaData.links.id_ADW = 'Dromaius_novaehollandiae'; % ADW
metaData.links.id_Taxo = '51279'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '2DB5A9703C6D4D91'; % avibase
metaData.links.id_birdlife = 'common-emu-dromaius-novaehollandiae'; % birdlife
metaData.links.id_AnAge = 'Dromaius_novaehollandiae'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dromaius_novaehollandiae}}';
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
bibkey = 'DawsHerd1983'; type = 'Article'; bib = [ ... 
'author = {Dawson, T.J. and Herd, R. M. and Skadhauge, E.}, ' ... 
'year = {1983}, ' ...
'title = {Water turnover and body water distribution during dehydration in a large arid-zone bird, the Emu, \emph{Dromaius novaehollandiae}}, ' ...
'journal = {Journal of Comparative Physiology B}, ' ...
'volume = {153}, ' ...
'pages = {235--240}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KuehGood1990'; type = 'Article'; bib = [ ... 
'author = {Kuehler, C. and Good, J.}, ' ... 
'year = {1990}, ' ...
'title = {Artificial incubation of bird eggs at the {Z}oological {S}ociety of {S}an {D}iego}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {29}, ' ...
'pages = {118--136}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaloDaws1993'; type = 'Article'; bib = [ ... 
'author = {Maloney, S.K. and Dawson, T.J.}, ' ... 
'year = {1993}, ' ...
'title = {Sexual dimorphism in basal metabolism and body temperature of a large bird, the Emu.}, ' ...
'journal = {The Condor}, ' ...
'volume = {95}, ' ...
'pages = {1034--1037}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NagaMak2011'; type = 'Article'; bib = [ ... 
'author = {Nagai, H. and Mak, S. and Weng, W. and Nakaya, Y. and Ladher, R. and Sheng, G.}, ' ... 
'year = {2011}, ' ...
'title = {Embryonic development of the emu, \emph{Dromaius novaehollandiae}}, ' ...
'journal = {Developmental Dynamics}, ' ...
'volume = {240}, ' ...
'pages = {162--175}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sale2002'; type = 'Techreport'; bib = [ ... 
'author = {Sales, J.}, ' ... 
'year = {2002}, ' ...
'title = {Feeding Guidelines for Ratites in Zoos}, ' ...
'institution = {Ghent University, Merelbeke}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Swar2009'; type = 'Techreport'; bib = [ ... 
'author = {Swarbrick, K.}, ' ... 
'year = {2009}, ' ...
'title = {Husbandry Guidelines for Emus \emph{Dromaius novaehollandiae}}, ' ...
'institution = {Western Sydney Institute of TAFE, Richmond}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AWD'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Dromaius_novaehollandiae/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ARKive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/emu/dromaius-novaehollandiae/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FolcChri2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.ostric2.01}, ' ...
'author = {Folch, A. and D. A. Christie and E. F. J. Garcia}, ' ...
'year = {2020}, ' ...
'title = {Emu (\emph{Dromaius novaehollandiae})}, ' ...
'howpublished = {version 1.0. In Birds of the World (J. del Hoyo, A. Elliott, J. Sargatal, D. A. Christie, and E. de Juana, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA.}'];
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

