function [data, auxData, metaData, txtData, weights] = mydata_Tachycineta_stolzmanni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Hirundinidae';
metaData.species    = 'Tachycineta_stolzmanni'; 
metaData.species_en = 'Tumbes swallow'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tncf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 18];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};  

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 16.5;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'StagLopr2012';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '15 to 18 d';
data.tx = 29;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'StagLopr2012';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '26 to 32 d';
data.tp = 87;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '26 to 32 d';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 9.1*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 1.3;   units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'StagLopr2012';
data.Wwb = 1.1;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'StagLopr2012';
data.Wwi = 16.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 2*2.68/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'StagLopr2012';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.68 eggs per clutch, 1-4 clutches per yr';
 
% uni-variate data
% time - weight
data.tW = [ ...
2.769	3.935
2.808	3.478
2.808	3.317
2.808	3.237
2.808	3.156
2.808	3.048
2.808	3.048
2.808	3.048
2.808	2.941
2.808	2.914
2.808	2.833
2.808	2.403
2.808	2.188
2.808	1.973
2.808	1.973
2.808	1.973
2.846	2.591
2.846	1.651
2.885	1.758
5.808	4.258
5.808	4.177
5.808	3.801
5.808	3.694
5.846	7.242
5.846	6.624
5.846	6.462
5.846	6.194
5.846	6.059
5.846	5.978
5.846	5.871
5.846	5.737
5.846	5.737
5.846	5.602
5.846	5.602
5.846	5.495
5.846	5.360
5.846	5.199
5.846	4.876
5.846	4.823
5.846	4.688
5.846	4.634
5.885	4.984
8.808	10.038
8.808	9.258
8.808	9.043
8.808	8.882
8.808	8.801
8.808	8.747
8.808	8.667
8.808	8.667
8.808	8.505
8.808	8.425
8.808	7.806
8.846	8.210
8.846	6.866
8.846	6.812
8.846	5.226
8.885	9.608
8.885	7.591
8.885	7.511
8.885	7.376
8.885	7.349
8.885	7.242
8.923	7.000
11.846	7.242
11.846	10.522
11.846	10.522
11.846	10.790
11.846	10.952
11.846	11.032
11.846	11.032
11.846	11.247
11.846	11.301
11.846	11.435
11.846	11.435
11.885	8.774
11.885	9.258
11.885	9.715
11.885	9.876
11.885	9.930
11.885	10.038
11.885	10.253
11.885	10.360
11.885	11.946
11.923	12.296];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-4;end;end
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'StagLopr2012';

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
D1 = 'Body temperature is guessed, food availability varied';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '54CBH'; % Cat of Life
metaData.links.id_ITIS = '563266'; % ITIS
metaData.links.id_EoL = '45513367'; % Ency of Life
metaData.links.id_Wiki = 'Tachycineta_stolzmanni'; % Wikipedia
metaData.links.id_ADW = 'Tachycineta_stolzmanni'; % ADW
metaData.links.id_Taxo = '604014'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '3ADA18E5D24A2DD1'; % avibase
metaData.links.id_birdlife = 'tumbes-swallow-tachycineta-stolzmanni'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tachycineta_stolzmanni}}';
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
bibkey = 'StagLopr2012'; type = 'Article'; bib = [ ... 
'author = {Maria Stager and Eric Lopresti and Fernando Angulo Pratolongo and Daniel R. Ardia and Daniel Caceres and Caren B. Cooper and Eduardo E. I\~{n}igo-Elias ans Juan Molina and Nathaniel Taylor and David W. Winkler}, ' ... 
'year = {2012}, ' ...
'title = {REPRODUCTIVE BIOLOGY OF A NARROWLY ENDEMIC \emph{Tachycineta} SWALLOW IN DRY, SEASONAL FOREST IN COASTAL {P}ERU}, ' ...
'journal = {Ornitologia Neotropical}, ' ...
'volume = {23}, ' ...
'pages = {95–112}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=3ADA18E5D24A2DD1&sec=lifehistory}}';
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

