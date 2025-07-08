  function [data, auxData, metaData, txtData, weights] = mydata_Lophius_piscatorius

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lophiiformes'; 
metaData.family     = 'Lophiidae';
metaData.species    = 'Lophius_piscatorius'; 
metaData.species_en = 'Monkfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.5); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 'L-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2014 05 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data
data.ah = 14;     units.ah = 'd';   label.ah = 'age at hatch';           bibkey.ah = 'HislGall2001'; 
  temp.ah = C2K(8.5);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.tb = 20;     units.tb = 'd';   label.tb = 'time since hatch at birth'; bibkey.tb = 'HislGall2001'; 
  temp.tb = C2K(8.5);  units.temp.tb = 'K'; label.temp.tb = 'temperature';
  comment.tb = '3 degrees C is actually temperature upon spawning';
data.ap = 6*365;  units.ap = 'd';   label.ap = 'age at puberty';         bibkey.ap = 'arkive';
  temp.ap = C2K(8.5); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 25*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(8.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lh = 0.600;  units.Lh = 'cm';  label.Lh = 'total length at hatch';  bibkey.Lh = 'HislGall2001'; 
data.Lp = 50.8;   units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'arkive'; 
  comment.Lp =  'for males: 4 yr';
data.Li = 200;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'arkive';

data.Wwi = 40e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'arkive';
  
data.Ri = 1e6/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'HislGall2001';   
  temp.Ri = C2K(8.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL_fm = [ ... % age (yr), fork length (cm) for female, male
0	16.9	15.6
1	28.5	28.1	
2	37.1	37.2	
3	46.4	45.3
4	54.4	56.1
5	63.8	63.0
6	73.1	69.6
7	81.2	75.6
8	89.4	79.5
9	94.8	87.3
10	99.4	83.5
11	105.5	88.0
12	112.2	NaN
13	115.5	NaN
14	120.5	NaN];
data.tL_fm(:,1) = 365 * (1 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'fork length'}; 
temp.tL_fm = C2K(12); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = {'OfstAngu2013'}; treat.tL_fm = {1 {'female','male'}};
comment.tL_fm = 'temp is guessed';

% time-length
data.tL = [ ... simce since hatch (d); fork length (cm)
21.165	0.874
25.158	0.658
26.755	0.767
26.756	1.093
29.551	0.931
32.745	1.040
33.145	0.660
41.131	1.259
42.329	1.097
43.128	1.314
46.722	0.717
54.309	1.154
76.273	4.148
78.270	4.529
78.271	5.507
79.867	6.377
80.266	5.127
80.666	4.149
81.864	3.714
82.263	4.856
83.860	4.095
85.458	3.878
86.256	4.204
86.257	4.530
86.258	4.693
83.062	6.378
85.058	6.976
86.656	6.759
86.657	5.346
86.658	5.780
86.659	6.107
88.652	6.216
90.250	6.216
91.448	6.216
91.847	6.923
88.253	5.346
91.448	5.673
93.045	5.510
93.046	5.130
93.047	4.858
95.441	4.696
96.240	5.076
96.639	5.348
98.636	5.838
87.854	7.955
87.855	7.194
89.451	7.520
90.250	7.140
90.251	8.553
90.649	7.955
91.448	8.282
92.646	7.304
94.243	8.119
95.840	8.174
98.236	7.903
98.237	7.740
99.035	8.392
99.036	6.055
97.837	6.218
96.638	6.326
96.639	6.544
98.236	6.816
99.035	7.359
99.834	7.142
100.632	8.392
100.633	7.577
101.032	7.360
101.431	8.012
103.028	9.480
103.428	7.741
103.429	9.263
103.827	6.545
104.626	9.698
105.424	6.383
105.425	7.198
105.426	7.741
105.824	7.252
105.825	9.480
106.224	8.991
106.622	7.578
106.623	8.176
106.624	6.981
107.022	8.720
107.421	10.024
107.820	8.448
108.220	8.883
109.817	9.318
110.616	9.427
113.810	9.428
115.008	8.559
115.807	11.113
117.005	10.407
119.002	9.266
119.003	9.647
119.401	10.407
124.992	11.061
162.130	14.982
176.506	21.888
183.694	16.020
194.077	16.837
197.671	22.925
198.469	19.230
200.865	20.969
202.463	18.524
205.258	19.992
213.644	17.929
226.423	22.008];
data.tL(:,1) = data.tL(:,1) - 20;  % convert time since hatch to time since birth
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'}; 
temp.tL = C2K(12); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'HislGall2001'}; 
comment.tL = 'temp is guessed';
 
% length-weight
data.LW = [ ... % fork length (cm),wet weight (g)
135.329	22058.702
117.913	22026.758
116.640	19961.545
114.111	16974.558
106.653	17419.297
105.078	16018.104
100.700	14285.740
98.519	13991.277
102.558	13658.164
100.063	13179.364
96.312	11778.789
97.242	11594.098
93.500	10894.340
91.634	10894.870
94.424	10193.259
95.668	10192.906
90.057	9272.367
89.438	9530.739
88.492	8571.991
87.558	8498.485
86.314	8461.953
85.994	7834.995
84.431	7245.274
84.123	7466.673
82.878	7430.141
80.997	6324.117
80.690	6619.286
80.062	6213.727
77.259	5919.440
74.772	5993.916
78.807	5402.608
76.319	5403.314
76.004	5108.321
73.514	4924.601
72.582	5035.521
71.953	4519.306
71.332	4593.253
69.772	4224.843
69.151	4335.675
67.282	4078.009
66.657	3893.760
66.034	3820.166
65.722	3709.599
64.478	3746.837
63.542	3488.906
62.919	3415.312
61.984	3341.807
61.983	3231.152
61.358	3010.018
60.427	3194.708
58.248	3010.900
58.550	2383.765
54.503	2089.831
53.879	1905.582
52.636	1979.705
51.081	2017.032
51.388	1721.863
49.829	1464.108
48.585	1464.461
47.649	1243.415
47.654	1575.381
46.408	1428.194
45.784	1317.715
44.539	1207.413
43.604	1060.137
43.605	1170.792
42.048	986.808
41.426	1023.870
40.803	913.391
40.181	913.567
38.936	877.035
38.312	729.671
37.380	766.821
36.445	693.316
36.133	582.748
35.202	730.554
34.268	657.048
34.267	583.278
32.089	510.125
30.844	473.593
29.911	473.858
29.288	363.379
28.977	363.467
28.354	289.874
27.421	290.138
26.488	327.288
25.865	253.695
25.556	364.438
24.310	254.136
23.377	254.400
22.754	180.807
22.443	180.895
21.199	181.248
20.888	181.336
19.955	181.601
19.332	108.007
19.022	144.981
18.087	34.590
17.466	108.537
16.222	108.890
15.600	109.066
14.356	72.534];
units.LW = {'cm', 'g'}; label.LW = {'fork length', 'wet weight'};
bibkey.LW = {'Dore1986'};
 
%% set weights for all real data
weights = setweights(data, []);
weights.Li = weights.Li * 3;
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Bas Kooijman: males are assumed to differ from females by {p_Am} only ';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  
                                 
%% Facts
F1 = 'Lives at 20 to 1000 m deep on bottum; pelagic stage lasts 120 d';
metaData.bibkey.F1 = 'arkive';
F2 = 'Angler-fish eggs are extruded in a buoyant, gelatinous ribbon that may measure more than 10 m x 25 cm  and contain more than 1 000 000 eggs ';
metaData.bibkey.F2 = 'HislGall2001';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3W2MQ'; % Cat of Life
metaData.links.id_ITIS = '164501'; % ITIS
metaData.links.id_EoL = '46566106'; % Ency of Life
metaData.links.id_Wiki = 'Lophius_piscatorius'; % Wikipedia
metaData.links.id_ADW = 'Lophius_piscatorius'; % ADW
metaData.links.id_Taxo = '44235'; % Taxonomicon
metaData.links.id_WoRMS = '126555'; % WoRMS
metaData.links.id_fishbase = 'Lophius-piscatorius'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lophius_piscatorius}}';  
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
bibkey = 'OfstAngu2013'; type = 'Article'; bib = [ ...  
'author = {L. H. Ofstad and C. Angus and T. Pedersen and P. Steingrund }, ' ...
'year = {2013}, ' ...
'title = {Age and growth of anglerfish (\emph{Lophius piscatorius}) in {F}aroese waters.}, ' ... 
'howpublished = {\url{http://www.sciencedirect.com/science/article/pii/S0165783612001671}}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = 139, '...
'pages = {51-60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HislGall2001'; type = 'Article'; bib = [ ...  
'author = {Hislop, J. R. G. and Gallego, A. and Heath, M. R. and Kennedy, F. M. and Reeves, S. A. and Wright, P. J.}, ' ...
'year = {2001}, ' ...
'title = {A synthesis of the early life history of the anglerfish, \emph{Lophius piscatorius} ({L}innaeus 1758) in northern {B}ritish waters.}, ' ... 
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {58}, '...
'pages = {70-86}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dore1986'; type = 'Techreport'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Dorel, D.}, ' ...
'year = {1986}, ' ...
'title  = {Poissons de l''{A}tlantique nord-est relations taille-poids}, ' ...
'institution = {Institut Francais de Recherche pour l Exploitation de la Mer. Nantes, France.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lophius_piscatorius}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/anglerfish/lophius-piscatorius/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
