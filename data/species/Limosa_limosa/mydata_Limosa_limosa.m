function [data, auxData, metaData, txtData, weights] = mydata_Limosa_limosa

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Scolopacidae';
metaData.species    = 'Limosa_limosa'; 
metaData.species_en = 'Black-tailed godwit'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTg'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 07 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2022 11 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 25];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 21;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Data for L. lapponica';  
data.tx = 25;      units.tx = 'd';     label.tx = 'time since birth at fledging'; bibkey.tx = 'KentHooi2013';   
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 75;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 23.6*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 25;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KentHooi2013';
data.Wwi = 294;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'AnAge';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr';
  
% uni-variate data
% time-weight 
data.tW = [ ... % time since birth (d), wet weight (g)
0.944	30.086
1.003	22.638
2.117	26.867
2.784	30.397
3.673	41.015
3.894	45.619
3.955	32.143
4.783	54.109
5.725	71.108
5.777	81.391
5.779	75.717
5.797	26.425
5.900	49.118
6.836	81.720
7.022	31.006
7.771	116.095
7.891	94.106
7.895	83.823
7.897	78.504
7.957	66.800
9.906	72.428
10.839	114.604
10.899	101.837
11.843	111.744
11.846	104.297
11.917	63.160
11.920	56.777
12.893	139.378
13.891	154.248
13.910	101.411
15.893	168.385
15.914	113.066
16.842	165.171
16.848	148.505
16.897	167.298
18.837	199.521
19.911	159.780
20.851	181.034
20.908	177.841
21.904	199.449
21.915	168.243
21.916	166.825
22.863	169.994
22.916	175.312
22.925	152.971
24.868	175.265];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'KentHooi2013';

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
D1 = 'mod_1: v is reduced';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '72FCR'; % Cat of Life
metaData.links.id_ITIS = '176691'; % ITIS
metaData.links.id_EoL = '45509183'; % Ency of Life
metaData.links.id_Wiki = 'Limosa_limosa'; % Wikipedia
metaData.links.id_ADW = 'Limosa_limosa'; % ADW
metaData.links.id_Taxo = '53656'; % Taxonomicon
metaData.links.id_WoRMS = '159035'; % WoRMS
metaData.links.id_avibase = '454B5CD5F5285B77'; % avibase
metaData.links.id_birdlife = 'black-tailed-godwit-limosa-limosa'; % birdlife
metaData.links.id_AnAge = 'Limosa_limosa'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Limosa_haemastica}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Limosa_limosa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KentHooi2013'; type = 'Article'; bib = [ ...  
'title = {Intensified agricultural use of grasslands reduces growth and survival of precocial shorebird chicks}, ' ...
'journal = {Journal of Applied Ecology}, ' ...
'year = {2013}, ' ...
'author = {R. Kentie and J. C. E. W. Hooijmeijer and K. B. Trimbos and N. M. Groen and T. Piersma}, ' ...
'volume = {50}, ' ...
'pages = {243-251}'];
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

