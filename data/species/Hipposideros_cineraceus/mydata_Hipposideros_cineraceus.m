function [data, auxData, metaData, txtData, weights] = mydata_Hipposideros_cineraceus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Hipposideridae';
metaData.species    = 'Hipposideros_cineraceus'; 
metaData.species_en = 'Ashy roundleaf bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 26]; 

%% set data
% zero-variate data

data.tg = 45;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'guess';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 33;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'JinLin2010';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'guess';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 13*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'JinLin2010';
  comment.Wwb = '2.31 g for male, 2.36 g for female';
data.Wwi = 5.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Wiki';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'guess';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0.813	1.717
0.814	1.679
0.903	1.651
0.947	1.519
0.948	1.429
0.949	1.387
0.950	1.349
0.951	1.312
0.992	1.595
0.993	1.571
0.994	1.462
2.889	1.821
2.934	1.774
2.935	1.746
2.936	1.718
2.980	1.671
2.981	1.623
2.982	1.586
2.983	1.562
2.984	1.510
2.985	1.529
3.070	1.859
4.921	2.048
4.922	2.011
4.966	1.973
4.967	1.789
5.010	1.916
5.011	1.822
5.055	2.204
5.056	2.157
5.057	2.096
5.058	1.869
8.894	2.309
8.939	2.611
8.983	2.554
8.984	2.370
8.985	2.257
8.986	2.181
8.987	2.106
9.028	2.502
9.029	2.427
9.074	2.214
12.822	2.409
12.867	2.310
12.912	2.725
12.957	2.753
13.000	2.470
13.001	2.531
13.002	2.560
13.003	2.602
13.004	2.630
13.005	2.673
13.006	2.800
13.007	2.852
13.008	2.890
13.009	2.918
13.010	2.975
16.930	3.202
16.931	2.929
16.973	3.334
16.974	3.136
16.975	3.112
16.976	2.801
16.977	2.749
16.978	2.721
16.979	2.655
16.98	2.617
17.020	3.070
17.021	3.013
17.022	2.976
17.023	2.844
17.065	2.877
20.946	3.406
20.947	3.312
20.948	3.260
20.949	3.208
20.950	3.165
20.951	2.863
20.952	3.146
20.953	3.090
20.954	3.052
20.955	3.010
20.993	2.962
24.921	3.548
24.922	3.501
24.923	3.459
24.924	3.397
24.925	3.350
24.926	3.317
24.963	3.270
24.964	3.223
24.965	3.185
24.966	3.110
24.967	3.044
24.968	3.015
25.011	2.907
28.894	3.582
28.895	3.488
28.896	3.441
28.897	3.139
28.898	3.111
28.939	3.356
28.940	3.318
28.984	3.394
28.985	3.214
29.028	3.620
29.029	3.540
32.866	3.475
32.867	3.225
32.912	3.508
32.957	3.645
32.958	3.602
32.959	3.446
33.002	3.579
33.045	3.546
33.046	3.395
33.047	3.300
36.884	3.721
36.885	3.622
36.930	3.565
36.931	3.509
36.932	3.471
36.974	3.433
36.975	3.400
36.976	3.325
36.977	3.263];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'JinLin2010';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
%weights.Wwim = 3 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
D3 = 'scaled function response during lactation is assumed to be larger than post-weaning';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3M36D'; % Cat of Life
metaData.links.id_ITIS = '631491'; % ITIS
metaData.links.id_EoL = '128666'; % Ency of Life
metaData.links.id_Wiki = 'Hipposideros_cineraceus'; % Wikipedia
metaData.links.id_ADW = 'Hipposideros_cineraceus'; % ADW
metaData.links.id_Taxo = '64212'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800746'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hipposideros_cineraceus}}';
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
bibkey = 'JinLin2010'; type = 'Article'; bib = [ ... 
'doi = {10.3161/150811010x504653}, ' ...
'author = {Jin, L. and Lin, A. and Sun, K. and Liu, Y. and Feng, J.}, ' ... 
'year = {2010}, ' ...
'title = {Postnatal Growth and Age Estimation in the Ashy Leaf-Nosed Bat, \emph{Hipposideros cineraceus}}, ' ...
'journal = {Acta Chiropterologica}, ' ...
'volume = {12(1)}, ' ...
'pages = {155–160}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

