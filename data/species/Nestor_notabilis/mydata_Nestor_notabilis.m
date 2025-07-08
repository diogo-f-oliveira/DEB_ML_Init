function [data, auxData, metaData, txtData, weights] = mydata_Nestor_notabilis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Nestoridae';
metaData.species    = 'Nestor_notabilis'; 
metaData.species_en = 'Kea'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTd'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs', 'biCi', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 18];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 05];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 24.5;    units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'Wool2000';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 45;    units.tx = 'd';    label.tx = 'time since birth at fledging';      bibkey.tx = 'Wool2000';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'start seed feeding at 6.5 wk';
data.tp = 135;    units.tp = 'd';    label.tp = 'time since birth at puberty';      bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'start seed feeding at 6.5 wk';
data.tR = 3*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Wool2000';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'data is uncertain';
data.am = 47*365;    units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 18.7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'Wool2000';
data.Wwi = 922;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'EoL';
  comment.Wwi = 'Wiki: 800 till 1000 g';

data.Ri = 4/365; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';               bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 1 eggs/clutch; breeds once per 2 yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.097	18.728
0.098	21.609
0.904	17.332
1.034	23.101
1.873	21.707
2.002	21.714
2.971	18.887
3.101	27.536
3.908	36.223
4.005	26.146
4.037	36.230
4.974	36.282
5.103	39.170
5.975	29.136
5.976	44.979
6.007	52.183
6.944	49.354
6.945	55.115
7.978	55.173
7.979	66.695
8.010	40.771
8.946	69.630
8.947	75.391
9.948	59.603
9.980	71.127
9.981	78.329
10.917	94.224
10.918	95.665
12.015	100.047
12.016	105.808
12.080	71.243
12.952	117.382
12.953	126.024
13.985	104.477
13.986	133.283
14.017	144.808
14.986	166.466
14.987	177.989
15.826	134.826
15.858	172.276
16.052	183.809
16.988	191.063
16.989	201.145
17.924	178.152
17.925	222.802
17.926	232.884
19.056	270.395
19.088	258.875
19.928	284.847
19.993	312.217
20.089	214.280
20.929	336.754
21.058	395.815
21.801	446.268
21.866	263.349
21.995	388.665
22.932	457.853
23.061	423.292
23.996	371.492
23.997	446.389
23.998	495.361
24.934	550.145
24.966	492.534
25.935	576.126
25.936	470.982
25.968	531.478
26.969	590.587
26.970	603.550
27.001	548.819];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Wool2000';
  
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
D2 = 'Poor fit of growth if scaled functional responds is constant; therefor it is assumed to vary';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '4793F'; % Cat of Life
metaData.links.id_ITIS = '177500'; % ITIS
metaData.links.id_EoL = '45517886'; % Ency of Life
metaData.links.id_Wiki = 'Nestor_notabilis'; % Wikipedia
metaData.links.id_ADW = 'Nestor_notabilis'; % ADW
metaData.links.id_Taxo = '54207'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'D2E2AE57ABAD79F3'; % avibase
metaData.links.id_birdlife = 'kea-nestor-notabilis'; % birdlife
metaData.links.id_AnAge = 'Nestor_notabilis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nestor_notabilis}}';
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
bibkey = 'Wool2000'; type = 'Article'; bib = [ ... 
'author = {D. Woolcock}, ' ... 
'year = {2000}, ' ...
'title = {Husbandry and management of kea \emph{Nestor notabilis} at {Paradise Park, Hayle}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {37}, ' ...
'pages = {146-152}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Nestor_notabilis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1177837/overview}}';
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

