function [data, auxData, metaData, txtData, weights] = mydata_Scomber_colias

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Scomber_colias'; 
metaData.species_en = 'Atlantic chub mackerel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA','MAm','MAbl'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.5); % K, body temp
metaData.data_0     = {'ab';  'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 03];

%% set data
% zero-variate data

data.ab = 2;        units.ab = 'd';   label.ab = 'age at birth'; bibkey.ab = 'fishbase';   
  temp.ab = C2K(22.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(22.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 21.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 55;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 6e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.05 mm: pi/6*0.105^3';
data.Wwp = 78.5;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00741*Lp^3.03, see F1';
data.Wwi = 1.39e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00741*Li^3.03, see F1';

data.Ri  = 494500/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(22.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    0  9.8
    1 18.93
    2 27.33
    3 32.06
    4 36.61
    5 40.21
    6 43.69
    7 46.36
    8 48.64
    9 50.93
   10 52.20
   11 53.83
   12 55.69
   13 56.57];
data.tL(:,1) = (data.tL(:,1)+0.5)*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(22.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CarvPerr2022';

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
9.091	8.941
23.153	142.902
23.853	159.574
24.413	176.236
25.535	238.652
25.743	205.420
25.884	230.364
26.307	313.511
27.497	326.060
28.824	297.061
28.892	259.664
28.967	359.409
29.593	301.271
29.875	338.693
30.573	317.962
30.925	359.545
31.131	272.286
31.553	326.341
31.903	351.301
32.185	388.723
32.326	434.447
32.393	359.646
32.397	451.075
32.468	480.171
32.746	422.008
33.097	455.280
33.866	463.644
33.935	447.026
34.003	388.849
34.144	409.638
34.988	530.216
35.057	496.974
35.268	546.858
35.901	630.019
36.108	551.072
36.114	688.216
36.179	571.857
36.315	484.593
36.326	733.945
36.738	580.207
36.741	638.389
36.883	696.581
37.020	613.473
37.027	771.396
37.092	663.348
37.649	621.829
37.860	634.311
37.862	688.337
38.005	767.308
38.071	671.728
38.144	729.915
38.216	788.102
38.633	721.637
38.635	767.351
38.840	671.781
38.986	800.622
39.063	954.394
39.198	850.507
39.334	767.400
39.621	933.654
39.686	813.138
39.899	904.582
39.963	750.820
40.108	879.661
40.312	738.377
40.314	788.247
40.386	846.434
40.458	883.841
40.597	858.916
40.734	800.744
41.091	962.846
41.151	746.746
41.155	829.864
41.298	908.835
41.370	958.710
41.512	987.810
41.575	850.672
41.584	1050.153
41.793	1016.921
41.997	904.727
42.064	817.459
42.069	933.823
42.074	1050.187
42.141	983.698
42.285	1079.293
43.125	1100.130
43.189	979.615
43.190	1000.394
43.550	1237.302
43.823	1066.932
43.897	1170.833
43.966	1137.591
43.969	1208.240
43.977	1386.942
44.243	1079.428
44.250	1233.195
44.951	1278.958
45.010	1042.079
45.017	1183.378
45.087	1204.162
45.437	1212.498
45.794	1370.445
45.930	1283.181
46.002	1328.901
46.071	1316.438
46.206	1191.772
47.119	1291.575
47.121	1341.446
47.131	1570.018
47.197	1466.126
48.173	1412.168];
units.LW   = {'cm', 'g'};  label.LW = {'fork length','weight'};  
bibkey.LW = 'CarvPerr2022';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: W in g = 0.00741*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VTRW'; % Cat of Life
metaData.links.id_ITIS = '172413'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scomber_colias'; % Wikipedia
metaData.links.id_ADW = 'Scomber_colias'; % ADW
metaData.links.id_Taxo = '187059'; % Taxonomicon
metaData.links.id_WoRMS = '151174'; % WoRMS
metaData.links.id_fishbase = 'Scomber-colias'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...187059
'howpublished = {\url{http://en.wikipedia.org/wiki/Scomber_colias}}';
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
bibkey = 'CarvPerr2022'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2005.00868.x}, ' ...
'author = {Carvalho, N. and R.G. Perrota and E.J. I Sidro}, ' ... 
'year = {2002}, ' ...
'title = {Age, growth and maturity in the chub mackerel (\emph{Scomber japonicus} {H}outtuyn, 1782) from the {A}zores Arquip\''{e}lago}, ' ...
'journal = {Life and Marine Sciences}, ' ...
'volume = {19A}, ' ...
'pages = {93-99}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Scomber-colias.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
