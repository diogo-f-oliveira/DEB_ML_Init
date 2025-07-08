function [data, auxData, metaData, txtData, weights] = mydata_Thraupis_episcopus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Thraupidae';
metaData.species    = 'Thraupis_episcopus';
metaData.species_en = 'Blue-gray tanager';

metaData.ecoCode.climate = {'Af','Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 12];

%% set data
% zero-variate data

data.ab = 13.25;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 17.5;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 52.5;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 9.5*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.7;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'OnikRick2008';
  comment.Wwb = 'based on tW data';
data.Wwi = 35.5;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 4/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'SancLond2012';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 clutch per yr, 2 eggs per clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time (d), weight (g)
0.952	4.032
0.978	4.653
1.978	6.390
2.027	5.769
2.977	7.506
3.028	8.871
3.904	11.414
3.953	10.546
3.979	11.104
4.003	10.050
4.928	12.531
4.929	13.089
4.980	14.020
5.002	10.670
5.953	14.082
5.954	14.702
5.956	16.563
6.880	17.618
6.977	14.578
7.008	20.285
8.055	19.479
8.906	22.084
8.930	20.471
8.978	19.293
9.004	19.727
10.006	23.449
10.078	21.402
10.954	23.201
10.975	20.720
10.976	20.906
10.977	21.402];
units.tW = {'d', 'g'};     label.tW = {'time', 'wet weight','Manaus'};  
temp.tW = C2K(41.6); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'OnikRick2008';
%
data.tW1 = [ ... % time (d), weight (g)
1.026	2.916
2.076	5.025
3.001	6.700
4.000	7.630
4.976	9.926
6.000	11.166
6.951	13.834
7.950	14.144
9.002	18.238
9.926	18.797
11.001	20.533
11.052	22.022
11.901	22.581
13.949	23.449
14.975	26.241];
units.tW1 = {'d', 'g'};     label.tW1 = {'time', 'wet weight', 'Panama Chanal'};  
temp.tW1 = C2K(41.6); units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'OnikRick2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = weights.tW1 * 2;
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
set1 = {'tW','tW1'}; subtitle1 = {'Nestlings at Manaus, Panama Chanal'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '56LM6'; % Cat of Life
metaData.links.id_ITIS = '563425'; % ITIS
metaData.links.id_EoL = '45510418'; % Ency of Life
metaData.links.id_Wiki = 'Thraupis_episcopus'; % Wikipedia
metaData.links.id_ADW = 'Thraupis_episcopus'; % ADW
metaData.links.id_Taxo = '58320'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'EFCDB0ECCF55BF56'; % avibase
metaData.links.id_birdlife = 'blue-grey-tanager-tangara-episcopus'; % birdlife
metaData.links.id_AnAge = 'Thraupis_episcopus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thraupis_episcopus}}';
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
bibkey = 'OnikRick2008'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1474-919X.1981.tb04038.x}, ' ...
'author = {Oniki, Y. and Ricklefs, R. E.}, ' ... 
'year = {2008}, ' ...
'title = {MORE GROWTH RATES OF BIRDS IN THE HUMID NEW WORLD TROPICS}, ' ...
'journal = {Ibis}, ' ...
'volume = {123(3)}, ' ...
'pages = {349–354}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Thraupis_episcopus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=EFCDB0ECCF55BF56&sec=lifehistory}}';
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

