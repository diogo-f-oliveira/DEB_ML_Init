function [data, auxData, metaData, txtData, weights] = mydata_Xolmis_pyrope
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Tyrannidae';
metaData.species    = 'Xolmis_pyrope'; 
metaData.species_en = 'Fire-eyed diucon'; 

metaData.ecoCode.climate = {'BWk','Csb','Cfb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTi'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCii', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab', 'ap', 'aR', 'am', 'Wwb', 'Wwi', 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 22];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 07];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 07];

%% set data
% zero-variate data

data.ab = 18;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Mari2013';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '14-15 d';
data.tx = 15;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Mari2013';
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 45;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';   
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 8*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.0;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Mari2013';
data.Wwi = 37;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'Mari2013';

data.Ri  = 2.4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per year';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.020	2.770
0.021	3.585
0.480	4.720
0.499	3.497
0.997	6.099
1.035	3.980
1.035	4.469
1.035	5.121
1.054	3.654
1.533	5.115
1.533	5.766
1.992	5.435
2.012	7.064
2.012	7.879
2.012	8.694
2.030	6.412
2.452	8.200
2.509	7.140
2.950	10.068
3.007	9.334
3.025	7.216
3.026	7.704
3.026	8.519
3.486	10.387
3.505	9.735
3.525	11.446
3.525	12.505
3.542	8.350
4.003	12.255
4.003	12.988
4.004	14.618
4.022	10.788
4.022	11.440
4.040	9.974
4.059	9.485
4.444	14.531
4.500	12.412
4.501	12.901
4.519	11.434
4.539	13.389
4.981	16.561
5.017	13.547
5.018	15.013
5.019	15.909
5.019	17.376
5.515	13.215
5.515	14.519
5.516	15.822
5.516	16.392
5.516	17.044
5.517	18.592
6.014	18.749
6.015	19.156
6.015	19.808
6.032	15.653
6.032	16.305
6.033	18.178
6.054	20.704
6.475	21.839
6.493	18.662
6.511	17.521
6.512	19.476
6.512	20.047
6.513	20.780
6.532	21.350
6.972	21.915
6.973	22.648
6.973	23.463
6.990	19.960
6.991	21.019
7.050	25.091
7.507	21.013
7.508	21.990
7.508	22.968
7.509	24.027
7.526	20.361
7.567	24.841
8.005	21.577
8.005	21.984
8.006	24.917
8.007	25.569
8.007	26.872
8.008	27.524
8.008	28.094
8.025	22.717
8.504	26.541
8.505	27.437
8.522	23.608
8.523	24.911
8.523	25.481
8.563	28.414
9.040	25.883
9.040	26.453
9.040	27.105
9.041	27.594
9.041	28.490
9.041	29.549
9.537	25.225
9.537	25.877
9.537	26.203
9.537	26.855
9.538	27.343
9.538	27.832
9.538	28.484
9.539	29.136
9.539	30.032
9.559	31.987
9.997	27.908
9.997	28.560
9.998	29.212
9.998	30.026
10.000	34.507
10.034	25.219
10.034	26.360
10.035	26.849
10.037	31.085
10.037	31.492
10.514	29.939
10.515	30.672
10.551	25.947
10.552	28.961
11.030	28.467
11.030	28.955
11.031	29.526
11.031	30.096
11.032	32.458
11.034	37.591
11.050	30.910
11.528	29.764
11.528	30.497
11.548	31.719
11.566	28.786
12.025	30.084
12.026	30.899
12.026	31.714
12.027	33.343
12.029	37.416
12.044	28.944
12.044	29.432
12.062	27.803
12.541	29.182
12.561	30.404
12.561	31.137
12.562	32.522
13.000	29.421
13.020	31.050
13.021	31.865
13.021	32.354
13.021	32.924
13.041	33.657
13.041	34.798
13.043	38.382
13.058	30.154
13.076	28.524
13.537	31.370
13.555	30.229
13.556	30.555
14.015	30.631
14.033	29.409
14.033	30.061
14.035	33.320
14.052	28.757
14.515	37.876
14.550	29.403
14.551	31.358
14.551	33.314
14.989	28.991
15.008	27.850
15.029	31.597
15.046	26.872
15.066	29.886];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-4;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Mari2013';
  
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
D1 = 'Feeding is reduced just before fledge';
D2 = 'mod_1: v is reduced';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '5CGDR'; % Cat of Life
metaData.links.id_ITIS = '563753'; % ITIS
metaData.links.id_EoL = '45513213'; % Ency of Life
metaData.links.id_Wiki = 'Xolmis_pyrope'; % Wikipedia
metaData.links.id_ADW = 'Xolmis_pyrope'; % ADW
metaData.links.id_Taxo = '80969'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '7161C81196F2F161'; % avibase
metaData.links.id_birdlife = 'fire-eyed-diucon-xolmis-pyrope'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Xolmis_pyrope}}';
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
bibkey = 'Mari2013'; type = 'Article'; bib = [ ... 
'author = {Manuel Mar\''{i}n}, ' ... 
'year = {2013}, ' ...
'title = {HISTORIA NATURAL DEL DIUC\''{o}N (\emph{Xolmis pyrope}) EN {C}HILE CENTRAL, CON \''{e}NFASIS EN SU BIOLOG\''{i}A REPRODUCTIVA}, ' ...
'journal = {Ornitologia Neotropical}, ' ...
'volume = {24}, ' ...
'pages = {345–357}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=7161C81196F2F161&sec=lifehistory}}';
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

