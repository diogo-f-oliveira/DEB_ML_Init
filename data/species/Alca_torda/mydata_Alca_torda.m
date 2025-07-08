function [data, auxData, metaData, txtData, weights] = mydata_Alca_torda
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Alcidae';
metaData.species    = 'Alca_torda'; 
metaData.species_en = 'Razorbill'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'xiMcp', '0bTd'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 05 27];              
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

data.ab = 36;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 24;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Barr1984';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 72;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 1460;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 42*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 50;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Barr1984';
data.Wwi = 726;       units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW81 = [ ... % time since birth (d), wet weight (g)
 2	 76.358
 5	109.666
 8	149.018
11	180.597
14	195.338
17	203.596
18	206.639
19	205.795
20	208.837
21	227.422
22	227.874
23	236.527];
units.tW81   = {'d', 'g'};  label.tW81 = {'time since birth', 'wet weight'};  
temp.tW81    = C2K(40.7);  units.temp.tW81 = 'K'; label.temp.tW81 = 'temperature';
bibkey.tW81  = 'Barr1984';
comment.tW81 = 'Data from Hornoy 1981';
%
data.tW82 = [ ... % time since birth (d), wet weight (g)
 2	 40.097
 5	 87.224
 8	 84.109
11	130.130
14	168.627
16	184.555
17	190.944
18	191.405
19	192.364
20	202.353
21	201.309
22	201.766
23	219.281
24	220.245];
units.tW82   = {'d', 'g'};  label.tW82 = {'time since birth', 'wet weight'};  
temp.tW82    = C2K(40.7);  units.temp.tW82 = 'K'; label.temp.tW82 = 'temperature';
bibkey.tW82  = 'Barr1984';
comment.tW82 = 'Data from Hornoy 1982';

%% set weights for all real data
weights = setweights(data, []);
weights.tW82 = weights.tW82 * 2;
weights.tW81 = weights.tW81 * 2;
 
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
set1 = {'tW82','tW81'}; subtitle1 = {'Data from Hornoy 1982, 1981'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'BGZW'; % Cat of Life
metaData.links.id_ITIS = '176971'; % ITIS
metaData.links.id_EoL = '45509345'; % Ency of Life
metaData.links.id_Wiki = 'Alca_torda'; % Wikipedia
metaData.links.id_ADW = 'Alca_torda'; % ADW
metaData.links.id_Taxo = '53888'; % Taxonomicon
metaData.links.id_WoRMS = '137128'; % WoRMS
metaData.links.id_avibase = '64F4DD81371B269F'; % avibase
metaData.links.id_birdlife = 'razorbill-alca-torda'; % birdlife
metaData.links.id_AnAge = 'Alca_torda'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alca_torda}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Alca_torda}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Barr1984'; type = 'Article'; bib = [ ...  
'title = {Comparative notes on eggs, chick growth and fledging of \emph{Alaca torda} in north {N}orway}, ' ...
'journal = {Seabird}, ' ...
'volume = {7}, ' ...
'pages = {55-56}, ' ...
'year = {1984}, ' ...
'author = {Barrett, R. T.}'];
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

