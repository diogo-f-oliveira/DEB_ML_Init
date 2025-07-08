  function [data, auxData, metaData, txtData, weights] = mydata_Latris_lineata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Latridae';
metaData.species    = 'Latris_lineata'; 
metaData.species_en = 'Striped trumpeter'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAS','MIS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 15];

%% set data

% zero-variate data

data.ab = 8;   units.ab = 'd';  label.ab = 'age at birth';              bibkey.ab = 'fishbase';   
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 43*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'TracLyle2005';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = '29 yrs for males';

data.Lp = 51.9;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 120;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'TracLyle2005';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of  1.3 mm: pi/6*0.13^3';
data.Wwi = 25e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'TracLyle2005';
    
data.Ri  = 2.35e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
0.027	19.647
0.030	20.070
0.034	18.440
0.041	18.742
0.041	19.346
0.045	19.828
0.045	20.553
0.060	18.924
0.105	20.433
0.385	27.137
0.385	29.913
0.392	27.680
0.392	27.741
0.392	29.129
0.396	28.042
0.396	28.103
0.396	28.586
0.400	27.017
0.456	29.552
0.604	27.383
0.612	27.986
0.634	27.021
0.641	26.056
0.645	27.323
0.761	28.291
0.768	26.843
0.768	27.809
0.776	28.593
0.843	27.508
0.846	29.681
0.925	32.941
0.932	30.588
0.932	32.277
0.932	32.519
0.936	31.433
0.936	32.036
0.940	31.614
1.025	31.978
1.029	32.641
1.029	33.848
1.029	34.814
1.033	30.710
1.036	31.374
1.037	33.124
1.037	34.573
1.037	36.081
1.040	32.943
1.040	34.030
1.044	33.426
1.044	35.116
1.044	35.538
1.048	34.271
1.108	34.695
1.112	37.169
1.115	34.091
1.119	32.522
1.119	33.307
1.119	36.204
1.122	33.247
1.122	33.609
1.122	33.850
1.122	33.971
1.122	34.574
1.126	31.074
1.126	35.721
1.134	34.997
1.305	34.035
1.305	34.759
1.305	35.543
1.312	35.121
1.312	36.026
1.313	37.837
1.313	38.440
1.316	37.113
1.320	34.216
1.324	36.328
1.324	36.690
1.324	37.897
1.361	37.596
1.365	37.355
1.365	38.260
1.368	37.114
1.380	37.114
1.380	37.959
1.387	35.304
1.878	37.908
1.882	36.702
1.882	37.305
1.882	38.874
1.882	39.538
1.886	40.081
1.886	40.564
1.886	41.409
1.889	36.521
1.890	38.512
1.893	39.236
1.901	37.607
1.901	40.805
1.904	36.038
1.904	36.581
1.904	37.185
1.905	39.176
1.905	39.599
1.912	40.323
1.919	38.452
1.938	42.556
2.087	40.628
2.095	42.620
2.098	42.258
2.106	40.085
2.136	41.776
2.150	40.690
2.151	43.104
2.195	41.837
2.225	43.346
2.236	41.114
2.336	40.392
2.340	42.625
2.344	41.357
2.351	40.634
2.351	41.599
2.821	43.238
2.824	44.203
2.832	42.997];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-1;end;end
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = [ ...
0.000	15.538
0.031	17.193
0.057	16.973
0.072	17.152
0.079	17.111
0.109	17.649
0.123	17.732
0.149	18.283
0.168	18.256
0.210	16.077
0.232	15.898
0.259	14.808
0.315	14.422
0.352	14.643
0.375	13.829
0.434	14.105
0.464	13.264
0.490	13.251
0.513	13.058
0.517	12.630
0.524	12.354
0.558	12.492
0.576	12.189
0.599	12.065
0.617	12.079
0.658	11.817
0.688	12.162
0.725	11.679
0.736	12.162
0.766	12.231
0.785	12.093
0.829	12.728
0.848	12.645
0.862	13.569
0.888	13.680
0.899	14.163
0.944	14.218
0.963	14.080
0.977	14.411
1.003	14.591
1.010	15.708
1.025	16.081
1.062	16.122
1.092	15.322
1.111	15.598
1.144	16.702
1.159	16.592
1.188	16.592
1.215	15.833
1.226	16.178
1.234	15.530
1.267	15.337
1.278	15.171
1.305	14.703
1.316	14.978
1.335	14.648
1.368	14.813
1.387	14.248
1.391	13.862
1.428	14.096
1.436	13.324
1.458	13.489
1.499	13.007
1.514	12.607
1.536	12.648
1.562	12.842
1.574	12.759
1.622	12.387
1.633	12.401
1.678	12.111
1.715	12.525
1.723	12.249
1.749	12.415
1.753	12.194
1.808	12.360
1.830	12.760
1.849	13.326
1.853	13.022
1.875	13.036
1.890	13.229
1.905	13.009
1.934	13.326
1.945	14.237
1.979	14.099
2.008	15.699
2.026	15.713
2.052	16.458
2.074	16.196
2.093	17.079
2.104	17.134
2.133	18.127
2.148	17.258
2.163	17.217
2.201	16.720
2.231	16.693
2.254	15.328
2.276	15.355
2.295	14.997
2.321	15.218
2.336	14.928
2.358	14.818
2.380	15.080
2.410	14.432
2.440	14.032
2.448	13.618
2.467	13.453
2.504	13.660
2.522	13.274
2.530	13.067
2.545	12.957
2.571	12.419
2.597	12.446
2.612	12.295
2.642	12.185
2.661	12.129
2.679	12.626
2.716	12.668
2.720	12.916
2.742	13.123
2.749	13.495
2.768	12.820
2.790	13.302
2.809	13.923];  
temp.tL(:,1) = temp.tL(:,1) * 365; % convert yr to d
units.temp.tL = {'d','C'}; label.temp.tL = {'time','temperature'};
bibkey.tL = 'TracLyle2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '6P4J7'; % Cat of Life
metaData.links.id_ITIS = '170271'; % ITIS
metaData.links.id_EoL = '46580146'; % Ency of Life
metaData.links.id_Wiki = 'Latris_lineata'; % Wikipedia
metaData.links.id_ADW = 'Latris_lineata'; % ADW
metaData.links.id_Taxo = '178249'; % Taxonomicon
metaData.links.id_WoRMS = '281280'; % WoRMS
metaData.links.id_fishbase = 'Latris-lineata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Latris_lineata}}';  
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
bibkey = 'TracLyle2005'; type = 'article'; bib = [ ...  
'author = {Sean R. Tracey and Jeremy M. Lyle}, ' ...
'year = {2005}, ' ...
'title = {Age validation, growth modeling, and mortality estimates for striped trumpeter (\emph{Latris lineata}) from southeastern {A}ustralia: making the most of patchy data}, ' ... 
'journal = {Fish. Bull.}, ' ...
'volume = {103}, '...
'pages = {169–182}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Latris-lineata.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
