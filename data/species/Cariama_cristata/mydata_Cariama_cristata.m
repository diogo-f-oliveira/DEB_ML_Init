function [data, auxData, metaData, txtData, weights] = mydata_Cariama_cristata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Cariamiformes'; 
metaData.family     = 'Cariamidae';
metaData.species    = 'Cariama_cristata'; 
metaData.species_en = 'Red-legged seriema'; 

metaData.ecoCode.climate = {'Aw', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tnsfm', 'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii', 'biCvr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 10 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 26];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 05];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 27.5;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Schu2012';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temperature from KuehGood1990';
data.tx = 30;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Hall2007';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temperature from DaanMasm1991,DawsWhit1999';
data.tp = 90;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temperature from DaanMasm1991,DawsWhit1999';
data.tR = 240;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Hall2007';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 11680; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Hall2009';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 90;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Hall2007';

data.Wwb = 60.25;units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SeaWorld';
data.Wwi = 2750; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Hall2007';

data.Ri = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ALR';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1 61.5;
2 59.8;
3 67;
4 77;
5 96;
6 119;
7 141;
8 183;
9 219;
10 256;
11 289;
12 314;
13 350;
14 376;
15 417;
16 437;
17 474;
18 508;
19 524;
20 539;
21 562;
22 618;
23 624;
24 650;
25 664;
27 729;
31 807];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Rodr2012';
  
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
D1 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '69CFR'; % Cat of Life
metaData.links.id_ITIS = '176413'; % ITIS
metaData.links.id_EoL = '45512155'; % Ency of Life
metaData.links.id_Wiki = 'Cariama_cristata'; % Wikipedia
metaData.links.id_ADW = 'Cariama_cristata'; % ADW
metaData.links.id_Taxo = '53437'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '5817C5F7C841C6DE'; % avibase
metaData.links.id_birdlife = 'red-legged-seriema-cariama-cristata'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cariama_cristata}}';
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
bibkey = 'Hall2007'; type = 'Book'; bib = [ ... 
'author = {Hallager, S.}, ' ... 
'year = {2007}, ' ...
'title = {North American Studbook for the Red-Legged Seriema}, ' ...
'publisher = {Smithsonians National Zoological Park}, ' ...
'address = {Washington, DC}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hall2009'; type = 'Book'; bib = [ ... 
'author = {Hallager, S.}, ' ... 
'year = {2009}, ' ...
'title = {Population Management Plan for the Red-legged seriema}, ' ...
'publisher = {Smithsonians National Zoological Park}, ' ...
'address = {Washington, DC}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KuehGood1990'; type = 'Article'; bib = [ ... 
'author = {Kuehler, C. and Good, J.}, ' ... 
'year = {1990}, ' ...
'title = {Artificial incubation of bird eggs at the Zoological Society of {S}an {D}iego}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {29}, ' ...
'pages = {118--136}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DaanMasm1991'; type = 'Article'; bib = [ ... 
'author = {Daan, S. and Masman, D. and Strijkstra, A. and Verhulst, S.}, ' ... 
'year = {1991}, ' ...
'title = {Intraspecific Allometry of Basal Metabolic Rate: Relations with Body Size, Temperature, Composition, and Circadian Phase in the Kestrel, \emph{Falco tinnunculus}}, ' ...
'journal = {Journal of Biological Rhythms}, ' ...
'volume = {4}, ' ...
'pages = {267--283}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DawsWhit1999'; type = 'Incollection'; bib = [ ... 
'author = {Dawson, W. R. and Whittow, G.C.}, ' ... 
'year = {1999}, ' ...
'title = {Regulation of Body Temperature}, ' ...
'booktitle = {Sturkie''s Avian Physiology, Fifth Edition.}, ' ...
'editor = {Whittow, G. C.}, ' ...
'publisher = {Academic Press}, ' ...
'address = {San Diego}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Schu2012'; type = 'Book'; bib = [ ... 
'author = {Schulenberg, T. S.}, ' ... 
'year = {2012}, ' ...
'title = {Neotropical Birds Online}, ' ...
'publisher = {Cornell Lab of Ornithology}, ' ...
'address = {Ithaca}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SeaWorld'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.seaworld.org}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ALR'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animals.jrank.org/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rodr2012'; type = 'Misc'; bib = [...
'author = {Rodriguez, S.}, ' ... 
'year = {2012}, ' ...
'note = {Personal communication. SeaWorld Orlando}, ' ...
'howpublished = {\url{http://seaworldparks.com/en/seaworld-orlando/}}'];
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

