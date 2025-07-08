function [data, auxData, metaData, txtData, weights] = mydata_Melopsittacus_undulatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittaculidae';
metaData.species    = 'Melopsittacus_undulatus'; 
metaData.species_en = 'Budgerigar'; 

metaData.ecoCode.climate = {'BWk', 'BSk'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww';'t-JOe'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 07 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 10 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 26];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 11 09];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 11 09]; 

%% set data
% zero-variate data

data.ab = 19;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 32;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(41);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 32;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 5*30.5;units.tR = 'd';    label.tR = 'time since birth at 1st brood';bibkey.tR = 'Wiki';
  temp.tR = C2K(41);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 21*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 18;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwb = 1.7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'EarlClar1991';
data.Wwi = 50;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EarlClar1991';

data.Ri  = 15/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Anage: 5 egg/clutch, so 3 clutches/yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.000	1.690
1.966	3.956
3.989	6.779
5.946	11.920
7.957	16.413
9.863	21.831
11.968	27.160
13.920	32.951
15.833	37.256
17.895	41.749
19.815	45.034
21.938	47.767
23.874	48.733
25.860	49.793
27.807	49.182
29.802	48.943];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'EarlClar1991';

% time-embryo O2 consumption
data.tJOe = [ ... % age (d), O2 consumption (ml/d)
1.693	1.124
2.510	0.328
2.695	0.970
3.608	1.595
3.670	1.852
4.552	2.348
4.672	1.957
4.886	2.340
5.466	3.361
5.647	2.839
6.443	4.632
6.470	3.725
6.746	4.365
6.782	5.917
7.540	5.640
7.664	6.284
8.703	7.941
8.915	7.806
9.482	13.098
9.523	7.921
9.531	9.991
9.533	10.509
10.546	13.331
10.635	12.940
10.658	10.999
11.437	16.026
11.502	17.318
11.648	15.633
11.691	11.233
11.706	15.114
12.437	15.614
12.476	17.942
12.523	22.081
12.554	14.317
13.443	16.754
13.457	20.247
13.493	21.799
13.497	22.704
13.595	24.643
13.604	19.079
14.573	34.065
14.703	28.498
14.706	21.252
14.805	23.320
14.824	28.365
15.606	34.169
15.630	24.723
15.671	35.203
15.674	28.345
15.691	24.851
15.694	33.261
15.739	29.249
16.444	38.807
16.444	15.516
16.468	29.361
16.484	41.264
16.504	23.020
16.930	38.795
17.464	51.333
17.494	43.439
17.500	37.228
17.519	34.252
17.629	46.930
17.651	36.837
17.676	58.962
17.720	54.561
17.726	56.243
17.909	48.605
17.913	49.510
18.563	52.859
18.578	72.138];
units.tJOe   = {'d', 'ml/d'};  label.tJOe = {'age', 'embryo O_2 consumption'};  
temp.tJOe    = C2K(36);  units.temp.tJOe = 'K'; label.temp.tJOe = 'temperature';
bibkey.tJOe = 'Buch1983';

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
D1 = 'mod_1: tJOe data added; Embryonal reserve mobilisation rate is half that of post-embryonal';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = '10 d: eyes open; 28 d: feathers ';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3ZN3R'; % Cat of Life
metaData.links.id_ITIS = '177597'; % ITIS
metaData.links.id_EoL = '45510805'; % Ency of Life
metaData.links.id_Wiki = 'Melopsittacus_undulatus'; % Wikipedia
metaData.links.id_ADW = 'Melopsittacus_undulatus'; % ADW
metaData.links.id_Taxo = '54299'; % Taxonomicon
metaData.links.id_WoRMS = '1485183'; % WoRMS
metaData.links.id_avibase = 'D17D101A132D3FB2'; % avibase
metaData.links.id_birdlife = 'budgerigar-melopsittacus-undulatus'; % birdlife
metaData.links.id_AnAge = 'Melopsittacus_undulatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Melopsittacus_undulatus}}';
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
bibkey = 'EarlClar1991'; type = 'Article'; bib = [ ... 
'author = {Earle, K. E. and Clarke, N. R.}, ' ... 
'year = {1991}, ' ...
'title = {The Nutrition of the Budgerigar (\emph{Melopsittacus undulatus})}, ' ...
'journal = {Journal of Nutrition}, ' ...
'pages = {S186--S192}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Melopsittacus_undulatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Buch1983'; type = 'Article'; bib = [ ... 
'doi = {10.1086/physzool.56.3.30152612}, ' ...
'author = {Bucher, T. L.}, ' ... 
'year = {1983}, ' ...
'title = {Parrot Eggs, Embryos, and Nestlings: {P}atterns and Energetics of Growth and Development}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {56(3)}, ' ...
'pages = {465–483}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

