function [data, auxData, metaData, txtData, weights] = mydata_Tetraodon_lineatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Tetraodontidae';
metaData.species    = 'Tetraodon_lineatus'; 
metaData.species_en = 'Globe fish'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0jFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 26];

%% set data
% zero-variate data

data.am = 6 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'AbouFarr2021';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18.2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 43;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 3.6e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.85 - 0.91 mm of Sphoeroides maculatus: pi/6*0.088^3';
data.Wwi = 1.3e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02570*Li^2.88, see F1';
  
data.GSI = 0.065; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';   bibkey.GSI = 'AbouFarr2021';
  temp.GSI = C2K(25);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1	14.619
2	21.614
3	26.816
4	31.211
5	34.619];
data.tL(:,1) = 365 * (0.6 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AbouFarr2021';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
14.452	110.435
14.452	54.185
14.916	129.009
15.496	135.040
16.018	91.092
16.076	122.320
16.134	159.798
16.308	159.732
16.830	184.534
17.004	140.718
17.293	209.359
17.467	140.543
17.815	184.161
17.989	134.095
18.511	233.897
18.511	158.897
18.743	127.559
18.917	202.494
19.033	289.950
19.555	252.252
19.613	177.230
19.787	164.664
19.903	239.620
20.019	333.326
20.367	258.194
20.367	214.444
20.657	176.834
20.657	151.834
20.831	370.519
21.005	320.453
21.005	207.953
21.121	270.409
21.643	245.211
21.933	295.101
21.991	370.079
22.223	307.491
22.223	251.241
22.571	382.360
22.629	282.338
22.861	238.500
22.919	425.978
23.209	313.368
23.383	450.802
23.615	200.714
23.673	369.442
24.021	469.310
24.021	325.560
24.079	231.788
24.311	381.700
24.427	456.657
24.485	525.385
24.543	325.363
24.833	431.503
25.123	331.393
25.413	450.033
25.413	237.533
25.529	337.489
25.935	493.585
26.051	687.291
26.457	618.388
26.979	649.440
26.979	486.940
26.979	293.190
27.385	643.036
27.443	730.514
27.965	686.566
27.965	499.066
28.081	605.273
28.545	586.347
28.835	748.737
28.951	986.193
29.009	648.671
29.299	679.811
29.415	611.017
29.473	635.995
29.531	460.973
29.879	779.591
29.995	935.798
29.995	698.298
29.995	629.548
30.343	748.166
30.401	779.394
30.459	398.122
31.039	597.902
31.561	910.204
31.909	860.073
32.373	728.647
32.373	934.897
32.779	697.243
32.895	672.199
32.953	803.427
33.475	1003.229
33.938	1003.054
33.938	1071.804
34.460	1184.106
34.924	977.680
34.924	1296.430
34.982	802.658
35.040	1246.386
35.446	1014.983
36.954	1389.411
37.012	951.889
37.534	932.942
38.404	1438.862];
units.LW_f   = {'d', 'cm'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'AbouFarr2021';
%
data.LW_m = [ ... % total length (cm), weight (g)
13.587	79.245
14.536	116.226
14.536	79.245
15.011	110.943
15.063	68.679
15.485	121.509
15.801	142.642
16.012	89.811
16.223	110.943
16.434	163.774
16.540	126.792
16.909	121.509
17.067	179.623
17.541	110.943
17.594	163.774
17.963	147.925
17.963	211.321
18.227	132.075
18.385	190.189
18.438	116.226
18.649	163.774
18.701	216.604
18.859	232.453
19.070	158.491
19.123	190.189
19.387	227.170
19.439	248.302
19.439	174.340
19.545	179.623
19.914	216.604
20.019	237.736
20.283	195.472
20.599	243.019
20.810	264.151
20.863	353.962
20.863	290.566
20.863	200.755
20.916	316.981
20.968	216.604
21.443	264.151
21.496	359.245
21.917	200.755
22.023	290.566
22.866	417.358
22.866	301.132
22.919	449.057
22.972	280.000
23.025	401.509
23.025	243.019
23.183	433.208
23.288	491.321
23.657	332.830
23.815	306.415
24.079	264.151
24.132	348.679
24.185	285.283
24.343	306.415
24.448	433.208
24.606	390.943
24.975	433.208
25.397	575.849
25.503	406.792
25.819	528.302
25.924	544.151
26.399	401.509
26.452	665.660
26.610	486.038
26.873	692.075
26.926	549.434
26.979	612.830
26.979	353.962
27.506	491.321
27.822	676.226
27.822	612.830
27.981	565.283
28.086	644.528
28.402	438.491
28.455	697.358
29.931	818.868
30.986	533.585
30.986	871.698
35.942	1009.057];
units.LW_m   = {'d', 'cm'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'AbouFarr2021';

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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length - weight: Ww in g = 0.02570*(TL in cm)^2.88';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7BSX9'; % Cat of Life
metaData.links.id_ITIS = '173357'; % ITIS
metaData.links.id_EoL = '46570997'; % Ency of Life
metaData.links.id_Wiki = 'Tetraodon_lineatus'; % Wikipedia
metaData.links.id_ADW = 'Tetraodon_lineatus'; % ADW
metaData.links.id_Taxo = '188909'; % Taxonomicon
metaData.links.id_WoRMS = '154805'; % WoRMS
metaData.links.id_fishbase = 'Tetraodon-lineatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tetraodon_lineatus}}';
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
bibkey = 'AbouFarr2021'; type = 'article'; bib = [ ...  
'author = {AbouelFadl, Khaled Y. and Mahmoud M.S. Farrag}, ' ...
'year = {2021}, ' ...
'title  = {Biology and population dynamics of the freshwater puffer fish, \emph{Tetraodon lineatus} ({L}innaeus, 1758), from the {R}iver {N}ile, {A}swan, {E}gypt}, ' ...
'journal = {The Egyptian Journal of Aquatic Research}, ' ...
'volume = {47(1)}, ' ...
'pages = {75-80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Tetraodon-lineatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

