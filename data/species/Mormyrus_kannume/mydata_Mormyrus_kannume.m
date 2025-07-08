  function [data, auxData, metaData, txtData, weights] = mydata_Mormyrus_kannume
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osteoglossiformes'; 
metaData.family     = 'Mormyridae';
metaData.species    = 'Mormyrus_kannume'; 
metaData.species_en = 'Elephant-snout fish'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fbm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'; 'Ww-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 05];

%% set data
% zero-variate data
data.ab = 21; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'FarrYoun2022';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'MekkHass2012';
data.Li = 100;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MekkHass2012';
  comment.Wwb = 'based on egg diameter of 2.1 mm: pi/6*0.21^3';
data.Wwp = 247;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'MekkHass2012','fishbase'};
  comment.Wwp = 'based on 0.01175*Lp^2.88, see F1';
data.Wwi = 6.8e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^2.88, see F1';
  
data.Ri = 17369/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate';     bibkey.Ri = 'fishbase';
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 17.3
    2 26.64
    3 35.11
    4 42.98
    5 49.56
    6 55.91
    7 61.50
    8 65.82
    9 69.66
   10 72.54];
data.tL(:,1) = (data.tL(:,1) + 0.2) * 365; % convert yr to d
units.tL = {'d', 'cm', 'g'};  label.tL = {'time since birth', 'length', 'weight'};  
temp.tL = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FarrYoun2022';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
24.350	110.538
25.397	173.311
26.336	152.722
27.155	163.352
27.860	142.702
28.673	205.414
29.023	215.922
29.488	247.293
30.081	184.947
30.187	278.725
30.898	205.994
31.018	185.191
31.123	289.385
31.830	247.903
32.306	185.527
32.765	268.980
32.774	196.065
33.225	342.016
33.820	258.838
33.928	342.199
34.756	269.498
34.977	384.139
35.569	332.210
36.131	530.273
36.397	259.509
36.502	363.703
36.729	426.262
37.080	426.354
37.216	270.139
38.006	520.345
38.143	353.713
38.347	614.183
38.369	426.689
38.945	510.172
39.660	406.192
40.344	562.620
40.354	479.289
40.826	448.162
41.280	573.280
41.643	469.208
42.218	563.108
42.582	459.036
42.594	354.873
43.042	532.073
43.270	584.215
43.981	511.484
44.207	584.459
45.012	709.669
45.366	688.928
45.374	616.013
45.937	814.076
46.524	803.813
47.353	720.695
47.583	762.422
47.830	647.903
49.446	856.657
50.637	690.300
50.731	888.242
50.843	929.937
51.197	909.196
51.879	1086.457
52.817	1076.285
54.222	1076.651
55.137	1264.389
55.388	1129.038
55.599	1327.009
55.608	1243.679
57.453	1494.159
59.194	1630.029
64.788	1871.069
65.591	2017.111
67.358	1934.238
74.641	2748.635];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length', 'weight','females'};  
bibkey.LW_f = 'FarrYoun2022';
%
data.LW_m = [ ... % total length (cm), weight (g)
24.201	130.930
25.116	119.189
25.901	95.284
25.901	180.059
26.686	156.154
27.733	180.799
27.994	132.461
28.779	229.664
29.564	193.649
30.218	97.027
30.610	145.628
30.610	254.625
31.265	218.557
31.788	364.096
32.442	279.585
32.965	207.132
33.227	316.235
33.881	280.166
34.404	219.824
34.666	341.037
34.666	207.819
35.320	280.747
35.451	317.132
36.235	244.785
36.366	353.834
37.020	463.095
37.020	257.212
37.674	366.473
37.805	548.186
38.328	294.072
38.459	439.454
38.852	488.055
39.375	330.827
39.767	403.650
40.552	561.406
40.683	331.355
41.337	501.169
41.730	404.442
41.991	622.541
42.515	489.534
42.515	562.198
43.430	453.572
43.823	574.837
44.084	502.278
44.346	611.381
44.608	744.704
45.131	672.251
45.131	466.369
45.262	563.307
46.177	854.335
46.570	636.500
46.701	721.328
47.355	636.817
47.747	830.747
48.270	709.851
48.924	807.000
50.625	1001.459
51.672	880.774
52.195	1062.646
54.157	1136.103
55.073	1306.022
55.596	1221.458
55.858	1064.125
56.512	1294.493
60.698	1647.393
63.314	1769.557
77.703	2925.885];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length', 'weight','males'};  
bibkey.LW_m = 'FarrYoun2022';

% length-fecundity
data.LN = [ ... % weight (g), fecundity (#)
    20  1878
    24  2528
    28  4624
    32  5835
    36  8366
    40 10306
    44 13148]; 
units.LN = {'cm', '#'};  label.LN = {'length', 'fecundity'};  
temp.LN = C2K(24);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'MekkHass2012';

% weight-fecundity
data.WN = [ ... % weight (g), fecundity (#)
    100  1878
    200  2537
    300  6006
    400  7438
    500  8672
    600 11052
    700 10356
    800 13500]; 
units.WN = {'g', '#'};  label.WN = {'weight', 'fecundity'};  
temp.WN = C2K(24);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'MekkHass2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Weights Wwp and Wwi are inconsistent with LW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^2.88'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: SL = 0.9*TL from photo'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '73RBT'; % Cat of Life
metaData.links.id_ITIS = '649929'; % ITIS
metaData.links.id_EoL = '214899'; % Ency of Life
metaData.links.id_Wiki = 'Mormyrus'; % Wikipedia
metaData.links.id_ADW = 'Mormyrus_kannume'; % ADW
metaData.links.id_Taxo = '42766'; % Taxonomicon
metaData.links.id_WoRMS = '1021951'; % WoRMS
metaData.links.id_fishbase = 'Mormyrus-kannume'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Mormyrus}}';  
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
bibkey = 'FarrYoun2022'; type = 'Article'; bib = [ ...
'author = {Mahmoud M. S. Farrag and Alaa M. Younis and Rokaya M. Abdel-megaly and Khaled Y. AbouelFadl}, ' ...
'year = {2022}, ' ...
'title = {Age and growth of elephant-snout fish \emph{Mormyrus kannume} ({F}orssk{\aa}l, 1775) ({F}amily: {M}ormyridae) from {L}ake {N}asser, {E}gypt}, ' ... 
'journal = {Egyptian Journal of Aquatic Biology \& Fisheries}, ' ...
'volume = {26(5)}, '...
'pages = {219-234}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MekkHass2012'; type = 'Article'; bib = [ ...
'author = {Imam A.A. Mekkawy and Arafa A. Hassan}, ' ...
'year = {2012}, ' ...
'title = {Reproductive characteristics of the elephant-snout fish \emph{Mormyrus kannume} {F}orssk{\aa}l, 1775 from the {N}ile, {E}gypt}, ' ... 
'journal = {Journal of Biological Sciences}, ' ...
'volume = {21(1)}, '...
'pages = {15-24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mormyrus-kannume.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

