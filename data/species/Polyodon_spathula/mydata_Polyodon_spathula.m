  function [data, auxData, metaData, txtData, weights] = mydata_Polyodon_spathula

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Polyodontidae';
metaData.species    = 'Polyodon_spathula'; 
metaData.species_en = 'American paddlefish'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 06 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data
data.tp = 9*365;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Rose1976';
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 55*365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li = 117;    units.Li = 'cm';   label.Li = 'ultimate eye-fork length';  bibkey.Li = 'fishbase';
   comment.Li = 'based on TL 221 cm and EFL = 0.53 * TL, see F1';

data.Wwb = 6e-3; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Rose1976';
  comment.Wwb = 'based on egg diameter of 2.25 mm: pi/6*0.225^3';
data.Wwp = 6.3e3;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'Rose1976';
data.Wwi = 90.7e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  
data.Ri = 608e3/365;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr),  eye-fork length (cm)
1.947	46.005
4.032	54.197
4.959	64.950
6.025	71.873
7.045	70.589
8.018	77.147
8.991	74.952
10.150	79.868
10.891	81.869
12.050	79.855
13.070	84.589
13.996	85.859
14.831	78.741
16.082	88.398
16.963	82.556
18.863	96.585
19.975	99.495
22.014	85.621];
data.tL_f(:,1) = 365 * (4.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'eye-fork length', 'female'};  
temp.tL_f   = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Rose1976';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), eye-fork length (cm)
2.014	51.158
3.130	53.165
4.014	54.990
5.104	67.986
5.989	70.361
6.912	68.340
8.169	71.628
9.144	72.537
10.022	70.882
10.999	72.890
12.068	74.531
13.139	77.270
14.027	81.110
15.139	81.102
16.156	79.996
17.171	77.242
18.156	83.462
20.140	79.053
26.181	87.618];
data.tL_m(:,1) = 365 * (4.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'eye-fork length', 'male'};  
temp.tL_m   = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Rose1976';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (yr), wet weight (g)
3.914	2158.870
4.924	3753.021
6.109	5624.416
7.149	5040.909
7.811	6529.967
8.896	6292.321
9.946	7368.115
10.998	8685.890
11.867	8516.515
13.874	9665.261
14.778	8217.015
17.006	10023.435
17.958	9266.737
18.968	10826.320];
data.tWw_f(:,1) = 365 * (4.5 + data.tWw_f(:,1)); % convert yr to d
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f   = C2K(15);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Rose1976';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (yr), wet weight (g)
1.957	1668.885
3.043	1811.632
3.957	2299.706
4.826	3860.271
5.870	5213.916
7.087	5114.971
8.130	5534.362
9.043	5745.620
10.000	5334.215
11.217	6515.545
12.043	6622.649
14.000	6768.869
14.957	7395.525
18.000	8549.544];%
data.tWw_m(:,1) = 365 * (4.5 + data.tWw_m(:,1)); % convert yr to d
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m   = C2K(15);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Rose1976';
comment.tWw_m = 'Data for males';
    
% length-weight
data.LWw = [ ... % eye-fork length (cm), wet weight (g)
46.148	1007.160
47.882	1298.242
49.053	1955.776
50.843	1562.798
50.980	1448.398
51.007	1630.690
51.501	1857.151
52.715	1739.480
53.160	1624.146
54.815	2439.782
55.218	2028.225
56.016	2230.965
56.045	2436.043
56.683	2593.678
56.929	3231.230
57.004	2683.889
57.069	3139.617
57.737	2430.901
59.042	2951.249
59.926	4817.865
60.086	2720.114
60.129	3016.337
60.332	3357.666
60.773	3219.545
60.956	3424.155
61.752	3604.109
61.932	3785.933
62.072	4765.749
62.075	3717.106
62.095	2782.396
62.183	3397.629
62.291	3078.152
62.471	4331.405
62.475	3282.763
62.586	4057.500
62.609	3145.577
63.185	3941.699
63.299	3667.794
63.590	3552.928
63.689	3165.091
63.787	3848.683
63.810	4008.188
63.829	4144.907
63.891	6720.706
63.963	6150.578
64.261	6081.284
64.834	3640.334
65.102	4437.391
65.118	3479.894
65.151	4779.187
65.230	4254.632
65.295	3638.932
65.341	3957.941
65.354	6191.944
65.357	4071.873
65.374	5257.234
65.475	3820.755
65.812	4024.898
65.858	4343.908
65.910	3637.062
66.106	5004.246
66.401	4912.166
66.414	3931.883
66.784	4363.890
66.856	4865.191
66.954	4477.355
66.987	3633.790
66.996	4773.578
67.055	4112.305
67.098	6551.385
67.173	7075.472
67.209	5183.266
67.222	5274.411
67.235	5365.557
67.415	3404.524
67.824	4109.968
67.909	3630.986
67.916	5819.416
67.962	3995.568
67.968	5112.569
68.079	4815.879
68.089	4884.238
68.609	3150.134
68.838	5816.611
69.032	5018.152
69.084	4311.306
69.097	4402.452
69.156	4812.607
69.202	5131.617
69.274	4561.489
69.506	4036.467
69.683	4195.504
69.997	3168.714
70.095	7066.592
70.095	5995.163
70.128	5151.598
70.134	5197.171
70.160	5379.463
70.186	4490.325
70.399	8114.299
70.694	4807.933
70.952	4465.202
71.054	6243.009
71.080	5353.872
71.099	5490.590
71.148	4760.958
71.171	7063.320
71.171	5991.891
71.224	4213.616
71.227	5307.831
71.286	7860.844
71.492	5010.673
71.508	5124.605
71.587	5671.479
71.822	6240.672
71.979	5191.562
72.012	7562.284
72.166	5418.959
72.225	4757.686
72.375	5805.861
72.483	4414.955
72.598	7355.336
72.771	5348.730
72.807	5599.381
72.889	5097.612
72.912	5257.117
72.951	6601.983
72.974	6761.487
73.020	6009.069
73.288	5734.697
73.766	5847.227
73.848	7488.315
73.861	6508.032
73.874	6599.178
73.880	7716.179
73.894	6735.897
73.949	6051.837
73.952	5003.195
74.038	5595.641
74.083	4843.222
74.692	8010.066
74.793	6573.587
74.908	5228.254
75.026	4977.136
75.049	5136.641
75.150	5843.020
75.176	6025.311
75.297	5796.980
75.428	7779.865
75.435	6754.009
75.883	5590.032
75.955	6091.333
76.001	5338.914
76.007	7527.344
76.066	9008.928
76.096	8142.577
76.128	6227.584
76.141	5247.301
76.177	6569.380
76.442	6272.222
76.665	7821.698
76.740	8345.785
76.750	6271.288
76.806	5587.228
76.851	6977.666
76.900	7319.462
77.005	5905.770
77.126	6748.867
77.257	6588.895
77.588	7818.894
77.620	6975.329
77.653	6131.765
77.853	7521.735
77.947	4968.256
78.137	6289.867
78.160	6449.372
78.190	5583.021
78.212	7885.383
78.262	6084.322
78.356	6745.128
78.703	5946.201
78.854	8065.805
79.004	6971.122
79.263	7699.820
79.384	6400.060
79.433	6741.856
79.734	7766.777
79.740	7812.350
79.786	8131.359
79.803	8245.292
79.881	5577.880
79.917	9042.816
79.979	9475.758
79.999	7469.619
80.385	5872.701
80.522	6829.730
80.941	7603.533
81.016	8127.620
81.147	7967.648
81.265	7716.530
81.494	6097.293
81.690	7464.477
81.710	6529.767
81.756	6848.777
81.854	8603.798
82.122	9400.855
82.185	7690.939
82.247	7052.452
82.525	8989.297
82.564	6048.448
82.597	8419.169
82.607	7416.100
82.659	6709.254
82.790	9763.567
82.904	7346.806
83.035	8258.262
83.166	8098.290
83.693	8552.616
83.713	6546.477
83.794	8187.566
84.148	7434.212
84.357	7821.114
84.436	8367.988
84.769	11763.630
85.015	8115.467
85.126	7818.777
85.188	8251.718
85.892	9936.510
85.898	8910.655
86.461	8544.202
86.543	8042.434
86.955	7699.236
87.217	9522.148
87.331	8176.815
87.812	8312.132
88.306	11752.879
88.486	7648.989
88.493	8765.990
88.656	9905.311
89.056	9470.967
89.160	11271.560
89.163	10222.918
89.415	8763.186
89.533	10654.925
90.335	11951.881
90.708	9192.388
90.963	8826.871
92.075	12288.535
92.766	10667.896
93.211	8409.704
93.983	9501.582
94.660	14218.369
96.002	11775.081
97.203	12637.693
100.111	11466.238
100.118	11511.811
100.239	11283.479
101.839	12783.175];
units.LWw  = {'cm', 'g'};  label.LWw = {'eye-fork length', 'wet weight'};  
bibkey.LWw = 'Rose1976';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 10*weights.Li;
weights.Wwi = 0*weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Average temperatures are guessed';
D3 = 'In tL and tWw data, 3 yrs age have to be added to age to have a natural trajectory';
D4 = 'Data point Wwi was ignored because of inconsistency with LWw data';
D5 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Facts 
F1 = 'eye-fork length - total length from photo: EFL = 0.53 * TL';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Fingerlings capture zooplankton one-by-one till 15 cm TL';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);
                              
%% Links
metaData.links.id_CoL = '6W65D'; % Cat of Life
metaData.links.id_ITIS = '161088'; % ITIS
metaData.links.id_EoL = '208600'; % Ency of Life
metaData.links.id_Wiki = 'Polyodon_spathula'; % Wikipedia
metaData.links.id_ADW = 'Polyodon_spathula'; % ADW
metaData.links.id_Taxo = '42461'; % Taxonomicon
metaData.links.id_WoRMS = '994653'; % WoRMS
metaData.links.id_fishbase = 'Polyodon-spathula'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Polyodon_spathula}}';  
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
bibkey = 'Rose1976'; type = 'Phdthesis'; bib = [ ...    
'author = {Rudolph S. Rosen}, ' ...
'year  = {1976}, ' ...
'title = {Distribution, Age, and Growth, and Feeding Ecology of Paddlefish (\emph{Polyodon spathula}) In Unaltered Missouri River, South Dakota}, ' ...  
'school = {South Dakota Stat University}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Polyodon-spathula.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

 