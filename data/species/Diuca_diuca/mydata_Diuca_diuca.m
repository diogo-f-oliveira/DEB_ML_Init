function [data, auxData, metaData, txtData, weights] = mydata_Diuca_diuca
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Thraupidae';
metaData.species    = 'Diuca_diuca'; 
metaData.species_en = 'Diuca finch'; 

metaData.ecoCode.climate = {'BWk','BSk','Cfb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tnpf', 'Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 12];

%% set data
% zero-variate data

data.ab = 13.6;   units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'CookRich2021';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 9.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'CookRich2021';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 28.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 4.8*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'avibase';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 3.6; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';     bibkey.Ww0 = 'CookRich2021';
data.Wwb = 2.7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'CookRich2021';
data.Wwi = 36.8;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'CookRich2021';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-4 eggs per clutch; assumed 1 clutch per yr';

% uni-variate data
% time-weight
data.tW = [ % time since birth (d), wet weight  (g)
0.000	2.520
0.001	3.228
0.455	4.409
0.456	3.465
0.502	2.913
0.972	5.354
1.003	4.016
1.004	4.724
1.004	5.984
1.488	4.331
1.489	5.197
1.489	5.906
1.489	6.614
1.989	3.858
1.989	5.118
1.989	5.433
1.990	6.220
1.990	6.850
1.990	8.346
1.991	9.449
2.006	7.638
2.428	5.984
2.490	6.535
2.491	7.480
2.491	8.740
2.492	9.528
2.976	7.717
2.977	10.079
2.977	10.394
2.978	13.543
2.991	7.165
2.992	8.504
2.992	9.134
2.993	11.181
3.022	6.299
3.492	7.402
3.493	8.504
3.493	10.079
3.494	10.709
3.494	11.417
3.494	12.598
3.495	13.543
3.496	16.378
3.949	14.803
3.993	8.425
3.994	9.055
3.994	10.551
3.994	11.339
3.995	12.283
3.995	12.913
3.996	14.094
3.996	16.142
4.495	11.339
4.496	12.441
4.497	14.882
4.497	15.433
4.497	16.220
4.497	17.244
4.966	13.858
4.981	14.488
4.982	15.118
4.982	15.748
4.982	16.457
4.982	17.008
4.996	11.654
4.997	12.913
5.014	18.661
5.466	13.307
5.467	14.567
5.469	19.528
5.498	15.591
5.500	20.157
5.984	18.189
5.985	18.661
5.999	15.591
5.999	16.693
6.000	17.638
6.001	21.417
6.016	19.370
6.016	19.843
6.485	18.583
6.502	22.126
6.503	23.937
6.503	24.567
6.517	20.472
6.988	23.858
7.001	16.693
7.001	17.874
7.002	18.583
7.002	20.472
7.003	21.654
7.003	22.992
7.003	23.228
7.487	19.528
7.487	20.157
7.487	20.709
7.504	23.228
7.505	24.567
7.506	27.165
7.974	23.465
7.974	24.331
8.005	22.520
8.006	25.827
8.492	28.819
8.492	29.606
8.505	21.260
8.507	26.772
8.507	27.559
9.006	22.520
9.008	26.457
9.507	22.992
9.508	24.646
10.025	26.457
11.011	27.638];
for i=2:size(data.tW,1); if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-4;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Mari2011'; 
  
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
D1 = 'Males are assumed not to differ from females';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '36ZKR'; % Cat of Life
metaData.links.id_ITIS = '559800'; % ITIS
metaData.links.id_EoL = '1050320'; % Ency of Life
metaData.links.id_Wiki = 'Diuca_diuca'; % Wikipedia
metaData.links.id_ADW = 'Diuca_diuca'; % ADW
metaData.links.id_Taxo = '58044'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '4DF5197A4AFE1A08'; % avibase
metaData.links.id_birdlife = 'common-diuca-finch-diuca-diuca'; % birdlife
metaData.links.id_AnAge = 'Diuca_diuca'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diuca_diuca}}';
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
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Diuca_diuca}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=4DF5197A4AFE1A08&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CookRich2021'; type = 'misc'; bib = [ ... 
'doi = {10.2173/bow.codfin1.01.1}, ' ...
'author = {Cookson, M. and C. H. Richart and K. J. Burns}, ' ... 
'year = {2021}, ' ...
'title =  {Diuca Finch (\emph{Diuca diuca}), version 1.1. In Birds of the World (T. S. Schulenberg, Editor). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mari2011'; type = 'article'; bib = [ ... 
'author = {Marin, M.}, ' ... 
'year = {2011}, ' ...
'title =  {Sobre la biología reproductiva de la diuca (\emph{Diuca diuca}) en {C}hile central}, ' ...
'journal = {Ornithología Neotropical}, ', ...
'volume = {22}, ' ...
'pages = {369-378}'];
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

