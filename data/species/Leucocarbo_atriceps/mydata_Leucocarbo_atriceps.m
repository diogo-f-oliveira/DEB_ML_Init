function [data, auxData, metaData, txtData, weights] = mydata_Leucocarbo_atriceps

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Suliformes'; 
metaData.family     = 'Phalacrocoracidae';
metaData.species    = 'Leucocarbo_atriceps'; 
metaData.species_en = 'Imperial shag'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MIS','MS','MAS'};
metaData.ecoCode.habitat = {'0xMc'};
metaData.ecoCode.embryo  = {'Tnpfm', 'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Ww0'; 'Wwi'; 'Ri'}; 
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

data.Ww0 = 52.6; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';     bibkey.Ww0 = 'Gree1997';
  comment.Ww0 = 'based on egg volume of 52.6 cm^3';
data.Wwi = 2467; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Gree1997';
data.Wwim = 3157; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Gree1997';

data.Ri  = 2.8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Gree1997';   
  temp.Ri = C2K(40.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.8 eggs per clutch; 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
 5    83.329
10	 369.229
15	 795.866
20	1335.072
25	1801.108
30	2109.573
35	2395.500
40	2574.486
45	2691.585
50	2774.863
55	2773.740];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Gree1997';
comment.tW = 'Data for Heard Island Shag Phalacrocorax nivalis, which is considered to be a subspecies of Leucocarbo atriceps';
  
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
D2 = 'mod_2: Feeding is reduced towards just after hatch, imposed k_J = 0.002 1/d';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '725KJ'; % Cat of Life
metaData.links.id_ITIS = '824003'; % ITIS
metaData.links.id_EoL = '45517775'; % Ency of Life
metaData.links.id_Wiki = 'Leucocarbo_atriceps'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '51680'; % Taxonomicon
metaData.links.id_WoRMS = '1603882'; % WoRMS
metaData.links.id_avibase = '20ADDF78'; % avibase
metaData.links.id_birdlife = 'imperial-shag-leucocarbo-atriceps'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leucocarbo_atriceps}}';
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
bibkey = 'Gree1997'; type = 'Article'; bib = [ ...  
'doi = {10.1071/mu97007}, ' ...    
'author = {Green, K.}, ' ...
'year  = {1997}, ' ...
'title = {Biology of the Heard Island Shag \emph{Phalacrocorax nivalis}. 2. {B}reeding}, ' ...  
'journal = {Emu - Austral Ornithology}, ' ...
'volume = {97(1)}, ' ...
'pages = {67–75}'];
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

