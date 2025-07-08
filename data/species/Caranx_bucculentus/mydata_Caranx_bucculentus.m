  function [data, auxData, metaData, txtData, weights] = mydata_Caranx_bucculentus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Caranx_bucculentus'; 
metaData.species_en = 'Bluespotted trevally'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 12];

%% set data
% zero-variate data
data.ab = 7; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 66;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.23e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 27.5;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02570*Lp^2.91, see F1';
data.Wwi = 5e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02570*Li^2.91, see F1';

% uni-variate data
data.tL = [ ... % time since brth (d), total length (cm)
176.760	8.234
443.166	15.768
567.076	19.291
802.493	25.729];
data.tL(:,1) = data.tL(:,1)+ 0; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(24.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'BrewBlab1994';

data.LN = [ ... % time since brth (yr), total length (mm)
4.698	10.202
4.790	9.845
4.797	9.806
4.932	11.822
4.935	12.139
5.002	11.643
5.040	10.487
5.050	10.601
5.080	10.410
5.103	11.971
5.153	12.236
5.179	12.324
5.186	12.426
5.210	11.144
5.229	12.730
5.276	12.792
5.393	12.346
5.960	12.678
6.007	13.248
6.043	13.196
6.044	12.587
6.119	13.373
6.141	13.144];
data.LN = exp(data.LN); data.LN(:,1) = data.LN(:,1)/ 10; % remove log transform, convert mm to cm
units.LN = {'cm','#'};  label.LN = {'total length','fecundity'};  
  temp.LN = C2K(27.7);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = 'BrewBlab1994';
comment.LN = 'Fig 3 of BrewBlab1994 gives log10 transforms, but the assumption is that this should be natural logarithms';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
9.514	9.513
10.391	28.094
11.538	40.686
11.942	71.269
12.213	28.759
12.955	47.291
13.090	22.992
13.224	89.998
13.494	71.836
14.033	108.554
14.034	78.120
14.572	151.360
14.573	102.665
14.843	96.676
14.909	151.483
14.910	121.048
15.112	127.209
15.516	163.879
15.653	103.059
15.787	103.108
15.922	115.331
16.056	176.250
16.461	158.137
16.529	121.640
16.798	188.695
16.934	127.875
17.202	213.190
17.271	164.519
17.540	219.400
17.743	182.953
18.079	262.206
18.147	195.274
18.483	280.614
18.754	219.844
18.888	286.849
19.159	232.165
19.361	250.500
19.495	317.505
19.497	165.333
19.564	195.792
19.629	341.902
19.767	201.953
20.170	293.404
20.236	342.124
20.237	281.255
20.238	238.647
20.505	384.831
20.776	324.061
20.777	287.539
20.778	244.931
21.046	336.333
21.116	238.967
21.383	379.065
21.384	306.022
21.384	306.022
21.586	348.704
21.652	385.250
21.856	348.802
22.193	361.099
22.461	428.154
22.734	312.602
22.935	379.631
23.000	495.307
23.001	452.699
23.137	397.966
23.474	392.002
23.676	434.685
23.743	465.144
23.809	501.690
23.947	392.175
24.552	495.874
24.619	520.247
24.688	447.228
24.887	617.736
24.956	538.631
25.227	496.121
25.495	575.349
25.833	538.951
25.899	599.845
26.036	490.330
26.102	581.658
26.305	539.123
26.507	587.893
26.776	624.513
26.977	728.064
27.315	685.579
28.258	734.619
28.324	832.035
28.597	698.221
29.202	808.007
29.268	868.901
29.270	765.423
29.741	826.465
29.878	729.124
30.078	844.849
30.347	893.643
30.483	857.171
30.549	905.891
31.563	851.478
32.576	803.153
32.706	1052.765
32.707	991.896
32.908	1083.274
34.391	1150.772
36.347	1206.269
36.611	1462.018
36.816	1370.788
37.357	1316.203
38.431	1608.769
38.498	1584.446
38.636	1468.844
38.697	1791.475
38.832	1761.090
39.442	1633.486
39.508	1743.076
39.512	1523.946
40.989	1877.530
41.058	1810.598
41.192	1877.604
41.257	1975.019
42.136	1890.123
42.199	2151.884
42.673	2066.840
42.945	1963.461
43.005	2334.787
43.684	2085.470
44.027	1829.943
44.223	2152.624
44.829	2244.149
45.501	2347.873
45.572	2195.725
45.908	2274.978
46.042	2311.549
46.982	2549.283
47.317	2671.145
47.451	2725.976
48.452	3286.342
49.201	2927.485];    
units.LW = {'cm','g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'BrewBlab1994';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;
weights.Wwi = weights.Wwi * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02570*(TL in cm)^2.91'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'R2MW'; % Cat of Life
metaData.links.id_ITIS = '168632'; % ITIS
metaData.links.id_EoL = '46577977'; % Ency of Life
metaData.links.id_Wiki = 'Caranx_bucculentus'; % Wikipedia
metaData.links.id_ADW = 'Caranx_bucculentus'; % ADW
metaData.links.id_Taxo = '165424'; % Taxonomicon
metaData.links.id_WoRMS = '273270'; % WoRMS
metaData.links.id_fishbase = 'Caranx-bucculentus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Caranx_bucculentus}}';  
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
bibkey = 'BrewBlab1994'; type = 'techreport'; bib = [ ... 
'author = {D. T. Brewer and S. J. M. Blaber and D. A. Milton and J. P. Salini}, ' ...
'year = {1994}, ' ...
'title = {Aspects of the Biology of \emph{Caranx bucculentus} ({T}eleostei: {C}arangidae) from the {G}ulf of {C}arpentaria, {A}ustralia}, ' ... 
'journal = {Aust. J. Mar. Freshwater Res.}, ' ...
'volume = {45}, '...
'pages = {413-427}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Caranx-bucculentus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  