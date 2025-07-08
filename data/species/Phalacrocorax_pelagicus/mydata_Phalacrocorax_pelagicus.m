function [data, auxData, metaData, txtData, weights] = mydata_Phalacrocorax_pelagicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Suliformes'; 
metaData.family     = 'Phalacrocoracidae';
metaData.species    = 'Phalacrocorax_pelagicus'; 
metaData.species_en = 'Pelagic cormorant'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0xMc'};
metaData.ecoCode.embryo  = {'Tnpfm', 'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 26.5;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from PoweAule1996';
data.tx = 45;   units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temps from DawsWhit1999';
data.tp = 135;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temps from DawsWhit1999';
data.tR = 1.4*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(40.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 17.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(40.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 42; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 35;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'avibase';
data.Wwi = 1702; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
data.Wwim = 2041; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 3.7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.7 eggs per clutch; 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
 0.001	 32.983
 0.929	 37.183
 1.772	 41.376
 3.038	 57.976
 3.966	 82.795
 4.894	 95.242
 5.823	115.937
 7.005	157.272
 8.018	194.469
 8.864	244.023
 9.961	264.732
 9.963	314.217
10.976	355.538
11.906	413.346
12.837	504.145
13.935	533.101
15.035	623.914
15.202	599.185
15.881	694.086
16.897	793.139
17.994	826.220
19.179	917.039
20.109	978.971
20.190	904.751
21.119	954.312
21.799	1082.203
22.982	1131.786
24.251	1239.107
25.008	1193.808
26.021	1222.758
26.952	1292.938
28.051	1359.008
29.063	1371.462
30.075	1388.041
30.076	1412.783
31.086	1363.382
32.357	1503.693
33.118	1565.611
33.955	1421.350
35.059	1602.885
36.157	1644.212
37.168	1636.048
38.095	1611.382
41.215	1628.135
44.337	1673.753
47.286	1616.264
50.406	1620.645];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Robe1966';
  
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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4FQQX'; % Cat of Life
metaData.links.id_ITIS = '174725'; % ITIS
metaData.links.id_EoL = '45511369'; % Ency of Life
metaData.links.id_Wiki = 'Phalacrocorax_pelagicus'; % Wikipedia
metaData.links.id_ADW = 'Phalacrocorax_pelagicus'; % ADW
metaData.links.id_Taxo = '51704'; % Taxonomicon
metaData.links.id_WoRMS = '343950'; % WoRMS
metaData.links.id_avibase = 'A429B5B8397A0907'; % avibase
metaData.links.id_birdlife = 'pelagic-cormorant-urile-pelagicus'; % birdlife
metaData.links.id_AnAge = 'Phalacrocorax_pelagicus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phalacrocorax_pelagicus}}';
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
bibkey = 'Robe1966'; type = 'phdthesis'; bib = [ ... 
'author = {Ian Robertson}, ' ... 
'year = {1966}, ' ...
'title = {The influence of brood-size on reproductive succes in two species of cormorant, \emph{Phalacrocorax auritus \& \emph{P. pelagicus} and its relation to the problem of clutch-size}}, ' ...
'school = {Univ. of Britisch Columbia, Vancouver}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=A429B5B8397A0907&sec=lifehistory}}';
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

