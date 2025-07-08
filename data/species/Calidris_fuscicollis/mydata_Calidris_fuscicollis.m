function [data, auxData, metaData, txtData, weights] = mydata_Calidris_fuscicollis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Scolopacidae';
metaData.species    = 'Calidris_fuscicollis'; 
metaData.species_en = 'White-rumped sandpiper'; 

metaData.ecoCode.climate = {'ET'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iFm'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 26];

%% set data
% zero-variate data

data.ab = 20.5;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'avibase';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 16.5;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '16-17 d';
data.tp = 49.5;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(41); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 7*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'avibase';   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 8.3;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'ParmGrei1968';
data.Wwb = 5;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'avibase';
data.Wwi = 45.8;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'avibase';
data.Wwim = 43; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male'; bibkey.Wwim = 'avibase';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
    0.25  5.0
    6.46 18.0
    9.17 19.8
   10.83 25.2
   12.79 29.2
   15.54 29.7
   17.21 33.4
   21.96 33.8
   22.25 36.3
   27.08 32.5];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'ParmGrei1968'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Ww0 = weights.Ww0 * 0; 

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
D1 = 'Males are assumed to differ from females by {p_Am} only';     
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'PK48'; % Cat of Life
metaData.links.id_ITIS = '176654'; % ITIS
metaData.links.id_EoL = '45509232'; % Ency of Life
metaData.links.id_Wiki = 'Calidris_fuscicollis'; % Wikipedia
metaData.links.id_ADW = 'Calidris_fuscicollis'; % ADW
metaData.links.id_Taxo = '53738'; % Taxonomicon
metaData.links.id_WoRMS = '159050'; % WoRMS
metaData.links.id_avibase = '153BA3069DFCDDCA'; % avibase
metaData.links.id_birdlife = 'white-rumped-sandpiper-calidris-fuscicollis'; % birdlife
metaData.links.id_AnAge = 'Calidris_fuscicollis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Calidris_fuscicollis}}';
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
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=153BA3069DFCDDCA&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Parm2020'; type = 'Misc'; bib = [ ... 
'doi = {10.2173/bow.whrsan.01}, ' ...
'author = {Parmelee, D. F.}, ' ... 
'year = {2020}, ' ...
'title = {White-rumped Sandpiper (\emph{Calidris fuscicollis}), version 1.0. In Birds of the World (A. F. Poole, P. R. Stettenheim, and F. B. Gill, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ParmGrei1968'; type = 'Article'; bib = [ ...  
'doi = {10.2307/1364130}, ' ...
'title = {SUMMER SCHEDULE AND BREEDING BIOLOGY OF THE WHITE-RUMPED SANDPIPER IN THE CENTRAL {C}ANADIAN ARCTIC}, ' ...
'journal = {The Wilson Bulletin }, ' ...
'volume = {80(1)}, ' ...
'year = {1968}, ' ...
'author = {David F. Parmelee and Dale W. Greiner and Walter D. Graul}, ' ...
'pages = {4-29}'];
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

