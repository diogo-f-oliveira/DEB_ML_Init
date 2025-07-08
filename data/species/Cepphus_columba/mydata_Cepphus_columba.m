function [data, auxData, metaData, txtData, weights] = mydata_Cepphus_columba
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Alcidae';
metaData.species    = 'Cepphus_columba'; 
metaData.species_en = 'Pigeon guillemot'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'xiMcp', '0bTd'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf', 'biCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2022 08 29];              
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

data.ab = 31;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 38;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Dren1965';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 114;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 3*365;       units.tR = 'd';    label.tR = 'time since birth at first egg laying';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 15.2*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 55;  units.Ww0 = 'g'; label.Ww0 = 'initial wet weight';  bibkey.Ww0 = 'avibase';
data.Wwb = 43.7;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Dren1965';
data.Wwi = 483.8;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1.55/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avubase';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-2 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
 0  43.7
 1  48.7
 2  56.9
 3  65.9
 4  78.4
 5  89.5
 6 101.5
 7 119.0
 8 132.5
10 164.1
11 182.6
12 198.4
13 215.1
14 233.4
15 245.7
16 257.7
17 269.4
18 288.5
19 304.6
20 308.9
21 318.4
22 329.9
23 339.7
24 336.8
25 357.2
26 366.0
27 367.1
28 377.4
29 378.3
30 393.1
31 397.0
32 400.0
33 407.8
34 409.9
35 412.9
36 424.0
37 420.5
38 423.5];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'Pitsulak City 1981'};  
temp.tW    = C2K(40.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Dren1965';

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
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'SFVK'; % Cat of Life
metaData.links.id_ITIS = '176991'; % ITIS
metaData.links.id_EoL = '45509350'; % Ency of Life
metaData.links.id_Wiki = 'Cepphus_columba'; % Wikipedia
metaData.links.id_ADW = 'Cepphus_columba'; % ADW
metaData.links.id_Taxo = '70346'; % Taxonomicon
metaData.links.id_WoRMS = '343902'; % WoRMS
metaData.links.id_avibase = '2F5DF476344AEA92'; % avibase
metaData.links.id_birdlife = 'pigeon-guillemot-cepphus-columba'; % birdlife
metaData.links.id_AnAge = 'Cepphus_columba'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cepphus_columba}}';
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
bibkey = 'Dren1965'; type = 'Article'; bib = [ ... 
'author = {R. H. Drent}, ' ... 
'year = {1965}, ' ...
'title = {BREEDING BIOLOGY OF THE PIGEON GUILLEMOT, \emph{Cepphus columba}}, ' ...
'journal = {Ardea}, ' ...
'volume = {53}, ' ...
'pages = {99-159}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cepphus_columba}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=2F5DF476344AEA92&sec=lifehistory}}';
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

