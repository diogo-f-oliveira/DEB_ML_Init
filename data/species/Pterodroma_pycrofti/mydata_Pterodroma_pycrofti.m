function [data, auxData, metaData, txtData, weights] = mydata_Pterodroma_pycrofti

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Pterodroma_pycrofti'; 
metaData.species_en = 'Pycroft''s petrel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 09 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 45;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 80; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 240; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 7.7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
  comment.Wwb = 'Data for Pterodroma hypoleuca';
data.Wwi = 250; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'GangWils2004';
  comment.Wwi = 'asymptote for nestling; mean adult weight is lower. Wiki 112-198 g';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
 0      7.7     % added data point Wwb
20.000	119.510
20.896	126.271
21.954	127.851
23.012	133.813
24.071	144.157
25.047	142.152
25.943	157.280
27.246	154.872
28.060	157.252
29.199	166.001
30.014	163.202
31.153	173.147
32.130	189.867
32.944	189.458
33.840	188.251
34.980	203.773
35.957	210.932
37.096	224.462
37.992	218.474
39.132	224.037
40.109	214.462
41.167	220.026
42.144	235.152
43.202	221.592
44.342	223.569
45.156	227.144
46.133	231.912
47.191	240.663
47.924	238.263
49.064	245.020
49.878	236.245
50.855	241.411
52.076	250.160
53.216	256.519
54.111	259.694
54.925	259.285
55.984	263.654
56.961	257.266
58.019	249.682
58.996	251.263
59.891	245.275
61.113	246.454
62.090	245.644
63.066	244.038
64.043	242.033
64.939	234.849
65.916	238.821
66.974	224.862
68.033	226.840
68.765	214.878
69.905	215.660
70.963	208.475
71.859	207.666
73.080	198.088
73.894	194.890
74.708	187.708
76.092	185.299
76.988	174.530
78.046	173.321
78.779	163.749
80.000	160.546];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'GangWils2004';
comment.tW = 'GangWils2004 gives time only as days before fledging; tx was assumed to hold, Wwb was added';
  
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
D2 = 'Long tp cannot be captured by std model';
D3 = 'Body temperature is guessed';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4PWL3'; % Cat of Life
metaData.links.id_ITIS = '562560'; % ITIS
metaData.links.id_EoL = '1049493'; % Ency of Life
metaData.links.id_Wiki = 'Pterodroma_pycrofti'; % Wikipedia
metaData.links.id_ADW = 'Pterodroma_pycrofti'; % ADW
metaData.links.id_Taxo = '51555'; % Taxonomicon
metaData.links.id_WoRMS = '343982'; % WoRMS
metaData.links.id_avibase = '3786AD4E1A186AC1'; % avibase
metaData.links.id_birdlife = 'pycrofts-petrel-pterodroma-pycrofti'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterodroma_pycrofti}}';
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
bibkey = 'GangWils2004'; type = 'Article'; bib = [ ... 
'author = {B. Gangloff and K.-J. Wilson}, ' ... 
'year = {2004}, ' ...
'title = {Feeding frequency, meal size and chick growth in {P}ycroft''s petrel (\emph{Pterodroma pycrofti}): preparing for chick translocations in \emph{Pterodroma} species}, ' ...
'journal = {Notornis}, ' ...
'volume = {51}, ' ...
'pages = {26-32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pterodroma_hypoleuca}}';
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

