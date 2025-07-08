  function [data, auxData, metaData, txtData, weights] = mydata_Diplectrum_formosum
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Diplectrum_formosum'; 
metaData.species_en = 'Sand perch'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Hs'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'; 'Ww-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 07 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 01];

%% set data
% zero-variate data
data.ab = 7; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 24*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25.2);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12.9;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 30;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 3.44e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Bort1971';
  comment.Wwb = 'based on egg diameter of 0.875 mm: pi/6*0.087^3';
data.Wwp = 25.3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00912*Lp^3.10, see F1';
data.Wwi = 346;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.10, see F1';

data.Ri = 13e3/365; units.Ri = '#/d'; label.Ri = 'reproduction rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(25.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap=0.95';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (mm)
  0  32.317
  1  49.267
  2 109.901
  3 170.805
  4 187.707
  5 205.077
  6 213.412];
data.tL(:,1) = 365 * (0.3+data.tL(:,1)); % convert yr to d
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(25.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bort1971';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
2.199	1.000
3.247	1.441
3.653	1.921
4.093	2.402
4.432	1.921
4.804	0.961
5.073	4.323
5.277	2.402
5.547	3.362
6.222	6.244
6.561	6.724
6.831	6.724
7.101	7.685
7.641	10.086
7.844	11.047
8.317	12.008
8.349	15.370
8.585	16.811
8.857	14.890
9.091	18.732
9.195	15.370
9.798	24.976
9.801	20.653
9.935	22.094
10.204	25.937
10.337	29.779
10.777	29.299
10.846	27.378
11.012	32.181
11.077	36.984
11.279	38.425
11.282	33.141
12.324	45.629
12.354	51.393
12.453	55.716
13.653	85.495
13.763	72.046
13.903	64.361
14.001	70.605
14.134	73.967
14.530	89.818
14.769	86.455
14.973	85.014
15.103	93.660
15.328	112.872
15.743	99.424
15.982	95.101
16.333	130.163
16.405	123.919
16.698	141.691
17.018	116.234
17.024	163.305
17.443	142.171
17.448	133.525
17.716	137.848
17.779	145.053
17.802	163.785
17.809	151.777
17.968	168.588
18.011	154.179
18.039	162.824
18.110	157.541
18.117	145.533
18.225	135.447
18.342	165.226
18.383	154.179
18.436	177.233
18.447	159.462
18.477	165.706
18.540	174.352
18.595	194.525
18.677	170.509
18.709	174.832
18.911	176.273
18.973	185.399
19.011	178.194
19.112	207.493
19.362	212.536
19.368	203.890
19.423	169.549
19.462	215.418
19.513	186.840
19.549	184.438
19.570	204.611
19.620	178.194
19.677	196.446
19.761	224.784
19.818	215.418
19.849	192.123
19.872	208.934
20.009	234.150
20.027	205.331
20.115	226.945
20.117	195.485
20.169	221.182
20.325	215.418
20.328	211.095
20.388	195.005
20.408	245.677
20.616	237.752
20.783	213.977
20.809	255.043
21.059	260.086
21.160	260.807
21.482	232.709
21.617	261.527
21.756	282.421
21.760	277.378
21.827	332.853
22.216	278.818
22.378	261.527];
units.LW = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'Bort1971';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;
weights.Ri = weights.Ri * 0;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00912*(TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Simultaenous hermaphrodite'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'SDMZ'; % Cat of Life
metaData.links.id_ITIS = '167740'; % ITIS
metaData.links.id_EoL = '65059019'; % Ency of Life
metaData.links.id_Wiki = 'Diplectrum_formosum'; % Wikipedia
metaData.links.id_ADW = 'Diplectrum_formosum'; % ADW
metaData.links.id_Taxo = '166795'; % Taxonomicon
metaData.links.id_WoRMS = '279148'; % WoRMS
metaData.links.id_fishbase = 'Diplectrum-formosum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Diplectrum_formosum}}';  
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
bibkey = 'Bort1971'; type = 'Article'; bib = [ ...
'author = {Bortone, S.A.}, ' ...
'year = {1971}, ' ...
'title = {Studies on the biology of the sand perch, \emph{Diplectum formosus} ({P}erciformes, {S}erranidae)}, ' ... 
'journal = {Tech. Ser. Fla. Dep. Nat. Res.}, ' ...
'volume = {65}, '...
'pages = {1-27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Diplectrum-formosum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

