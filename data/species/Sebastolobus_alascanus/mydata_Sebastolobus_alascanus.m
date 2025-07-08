function [data, auxData, metaData, txtData, weights] = mydata_Sebastolobus_alascanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastolobus_alascanus'; 
metaData.species_en = 'Shortspine thornyhead'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNE','MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 30];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 30];

%% set data
% zero-variate data

data.am = 100 *365;    units.am = 'd';    label.am = 'life span';           bibkey.am = 'fishbase';   
  temp.am = C2K(3.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 22;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 80;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 123.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00708*Lp^3.16, see F1';
data.Wwi = 7.3e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.16, see F1; mas reported weight 9 kg';
  
data.Ri  = 821296/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(3.8);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) 
4.909	11.742
5.870	15.341
7.063	16.477
8.136	17.045
8.854	18.561
8.858	20.265
9.682	16.288
9.693	21.023
9.811	20.265
10.769	22.727
10.892	24.432
11.017	26.894
11.123	21.591
11.365	22.917
11.735	28.409
12.078	22.538
12.201	24.242
12.324	25.947
12.327	27.083
12.920	26.326
13.034	24.053
13.264	20.833
13.269	22.727
13.515	25.947
13.756	27.462
13.757	27.841
13.766	31.439
13.993	26.705
14.000	29.735
14.226	24.621
14.342	23.485
14.478	30.492
14.591	28.030
14.933	21.591
15.050	20.833
15.062	25.758
15.077	32.008
15.192	30.492
15.294	23.485
15.434	32.008
15.662	28.030
15.903	28.977
16.144	30.303
16.254	26.326
16.849	26.326
16.855	28.977
16.861	31.629
17.107	34.659
17.336	30.871
17.460	32.955
17.567	28.030
17.927	29.167
18.177	34.280
18.760	28.977
19.012	34.659
19.128	33.523
20.090	37.500
20.101	42.235
20.206	36.364
20.316	32.576
20.429	30.114
20.434	32.008
20.450	38.636
20.549	30.303
20.916	34.659
21.266	31.629
21.270	33.333
21.277	35.985
21.399	37.311
22.008	43.182
22.108	35.227
22.112	36.932
22.238	39.962
22.339	32.386
22.580	33.523
22.587	36.174
23.055	32.955
23.065	37.121
23.162	28.030
23.178	34.659
23.188	38.826
23.780	37.500
24.007	32.955
24.257	37.689
24.261	39.583
24.624	42.045
24.851	37.311
25.084	35.038
25.087	36.174
25.096	39.962
25.097	40.720
25.117	49.053
25.230	46.591
26.035	34.659
26.048	39.773
26.050	40.720
26.060	45.076
26.281	37.689
26.284	39.205
26.888	42.614
27.009	43.750
27.114	37.879
27.117	39.015
27.120	40.152
27.228	35.606
27.229	36.174
27.256	47.159
27.728	45.644
28.065	37.311
28.187	38.258
28.221	52.652
28.309	39.394
28.420	36.364
28.552	41.856
28.663	38.068
28.898	36.932
28.917	44.886
29.035	44.318
29.168	50.379
29.266	41.477
29.967	35.985
29.970	37.311
30.121	50.758
30.225	44.508
30.340	42.424
30.921	36.742
31.063	46.212
31.292	42.614
31.306	48.295
31.309	49.621
31.893	44.697
31.899	47.538
32.107	34.848
32.255	46.780
32.364	42.614
32.371	45.644
32.969	46.780
32.974	49.053
32.983	52.841
33.200	43.939
33.916	44.697
34.028	41.667
34.416	54.735
34.753	46.023
34.989	45.076
35.106	44.129
35.214	39.773
35.217	41.098
35.236	49.053
36.191	50.189
36.301	46.023
36.908	51.326
37.868	54.356
37.975	49.242
38.091	47.917
38.218	51.515
38.557	43.939
38.945	56.629
39.029	41.856
39.039	46.212
39.171	51.515
39.295	53.598
39.391	44.129
39.875	47.348
39.898	56.818
40.098	40.909
40.225	44.508
40.243	51.705
40.713	49.242
40.726	54.545
41.060	45.076
41.081	53.977
41.193	50.758
42.010	43.939
43.081	43.750
43.236	58.902
43.919	45.644
44.154	44.508
44.778	56.629
45.131	54.924
45.153	64.205
45.268	62.311
45.960	53.220
46.193	50.758
46.922	57.197
47.029	51.894
47.858	50.189
48.122	61.174
50.973	58.333
51.921	56.439
52.020	48.106
52.030	52.273
53.224	53.977
54.416	54.735
56.223	63.636
58.138	67.803
58.869	74.811
59.084	65.152
64.205	66.098
66.006	72.159
69.818	73.295
71.476	69.886
82.908	71.212];
data.tL(:,1) = 365*(0.3+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(3.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Klin1996';  

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% % Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.00708*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7ZL'; % Cat of Life
metaData.links.id_ITIS = '166783'; % ITIS
metaData.links.id_EoL = '46568233'; % Ency of Life
metaData.links.id_Wiki = 'Sebastolobus_alascanus'; % Wikipedia
metaData.links.id_ADW = 'Sebastolobus_alascanus'; % ADW
metaData.links.id_Taxo = '187356'; % Taxonomicon
metaData.links.id_WoRMS = '282740'; % WoRMS
metaData.links.id_fishbase = 'Sebastolobus-alascanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastolobus_alascanus}} ';
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
bibkey = 'Klin1996'; type = 'phdthesis'; bib = [ ... 
'author = {Donna E. Kline}, ' ...
'year = {1996}, ' ...
'title = {Radiochemical age verification for deep-sea rockfishes \emph{Sebastolobus altivelis} and \emph{Sebastolobus alascanus}}, ' ...
'school = {San Jose State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastolobus-alascanus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
