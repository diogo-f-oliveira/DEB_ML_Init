function [data, auxData, metaData, txtData, weights] = mydata_Nyctalus_plancyi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Nyctalus_plancyi'; 
metaData.species_en = 'Chinese noctule'; 

metaData.ecoCode.climate = {'Cfa','Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2022 12 04]; 

%% set data
% zero-variate data

data.tg = 137;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'guess';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '135-140';
data.tx = 50;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'guess';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 400;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'guess';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 18*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.73; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'ShiLiu2008';
data.Wwi = 21;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'ShiLiu2008';
  comment.Wwi = 'Wiki: 21-26 g';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'guess';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0.524	3.590
0.922	2.935
1.022	4.429
1.121	3.882
1.519	3.482
1.918	4.211
1.919	4.211
2.814	4.539
2.815	3.956
3.212	4.211
3.610	5.086
4.208	5.050
4.407	5.633
4.805	5.415
5.004	6.362
5.403	5.962
5.404	6.800
6.498	7.748
6.597	7.347
6.798	6.546
6.996	4.724
7.792	6.801
7.892	7.530
8.589	8.041
9.385	9.972
9.386	9.608
9.584	7.604
9.784	8.551
9.785	8.187
10.481	9.536
10.482	9.135
10.580	10.082
10.779	7.094
11.177	10.192
11.178	9.718
11.377	11.540
11.378	8.552
11.576	9.136
11.675	9.500
12.173	8.990
12.372	12.306
12.472	10.885
12.870	6.914
12.970	10.448
13.468	9.574
13.667	10.339
13.766	11.032
14.264	11.214
14.563	13.218
14.961	12.089
15.061	10.632
15.359	12.709
15.459	11.579
15.857	11.324
16.255	12.564
16.455	11.798
16.952	12.382
17.052	12.090
17.053	11.726
17.450	12.783
18.147	13.731
18.148	12.565
19.442	14.897
19.443	13.076
19.541	13.586
19.641	16.100
20.039	16.465
20.139	12.092
20.537	12.566
21.333	16.320
21.334	14.716
21.433	13.623
22.130	14.316
22.229	13.259
22.329	12.859
22.528	16.138
22.529	14.644
22.727	15.446
22.926	14.280
23.325	12.859
24.519	15.629
24.918	14.828
25.017	12.933
25.316	12.824
25.416	12.132
25.515	15.848
26.511	14.610
26.512	14.464
26.710	15.594
26.909	13.845
27.407	17.526
27.408	17.161
27.706	15.413
28.104	21.170
28.303	13.992
28.403	15.704
28.502	22.919
28.503	16.470
29.198	17.272
29.199	15.195
29.299	14.539
29.398	19.385
29.597	16.397
29.598	15.523
30.494	16.726
30.693	18.184
31.290	17.200
31.291	17.565
31.292	21.099
31.390	14.139
32.385	16.508
32.584	17.092
34.476	15.708
36.069	16.693
40.450	15.019
41.645	16.915
42.043	16.441
44.831	16.589
46.126	20.634
46.127	19.322
46.424	16.152
46.425	14.695
46.524	17.027
48.017	20.016
53.506	18.188
54.545	19.377
54.546	20.802
55.286	23.154
56.623	21.136
67.532	18.909
69.740	21.192
76.364	23.524];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ShiLiu2008';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

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
D4 = 'mod_1: p_M is reduced';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '5JXGC'; % Cat of Life
metaData.links.id_ITIS = '948450'; % ITIS
metaData.links.id_EoL = '7242747'; % Ency of Life
metaData.links.id_Wiki = 'Nyctalus_plancyi'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '2680020'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13802043'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nyctalus_plancyi}}';
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
bibkey = 'ShiLiu2008'; type = 'Article'; bib = [ ... 
'author = {Shi, Hongyanan and Liu, Han and Wu, Yi and Hu, Jingchu}, ' ... 
'year = {2008}, ' ...
'title = {Postnatal growth and age estimation in villus noctule (Nyctalus velutinus)}, ' ...
'journal = {Acta Theriologica Sinica}, ' ...
'volume = {28(1)}, ' ...
'pages = {4248}-'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

