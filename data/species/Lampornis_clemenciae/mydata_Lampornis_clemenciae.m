function [data, auxData, metaData, txtData, weights] = mydata_Lampornis_clemenciae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Trochilidae';
metaData.species    = 'Lampornis_clemenciae';
metaData.species_en = 'Blue-throated mountaingem'; 

metaData.ecoCode.climate = {'Am', 'Cwa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi', 'xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body Temperature 
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 18];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data;
data.ab = 18;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'egg temperature'; 
data.tx = 25;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Schu1985'; 
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 75;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess'; 
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;   units.tR = 'd';   label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(38.1);  units.temp.tR = 'K'; label.temp.tR = 'temperature';  
data.am = 12*365;  units.am = 'd';   label.am = 'life span';                     bibkey.am = 'AnAge'; 
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.4; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Schu1985';
  comment.Wwb = 'egg weight 0.75 g';
data.Wwi = 9.5; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'Schu1985'; 
  comment.Wwi = 'asymptotic weight of nestling; adult: 7.1 g';

data.Ri  = 2*2/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 2 clutches per yr';
 
% uni-variate data
% time-weight
data.tW = [...
0.000	1.386
1.040	2.450
1.991	3.129
1.992	3.129
2.913	3.691
3.954	4.282
4.935	4.519
7.015	5.171
7.996	5.968
8.977	6.884
9.958	6.619
10.999	7.329
11.950	7.743
13.020	8.245
13.942	8.660
14.982	9.074
16.023	8.986
17.004	9.224
18.014	9.195
18.995	9.727
20.065	9.404
21.106	9.405
22.087	9.259
23.098	8.847
24.019	8.907
25.119	8.555];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(38.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Schu1985';

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
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'mod_1: v is reduced; variable food availability in tW data';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Body temperature drops at night';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3S3HH'; % Cat of Life
metaData.links.id_ITIS = '178054'; % ITIS
metaData.links.id_EoL = '45509608'; % Ency of Life
metaData.links.id_Wiki = 'Lampornis_clemenciae'; % Wikipedia
metaData.links.id_ADW = 'Lampornis_clemenciae'; % ADW
metaData.links.id_Taxo = '55044'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '97FB2BC90F977D37'; % avibase
metaData.links.id_birdlife = 'blue-throated-hummingbird-lampornis-clemenciae'; % birdlife
metaData.links.id_AnAge = 'Lampornis_clemenciae'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lampornis_clemenciae}},'...
'note = {Accessed : 2017-03-20}'];
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
bibkey = 'Schu1985'; type = 'Article'; bib = [ ... 
'author = {K.-L. Schuchmann}, ' ... 
'year = {1985}, ' ...
'title = {Morpho- und {T}hermogenese nestjunger {B}laukehlkolibris (\emph{Lampornis clemenciae})}, ' ...
'journal = {J. Orn.}, ' ...
'volume = {126}, ' ...
'number = {3}, '...
'pages = {305-308}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Aboutanimals'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2017}, ' ...
'howpublished = {\url{https://www.aboutanimals.com/bird/black-chinned-hummingbird/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Vlec1981'; type = 'Article'; bib = [ ... 
'author = {C. M. Vleck}, ' ... 
'year = {1981}, ' ...
'title = {Hummingbird Incubation: Female Attentiveness Egg Temperature}, ' ...
'journal = {Oecologia}, ' ...
'volume = {51}, ' ...
'number = {Issue 2}, '...
'pages = {199--205}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = [...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Lampornis_clemenciae}},'...
'note = {Accessed : 2017-03-20}'];
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

