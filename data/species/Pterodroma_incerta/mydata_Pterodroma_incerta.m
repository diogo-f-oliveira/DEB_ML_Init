function [data, auxData, metaData, txtData, weights] = mydata_Pterodroma_incerta

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Pterodroma_incerta'; 
metaData.species_en = 'Atlantic petrel'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAS'};
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

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 19];              
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

data.ab = 55.5;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Cuth2004';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 138; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Cuth2004';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 414; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 30*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 70; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Cuth2004';
  comment.Wwb = 'Data derived from tW';
data.Wwi = 750; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Cuth2004';
  comment.Wwi = 'asymptote for nestling; mean adult weight is lower: 544.4 g';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.224	69.412
3.541	131.593
6.439	166.367
10.979	171.957
14.695	177.527
18.823	183.107
22.551	239.819
26.273	269.133
31.023	287.513
34.326	296.726
38.455	305.959
44.858	331.686
48.780	337.261
52.293	359.264
57.659	364.874
63.039	423.453
66.557	465.548
71.913	430.975
74.814	482.187
78.734	478.630
84.929	500.698
89.270	530.028
96.902	524.734
101.030	528.488
104.340	563.272
108.896	627.309
112.802	574.437
118.378	591.011
125.189	600.309
129.326	642.419
134.905	671.778
139.248	712.067
147.072	650.157];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Cuth2004';
  
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

%% Links
metaData.links.id_CoL = '4PWKN'; % Cat of Life
metaData.links.id_ITIS = '174586'; % ITIS
metaData.links.id_EoL = '45512118'; % Ency of Life
metaData.links.id_Wiki = 'Pterodroma_incerta'; % Wikipedia
metaData.links.id_ADW = 'Pterodroma_incerta'; % ADW
metaData.links.id_Taxo = '51539'; % Taxonomicon
metaData.links.id_WoRMS = '212641'; % WoRMS
metaData.links.id_avibase = '23865D2512972A80'; % avibase
metaData.links.id_birdlife = 'atlantic-petrel-pterodroma-incerta'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterodroma_hypoleuca}}';
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
bibkey = 'Cuth2004'; type = 'Article'; bib = [ ... 
'author = {Cuthbert, R.}, ' ... 
'doi = {10.1071/mu03037}, ' ...
'year = {2004}, ' ...
'title = {Breeding biology of the {A}tlantic Petrel, \emph{Pterodroma incerta}, and a population estimate of this and other burrowing petrels on {G}ough {I}sland, {S}outh {A}tlantic {O}cean}, ' ...
'journal = {Emu - Austral Ornithology} , ' ... 
'volume = {104}, ' ...
'number = {3}, ' ...
'pages = {221-228}'];
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

