function [data, auxData, metaData, txtData, weights] = mydata_Paralichthys_dentatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Paralichthyidae';
metaData.species    = 'Paralichthys_dentatus'; 
metaData.species_en = 'Summer flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 18];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 18];

%% set data
% zero-variate data

data.ab = 3.06;   units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'fishbase';   
  temp.ab = C2K(17.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 9*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 28;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 94;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 5.6e-04; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.02 mm: pi/6*0.102^3';
data.Wwi = 10.6e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00589*Li^3.17, see F1; max published weight 12 kg';
 
% uni-variate data
% time-length
data.tL_fm = [... % time since birth (yr), total length (cm)
 1 27.3 24.9
 2 37.9 33.7
 3 47.0 39.3
 4 55.0 45.5]; 
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.2) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'age', 'total length'};  
temp.tL_fm = C2K(19); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Desf1995'; treat.tL_fm = {1 {'females','males'}}; 

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
36.437	541272.481
38.351	696959.956
38.741	591921.498
39.132	486883.040
40.106	878953.035
40.989	780092.408
41.636	733781.669
42.110	635227.634
42.180	569708.900
42.417	523704.753
42.491	477823.243
42.586	994936.832
42.723	850807.879
42.953	765529.283
43.888	941589.804
44.178	738426.540
44.349	777578.353
44.397	1039408.018
44.443	842974.451
44.883	1006311.399
45.024	881819.671
45.040	521742.563
45.096	829392.420
45.111	462769.570
45.251	776903.850
45.293	560833.058
45.419	802964.180
45.510	848723.053
45.600	894481.926
46.066	1195279.448
46.109	540582.649
46.145	736954.898
46.247	848171.187
46.267	952903.053
46.280	1024906.211
46.475	1194972.856
46.508	1371707.880
46.533	618824.956
47.231	847435.366
47.267	598635.866
47.312	1286000.055
47.421	991319.045
47.942	1148048.933
47.976	1331329.699
48.102	1128289.072
48.128	820577.897
48.382	866214.133
48.586	1527272.719
48.717	1350415.058
48.819	1016459.598
48.822	1029551.081
49.146	1454840.332
49.196	1278043.989
49.477	1029060.534
49.715	1428228.136
49.732	1519868.519
49.832	1172821.576
50.021	864987.764
50.377	1460466.297
50.379	1028386.031
50.700	988866.308
50.767	910256.090
50.903	1204753.145
50.946	1879025.851
50.948	1446945.585
50.958	1054139.769
51.153	1224206.414
51.178	1361666.988
51.188	1859204.671
51.199	1027772.847
51.244	1276511.029
51.406	818125.160
52.312	1288805.373
52.383	1229832.380
52.752	1006970.572
52.779	1596148.637
52.982	1366863.725
53.028	1170430.158
53.133	1739909.679
53.138	1766092.646
53.201	1661299.461
53.293	1720149.817
53.629	1759178.993
53.650	2322174.092
53.813	1425162.215
53.960	1778570.945
54.024	1680323.502
54.072	1051809.669
54.148	2354534.889
54.164	1994457.781
54.214	1379035.432
54.289	1339699.663
54.297	1830691.604
54.313	1470614.496
54.575	2000696.931
54.905	1568371.391
55.110	2235975.719
55.231	1561580.376
55.351	1764437.048
55.434	2216093.220
55.491	2523743.077
55.527	1829771.828
55.890	2019353.061
56.085	1744247.958
56.093	2235239.898
56.221	1593573.263
56.382	2464156.900
56.507	1809398.782
56.680	1416470.329
57.331	1389796.815
57.605	2430508.415
57.929	2410625.917
58.158	1873629.829
58.211	1271298.963
58.520	2501837.070
58.709	2639175.008
59.580	2474856.964
59.617	2232603.206
59.715	1872464.779
60.374	1891611.457
60.391	2428423.589
61.010	2670186.800
61.021	2729098.475
61.053	2015490.000
61.421	2231254.200
61.970	2099910.139
62.023	1942751.022
62.143	2590779.443
65.163	3858568.492
65.390	3308480.922
66.162	3942927.312
66.288	4178512.692
67.394	3509927.270
68.153	2736855.255];
units.LN = {'cm','#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(19); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Mors1981'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.LN = 3 * weights.LN;
weights.Wwb = 5 * weights.ab;
weights.Lp = 5 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for females, males in Southern California'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

% %% Discussion points
% D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
% metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00589*(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CYVG'; % Cat of Life
metaData.links.id_ITIS = '172735'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Paralichthys_dentatus'; % Wikipedia
metaData.links.id_ADW = 'Paralichthys_dentatus'; % ADW
metaData.links.id_Taxo = '46920'; % Taxonomicon
metaData.links.id_WoRMS = '158826'; % WoRMS
metaData.links.id_fishbase = 'Paralichthys-dentatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paralichthys_dentatus}}';
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
bibkey = 'Desf1995'; type = 'phdthesis'; bib = [ ...
'doi = {10.25773/v5-vdr9-cn07}, ' ... 
'author = {Desfosse, Joseph C.}, ' ... 
'year = {1995}, ' ...
'title = {Movements and ecology of summer flounder, \emph{Paralichthys dentatus}, tagged in the southern mid-{A}tlantic bight}, ' ...
'school = {William & Mary}, ' ...
'number = {1539616631}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mors1981'; type = 'article'; bib = [ ...
'author = {W.W. Morse}, ' ... 
'year = {1981}, ' ...
'title = {Reproductive of the summer flounder, \emph{Paralichthys dentatus} ({L}.)}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {19}, ' ...
'pages = {189-203}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Paralichthys-dentatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

