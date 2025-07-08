function [data, auxData, metaData, txtData, weights] = mydata_Gyps_africanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Gyps_africanus'; 
metaData.species_en = 'White-backed vulture'; 

metaData.ecoCode.climate = {'Am', 'BSh', 'Cwb', 'Cwc'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTg', '0iTht'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biSvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 08 07];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 55;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 125;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'arkive';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 375;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1460;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 19.7*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 200;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Tarb2014';
  comment.Wwb = 'egg weight: 220 g';
data.Wwi = 6200; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '4.2 to 7.2 kg';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.770	327.511
2.951	240.175
4.918	360.262
9.176	414.847
9.944	589.520
11.033	502.183
12.784	676.856
15.293	644.105
16.170	829.694
21.530	1353.712
22.728	1255.459
24.152	1484.716
25.350	1375.546
28.955	1517.467
32.460	2117.904
34.315	2106.987
35.954	2161.572
37.161	2478.166
39.680	2893.013
42.407	2783.843
44.157	2969.432
45.573	2838.428
46.563	3220.524
51.046	3580.786
53.774	3569.869
55.523	3668.122
63.280	4061.135
65.246	4137.555
69.079	4716.157
73.986	4519.651
74.635	4268.559];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Hous1976';
comment.tW = 'The values along the ordinate in fig 8 of Hous1976 are strangely non-linear';
  
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

%% Links
metaData.links.id_CoL = '3HXN9'; % Cat of Life
metaData.links.id_ITIS = '560343'; % ITIS
metaData.links.id_EoL = '1047564'; % Ency of Life
metaData.links.id_Wiki = 'Gyps_africanus'; % Wikipedia
metaData.links.id_ADW = 'Gyps_africanus'; % ADW
metaData.links.id_Taxo = '52462'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '0419DDC2F668EEE5'; % avibase
metaData.links.id_birdlife = 'white-backed-vulture-gyps-africanus'; % birdlife
metaData.links.id_AnAge = 'Gyps_africanus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gyps_africanus}}';
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
bibkey = 'Hous1976'; type = 'Article'; bib = [ ... 
'author = {D. C. Houston}, ' ... 
'doi = {10.1111/j.1474-919X.1976.tb02008.x}, ' ...
'year = {1976}, ' ...
'title = {BREEDING OF THE WHITE?BACKED AND R\"{u}PPELL''S GRIFFON VULTURES, \emph{Gyps africanus} AND \emph{G. rueppellii}}, ' ...
'journal = {Ibis}, ' ...
'volume = {118}, ' ...
'pages = {14--40}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Gyps_africanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.arkive.org/white-backed-vulture/gyps-africanus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tarb2014'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {W. Tarboton}, ' ...
'year = {2014}, ' ...
'title  = {Roberts nests and eggs of southern {A}frican birds}, ' ...
'publisher = {Trustees of the John Voelcker Bird Book}, ' ...
'address = {Cape Town}'];
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

