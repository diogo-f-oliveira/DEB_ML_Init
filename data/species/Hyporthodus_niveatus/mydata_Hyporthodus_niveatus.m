function [data, auxData, metaData, txtData, weights] = mydata_Hyporthodus_niveatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Hyporthodus_niveatus'; 
metaData.species_en = 'Snowy grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 27];

%% set data
% zero-variate data

data.am = 55 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'CostBrag2011';   
  temp.am = C2K(19.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 54;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 122 ;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.13e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwp = 2.9e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01585*Lp^3.04, see F1';
data.Wwi = 34.9e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01585*Li^3.04, see F1, give 1.66 kg';

data.Ri  = 293382/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(19.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap=0.97';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.457	15.521
0.532	17.462
1.188	20.228
3.004	25.200
3.744	36.283
3.882	32.123
4.850	50.412
4.900	35.440
5.858	47.075
5.934	49.293
5.937	51.788
6.749	62.870
6.874	49.283
6.878	52.056
7.011	43.736
7.161	47.339
7.224	40.962
7.834	62.582
8.055	65.075
8.059	67.571
8.112	54.261
8.169	43.725
8.788	71.168
8.896	46.213
8.911	56.471
8.930	69.225
8.998	66.452
9.088	78.651
9.119	50.369
9.123	52.865
9.134	60.628
9.158	76.986
9.643	62.287
9.686	42.046
9.775	53.690
9.780	56.740
9.987	50.083
10.011	66.165
10.162	70.599
10.239	74.203
10.865	56.174
10.881	67.819
10.930	51.460
10.945	61.719
10.950	65.323
11.103	70.867
11.253	74.747
11.820	66.424
11.898	70.027
11.960	62.818
11.977	75.017
12.003	42.854
12.096	56.717
12.128	78.897
12.173	60.043
12.758	64.196
12.993	76.670
13.037	56.984
13.040	59.202
13.056	70.293
13.205	73.064
13.923	69.175
13.950	88.029
13.954	90.801
13.973	53.648
14.063	65.846
14.076	75.273
14.122	56.696
14.147	74.163
14.706	60.572
14.741	84.139
14.790	68.334
14.803	77.207
14.881	80.810
14.943	73.878
15.000	63.619
15.276	104.374
15.683	85.516
15.702	48.085
15.871	65.274
16.012	62.500
16.024	70.817
16.028	73.590
16.041	82.740
16.109	79.412
16.237	68.320
16.252	78.301
16.678	73.029
16.739	64.710
16.768	84.673
16.908	81.899
16.964	69.976
16.974	77.462
17.046	76.630
17.281	89.659
17.326	70.250
17.695	75.237
17.759	69.691
17.919	79.948
18.006	89.929
18.068	83.274
18.072	86.046
18.269	71.627
18.625	67.741
18.926	76.056
18.992	71.342
19.024	93.523
19.100	96.295
19.229	85.480
19.654	78.544
19.877	83.255
20.010	74.936
20.034	91.572
20.079	72.440
20.171	86.302
20.294	71.329
20.812	78.810
20.825	88.237
20.895	86.572
20.965	84.354
20.975	91.840
21.021	73.540
21.053	95.166
21.316	76.864
21.681	79.078
21.793	106.526
21.908	86.008
21.977	84.066
22.182	75.746
22.191	81.569
22.202	89.055
22.212	95.986
22.851	87.939
22.861	94.593
23.087	100.413
23.146	91.263
23.202	79.895
23.851	78.779
23.929	82.383
24.032	103.454
24.087	91.531
24.226	87.648
24.898	101.782
24.958	93.186
25.048	105.939
25.086	81.817
25.244	91.242
25.674	88.188
25.733	79.037
25.911	101.771
26.049	97.334
26.100	82.638
26.189	94.005
26.218	114.245
27.037	80.133
27.097	71.260
27.147	105.641
27.280	97.876
27.853	93.434
27.934	99.533
27.994	90.937
28.073	95.927
28.207	88.162
28.937	92.591
28.961	109.227
29.070	84.549
29.234	97.579
29.303	95.637
29.825	105.891
29.940	85.372
30.155	83.984
30.737	86.196
31.130	107.541
31.366	120.848
31.905	93.116
32.857	101.147
34.008	96.422
34.091	103.352
34.140	87.548
35.165	95.855
35.972	102.779
36.331	101.112
37.060	104.986
37.290	113.579
38.052	90.004
39.070	93.875
40.078	90.261
40.104	108.283
40.833	111.602
40.963	101.342
41.018	89.697
41.992	112.422
43.080	114.352
45.387	108.229
47.901	95.173
47.977	97.667
47.989	105.708
49.064	98.488
49.932	97.925
52.905	102.608];
data.tL(:,1) = (0.8 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length', 'female'};  
temp.tL    = C2K(19.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CostBrag2011';

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

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Hermaphroditic, so kap_R is reduced ba a factor 2';
D2 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: W in g = 0.01585*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3NYHL'; % Cat of Life
metaData.links.id_ITIS = '167705'; % ITIS
metaData.links.id_EoL = '46579826'; % Ency of Life
metaData.links.id_Wiki = 'Hyporthodus_niveatus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_niveatus'; % ADW
metaData.links.id_Taxo = '1683154'; % Taxonomicon
metaData.links.id_WoRMS = '475101'; % WoRMS
metaData.links.id_fishbase = 'Hyporthodus-niveatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyporthodus_niveatus}}';
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
bibkey = 'CostBrag2011'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0025315411000142}, ' ...
'author = {Paulo A.S. Costa and Adriana C. Braga and Juan P. Rubinich and Ant\^{o}nio Olinto \''{A}vila-da-Silva and Cassiano M. Neto}, ' ... 
'year = {2011}, ' ...
'title = {Age and growth of the snowy grouper, \emph{Epinephelus niveatus}, off the {B}razilian coast}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'pages = {1-9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Hyporthodus-niveatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

