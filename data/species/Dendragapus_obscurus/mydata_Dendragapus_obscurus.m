function [data, auxData, metaData, txtData, weights] = mydata_Dendragapus_obscurus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Dendragapus_obscurus'; 
metaData.species_en = 'Dusky grouse'; 

metaData.ecoCode.climate = {'BSk', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 21];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 21];

%% set data
% zero-variate data

data.ab = 26;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(32);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 1;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ZwicBend2020';   
  temp.tx = metaData.T_typical; units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 4 * 30.5;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ZwicBend2020';   
  temp.tp = metaData.T_typical; units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'brood organization disintegrates in late summer to automn, and nesting is may-june. So we assume 4 months. Moreover, Postjuvenile plumage complete at about 17 wk.';
data.tR = 365;         units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = metaData.T_typical; units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 14*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = metaData.T_typical; units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 22.7;         units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ZwicBend2020';
data.Wwi = 1271;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ZwicBend2020';
comment.Wwi = 'reported mean mass of males which might not differ a lot from females. Adult female mass increases in early spring, declines during incubation, and slowly recovers over summer.';
data.Ri  = 8/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = metaData.T_typical; units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.752	25.605
1.759	28.120
2.042	25.543
2.185	25.536
2.902	25.501
3.189	25.488
4.049	25.446
5.056	27.962
6.207	30.471
6.927	33.000
8.078	35.509
9.089	40.589
10.239	43.097
11.101	44.338
11.967	48.143
12.974	50.658
14.268	53.160
15.016	74.919
16.167	77.428
16.731	70.990
18.310	72.197
18.918	96.526
19.914	91.350
21.213	97.698
21.967	123.303
22.827	123.261
24.869	147.522
26.001	137.211
28.018	143.525
28.925	176.814
29.923	172.920
39.720	305.783
41.067	245.461
42.859	295.375
45.688	368.316
49.093	443.794
50.049	410.414
52.014	380.833
53.050	403.860
54.951	529.409
55.805	525.522
57.652	513.895
59.075	306.134
60.874	461.176
67.153	540.361
71.242	492.729];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = metaData.T_typical;  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Redf1978';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.ab = weights.ab * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Feeding is reduced just after hatching';
D2 = 'Body temperature is guessed';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '34LXB'; % Cat of Life
metaData.links.id_ITIS = '175860'; % ITIS
metaData.links.id_EoL = '45510628'; % Ency of Life
metaData.links.id_Wiki = 'Dendragapus_obscurus'; % Wikipedia
metaData.links.id_ADW = 'Dendragapus_obscurus'; % ADW
metaData.links.id_Taxo = '52942'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'A55D83A9520AA6DA'; % avibase
metaData.links.id_birdlife = 'dusky-grouse-dendragapus-obscurus'; % birdlife
metaData.links.id_AnAge = 'Dendragapus_obscurus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dendragapus_obscurus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dendragapus_obscurus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Redf1978'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1474-919X.1978.tb04998.x}, ' ...
'title = {GROWTH OF JUVENILE BLUE GROUSE \emph{Dendragapus obscurus}}, ' ...
'journal = {Ibis}, ' ...
'year = {1978}, ' ...
'author = {J. A. Redfield}, ' ...
'volume = {120}, ' ...
'pages = {55--61}'];
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
%
bibkey = 'ZwicBend2020'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Zwickel, F. C. and J. F. Bendell}, ' ...
'year = {2020}, ' ...
'title  = {Dusky Grouse (\emph{Dendragapus obscurus}), version 1.0.}, ' ...
'booktitle = {Birds of the World }, ' ...
'publisher = {Cornell Lab of Ornithology}, ' ...
'address = {Ithaca, NY, USA}, ' ...
'doi = {10.2173/bow.dusgro.01}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
