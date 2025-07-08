function [data, auxData, metaData, txtData, weights] = mydata_Pica_pica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Corvidae';
metaData.species    = 'Pica_pica'; 
metaData.species_en = 'Eurasian magpie'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'THp', 'TPi'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 08];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 21;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from Cuculus canoris';
data.tx = 28;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SoleSole1991';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 84;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 21.7*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 7;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SoleSole1991';
data.Wwi = 185;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'SoleSole1991';

data.Ri  = 6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Data for Pica hudsonia';
 
% uni-variate data
% time-weight
data.tW = [ ...
1.021	8.532
1.921	18.513
3.002	27.045
3.963	37.740
4.923	36.233
6.064	51.220
6.965	58.330
7.986	68.302
8.946	65.360
9.967	71.026
10.928	93.921
11.888	99.591
12.969	121.760
13.990	125.990
14.890	133.818
16.031	139.475
16.932	142.279
17.892	143.643
18.853	158.644
19.874	147.802
20.954	164.947
21.915	173.488
22.936	173.412
23.957	171.183
24.977	171.825
25.998	173.903
26.899	174.553
27.979	177.344
28.820	169.387];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'no guest'};  
temp.tW   = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SoleSole1991';
comment.tW = 'Data without guest Clamator glandarius';
%
data.tW1 = [ ...
0.964	9.102
2.048	13.240
3.074	27.278
4.097	29.302
4.999	31.337
6.082	31.941
7.044	33.971
8.013	58.615
9.100	74.060
10.005	85.282
11.033	104.973
12.059	116.184
13.023	123.867
14.045	122.357
15.069	130.034
16.091	131.352
17.057	144.688
18.137	136.106
18.976	127.546
20.003	145.117
21.152	166.917
22.054	165.419
23.076	167.443
24.039	170.885
26.020	162.218
26.983	162.834
28.063	157.785
31.072	168.102];
units.tW1  = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'guest: Clamator glandarius'};  
temp.tW1   = C2K(41.6);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'SoleSole1991';
comment.tW1 = 'Data with guest Clamator glandarius';
  
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

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data for unparasitized, parasitized nests'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4HPXM'; % Cat of Life
metaData.links.id_ITIS = '925576'; % ITIS
metaData.links.id_EoL = '45515236'; % Ency of Life
metaData.links.id_Wiki = 'Pica_pica'; % Wikipedia
metaData.links.id_ADW = 'Pica_pica'; % ADW
metaData.links.id_Taxo = '59494'; % Taxonomicon
metaData.links.id_WoRMS = '1458156'; % WoRMS
metaData.links.id_avibase = 'FBBBA943D3AB65E8'; % avibase
metaData.links.id_birdlife = 'eurasian-magpie-pica-pica'; % birdlife
metaData.links.id_AnAge = 'Pica_pica'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pica_pica}}';
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
bibkey = 'SoleSole1991'; type = 'Article'; bib = [ ... 
'author = {M. Soler and J. J. Soler}, ' ... 
'year = {1991}, ' ...
'title = {GROWTH AND DEVELOPMENT OF GREAT SPOTTED CUCKOOS AND THEIR MAGPIE HOST}, ' ...
'journal = {The Condor}, ' ...
'volume = {93}, ' ...
'pages = {49--54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Pica_hudsonia/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pica_pica}}';
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

