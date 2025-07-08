function [data, auxData, metaData, txtData, weights] = mydata_Nyctalus_lasiopterus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Nyctalus_lasiopterus'; 
metaData.species_en = 'Greater noctule bat'; 

metaData.ecoCode.climate = {'BSk', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiCi', 'xiCvb'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 11 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 05]; 

%% set data
% zero-variate data

data.tg = 60;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'guess';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on Nyctalus noctula';
data.tx = 59;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'EoL';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 90;    units.tp = 'd';    label.tp = 'time since birth at puberty female'; bibkey.tp = 'guess';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Nyctalus noctula';
data.am = 12*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Nyctalus noctula';

data.Wwb = 8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Mead1972';
data.Wwi = 76;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'Wiki';

data.Ri  = 2*1.2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'Mead1972';   
  temp.Ri = C2K(36);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 till 2 pup per litter; 1 litter per yr';

% univariate data

% time-weight
data.tWw1 = [ ...
0.828	8.560
1.640	9.331
2.511	10.267
3.207	10.819
4.194	11.810
4.891	12.636
5.820	13.792
6.518	14.947
7.563	16.048
8.260	17.148
9.189	18.304
9.945	19.514
10.875	20.834
11.571	21.605
12.500	22.651
13.196	23.148
14.125	23.920
15.053	24.362
15.866	25.189
16.678	25.741
17.604	25.471
18.300	25.912
19.112	26.026
19.924	26.413
20.677	26.362
21.604	26.585
22.647	26.754
23.226	26.647
25.024	27.203
26.587	26.936
27.458	27.982
28.271	28.808
28.908	28.372
29.949	27.444
30.703	28.215
31.630	27.945
33.192	26.965
34.062	27.407
34.990	27.576
36.613	28.406
38.358	31.978
39.175	35.053
43.291	36.333
47.582	37.942];
units.tWw1  = {'d', 'g'};  label.tWw1 = {'time', 'weight'};  
temp.tWw1  = C2K(36);  units.temp.tWw1 = 'K'; label.temp.tWw1 = 'temperature';
bibkey.tWw1 = 'Mead1972';
%
data.tWw2 = [ ...
0.016	8.062
0.886	8.779
1.582	9.221
2.626	9.719
3.439	10.710
4.252	11.701
5.064	12.363
5.819	13.298
6.690	14.070
7.503	15.225
8.316	15.832
9.128	16.549
9.941	17.484
10.754	18.475
11.567	19.576
12.496	20.238
13.251	21.119
14.122	22.439
14.994	23.978
15.806	24.530
16.620	25.740
17.431	25.854
18.301	26.296
19.230	27.452
19.984	27.675
20.854	28.172
21.550	28.614
22.477	28.618
23.232	29.334
24.100	29.174
25.028	29.397
25.780	28.962
26.589	27.978
27.344	28.859
28.270	28.095
29.081	28.153
29.894	29.254
30.821	29.313
31.633	29.755
33.890	28.229
35.801	27.634
36.669	27.200
37.599	28.684
38.123	30.003
39.107	29.349
39.980	31.547
40.786	28.918
42.467	29.583
45.880	26.801];
units.tWw2  = {'d', 'g'};  label.tWw2 = {'time', 'weight'};  
temp.tWw2  = C2K(36);  units.temp.tWw2 = 'K'; label.temp.tWw2 = 'temperature';
bibkey.tWw2 = 'Mead1972';
%
data.tWw3 = [ ...
0.000	5.375
0.879	5.324
1.633	5.492
2.619	6.154
3.200	6.980
4.128	7.422
5.057	8.469
5.868	8.527
6.680	8.805
7.434	9.576
8.247	10.292
9.175	11.009
10.104	11.672
10.858	12.333
11.670	12.775
12.541	13.766
13.238	14.647
14.108	15.309
14.979	15.971
15.906	16.249
16.662	17.459
17.474	18.230
18.228	18.618
19.214	19.225
19.969	19.996
20.839	20.329
21.535	20.881
22.579	21.214
23.275	21.766
24.145	22.209
24.957	22.925
25.767	22.216
26.638	23.042
27.390	22.607
28.490	22.008
29.186	22.505
29.998	22.892
31.561	22.351
33.357	22.304
34.053	22.691
34.866	23.407
35.677	23.521
36.603	23.250
37.474	24.077
38.226	23.422
39.964	23.101
40.775	23.433
41.643	22.505
44.943	21.477
45.763	25.923];
units.tWw3  = {'d', 'g'};  label.tWw3 = {'time', 'weight'};  
temp.tWw3  = C2K(36);  units.temp.tWw3 = 'K'; label.temp.tWw3 = 'temperature';
bibkey.tWw3 = 'Mead1972';
%
data.tWw4 = [ ...
0.000	5.868
0.765	5.927
1.692	6.370
2.447	6.812
3.433	7.419
4.245	7.917
4.884	8.742
5.753	9.075
6.855	9.299
7.841	10.236
8.422	10.951
9.176	11.503
10.162	12.111
10.859	12.936
11.730	13.543
12.484	14.315
13.181	15.305
14.109	15.693
14.922	16.629
15.850	17.072
16.546	17.678
17.359	18.395
18.229	18.782
19.099	19.280
19.969	19.996
20.955	20.494
21.652	21.156
22.463	21.379
23.217	21.985
24.087	22.373
24.899	22.596
25.710	22.764
26.405	22.548
27.331	21.893
28.258	21.843
29.185	22.121
29.940	23.057
31.503	22.296
33.414	21.865
34.284	22.034
35.096	22.860
35.734	23.247
36.603	23.031
37.530	22.980
38.341	23.203
39.904	22.168
40.831	22.337
41.698	21.024
44.941	20.380];
units.tWw4  = {'d', 'g'};  label.tWw4 = {'time', 'weight'};  
temp.tWw4  = C2K(36);  units.temp.tWw4 = 'K'; label.temp.tWw4 = 'temperature';
bibkey.tWw4 = 'Mead1972';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw1','tWw2','tWw3','tWw4'}; subtitle1 = {'Data for f4 individuals'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '484X9'; % Cat of Life
metaData.links.id_ITIS = '632066'; % ITIS
metaData.links.id_EoL = '1038526'; % Ency of Life
metaData.links.id_Wiki = 'Nyctalus_lasiopterus'; % Wikipedia
metaData.links.id_ADW = 'Nyctalus_lasiopterus'; % ADW
metaData.links.id_Taxo = '64830'; % Taxonomicon
metaData.links.id_WoRMS = '1476281'; % WoRMS
metaData.links.id_MSW3 = '13802033'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nyctalus_lasiopterus}}';
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
bibkey = 'Mead1972'; type = 'Article'; bib = [ ... 
'doi = {10.1515/mamm.1972.36.2.269}, ' ...
'author = {Maeda, K.}, ' ... 
'year = {1972}, ' ...
'title = {GROWTH AND DEVELOPMENT OF LARGE NOCTULE, \emph{Nyctalus lasiopterus} {S}CHREBER}, ' ...
'journal = {Mammalia}, ' ...
'volume = {36(2)}, ' ...
'pages = {268-278}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1038526}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

