function [data, auxData, metaData, txtData, weights] = mydata_Coturnix_japonica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Coturnix_japonica'; 
metaData.species_en = 'Japanese quail'; 

metaData.ecoCode.climate = {'Dwa', 'Dwb'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-pX'; 't-Wwe'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 07 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 10 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2  = {'Bas Kooijman'};                 
metaData.date_mod_2    = [2022 11 04];                            
metaData.email_mod_2   = {'bas.kooijman@vu.nl'};                  
metaData.address_mod_2 = {'VU University of Amsterdam'};   

metaData.author_mod_2  = {'Starrlight Augustine'};                 
metaData.date_mod_2    = [2023 08 04];                            
metaData.email_mod_2   = {'starrlight@tecnico.ulisboa.pt'};                  
metaData.address_mod_2 = {'IST, univ. Lisboa'};   

metaData.curator   = {'Bas Kooijman'};
metaData.email_cur = {'bas.kooijman@vu.nl'}; 
metaData.date_acc  = [2023 08 04]; 

%% set data
% zero-variate data

data.ab = 21;        units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 3;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 63;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '52 d for males';
  data.tR = 928.01;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = {'BourCast2009','McNa1996'}; 
  temp.tR = C2K(38.17);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'age at first breeding. average body temperature (38.17 C)';
data.am = 6*365;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Ww0 = 8.2; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';          bibkey.Ww0 = 'avibase';
data.Wwb = 6.5;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'thepoultrysite';
data.Wwi = 250;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BoonViss1999';
  comment.Wwi = 'avibase gives 102.25';
data.Wwim = 242;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'guess';
  comment.Wwim = 'avibase gives 93.25';

data.Ri  = 200/300;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'thepoultrysite';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW_fm = [ ... % time since birth (d), wet weight (g)
 2	 13.957  13.079
 5	 22.622  20.708
 8	 36.741  31.608
10	 58.487  59.946
14	 88.936  93.733
18	132.460 128.610
22	152.012 155.858
28	197.681 202.725
35	271.671 256.131
48  310.670 291.008
63	333.286 270.300];
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'wet weight'};  
temp.tW_fm    = C2K(40.7);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm  = 'DietDren1997'; treat.tW_fm = {1, {'females','males'}};
comment.tW_fm = 'temp is guessed';
%
data.tW = [ ... % time since birth (d), wet weight (g)
1.802	14.284
5.988	33.452
6.977	35.226
7.791	40.133
8.837	48.615
9.942	57.543
10.930	65.579
11.860	73.615
12.907	84.333
13.895	93.262
14.942	102.639
15.872	112.911
16.860	121.841
17.907	130.323
18.895	141.041
19.884	150.418
20.872	156.665
21.919	165.146
22.907	172.287
23.895	181.217
25.930	197.287
26.977	206.216
27.849	211.122
28.895	217.368
29.942	220.036
30.930	228.966];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'BoonViss1999';
comment.tW = 'temp is guessed';

% time-energy intake
data.tpX = [ ... % time since birth (d), energy intake (kJ/d)
6.879	177.980
7.940	192.053
8.946	215.232
9.950	216.887
10.958	252.483
12.017	255.795
12.967	270.695
13.915	267.384
14.924	320.364
15.927	307.947
16.987	317.053
17.994	343.543
19.001	375.000
19.944	334.437
20.951	364.238
21.955	360.099
23.019	403.974
27.037	430.464
28.983	384.106
30.041	363.411];
units.tpX   = {'d', 'kJ/d'};  label.tpX = {'time since birth', 'energy intake'};  
temp.tpX    = C2K(40.7);  units.temp.tpX = 'K'; label.temp.tpX = 'temperature';
bibkey.tpX  = 'BoonViss1999';
comment.tpX = 'temp is guessed';

% time-weight fro embryos
data.tWe = [ ... % age (d), yolk-free embryo weight (g)
4.923	0.101
5.874	0.258
6.937	0.576
7.944	0.986
9.007	1.190
9.902	1.967
10.965	2.836
12.028	4.002
12.923	4.642
13.986	5.717
14.937	7.480
16.000	8.142];
units.tWe = {'d', 'g'}; label.tWe = {'age', 'yolk-free embryo weight'};  
temp.tWe = C2K(37.6); units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'DietDren1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tWe = weights.tWe * 2;
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: tW_f, tW_m data added';     
D3 = 'mod_2: tWe data added';  
D4 = 'mod_3: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = 'YYSL'; % Cat of Life
metaData.links.id_ITIS = '176013'; % ITIS
metaData.links.id_EoL = '45515958'; % Ency of Life
metaData.links.id_Wiki = 'Coturnix_japonica'; % Wikipedia
metaData.links.id_ADW = 'Coturnix_japonica'; % ADW
metaData.links.id_Taxo = '70044'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '110CF4251A857B0D'; % avibase
metaData.links.id_birdlife = 'japanese-quail-coturnix-japonica'; % birdlife
metaData.links.id_AnAge = 'Coturnix_japonica'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coturnix_japonica}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Coturnix_japonica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoonViss1999'; type = 'Article'; bib = [ ...  
'title = {Feeding and growth of {J}apanese quail (\emph{Coturnix c. japonica}) chicks with unpredictable food access}, ' ...
'journal = {Netherlands Journal of Zoology}, ' ...
'year = {1999}, ' ...
'author = {Boon, P. and Visser, G. H. and Daan, S.}, ' ...
'volume = {49}, ' ...
'pages = {233-249}, ' ...
'doi = {10.1163/156854299X00164}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DietDren1997'; type = 'Article'; bib = [ ...  
'title = {Effect of Growth Rate and Body Mass on Resting Metabolic Rate in Galliform Chicks}, ' ...
'journal = {Physiological Zoology}, ' ...
'year = {1997}, ' ...
'author = {Dietz, M. W. and Drent, R. H. }, ' ...
'volume = {70(5)}, ' ...
'pages = {493–501}, ' ...
'doi = {10.1086/515858}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'thepoultrysite'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.thepoultrysite.com/articles/607/raising-japanese-quail/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=110CF4251A857B0D&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

