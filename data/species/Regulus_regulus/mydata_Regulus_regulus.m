function [data, auxData, metaData, txtData, weights] = mydata_Regulus_regulus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Regulidae';
metaData.species    = 'Regulus_regulus'; 
metaData.species_en = 'Goldcrest'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Cwc', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am';'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 09 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 12 17];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 10];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 10];

%% set data
% zero-variate data

data.ab = 13;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 16.5;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Thal1990';   
  temp.tx = C2K(41.6);   units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 49.5;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);   units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;         units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6);   units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 7*365;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.8;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Thal1990';
data.Wwi = 10;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Thal1990';
  comment.Wwi = 'asymptotic weight of nestling; adult weight is 7 g in the field';

data.Ri  = 11*2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.6);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Second broods are common; 7-12 eggs/clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
2.024	0.768
3.102	0.952
4.095	1.080
5.059	1.207
6.078	1.252
7.099	1.380
8.057	2.311
9.100	4.214
10.206	5.341
11.216	6.107
12.182	6.289
13.182	6.667
14.176	6.878
15.139	6.949
16.142	7.437
17.178	8.120
18.215	7.805
19.226	7.600
20.199	7.035
21.256	6.443
22.239	6.210
23.256	6.199
24.272	6.161
25.320	6.262
26.481	6.364
28.348	6.424];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'Thal1990'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Thal1990';

data.tW1 = [ ... % time since birth (d), wet weight (g)
 1	0.585
 2	0.997
 3	1.398
 4	1.753
 5	2.510
 6	3.186
 7	4.092
 8	4.666
 9	5.331
10	5.766
11	6.328
12	6.534
13	6.866
14	6.854
15	7.002
16	6.944];
data.tW1(:,1) = data.tW1(:,1) - 1; % set origin at birth
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'Haft1978'};  
temp.tW1    = C2K(41.6);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'Haft1978';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = weights.tW1 * 2;
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

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data from Thal1990, Haft1978'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'tW data suggests varying food availebility, which has been implemented';
D2 = 'mod_1: tW1 data added';
D3 = 'mod_2: v is reduced';
D4 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '78SHD'; % Cat of Life
metaData.links.id_ITIS = '711744'; % ITIS
metaData.links.id_EoL = '45513685'; % Ency of Life
metaData.links.id_Wiki = 'Regulus_regulus'; % Wikipedia
metaData.links.id_ADW = 'Regulus_regulus'; % ADW
metaData.links.id_Taxo = '57355'; % Taxonomicon
metaData.links.id_WoRMS = '558583'; % WoRMS
metaData.links.id_avibase = 'A7CC62D6BD333F25'; % avibase
metaData.links.id_birdlife = 'goldcrest-regulus-regulus'; % birdlife
metaData.links.id_AnAge = 'Regulus_regulus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Regulus_regulus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Regulus_regulus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Thal1990'; type = 'Book'; bib = [ ...  
'title = {Die Goldh\"{a}hnchen \emph{Regulus regulus}, \emph{R. ignicapillus}}, ' ...
'publisher = {A. Ziemsen Verlag}, ' ...
'year = {1990}, ' ...
'author = {Thaler, E.}, ' ...
'volume = {597}, ' ...
'series = {Die Neue Brehm B\"{u}cherei}, ' ...
'address = {Wittenberg Lutherstadt}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haft1978'; type = 'Book'; bib = [ ...  
'title = {Weight Increase and Feather Development in the Goldcrest \emph{Regulus regulus}}, ' ...
'journal = {Ornis Scandinavica (Scandinavian Journal of Ornithology)}, ' ...
'year = {1978}, ' ...
'author = {Svein Haftorn}, ' ...
'volume = {9(2)}, ' ...
'pages = {117-123}'];
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

