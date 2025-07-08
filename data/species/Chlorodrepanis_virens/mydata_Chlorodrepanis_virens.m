function [data, auxData, metaData, txtData, weights] = mydata_Chlorodrepanis_virens
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Fringillidae';
metaData.species    = 'Chlorodrepanis_virens'; 
metaData.species_en = 'Hawai''i ''amakihi'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TOh'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHn', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2022 09 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 11];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 11];

%% set data
% zero-variate data

data.ab = 14;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 20;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'KuehKuhn1996';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 60;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.3;      units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KuehKuhn1996';
data.Wwi = 12;       units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'KuehKuhn1996';
 
data.Ri  = 2.5*1.5/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.5 eggs per clutch, 1.5 clutches per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.938	1.466
1.932	1.726
2.925	2.010
3.919	2.578
4.913	3.240
5.907	3.902
7.025	4.753
8.019	5.628
8.950	6.432
9.944	7.236
10.876	8.041
11.932	8.703
13.050	9.365
14.043	9.956
14.975	10.618
15.907	10.902
17.087	11.257
18.019	11.943
19.075	13.078
19.882	10.997
21.000	11.068
21.932	11.186
22.863	11.115
23.981	11.375
24.913	11.399
26.155	11.470
27.025	11.446
28.019	11.541
29.012	11.375
30.068	11.706];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'KuehKuhn1996';
%
data.tW1 = [ ... % time since birth (d), wet weight (g)
 0	 1.319  1.409
 1	 2.495  2.146
 2	 3.758  2.824
 3	 4.320  3.473
 4	 6.021  4.620
 5	 6.729  5.912
 6	 8.255  7.088
 7	10.161  7.941
 8	11.103  9.321
 9	11.839  9.824
10	12.957 10.795
11	13.314 11.356
12	12.998 12.269
13	12.653 13.006
14  NaN    12.515
15  NaN    12.462];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(41.6);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'KuehKuhn1996'; treat.tW1 = {1, {'2 nestlings', '3 nestlings'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = weights.tW1 * 2;
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;
weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: tW1 data added with different feeding levels';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '5XY79'; % Cat of Life
metaData.links.id_ITIS = '997800'; % ITIS
metaData.links.id_EoL = '45510329'; % Ency of Life
metaData.links.id_Wiki = 'Chlorodrepanis_virens'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5312617'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'ABB15738E3BBDEE6'; % avibase
metaData.links.id_birdlife = 'hawaii-amakihi-chlorodrepanis-virens'; % birdlife
metaData.links.id_AnAge = 'Chlorodrepanis_virens'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chlorodrepanis_virens}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Chlorodrepanis_virens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KuehKuhn1996'; type = 'Article'; bib = [ ... 
'author = {C. Kuehler and M. Kuhn and J. E. Kuhn and A. Lieberman and N. Harvey and B. Rideout}, ' ... 
'year = {1996}, ' ...
'title = {Artificial incubation, hand-rearing, and release of common ''Amakihi (\emph{Hemignathus virens virens}): Surrogate research for restoration of endangered {H}awaiian forest birds}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {15}, ' ...
'pages = {541--553}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ripe1987'; type = 'Article'; bib = [ ... 
'author = {Charles van Riper}, ' ... 
'year = {1987}, ' ...
'title = {BREEDING ECOLOGY OF THE {H}AWAII COMMON AMAISIHI}, ' ...
'journal = {The Condor}, ' ...
'volume = {89}, ' ...
'pages = {185-102}']; 
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

