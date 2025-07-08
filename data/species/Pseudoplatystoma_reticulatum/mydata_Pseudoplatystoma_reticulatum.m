  function [data, auxData, metaData, txtData, weights] = mydata_Pseudoplatystoma_reticulatum
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Pimelodidae';
metaData.species    = 'Pseudoplatystoma_reticulatum'; 
metaData.species_en = 'Cachara'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCvf','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 01];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 01];

%% set data
% zero-variate data
data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'FranAmbr2011';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25;  units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 60.5;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AndrMakr2014';
  comment.Wwb = 'based on egg diameter of 1.74 mm of Hemisorubim_platyrhynchos: pi/6*0.174^3';

data.GSI = 0.20; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';   bibkey.GSI = 'guess';
  temp.GSI = C2K(25);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), std length (cm)
    1 49.51 46.03
    2 65.27 55.94
    3 71.87 64.89
    4 72.61 66.20
    5 76.30 67.53
    6 79.28 73.69
    7 83.80 66.10
    8 92.60 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.9) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(25);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
  treat.tL_fm = {1, {'females','males',}};
bibkey.tL_fm = 'FranAmbr2011';

% length-weight
data.LW_f = [ ... % std length (cm), weight (g)
42.217	968.113
42.773	1338.003
42.989	672.576
43.213	1067.011
46.197	1191.170
47.303	1339.399
51.174	1808.902
51.725	1587.241
53.282	2820.114
54.160	2056.300
55.483	1686.989
55.489	2525.019
56.147	1884.377
57.036	2451.552
59.473	3265.684
60.685	2871.692
63.348	4228.144
63.894	3365.637
64.337	3538.310
64.453	4277.781
65.227	4228.723
65.769	2897.905
65.770	3144.384
66.551	4081.244
66.988	3415.886
66.995	4229.268
67.770	4475.986
68.098	3983.130
68.106	5116.935
69.324	5388.437
70.316	5092.967
70.525	3540.216
70.638	3860.672
70.757	4945.216
70.968	3663.592
71.097	6054.476
71.854	3984.287
71.980	5906.861
72.647	6375.376
74.524	6178.771
74.739	5464.049
74.860	6745.776
75.064	4626.121
75.283	4404.358
75.286	4823.373
75.738	6006.610
76.503	4996.283
76.618	5538.571
76.720	4503.392
76.734	6278.044
77.289	6573.990
78.504	6525.068
78.834	6278.691
78.932	4725.904
79.157	5218.931
79.165	6180.201
79.489	5219.033
80.053	6722.728
80.714	6525.749
80.715	6673.636
80.830	7141.982
81.391	8325.254
81.492	7117.538
81.504	8571.767
82.921	6132.063
83.155	7783.543
83.253	6156.813
85.268	9435.602
85.471	7143.411
87.914	8746.277
88.900	7662.074
89.914	10077.879
89.917	10546.190
90.019	9461.714
90.021	9658.898
93.791	11385.412
94.349	12100.372
96.001	11312.149];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'FranAmbr2011';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ...  % std length (cm), weight (g)
29.510	988.846
40.344	1583.734
41.892	1781.394
43.879	1510.879
44.869	968.930
45.425	1338.820
46.971	1240.704
47.080	1043.556
48.296	1117.874
49.071	1266.000
49.629	2079.552
50.405	2301.621
50.731	1611.582
50.844	1932.039
51.069	2425.067
51.394	1636.433
52.058	1784.526
52.283	2252.906
53.278	2401.099
54.712	2056.470
55.043	2007.276
55.155	2204.495
55.271	2820.727
56.045	2944.205
56.152	2475.927
56.154	2697.759
56.487	2919.692
56.596	2722.544
58.035	3092.706
58.693	2427.416
58.804	2526.040
58.806	2723.225
59.573	1984.025
59.695	3438.288
59.907	2181.310
60.015	1910.216
60.142	4005.326
60.471	3734.301
60.695	4054.792
61.124	2452.812
61.466	3759.255
61.799	3931.893
62.116	2157.343
62.118	2329.879
62.349	3636.288
62.788	3217.409
63.118	3069.623
63.336	2724.620
63.348	4154.201
64.006	3562.855
64.011	4179.053
64.885	2922.280
64.993	2626.539
65.008	4475.135
65.329	3193.544
65.332	3538.616
65.556	4031.642
66.214	3341.704
67.872	3440.807
68.325	4771.932
69.086	3170.054
69.201	3761.638
69.207	4599.669
69.321	4944.774
69.765	5216.037
70.197	3959.128
70.530	4181.062
70.635	3441.658
71.084	4304.472
71.416	4477.109
71.519	3540.523
72.079	4428.018
72.084	5118.160
72.086	5266.048
72.200	5759.041
72.523	4699.281
72.641	5635.938
73.190	5217.093
73.302	5414.310
73.306	5931.917
73.860	6055.327
73.955	4083.525
74.857	6400.704
75.067	4995.840
75.732	5242.524
75.736	5834.074
76.290	6006.780
76.516	6647.695
77.832	5391.058
78.271	4947.531
79.383	5835.198
80.059	7511.462
80.153	5465.717
80.724	7758.146
80.822	6156.064
82.926	6797.557
84.030	6650.010
85.142	7562.324
85.367	8055.352
87.132	7587.585
94.448	10522.938];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'FranAmbr2011';
comment.LW_m = 'Data for males';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 5;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 10;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4P84X'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4548088'; % Ency of Life
metaData.links.id_Wiki = 'Pseudoplatystoma_reticulatum'; % Wikipedia
metaData.links.id_ADW = 'Pseudoplatystoma_fasciatum'; % ADW
metaData.links.id_Taxo = '3419643'; % Taxonomicon
metaData.links.id_WoRMS = '1019693'; % WoRMS
metaData.links.id_fishbase = 'Pseudoplatystoma-reticulatum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Pseudoplatystoma_reticulatum}}';  
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
bibkey = 'FranAmbr2011'; type = 'Article'; bib = [ ...
'author = {Talitha M. Francisco and Angela Maria Ambr\''{o}sio and Thiago Jos\''{e} Balbi and Marina S. Zuliani and Edson K. Okada and Luiz C. Gomes}, ' ...
'year = {2011}, ' ...
'title = {Age and growth parameters of cachara \emph{Pseudoplastystoma reticulatum} ({S}iluriformes, {P}imelodidae) from the {C}uiab\''{a} {R}iver, {B}razil}, ' ... 
'journal = {Iheringia, Série Zoologia, Porto Alegre}, ' ...
'volume = {101(4)}, '...
'pages = {304-309}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AndrMakr2014'; type = 'Article'; bib = [ ...
'author = {Fernanda F. Andrade and Maristela C. Makrakis and Ariane F. de Lima and Lucileine de Assump\c{c}\~{a}o and Sergio Makrakis and Suelen F. R. Pini}, ' ...
'year = {2014}, ' ...
'title = {Desenvolvimento embrion\''{a}rio, larval e juvenil de \emph{Hemisorubim platyrhynchos} ({S}iluriformes, {P}imelodidae) da bacia do rio {P}aran\''{a}}, ' ... 
'journal = {Iheringia, S\''{e}rie Zoologia, Porto Alegre}, ' ...
'volume = {104(1)}, '...
'pages = {70-80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pseudoplatystoma-reticulatum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

