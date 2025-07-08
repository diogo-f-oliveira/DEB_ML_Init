function [data, auxData, metaData, txtData, weights] = mydata_Amazona_aestiva

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittacidae';
metaData.species    = 'Amazona_aestiva'; 
metaData.species_en = 'Turquoise-fronted amazon'; 

metaData.ecoCode.climate = {'Af','Am','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 05];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 29.25;    units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '24 till 28 d';
data.tx = 60;    units.tx = 'd';    label.tx = 'time since birth at fledging';     bibkey.tx = 'Wiki';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 180;    units.tp = 'd';    label.tp = 'time since birth at puberty';     bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'ADW';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 49*365;    units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 17.75;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';            bibkey.Ww0 = 'avibase';
data.Wwb = 14;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'ADW';
  comment.Wwb =  '12-22 g';
data.Wwi = 451;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'AnAge';
  comment.Wwi = 'avibase gives 400 g';

data.Ri = 3/365/1.5; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 eggs/clutch; breeds once per 1 yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.637	17.726
1.115	11.340
1.911	24.100
2.548	39.698
2.549	26.223
3.025	34.730
3.503	45.365
5.414	48.189
6.369	33.997
6.529	59.528
8.280	53.842
10.510	45.316
12.102	75.091
15.127	141.737
15.605	45.279
16.083	63.716
16.084	63.716
17.675	195.619
17.834	109.093
18.631	150.222
21.656	110.485
21.975	87.787
22.930	211.894
22.931	211.894
27.866	297.675
31.847	188.427
32.643	323.173
33.280	318.913
35.350	147.267
36.943	352.929
42.516	259.273
43.631	359.974
45.860	394.710
45.861	362.795
46.019	247.901
46.178	226.623
47.293	287.608
47.611	333.705
47.612	318.811
48.089	371.290
51.592	300.343
53.344	379.054
57.006	354.206
57.007	340.730
58.121	317.318
58.917	331.497
59.713	274.754
60.510	364.819
61.147	347.793
62.739	333.598
62.898	274.731
64.331	348.480
69.268	351.282
69.745	236.385
69.746	286.739
71.656	305.875
78.185	296.609];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'SeixMour2003';
  
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
D1 = 'Body temperatures are guessed';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Female breeds, both parents feed young; nest in tree cavities';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '65ZRW'; % Cat of Life
metaData.links.id_ITIS = '177783'; % ITIS
metaData.links.id_EoL = '45510874'; % Ency of Life
metaData.links.id_Wiki = 'Amazona_aestiva'; % Wikipedia
metaData.links.id_ADW = 'Amazona_aestiva'; % ADW
metaData.links.id_Taxo = '54343'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '4B268FD25510C6CB'; % avibase
metaData.links.id_birdlife = 'turquoise-fronted-amazon-amazona-aestiva'; % birdlife
metaData.links.id_AnAge = 'Amazona_aestiva'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amazona_aestiva}}';
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
bibkey = 'SeixMour2003'; type = 'Article'; bib = [ ... 
'author = {Gl\''{a}ucia Helena Fernandes Seixas and Guilherme Mour\~{a}o}}, ' ... 
'year = {2003}, ' ...
'title = {GROWTH OF NESTLINGS OF THE BLUE-FRONTED AMAZON (\meph{Amazona aestiva}) RAISED IN THE WILD OR IN CAPTIVITY}, ' ...
'journal = {Ornotologia Neotropical}, ' ...
'volume = {14}, ' ...
'pages = {295–305}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Amazona_aestiva}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=4B268FD25510C6CB&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Amazona_aestiva/}}';
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

