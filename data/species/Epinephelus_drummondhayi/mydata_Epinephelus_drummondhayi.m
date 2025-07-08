function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_drummondhayi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_drummondhayi'; 
metaData.species_en = 'Speckled hind'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 28];

%% set data
% zero-variate data

data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(22.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 45 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(22.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 55;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 110;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 2191;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01122*Lp^3.04, see F1';
data.Wwi = 18e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.04, see F1; max. published weight: 30 kg';

data.Ri  = 3.4e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(22.1);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on Epinephelus_coioides: 463940*18e3/24.6e3'; 
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
 1	24.426
 2	34.098
 3	42.295
 4	49.016
 5	54.426
 6	59.016
 7	64.590
 8	68.689
 9	71.803
10	75.738
11	79.672
12	79.672
13	83.770
14	83.770
15	89.016];
data.tL(:,1) = (0.8+data.tL(:,1)) * 365;
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(22.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MathHunt1984';
  
% length-weight
data.LW = [ ... % total length(cm), weight (g)
15.977	0.000
18.402	232.776
19.971	93.111
20.685	93.111
21.683	93.111
22.397	93.111
23.110	279.329
23.395	93.111
24.679	372.440
25.820	232.776
26.391	418.996
26.534	139.665
27.389	418.996
28.245	325.885
28.388	465.549
29.529	279.329
30.243	558.660
31.384	325.885
32.097	698.325
32.240	279.329
33.238	558.660
33.809	791.434
34.237	418.996
34.807	651.769
34.950	977.654
36.377	698.325
36.377	1070.763
37.518	884.545
37.803	1117.318
38.088	1303.538
38.802	1675.978
39.230	1163.874
39.230	884.545
40.514	1489.758
41.227	1117.318
41.655	2001.863
42.225	1582.867
42.225	1256.983
42.511	1117.318
44.223	1256.983
44.223	1722.532
44.365	2048.416
45.364	2048.416
45.649	1675.978
46.362	2234.636
46.790	1396.647
47.504	2467.412
47.504	1908.752
48.217	2234.636
48.787	1815.643
48.787	1582.867
49.215	2746.741
49.501	2513.967
50.214	2048.416
50.499	3026.070
51.213	2653.632
51.641	2188.083
52.068	3165.737
52.924	2420.856
53.067	3026.070
53.923	2560.521
54.066	2700.185
54.351	3584.730
55.207	3072.626
55.492	4143.390
56.063	2746.741
56.348	3351.955
56.633	3817.506
56.919	4469.275
57.347	3258.846
58.203	4189.944
58.488	3584.730
59.629	4236.499
59.629	3491.621
59.772	4795.159
60.057	3770.950
60.770	4329.608
60.913	4189.944
61.912	6424.580
61.912	4888.268
61.912	3864.059
62.197	5633.147
62.340	4376.164
62.767	4096.835
63.338	5307.262
63.766	4888.268
63.766	4515.828
64.479	5446.926
64.765	4608.939
64.907	6378.027
65.193	5633.147
66.334	6145.251
66.334	6471.136
66.476	5819.367
67.618	6145.251
67.760	5726.258
68.188	5214.153
68.759	6890.131
69.757	7495.345
70.043	8286.778
70.471	6703.911
71.469	8147.114
71.755	7635.009
71.897	7355.680
72.183	9962.757
72.753	9031.657
72.753	6610.800
73.039	7169.460
73.752	7867.785
74.608	9776.537
74.750	9031.657
75.178	8286.778
76.320	8147.114
78.174	9683.426
82.026	13175.046
85.021	11685.289
87.589	12337.058
93.153	14059.590];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'Zisk2008';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;
weights.ab = 0 * weights.ab;

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
F1 = 'length-weight: Ww in g = 0.01122*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6G5MK'; % Cat of Life
metaData.links.id_ITIS = '167698'; % ITIS
metaData.links.id_EoL = '46579674'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_drummondhayi'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_drummondhayi'; % ADW
metaData.links.id_Taxo = '173896'; % Taxonomicon
metaData.links.id_WoRMS = '273848'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-drummondhayi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_drummondhayi}}';
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
bibkey = 'MathHunt1984'; type = 'Article'; bib = [ ... 
'doi = {10.1577/1548-8659(1984)113<607:gmaymf>2.0.co;2}, ' ...
'author = {Matheson, R. H. and Huntsman, G. R.}, ' ... 
'year = {1984}, ' ...
'title = {Growth, Mortality, and Yield-per-Recruit Models for Speckled Hind and Snowy Grouper from the {U}nited {S}tates {S}outh {A}tlantic {B}ight}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {113(5)}, ' ...
'pages = {607–616}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Zisk2008'; type = 'pdhthesis'; bib = [ ... 
'doi = {10.1577/1548-8659(1984)113<607:gmaymf>2.0.co;2}, ' ...
'author = {Gabriel Lee Ziskin}, ' ... 
'year = {2008}, ' ...
'title = {AGE, GROWTH AND REPRODUCTION OF SPECKLED HIND, \emph{Epinephelus drummondhayi}, OFF THE {A}TLANTIC COAST OF THE SOUTHEAST {U}NITED {S}TATES }, ' ...
'school = {College of Charleston}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Epinephelus-drummondhayi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

