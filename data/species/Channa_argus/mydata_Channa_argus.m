function [data, auxData, metaData, txtData, weights] = mydata_Channa_argus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anabantiformes'; 
metaData.family     = 'Channidae';
metaData.species    = 'Channa_argus'; 
metaData.species_en = 'Northern snakehead'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'Ww-JX_T'; 'Ww-r_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 03 09];              
metaData.email    = {'bas.kooijan@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 09]; 


%% set data
% zero-variate data

data.ab = 1.5;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ReahGala2018';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 100;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.3e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 216;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 8e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.Ri  = 115e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'ReahGala2018';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% weight-food consumption
data.WJX10 = [ ... % body weight (g) food consumption (g/d)
44.910	0.883
90.997	0.016
115.119	1.145
169.941	1.530
269.014	0.173
325.744	1.933
339.330	1.185
414.548	0.574
469.424	1.333
500.339	2.089];
units.WJX10   = {'g', 'g/d'};  label.WJX10 = {'wet weight', 'food consumption', '10 C'};  
temp.WJX10    = C2K(10);  units.temp.WJX10 = 'K'; label.temp.WJX10 = 'temperature';
bibkey.WJX10 = 'LiuCui1998';
comment.WJX10 = 'Data for 10C';
%
data.WJX15 = [ ... % body weight (g) food consumption (g/d)
54.545	0.923
96.364	1.315
132.727	0.508
220.000	3.424
270.909	0.615
305.455	1.675
350.909	2.333
429.091	3.118
452.727	1.380
569.091	4.691];
units.WJX15   = {'g', 'g/d'};  label.WJX15 = {'wet weight', 'food consumption', '15 C'};  
temp.WJX15    = C2K(15);  units.temp.WJX15 = 'K'; label.temp.WJX15 = 'temperature';
bibkey.WJX15 = 'LiuCui1998';
comment.WJX15 = 'Data for 15C';
%
data.WJX20 = [ ... % body weight (g) food consumption (g/d)
58.245	3.575
137.139	5.937
155.012	7.245
216.209	5.951
316.267	13.665
320.203	9.100
343.789	6.104
373.646	15.371
454.737	12.385
569.631	13.970];
units.WJX20   = {'g', 'g/d'};  label.WJX20 = {'wet weight', 'food consumption', '20 C'};  
temp.WJX20    = C2K(20);  units.temp.WJX20 = 'K'; label.temp.WJX20 = 'temperature';
bibkey.WJX20 = 'LiuCui1998';
comment.WJX20 = 'Data for 20C';
%
data.WJX25 = [ ... % body weight (g) food consumption (g/d)
54.713	5.044
112.644	7.854
152.874	6.917
220.460	12.302
238.161	14.761
259.080	9.610
374.943	15.112
465.057	12.771
479.540	22.371
539.080	18.624];
units.WJX25   = {'g', 'g/d'};  label.WJX25 = {'wet weight', 'food consumption', '25 C'};  
temp.WJX25    = C2K(25);  units.temp.WJX25 = 'K'; label.temp.WJX25 = 'temperature';
bibkey.WJX25 = 'LiuCui1998';
comment.WJX25 = 'Data for 25C';
%
data.WJX30 = [ ... % body weight (g) food consumption (g/d)
89.389	5.886
161.097	8.221
221.964	11.329
283.112	10.694
331.487	12.638
376.259	14.711
398.132	10.585
442.546	17.432
483.492	22.600
546.514	20.934];
units.WJX30   = {'g', 'g/d'};  label.WJX30 = {'wet weight', 'food consumption', '30 C'};  
temp.WJX30    = C2K(30);  units.temp.WJX30 = 'K'; label.temp.WJX30 = 'temperature';
bibkey.WJX30 = 'LiuCui1998';
comment.WJX30 = 'Data for 30C';
%
data.WJX35 = [ ... % body weight (g) food consumption (g/d)
65.730	5.534
82.133	5.015
121.984	6.979
172.893	6.989
211.163	5.822
278.227	8.573
307.367	7.927
368.888	11.851
415.644	9.939
498.036	13.275];
units.WJX35   = {'g', 'g/d'};  label.WJX35 = {'wet weight', 'food consumption', '35 C'};  
temp.WJX35    = C2K(35);  units.temp.WJX35 = 'K'; label.temp.WJX35 = 'temperature';
bibkey.WJX35 = 'LiuCui1998';
comment.WJX35 = 'Data for 35C';
 
% weight-spec growth rate
data.Wr10 = [ ... % body weight (g), specific growth rate (%/d)
48.969	0.081
92.852	0.030
118.449	0.005
171.306	0.403
270.193	-0.122
324.974	0.012
343.270	-0.040
414.509	0.069
473.023	-0.008
500.428	0.019];
units.Wr10   = {'g', '%/d'};  label.Wr10 = {'wet weight', 'specific growth rate', '10 C'};  
temp.Wr10    = C2K(10);  units.temp.Wr10 = 'K'; label.temp.Wr10 = 'temperature';
bibkey.Wr10 = 'LiuCui1998';
comment.Wr10 = 'Data for 10C, ad lib food';
%
data.Wr15 = [ ... % body weight (g), specific growth rate (%/d)
54.830	0.342
100.522	0.263
129.765	0.184
221.149	0.447
270.496	0.184
305.222	0.237
349.086	0.342
427.676	0.316
451.436	0.132
568.407	0.447];
units.Wr15   = {'g', '%/d'};  label.Wr15 = {'wet weight', 'specific growth rate', '15 C'};  
temp.Wr15    = C2K(15);  units.temp.Wr15 = 'K'; label.temp.Wr15 = 'temperature';
bibkey.Wr15 = 'LiuCui1998';
comment.Wr15 = 'Data for 15C, ad lib food';
%
data.Wr20 = [ ... % body weight (g), specific growth rate (%/d)
56.658	1.686
137.076	1.374
157.180	1.427
217.493	1.482
316.188	0.880
327.154	1.486
343.603	0.460
369.191	0.909
455.091	0.780
570.235	0.758];
units.Wr20   = {'g', '%/d'};  label.Wr20 = {'wet weight', 'specific growth rate', '20 C'};  
temp.Wr20    = C2K(20);  units.temp.Wr20 = 'K'; label.temp.Wr20 = 'temperature';
bibkey.Wr20 = 'LiuCui1998';
comment.Wr20 = 'Data for 20C, ad lib food';
%
data.Wr25 = [ ... % body weight (g), specific growth rate (%/d)
65.226	2.910
127.367	2.910
164.201	2.143
232.018	1.614
250.179	1.931
275.873	1.640
381.975	1.376
473.581	0.767
488.096	1.058
541.195	0.794];
units.Wr25   = {'g', '%/d'};  label.Wr25 = {'wet weight', 'specific growth rate', '25 C'};  
temp.Wr25    = C2K(25);  units.temp.Wr25 = 'K'; label.temp.Wr25 = 'temperature';
bibkey.Wr25 = 'LiuCui1998';
comment.Wr25 = 'Data for 25C, ad lib food';
%
data.Wr30 = [ ... % body weight (g), specific growth rate (%/d)
87.728	2.898
159.008	2.611
222.977	2.535
283.290	1.853
334.465	1.671
371.018	1.435
394.778	0.857
444.125	1.254
484.334	0.860
544.648	0.810];
units.Wr30   = {'g', '%/d'};  label.Wr30 = {'wet weight', 'specific growth rate', '30 C'};  
temp.Wr30    = C2K(30);  units.temp.Wr30 = 'K'; label.temp.Wr30 = 'temperature';
bibkey.Wr30 = 'LiuCui1998';
comment.Wr30 = 'Data for 30C, ad lib food';
%
data.Wr35 = [ ... % body weight (g), specific growth rate (%/d)
102.752	2.435
106.264	2.827
152.233	2.068
192.538	1.806
271.109	1.859
287.577	1.806
309.614	1.518
346.292	1.178
392.022	1.073
614.999	1.073];
units.Wr35   = {'g', '%/d'};  label.Wr35 = {'wet weight', 'specific growth rate', '35 C'};  
temp.Wr35    = C2K(35);  units.temp.Wr35 = 'K'; label.temp.Wr35 = 'temperature';
bibkey.Wr35 = 'LiuCui1998';
comment.Wr35 = 'Data for 35C, ad lib food';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'WJX35','WJX30','WJX25','WJX20','WJX15','WJX10',}; subtitle1 = {'Data for 35, 30, 25, 20, 15, 10C'};
set2 = {'Wr35','Wr30','Wr25','Wr20','Wr15','Wr10'}; subtitle2 = {'Data for 35, 30, 25, 20, 15, 10C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Facts
% F1 = '';
% metaData.bibkey.F1 = 'fishbase'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'TM2L'; % Cat of Life
metaData.links.id_ITIS = '166680'; % ITIS
metaData.links.id_EoL = '204003'; % Ency of Life
metaData.links.id_Wiki = 'Channa_argus'; % Wikipedia
metaData.links.id_ADW = 'Channa_argus'; % ADW
metaData.links.id_Taxo = '192521'; % Taxonomicon
metaData.links.id_WoRMS = '594763'; % WoRMS
metaData.links.id_fishbase = 'Channa-argus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Channa_argus}}';
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
bibkey = 'LiuCui1998'; type = 'Article'; bib = [ ... 
'author = {J. Liu and Y. Cui and J. Liu}, ' ... 
'year = {1998}, ' ...
'title = {Food consumption and growth of two piscivorous fishes, the mandarin fish and the {C}hinese snakehead}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {53}, ' ...
'pages = {1071-1083}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReahGala2018'; type = 'Article'; bib = [ ... 
'doi = {10.7717/peerj.4581}, ' ...
'author = {Carlee A. Resh and Matthew P. Galaska and Andrew R. Mahon}, ' ... 
'year = {2018}, ' ...
'title = {Genomic analyses of {N}orthern snakehead (\emph{Channa argus}) populations in {N}orth {A}merica}, ' ...
'journal = {PeerJ}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {https://www.fishbase.de/summary/Channa-argus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

