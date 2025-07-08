function [data, auxData, metaData, txtData, weights] = mydata_Stellifer_lanceolatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Stellifer_lanceolatus'; 
metaData.species_en = 'American stardrum'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.9); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author         = {'Bas Kooijman'};    
metaData.date_subm      = [2019 04 26];              
metaData.email          = {'bas.kooijman@vu.nl'};            
metaData.address        = {'VU University Amsterdam'};   

metaData.curator        = {'Starrlight Augustine'};
metaData.email_cur      = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc       = [2019 04 26];

%% set data
% zero-variate data

data.tp = 1.64*365; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'RamoBeja2009';   
  temp.tp = C2K(23.9); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 43*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(23.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9.2;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'RamoBeja2009';
data.Li  = 20;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 5.3e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';

data.Ri = 1.9e4/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(23.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.90';
 
% uni-variate data
% time-length data
data.tL = [ ... % yr class (yr), total length (cm)
528.878	3.850
551.224	4.706
625.714	6.160
656.752	5.989
689.031	6.417
710.136	6.674
746.139	6.930
730+43.452	6.930
730+69.524	8.043
730+111.735	8.385
730+134.082	8.642
730+160.153	8.642
730+188.707	9.070
730+223.469	9.412
730+259.473	9.583
730+290.510	9.754
730+324.031	10.096
730+342.653	10.353
730+382.381	10.353
730+412.177	10.781
730+438.248	10.866
730+480.459	11.551
730+501.565	11.807
730+528.878	12.150
730+552.466	12.150
730+593.435	12.492
730+624.473	12.492
730+656.752	12.492
730+690.272	12.749
730+710.136	12.920
730+746.139	13.176
1460+69.524	13.604
1460+115.459	13.861
1460+163.878	14.203
1460+260.714	14.631
1460+346.378	14.717
1460+413.418	15.059
1460+440.731	15.230
1460+500.323	15.487
1460+590.952	15.914];
data.tL(:,1) = data.tL(:,1) - 335; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(23.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RamoBeja2009';
comment.tL = 'From length-frequency data';


% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
1.019	0.466
1.441	0.466
1.898	0.700
2.074	0.466
2.214	0.700
2.496	0.700
2.531	0.700
2.707	0.700
2.882	0.933
3.058	0.700
3.269	1.166
3.550	1.166
3.866	1.399
3.937	1.166
4.253	0.233
4.323	1.866
4.323	1.399
4.956	2.566
4.956	1.633
4.991	2.799
5.308	0.933
5.448	2.332
5.624	2.099
5.729	2.332
5.800	2.566
6.011	2.799
6.221	3.732
6.221	2.799
6.397	2.799
6.503	3.732
6.678	2.099
6.854	4.198
6.995	5.364
7.030	4.431
7.030	2.799
7.065	2.799
7.170	5.131
7.346	5.598
7.346	4.898
7.346	4.898
7.417	6.297
7.592	4.198
7.768	5.598
7.838	7.230
7.838	4.665
8.049	7.464
8.120	4.898
8.190	6.531
8.225	7.697
8.295	5.364
8.366	9.563
8.471	5.364
8.541	5.831
8.541	7.464
8.647	5.131
8.717	9.329
8.787	10.496
8.787	5.364
8.858	9.096
8.963	7.930
8.998	6.531
9.069	10.496
9.139	9.796
9.174	11.195
9.315	5.598
9.315	8.163
9.350	11.195
9.385	8.163
9.455	7.464
9.455	9.329
9.490	6.531
9.525	5.598
9.561	13.761
9.596	12.362
9.631	13.061
9.631	13.294
9.631	11.429
9.631	9.329
9.631	5.598
9.701	11.895
9.807	13.761
9.807	8.397
10.018	9.329
10.018	14.461
10.053	13.061
10.088	17.493
10.123	11.195
10.123	8.397
10.228	13.994
10.299	13.294
10.334	14.461
10.334	9.796
10.404	11.429
10.439	15.160
10.439	14.694
10.510	18.192
10.510	13.061
10.580	15.860
10.615	17.259
10.615	15.627
10.826	12.362
10.861	14.927
10.861	11.429
10.931	14.461
10.967	16.560
11.002	18.892
11.002	22.391
11.002	15.627
11.002	13.761
11.072	17.726
11.107	18.426
11.178	17.026
11.213	20.991
11.283	19.825
11.283	15.394
11.283	16.793
11.318	20.991
11.424	16.327
11.459	22.157
11.459	19.125
11.459	19.592
11.459	14.927
11.564	14.927
11.599	21.224
11.599	19.825
11.599	18.659
11.810	15.394
11.916	17.726
11.986	19.592
12.021	21.691
12.021	25.889
12.056	23.324
12.056	24.956
12.091	17.493
12.127	23.790
12.162	27.988
12.197	20.525
12.267	19.592
12.267	24.956
12.302	19.825
12.337	23.324
12.478	20.292
12.513	26.822
12.548	25.190
12.548	24.490
12.654	19.825
12.689	27.055
12.689	23.324
12.759	21.458
12.830	24.956
12.865	26.122
12.865	23.324
12.970	30.087
12.970	27.988
13.111	21.924
13.111	24.257
13.146	30.787
13.181	25.889
13.216	27.055
13.216	28.688
13.216	29.388
13.251	25.190
13.322	27.055
13.392	37.318
13.462	30.787
13.462	29.854
13.462	29.155
13.497	32.187
13.533	36.385
13.533	27.055
13.743	35.918
13.814	32.886
13.849	34.985
13.884	31.720
13.884	30.554
13.919	37.085
13.954	33.586
13.954	29.621
14.025	36.851
14.060	35.219
14.095	31.020
14.130	38.251
14.271	40.816
14.376	34.052
14.517	42.216
14.517	37.318
14.587	39.650
14.587	34.519
14.622	41.516
14.798	47.580
14.833	41.050
14.938	39.184
14.974	48.746
14.974	41.983
15.079	39.184
15.185	43.848
17.012	59.475
17.188	68.805
17.504	76.035
17.996	69.738];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'RamoBeja2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '4ZS5P'; % Cat of Life
metaData.links.id_ITIS = '169292'; % ITIS
metaData.links.id_EoL = '46579062'; % Ency of Life
metaData.links.id_Wiki = 'Stellifer'; % Wikipedia
metaData.links.id_ADW = 'Stellifer_lanceolatus'; % ADW
metaData.links.id_Taxo = '188137'; % Taxonomicon
metaData.links.id_WoRMS = '159337'; % WoRMS
metaData.links.id_fishbase = 'Stellifer-lanceolatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stellifer_lanceolatus}}';
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
bibkey = 'RamoBeja2009'; type = 'Article'; bib = [ ... 
'doi = {10.7773/cm.v35i3.1542}, ' ...
'author = {J. Ramos-Miranda and K. Bejarano-Hau and D. Flores-Hern\''{a}ndez and L. A. Ayala-P\''{e}rez}, ' ... 
'year = {2009}, ' ...
'title = {Growth, mortality, maturity, and recruitment of the star drum (\emph{Stellifer lanceolatus}) in the southern {G}ulf of {M}exico}, ' ...
'journal = {Ciencias Marinas}, ' ...
'volume = {35}, ' ...
'pages = {245-257}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Stellifer-lanceolatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

