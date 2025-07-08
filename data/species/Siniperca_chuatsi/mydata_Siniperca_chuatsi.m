function [data, auxData, metaData, txtData, weights] = mydata_Siniperca_chuatsi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Percichthyidae';
metaData.species    = 'Siniperca_chuatsi'; 
metaData.species_en = 'Mandarin fish'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
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

data.ab = 1;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'fao';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '20 to 30 h';
data.am = 9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.4; units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'fao';  
data.Lp  = 20;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 70;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fao';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 187;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 8e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.Ri  = 2e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fao';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'max nr of eggs: 30000; 1 broods/year';

% uni-variate data
% weight-food consumption
data.WJX10 = [ ... % body weight (g) food consumption (g/d)
51.732	0.912
72.748	0.908
124.480	1.379
172.979	1.251
206.928	1.365
211.778	1.124
286.143	2.312
376.674	3.016
415.473	1.089
546.420	2.867];
units.WJX10   = {'g', 'g/d'};  label.WJX10 = {'wet weight', 'food consumption', '10 C'};  
temp.WJX10    = C2K(10);  units.temp.WJX10 = 'K'; label.temp.WJX10 = 'temperature';
bibkey.WJX10 = 'LiuCui1998';
comment.WJX10 = 'Data for 10C';
%
data.WJX15 = [ ... % body weight (g) food consumption (g/d)
71.563	3.668
124.451	2.699
141.066	3.656
144.624	7.255
182.486	4.369
223.939	5.562
319.853	4.585
404.407	6.851
432.630	8.166
495.894	13.675];
units.WJX15   = {'g', 'g/d'};  label.WJX15 = {'wet weight', 'food consumption', '15 C'};  
temp.WJX15    = C2K(15);  units.temp.WJX15 = 'K'; label.temp.WJX15 = 'temperature';
bibkey.WJX15 = 'LiuCui1998';
comment.WJX15 = 'Data for 15C';
%
data.WJX20 = [ ... % body weight (g) food consumption (g/d)
72.321	3.662
99.868	4.612
200.218	6.386
250.558	9.721
294.255	10.430
354.118	11.136
402.817	14.113
420.431	11.602
506.272	13.976
540.253	14.448];
units.WJX20   = {'g', 'g/d'};  label.WJX20 = {'wet weight', 'food consumption', '20 C'};  
temp.WJX20    = C2K(20);  units.temp.WJX20 = 'K'; label.temp.WJX20 = 'temperature';
bibkey.WJX20 = 'LiuCui1998';
comment.WJX20 = 'Data for 20C';
%
data.WJX25 = [ ... % body weight (g) food consumption (g/d)
64.202	4.961
125.505	6.020
208.590	10.996
241.908	14.198
337.708	11.568
372.991	19.285
407.448	15.002
420.981	19.277
513.496	17.004
564.796	16.995];
units.WJX25   = {'g', 'g/d'};  label.WJX25 = {'wet weight', 'food consumption', '25 C'};  
temp.WJX25    = C2K(25);  units.temp.WJX25 = 'K'; label.temp.WJX25 = 'temperature';
bibkey.WJX25 = 'LiuCui1998';
comment.WJX25 = 'Data for 25C';
%
data.WJX30 = [ ... % body weight (g) food consumption (g/d)
104.066	6.164
217.358	8.055
246.835	13.662
293.925	16.758
324.480	14.365
332.418	12.214
361.791	16.269
423.367	18.408
462.141	18.043
549.679	21.610];
units.WJX30   = {'g', 'g/d'};  label.WJX30 = {'wet weight', 'food consumption', '30 C'};  
temp.WJX30    = C2K(30);  units.temp.WJX30 = 'K'; label.temp.WJX30 = 'temperature';
bibkey.WJX30 = 'LiuCui1998';
comment.WJX30 = 'Data for 30C';
%
data.WJX35 = [ ... % body weight (g) food consumption (g/d)
106.531	5.904
111.652	8.160
154.784	9.698
196.113	9.097
279.158	13.479
287.563	15.378
314.237	18.225
350.545	16.793
403.475	16.428
615.727	22.689];
units.WJX35   = {'g', 'g/d'};  label.WJX35 = {'wet weight', 'food consumption', '35 C'};  
temp.WJX35    = C2K(35);  units.temp.WJX35 = 'K'; label.temp.WJX35 = 'temperature';
bibkey.WJX35 = 'LiuCui1998';
comment.WJX35 = 'Data for 35C';
 
% weight-spec growth rate
data.Wr10 = [ ... % body weight (g), specific growth rate (%/d)
49.377	0.615
74.452	0.419
122.465	0.587
174.527	0.223
214.912	0.223
214.998	0.000
289.912	0.223
378.406	0.140
420.778	-0.028
553.449	0.028];
units.Wr10   = {'g', '%/d'};  label.Wr10 = {'wet weight', 'specific growth rate', '10 C'};  
temp.Wr10    = C2K(10);  units.temp.Wr10 = 'K'; label.temp.Wr10 = 'temperature';
bibkey.Wr10 = 'LiuCui1998';
comment.Wr10 = 'Data for 10C, ad lib food';
%
data.Wr15 = [ ... % body weight (g), specific growth rate (%/d)
83.514	1.288
137.405	0.788
150.819	0.816
152.447	1.570
191.156	0.650
235.212	0.792
329.354	0.348
415.804	-0.039
444.260	0.772
503.915	0.244];
units.Wr15   = {'g', '%/d'};  label.Wr15 = {'wet weight', 'specific growth rate', '15 C'};  
temp.Wr15    = C2K(15);  units.temp.Wr15 = 'K'; label.temp.Wr15 = 'temperature';
bibkey.Wr15 = 'LiuCui1998';
comment.Wr15 = 'Data for 15C, ad lib food';
%
data.Wr20 = [ ... % body weight (g), specific growth rate (%/d)
61.538	2.028
90.385	1.667
190.385	1.194
238.462	1.500
288.462	1.167
344.231	0.944
394.231	0.861
413.462	0.694
500.000	1.000
536.538	0.889];
units.Wr20   = {'g', '%/d'};  label.Wr20 = {'wet weight', 'specific growth rate', '20 C'};  
temp.Wr20    = C2K(20);  units.temp.Wr20 = 'K'; label.temp.Wr20 = 'temperature';
bibkey.Wr20 = 'LiuCui1998';
comment.Wr20 = 'Data for 20C, ad lib food';
%
data.Wr25 = [ ... % body weight (g), specific growth rate (%/d)
64.637	2.852
120.456	2.323
206.692	2.494
243.247	2.188
335.718	1.103
373.570	2.417
402.873	1.022
412.033	2.139
508.233	1.333
558.266	0.888];
units.Wr25   = {'g', '%/d'};  label.Wr25 = {'wet weight', 'specific growth rate', '25 C'};  
temp.Wr25    = C2K(25);  units.temp.Wr25 = 'K'; label.temp.Wr25 = 'temperature';
bibkey.Wr25 = 'LiuCui1998';
comment.Wr25 = 'Data for 25C, ad lib food';
%
data.Wr30 = [ ... % body weight (g), specific growth rate (%/d)
94.231	4.588
205.769	3.462
236.538	2.802
284.615	2.363
313.462	1.291
321.154	1.648
350.000	1.401
413.462	1.291
451.923	1.071
546.154	1.209];
units.Wr30   = {'g', '%/d'};  label.Wr30 = {'wet weight', 'specific growth rate', '30 C'};  
temp.Wr30    = C2K(30);  units.temp.Wr30 = 'K'; label.temp.Wr30 = 'temperature';
bibkey.Wr30 = 'LiuCui1998';
comment.Wr30 = 'Data for 30C, ad lib food';
%
data.Wr35 = [ ... % body weight (g), specific growth rate (%/d)
99.726	2.435
103.562	2.822
149.589	2.050
189.863	1.831
272.329	1.862
283.836	1.807
306.849	1.532
341.370	1.174
393.151	1.093
607.945	1.074];
units.Wr35   = {'g', '%/d'};  label.Wr35 = {'wet weight', 'specific growth rate', '35 C'};  
temp.Wr35    = C2K(35);  units.temp.Wr35 = 'K'; label.temp.Wr35 = 'temperature';
bibkey.Wr35 = 'LiuCui1998';
comment.Wr35 = 'Data for 35C, ad lib food';

%% set weights for all real data
weights = setweights(data, []);

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

%% Links
metaData.links.id_CoL = '4XKDW'; % Cat of Life
metaData.links.id_ITIS = '641911'; % ITIS
metaData.links.id_EoL = '613258'; % Ency of Life
metaData.links.id_Wiki = 'Siniperca_chuatsi'; % Wikipedia
metaData.links.id_ADW = 'Siniperca_chuatsi'; % ADW
metaData.links.id_Taxo = '187742'; % Taxonomicon
metaData.links.id_WoRMS = '1021545'; % WoRMS
metaData.links.id_fishbase = 'Siniperca-chuatsi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Siniperca_chuatsi}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {https://www.fishbase.de/summary/Siniperca-chuatsi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fao'; type = 'Misc'; bib = ...
'howpublished = {http://www.fao.org/fishery/culturedspecies/Siniperca_chuatsi/en}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

