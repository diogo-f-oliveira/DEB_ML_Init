function [data, auxData, metaData, txtData, weights] = mydata_Ara_macao

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittacidae';
metaData.species    = 'Ara_macao'; 
metaData.species_en = 'Scarlet macaw'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 03];              
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

data.ab = 26;    units.ab = 'd';    label.ab = 'age at birth';                        bibkey.ab = 'ADW';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '24 till 28 d';
data.tx = 100;    units.tx = 'd';    label.tx = 'time since birth at fledging';        bibkey.tx = 'Figu2014';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 300;    units.tp = 'd';    label.tp = 'time since birth at puberty';        bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3.5*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'ADW';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 33*365;    units.am = 'd';    label.am = 'life span';                       bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 21.0;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'Figu2014';
data.Wwi = 1.2e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';              bibkey.Wwi = 'ADW';

data.Ri = 2.5/365/1.5; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';           bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 till 3 eggs/clutch; breeds once per 1.5 yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
2.730	21.286
8.938	42.572
15.395	58.537
21.353	87.805
27.309	141.020
33.761	199.556
39.469	247.450
45.793	348.559
51.994	436.364
58.068	542.794
64.021	622.616
70.222	713.082
76.301	779.601
82.380	840.798
88.705	928.603
94.410	1005.765
100.738	1064.302
107.085	939.246
112.796	955.211
119.005	968.514];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Figu2014';
comment.tW = 'last three points: change in diet, linked to fledging';
  
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
D1 = 'scaled functional response turned out to vary, which has been implemented';
D2 = 'mod_1: v reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Female breeds, both parents feed young; nest in big hollow Mauritia flexuosa palms';
metaData.bibkey.F1 = {'ADW','Wiki'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'G22D'; % Cat of Life
metaData.links.id_ITIS = '177665'; % ITIS
metaData.links.id_EoL = '45510825'; % Ency of Life
metaData.links.id_Wiki = 'Ara_macao'; % Wikipedia
metaData.links.id_ADW = 'Ara_macao'; % ADW
metaData.links.id_Taxo = '54398'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '5B015EDA14786E2D'; % avibase
metaData.links.id_birdlife = 'scarlet-macaw-ara-macao'; % birdlife
metaData.links.id_AnAge = 'Ara_macao'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ara_macao}}';
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
bibkey = 'Figu2014'; type = 'Article'; bib = [ ... 
'author = {R. R. Figueras}, ' ... 
'year = {2014}, ' ...
'title = {Scarlet macaw \emph{Ara macao cyanoptera} conservation programme in {M}exico}, ' ...
'doi = {10.1111/izy.12049}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {48}, ' ...
'pages = {48--60}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ara_macao}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Ara_macao/}}';
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

