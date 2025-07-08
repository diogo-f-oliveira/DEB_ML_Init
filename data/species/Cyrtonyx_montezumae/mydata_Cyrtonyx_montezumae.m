function [data, auxData, metaData, txtData, weights] = mydata_Cyrtonyx_montezumae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Odontophoridae';
metaData.species    = 'Cyrtonyx_montezumae'; 
metaData.species_en = 'Montezuma quail'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.9); % K, body temp SwanWain1997
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Starrlight Augustine', 'Bas Kooijman'};    
metaData.date_mod_1 = [2023 08 02];              
metaData.email_mod_1    = {'starrlight@tecnico.ulisboa.pt'};            
metaData.address_mod_1  = {'University of Lisbon, Portugal'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 08 02]; 

%% set data
% zero-variate data

data.ab = 25;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(37.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 3;    units.tx = 'd';    label.tx = 'time since birth at fledge'; bibkey.tx = 'guess';
  temp.tx = metaData.T_typical;  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 100;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = metaData.T_typical;  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Colinus virginianus';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at first breeding'; bibkey.tR = 'guess';
  temp.tR = metaData.T_typical;  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 6.4 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = metaData.T_typical;  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Colinus virginianus';
data.Wwb = 7.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LeopMcCa1957';
data.Wwi = 230;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'StromMont2020';
comment.Wwi = 'range 122-230 n = 23';
data.Ri  = 11/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6-12 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [... time since birth (d), wet weight (g)
0.000	7.495
0.249	7.221
0.456	7.924
2.987	8.611
2.994	9.020
3.000	9.362
3.038	12.144
3.227	11.700
3.402	10.369
3.415	11.273
3.435	12.959
5.144	10.270
5.744	11.587
5.753	12.366
5.755	12.481
5.910	9.622
6.283	8.767
9.676	17.107
10.398	12.016
10.404	12.471
10.405	12.587
10.474	20.031
10.663	19.300
14.368	22.798
14.548	20.775
14.595	28.493
14.732	19.466
14.771	25.250
15.728	23.437
16.511	24.778
16.516	25.478
16.543	30.681
16.565	35.599
16.687	21.958
16.762	36.266
21.389	31.230
21.397	33.021
21.414	36.916
21.818	41.267
22.211	42.827
27.101	58.688
27.638	43.589
27.681	58.140
27.692	62.626
28.060	54.983
31.043	92.468
31.579	68.042
31.781	71.941
31.793	78.216
32.381	81.927
39.399	110.160
39.585	104.183
39.795	116.468
39.799	119.761
39.969	102.258
39.980	110.149
40.166	104.172
42.493	106.083
42.496	108.073
42.499	110.100
42.698	114.265
42.709	123.083
46.579	119.617
46.583	122.998
46.594	132.490
46.979	130.042
46.985	134.966
46.993	142.704
50.863	138.686
50.869	143.938
50.880	155.045
51.069	150.778
53.405	162.346
53.769	138.615
53.775	143.864
53.782	150.705
53.788	157.872
57.468	156.310
57.472	160.729
57.673	168.367
64.065	168.176
64.270	181.148
64.656	179.460
64.858	189.743
66.386	163.486
66.398	177.746
66.584	168.101
66.794	187.924
66.961	157.505
73.953	177.508
74.348	185.937
74.355	194.779
74.528	169.432
85.193	182.163
85.588	190.813
85.607	217.323
85.988	207.442
86.176	199.867
90.057	209.228
90.240	194.233
90.609	172.120
90.622	187.133
90.827	201.567
100.708	203.093
101.296	212.729
121.847	236.960
121.852	245.933
122.035	228.306
122.414	215.911
133.276	236.481
133.849	223.634
200.487	216.943
200.495	229.381
200.512	256.439
200.672	205.172
210.956	228.957
211.121	188.363];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = metaData.T_typical;  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'LeopMcCa1957';

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
D1 = 'Food density initially varies';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '33MY9'; % Cat of Life
metaData.links.id_ITIS = '175900'; % ITIS
metaData.links.id_EoL = '45508988'; % Ency of Life
metaData.links.id_Wiki = 'Cyrtonyx_montezumae'; % Wikipedia
metaData.links.id_ADW = 'Cyrtonyx_montezumae'; % ADW
metaData.links.id_Taxo = '52993'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'C5B014E3655668BA'; % avibase
metaData.links.id_birdlife = 'montezuma-quail-cyrtonyx-montezumae'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cyrtonyx_montezumae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=C5B014E3655668BA&sec=lifehistory}}';
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
bibkey = 'LeopMcCa1957'; type = 'article'; bib = [ ... 
'author = {Leopold, A. S. and McCabe, R. A.}, ' ... 
'year = {1957}, ' ...
'title = {Natural history of the {M}ontezuma Quail in {M}exico}, '...
'journal = {The Condor}, ' ...
'volume = {59}, ' ...
'pages = {3-26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StromMont2020'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Mark R. Stromberg and Angel B. Montoya and David Holdermann}, ' ...
'year = {2020}, ' ...
'title  = {Montezuma Quail (\emph{Cyrtonyx montezumae}), version 1.0}, ' ...
'booktitle = {Birds of the World }, ' ...
'publisher = {Cornell Lab of Ornithology}, ' ...
'address = {Ithaca, NY, USA}, ' ...
'doi = {10.2173/bow.monqua.01}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];