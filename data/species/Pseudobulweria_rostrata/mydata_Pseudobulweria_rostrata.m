function [data, auxData, metaData, txtData, weights] = mydata_Pseudobulweria_rostrata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Pseudobulweria_rostrata'; 
metaData.species_en = 'Tahiti petrel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tnsfm', 'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biSic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 55;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'VillDano2006';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '55 to 65 d';
data.tx = 120; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'VillDano2006';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 360; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 61; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'VillDano2006';
data.Wwi = 600; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'VillDano2006';
  comment.Wwi = 'asymptote for nestling; mean adult weight is lower. EoL 409 g';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.761	61.635
7.417	147.050
8.177	197.625
8.557	159.706
8.558	189.729
9.509	147.078
9.889	210.288
10.079	139.185
10.840	273.506
11.410	267.193
11.981	216.636
12.552	268.788
12.932	173.985
13.501	164.512
13.502	281.442
14.643	301.999
15.024	153.471
15.404	271.986
16.735	290.965
17.686	278.337
19.017	268.873
19.968	246.764
20.729	305.239
21.680	287.870
23.582	317.918
37.845	457.157
38.986	360.784
39.746	414.519
40.887	390.832
41.268	446.142
42.599	517.265
43.360	436.688
44.691	479.369
45.832	457.263
46.783	438.314
47.734	490.471
49.445	493.653
55.721	580.643
56.672	558.534
57.433	520.621
58.574	496.934
59.525	558.572
60.666	542.785
61.807	503.297
63.138	569.680
63.518	527.021
64.849	511.238
65.610	495.446
66.941	479.662
68.273	511.283
68.843	576.076
69.414	593.465
85.578	528.892
92.805	568.491
101.553	548.064
108.590	527.615
113.534	513.459
119.620	475.616];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'VillDano2006';
comment.tW = 'Last 5 data points were estimated by VillDano2006';
  
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
D2 = 'Body temperature is guessed';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4NQBV'; % Cat of Life
metaData.links.id_ITIS = '562522'; % ITIS
metaData.links.id_EoL = '45511501'; % Ency of Life
metaData.links.id_Wiki = 'Pseudobulweria_rostrata'; % Wikipedia
metaData.links.id_ADW = 'Pseudobulweria_rostrata'; % ADW
metaData.links.id_Taxo = '169634'; % Taxonomicon
metaData.links.id_WoRMS = '344112'; % WoRMS
metaData.links.id_avibase = 'FCFBB7D9A628EF5D'; % avibase
metaData.links.id_birdlife = 'tahiti-petrel-pseudobulweria-rostrata'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudobulweria_rostrata}}';
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
bibkey = 'VillDano2006'; type = 'Article'; bib = [ ... 
'author = {Villard, P. and Dano, S. and Bretagnolle, V.}, ' ... 
'doi = {10.1111/j.1474-919x.2006.00528.x}, ' ...
'year = {2006}, ' ...
'title = {Morphometrics and the breeding biology of the {T}ahiti Petrel \emph{Pseudobulweria rostrata}}, ' ...
'journal = {Ibis}, ' ...
'volume = {148}, ' ...
'pages = {285-291}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049520/overview}}';
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

