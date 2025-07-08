function [data, auxData, metaData, txtData, weights] = mydata_Margarops_fuscatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Mimidae';
metaData.species    = 'Margarops_fuscatus'; 
metaData.species_en = 'Pearly-eyed thrasher'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tnwf','Tncf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 10];

%% set data
% zero-variate data

data.ab = 14;       units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Toxostoma curvirostre';
data.tx = 10;       units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'value for Toxostoma rufum';
data.tp = 30;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'value for Toxostoma rufum';
data.tR = 365;      units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 17*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 


data.Wwb = 5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Aren1985';
data.Wwi = 100.48;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 2.4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-4 eggs/clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0.000	4.967
0.828	10.180
1.867	16.889
2.750	22.449
3.635	29.350
4.780	37.785
5.822	46.220
6.810	53.696
7.696	60.598
8.786	67.499
9.773	73.634
10.809	79.193
11.744	84.753
12.882	89.737
13.710	93.571
14.743	96.638
15.723	99.130
16.802	99.897
17.626	101.047
18.958	99.130
19.878	96.638
20.745	93.379];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'unparasiticed'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Aren1985';
comment.tW = 'unparasitized';
%
data.tWp = [ ... % time since birth (d), weight (g)
0.000	4.967
0.691	8.110
1.496	13.391
2.501	20.590
3.606	32.811
4.712	41.447
5.617	48.643
6.320	55.833
7.325	62.793
8.331	69.515
9.135	77.903
10.191	84.625
11.096	90.149
12.154	93.048
13.110	97.617
15.025	99.825
16.033	101.767
16.990	102.990
19.110	99.230
20.069	96.152
21.079	92.598];
units.tWp   = {'d', 'g'};  label.tWp = {'time since birth', 'wet weight', 'parasiticed'};  
temp.tWp    = C2K(41.6);  units.temp.tWp = 'K'; label.temp.tW1 = 'temperature';
bibkey.tWp = 'Aren1985';
comment.tWp = 'Heavily parasitized by the blood-sucking larvae of Protocalliphora azurea';

%% set weights for all real data
weights = setweights(data, []);
weights.tWp = weights.tWp * 2;
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

%% Group plots
set1 = {'tW','tWp'}; subtitle1 = {'Unparasitized, parasitized'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Scaled functional response varies in time';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '6QTZB'; % Cat of Life
metaData.links.id_ITIS = '178656'; % ITIS
metaData.links.id_EoL = '45510174'; % Ency of Life
metaData.links.id_Wiki = 'Margarops_fuscatus'; % Wikipedia
metaData.links.id_ADW = 'Margarops_fuscatus'; % ADW
metaData.links.id_Taxo = '56781'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'C2A16FAEAF1C1259'; % avibase
metaData.links.id_birdlife = 'pearly-eyed-thrasher-margarops-fuscatus'; % birdlife
metaData.links.id_AnAge = 'Margarops_fuscatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Margarops_fuscatus}}';
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
bibkey = 'Aren1985'; type = 'Article'; bib = [ ... 
'author = {Wayne J. Arendt}, ' ... 
'year = {1985}, ' ...
'title = {Philornis Ectoparasitism of Pearly-Eyed Thrashers. {I}. {I}mpact on Growth and Development of Nestlings}, ' ...
'journal = {The Auk}, ' ...
'volume = {102(2)}, ' ...
'pages = {270-280}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Margarops_fuscatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Margarops_fuscatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=C2A16FAEAF1C1259&sec=lifehistory}}';
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

