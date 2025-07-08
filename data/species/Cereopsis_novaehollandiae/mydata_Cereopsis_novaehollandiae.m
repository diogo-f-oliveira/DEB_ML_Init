function [data, auxData, metaData, txtData, weights] = mydata_Cereopsis_novaehollandiae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Cereopsis_novaehollandiae'; 
metaData.species_en = 'Cape Barren goose'; 

metaData.ecoCode.climate = {'Cfb', 'BSk'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'xiMc'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.2); % K
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 06];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 36;   units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'Vese1973';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '35 till 37 d';
data.tx = 70;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Vese1973';   
  temp.tx = C2K(41.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 210;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'Vese1973';
  temp.tR = C2K(41.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 28.1 * 365;  units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(41.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 34;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Vese1973';
  comment.Wwi = 'Wiki: 3 till 7 kg; males are somewhat larger than females';
data.Wwi = 6.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'Wiki';
  comment.Wwi = '3 till 7 kg';

data.Ri  = 6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Vese1973';   
 temp.Ri = C2K(41.2);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 comment.Ri = '3 till 7 eggs per clutch';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
 0.861	  34.014
 5.770	 136.054
 9.731	 340.136
16.792	 416.667
18.859	 552.721
24.198	 705.782
26.781	 918.367
30.915	1020.408
33.154	1343.538
38.149	1726.191
40.732	1879.252
44.865	2278.912
49.602	2593.537
52.874	2857.143
56.405	3103.742
59.074	3222.789
62.519	3299.320
64.930	3511.905
68.891	3707.483
73.197	3903.061
83.875	3911.565]; 
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = metaData.T_typical;  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Vese1973';
  

%% set weights for all real data
weights = setweights(data, []);

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
D1 = 'Body temperature is guessed';
D2 = 'mod_1: v is reduced; food availability taken variable in tW data';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = 'SWQ6'; % Cat of Life
metaData.links.id_ITIS = '175202'; % ITIS
metaData.links.id_EoL = '1048513'; % Ency of Life
metaData.links.id_Wiki = 'Cereopsis_novaehollandiae'; % Wikipedia
metaData.links.id_ADW = 'Cereopsis_novaehollandiae'; % ADW
metaData.links.id_Taxo = '51980'; % Taxonomicon
metaData.links.id_WoRMS = '1469777'; % WoRMS
metaData.links.id_avibase = 'CA875F313CC1FB4B'; % avibase
metaData.links.id_birdlife = 'cape-barren-goose-cereopsis-novaehollandiae'; % birdlife
metaData.links.id_AnAge = 'Cereopsis_novaehollandiae'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cereopsis_novaehollandiae}}';
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
bibkey = 'Vese1973'; type = 'Article'; bib = [ ... 
'author = {Veselovsky, Z.}, ' ... 
'doi = {10.1111/j.1748-1090.1973.tb02101.x}, ' ...
'year = {1973}, ' ...
'title = {The breeding biology of {C}ape {B}arren geese \emph{Cheopsis novaehollandiae}}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {13}, ' ...
'pages = {48-55}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cereopsis_novaehollandiae}}';
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

