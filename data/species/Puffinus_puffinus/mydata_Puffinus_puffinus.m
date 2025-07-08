function [data, auxData, metaData, txtData, weights] = mydata_Puffinus_puffinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Puffinus_puffinus'; 
metaData.species_en = 'Manx shearwater'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MA', 'MN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 09 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 08 24];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 08 24]; 

%% set data
% zero-variate data

data.ab = 51;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '52 till 58';
data.tx = 74; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Broo1990';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 222; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 5*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 50.9*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 45; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Broo1990';
data.Wwi = 700; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Broo1990';
  comment.Wwi = 'Asymptotic mass prior to fledging, mean adult mass 434 g (AnAge)';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0       45 % added from Wwb
2.723	63.791
3.216	90.037
5.313	92.859
7.578	100.968
7.855	160.022
9.414	172.961
12.213	174.416
12.664	233.562
14.398	246.592
17.364	255.064
17.811	317.673
18.860	318.218
21.821	330.154
22.590	415.454
24.173	409.346
27.318	414.446
27.600	468.306
29.883	462.562
32.136	481.060
32.790	517.786
34.706	525.712
36.976	530.357
37.643	556.694
39.565	559.426
41.833	565.803
42.870	576.738
44.420	596.603
47.213	603.253
48.094	598.513
49.461	625.214
52.269	619.742
52.625	614.730
52.817	600.968
55.398	636.963
57.167	622.289
57.891	603.605
60.381	571.979
62.793	602.688
63.655	613.532
67.925	558.574
68.275	558.756
69.141	566.136
73.781	495.776
74.610	532.593];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Broo1990';
  
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
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4QFY4'; % Cat of Life
metaData.links.id_ITIS = '174555'; % ITIS
metaData.links.id_EoL = '45511311'; % Ency of Life
metaData.links.id_Wiki = 'Puffinus_puffinus'; % Wikipedia
metaData.links.id_ADW = 'Puffinus_puffinus'; % ADW
metaData.links.id_Taxo = '51586'; % Taxonomicon
metaData.links.id_WoRMS = '137203'; % WoRMS
metaData.links.id_avibase = '5AEDC00231A5201C'; % avibase
metaData.links.id_birdlife = 'manx-shearwater-puffinus-puffinus'; % birdlife
metaData.links.id_AnAge = 'Puffinus_puffinus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Puffinus_puffinus}}';
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
bibkey = 'Broo1990'; type = 'Book'; bib = [ ... 
'author = {Brook, M.}, ' ... 
'year = {1990}, ' ...
'title = {The {M}anx shearwater}, ' ...
'publisher = {T \& A. D. Poyser}, ' ...
'address = {London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Puffinus_puffinus}}';
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

