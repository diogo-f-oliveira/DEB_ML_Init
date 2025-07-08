function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_striatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_striatus'; 
metaData.species_en = 'Nassau grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 30];

%% set data
% zero-variate data

data.ab = 4; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(26.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 29 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'SadoEklu1999';   
  temp.am = C2K(26.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 50;       units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'SadoEklu1999'; 
data.Li  = 150;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'SadoEklu1999';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 4e3;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01175*Lp^3.04, see F1';
data.Wwi = 100e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight 100 kg; based on 0.01175*Li^3.04, see F1, gives 45.3 kg';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
 1	16.106
 2	26.675
 4	40.701
 5	47.952
 6	53.622
 7	57.081
 8	59.750
 9	63.841
10	64.457
11	65.548
12	69.322
13	70.727
14	70.711
15	72.590
16	71.467
17	82.668
18	79.966
21	77.706
28	84.385
29	80.419];
data.tL(:,1) = 365*(data.tL(:,1)+0.5); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(26.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SadoEklu1999'; 

% length-weight
data.LW = [ ... % stdlength (cm), wieght (cm)
17.678	161.053
20.404	266.146
24.301	455.850
27.207	369.067
28.002	624.351
28.972	623.834
29.952	751.165
30.334	665.727
31.316	814.367
32.487	898.978
32.492	984.211
33.843	855.638
34.449	1196.258
35.820	1366.000
37.567	1365.069
38.165	1577.841
38.346	1385.964
38.956	1790.509
39.330	1577.220
39.336	1662.453
40.093	1385.033
40.910	1959.940
42.307	2513.230
42.660	2001.625
43.497	2874.848
44.019	2000.901
44.037	2256.600
45.378	2000.177
45.810	2617.908
46.174	2276.771
46.236	3171.715
46.542	1978.249
46.785	2681.315
47.150	2340.178
47.184	2830.266
47.401	3171.094
47.606	3320.148
48.534	2701.693
48.753	3063.829
48.896	2317.938
49.115	2680.074
49.159	3319.320
49.577	3745.277
49.734	3212.469
50.342	3574.398
50.888	3041.382
51.113	3488.751
51.141	3893.607
51.237	2487.163
51.274	3019.868
51.483	3232.846
51.901	3658.803
52.110	3871.781
52.316	4042.144
52.454	3232.329
53.077	3807.340
53.259	3636.771
53.318	4489.099
53.692	4275.810
54.456	4104.930
54.486	4531.094
54.511	4893.333
54.661	4253.984
54.864	4381.730
55.218	3891.435
55.621	4104.310
55.675	4871.405
55.780	3592.810
56.017	4210.644
56.047	4636.808
56.200	4040.075
56.815	4508.545
57.069	5382.078
57.147	3698.626
57.599	4614.672
57.683	5829.239
57.742	6681.567
58.087	6063.423
58.200	4891.368
58.383	4720.800
58.420	5253.505
59.008	5338.426
59.094	3782.825
59.408	5508.685
59.497	6787.177
59.562	4933.261
59.585	5252.884
59.639	6041.287
59.825	5913.334
59.937	4741.280
60.818	6232.439
60.997	6019.254
61.565	5805.862
61.750	5677.910
61.978	6167.894
62.578	6423.283
63.287	5442.692
64.122	9086.082
64.553	6891.028
64.795	4781.311
64.975	7380.910
65.599	7977.229
66.259	6293.468
67.719	10554.486
69.722	11427.087
70.779	9870.969
72.347	7291.746];
units.LW   = {'cm', 'g'};  label.LW = {'std length', 'weight'};  
bibkey.LW = 'SadoEklu1999'; 

% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
47.467	81457.045
48.233	50213.058
48.933	101470.790
49.467	462075.601
49.467	606405.498
50.167	317457.045
50.700	358474.227
50.900	28494.845
51.400	306639.175
51.700	296206.186
51.767	151848.797
52.033	203285.223
52.067	770281.787
52.100	656865.979
52.700	563835.052
53.033	1398749.141
53.067	738941.581
53.367	862529.210
53.367	357374.570
53.433	738790.378
53.867	202529.210
54.000	429278.351
54.333	521924.399
54.567	521828.179
54.567	583683.849
54.567	913580.756
54.600	295010.309
54.600	346556.701
54.600	645525.773
54.633	439326.460
54.667	1171271.478
54.700	150639.175
55.167	2037044.674
55.500	346185.567
55.867	1273869.416
55.867	170776.632
55.900	459422.680
55.967	1871766.323
55.967	748054.983
55.967	211972.509
56.200	593319.588
57.167	531065.292
57.267	1201127.148
57.400	634061.856
57.533	932975.945
57.867	1200879.725
57.933	747243.986
58.100	128618.557
58.533	551120.275
58.900	942721.649
59.700	1251670.103
59.767	756797.251
59.767	1138240.550
59.800	365030.928
60.967	972797.251
61.067	1632549.828
62.333	1343367.698
63.533	1281017.182
64.233	1373512.027
68.767	4340714.777];
units.LN   = {'cm', '#'};  label.LN = {'std length', 'fecundity'};  
bibkey.LN = 'SadoEklu1999'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6FTQZ'; % Cat of Life
metaData.links.id_ITIS = '167706'; % ITIS
metaData.links.id_EoL = '46579614'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_striatus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_striatus'; % ADW
metaData.links.id_Taxo = '173929'; % Taxonomicon
metaData.links.id_WoRMS = '159222'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-striatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_striatus}}';
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
bibkey = 'SadoEklu1999'; type = 'techreport'; bib = [ ... 
'author = {Yvonne Sadovy and Anne-Marie Eklund}, ' ... 
'year = {1999}, ' ...
'title = {Synopsis of biological data on the Nassau Grouper \emph{Epinephelus striatus} (Bloch, 1792), and the jewfish, \emph{E. itajara} (Lichtenstein, 1822)}, ' ...
'institution = {NOAA}, ' ...
'volume = {NMFS 146, FAO Fisheries Synopsis 157}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Epinephelus-striatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

