function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_analis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_analis'; 
metaData.species_en = 'Mutton snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jpMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb';  'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2018 12 24]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 24]; 

%% set data
% zero-variate data

data.ab = 26/24;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 29*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Burt2002';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 52; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'range 28 to 40 cm, which does not include 52 cm';
data.Li  = 94;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: 4/3*pi*0.0425^3'; 

data.Ri  = 3e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.85';
  
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), total length (cm)
    1 32.1
    2 40.4
    3 44.2
    4 50.3
    5 56.0
    6 61.6
    7 66.0
    8 68.5
    9 70.6
   10 74.7
   11 75.1
   12 73.9
   13 79.2
   14 78.7
   15 71.3
   16 80.6
   17 81.0
   21 79.9
   23 83.2
   29 83.1];
data.tL(:,1) = 365 * (.5+data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Burt2002';

data.LW = [ ... % total length (cm), wet weight (g)
29.828	336.203
32.154	409.252
33.165	629.863
37.226	1021.504
37.235	776.103
37.240	653.402
38.387	1119.378
38.832	898.410
38.842	628.470
38.933	2125.380
39.981	1315.306
40.001	775.425
40.131	1192.570
40.269	1413.395
40.286	947.133
40.873	799.750
42.033	922.165
42.465	1069.298
42.890	1388.212
43.026	1658.118
43.031	1510.877
43.343	921.844
44.202	1338.810
44.939	1068.691
45.079	1215.896
45.361	1485.765
45.938	1632.863
46.532	1289.159
47.117	1215.396
47.400	1436.185
48.264	1705.912
48.275	1411.430
48.850	1607.609
49.415	2073.727
49.425	1803.787
49.730	1411.073
50.014	1607.323
50.589	1803.501
51.174	1729.738
51.181	1557.957
51.535	3815.538
52.185	1950.349
52.467	2220.218
52.694	3962.493
52.887	2661.832
52.898	2367.351
53.062	1851.973
53.493	1999.107
53.631	2219.932
54.204	2465.191
54.345	2612.396
55.081	2366.815
55.816	2170.317
56.049	3765.351
56.385	2538.275
56.525	2685.480
56.975	2317.272
57.690	2685.194
57.698	2464.334
57.826	2955.099
57.974	2881.443
59.011	2365.851
59.142	2782.997
59.439	2611.145
59.862	3003.679
59.870	2782.819
60.438	3150.777
60.886	2856.189
61.454	3248.687
61.739	3420.397
62.044	3027.683
62.050	2855.903
62.318	3493.874
62.628	2978.461
62.894	3665.511
63.777	3419.897
63.782	3272.656
64.335	4082.336
64.353	3591.534
64.356	3493.374
64.371	3076.192
65.063	4057.617
65.068	3934.917
65.074	3763.136
65.948	3738.382
65.956	3542.061
66.653	4376.246
66.661	4155.385
66.824	3689.087
67.364	4842.329
67.366	4768.709
67.383	4302.447
67.398	3909.805
68.219	5332.917
68.539	4547.562
68.571	3664.118
68.680	4670.227
68.842	4228.470
69.544	4939.954
69.854	4424.540
69.987	4743.526
70.115	5234.292
70.121	5062.511
70.287	4522.594
70.403	5332.381
70.689	5455.010
70.866	4596.071
70.995	5062.297
71.005	4792.356
71.410	5651.152
72.603	4865.583
72.734	5258.189
73.161	5528.023
73.176	5110.842
73.874	5945.026
74.040	5380.568
74.340	5135.096
74.481	5257.761
75.046	5723.879
75.430	7171.638
75.467	6165.494
75.843	7834.113
76.047	6238.971
76.056	5969.030
76.071	5576.389
76.583	7490.373
76.946	5527.094
77.041	6901.304
77.168	7416.610
77.785	6459.404
78.361	6631.042
79.550	5968.173
83.382	8666.619
85.666	9893.053
88.534	7094.803];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Burt2002';
 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Marine; brackish; reef-associated; depth range 40 - 70 m. Tropical';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3WG7L'; % Cat of Life
metaData.links.id_ITIS = '168849'; % ITIS
metaData.links.id_EoL = '46580720'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_analis'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_analis'; % ADW
metaData.links.id_Taxo = '179207'; % Taxonomicon
metaData.links.id_WoRMS = '159792'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-analis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_analis}}';
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
bibkey = 'Burt2002'; type = 'Article'; bib = [ ... 
'author = {Michael L. Burton}, ' ... 
'year = {2002}, ' ...
'title = {Age, growth and mortality of mutton snapper, \emph{Lutjanus analis}, from the east coast of {F}lorida, with a brief discussion of management implications}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {59}, ' ...
'pages = {31-41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-analis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
