function [data, auxData, metaData, txtData, weights] = mydata_Lactarius_lactarius
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Lactariidae';
metaData.species    = 'Lactarius_lactarius'; 
metaData.species_en = 'False trevally'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSE','MI'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'L0-Lt'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 07];

%% set data
% zero-variate data

data.ab = 6;  units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(27.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 40; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';     bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Appa1966';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3'; 
data.Wwp = 37; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01288*Lp^2.94, see F1';
data.Wwi = 661; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^2.94, see F1';
 
% uni-variate data
% length-length-period
LLt = [ ... % total length at t (cm), total length at t+dt (cm), time difference dt (d) 
    9.0 11.0  30
   11.0 18.0 180
    9.0 10.0  30
   10.0 12.0  30
   12.0 16.0  90
   16.0 18.0  60
    8.0 16.0 180
    8.0 15.0 150
    5.0  9.0 180
    5.0  6.0  30];
data.LdL = LLt(:,1:2); time.LdL = LLt(:,3); treat.LdL = {0, {'dt'}};
units.time.LdL = 'd'; label.time.LdL = 'time difference';
units.LdL   = {'cm', 'cm'};  label.LdL = {'total length at t', 'total length at t+dt'};  
temp.LdL    = C2K(27.6);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Appa1966';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
4.859	0.836
5.204	0.847
5.453	1.844
5.998	3.098
6.046	2.357
6.342	2.614
6.540	3.115
6.985	3.624
7.332	4.377
7.828	5.629
8.275	7.127
8.275	7.127
8.521	6.888
8.819	7.886
9.067	8.636
9.415	9.636
9.615	10.879
9.663	10.386
9.960	11.137
10.308	12.138
10.508	13.380
10.856	14.381
10.858	15.122
10.903	13.640
11.209	17.606
11.352	15.880
11.554	17.617
11.753	18.366
12.054	20.106
12.102	19.860
12.453	22.097
12.697	21.363
12.898	22.606
12.903	24.584
13.207	27.561
13.505	28.559
13.703	29.060
13.705	29.555
13.705	29.802
13.904	30.303
13.951	29.563
14.007	32.037
14.105	31.793
14.158	33.278
14.557	35.022
15.058	38.252
15.220	43.203
15.304	38.013
15.417	43.456
15.460	41.232
15.556	39.999
15.568	44.450
15.622	46.430
15.704	40.251
15.708	41.735
15.716	44.702
15.767	45.446
15.809	42.727
15.918	46.439
16.118	47.435
16.226	50.900
16.263	46.451
16.307	44.721
16.421	50.412
16.574	52.147
16.670	51.409
16.730	55.119
16.766	50.423
16.919	52.406
17.072	54.141
17.078	56.367
17.331	58.848
17.485	61.078
17.723	58.119
17.779	60.593
17.881	62.080
17.929	61.339
18.092	67.032
18.192	67.529
18.235	65.305
18.452	72.483
18.493	69.517
18.699	72.738
18.705	75.211
18.892	71.508
18.902	74.970
19.006	76.951
19.007	77.446
19.058	78.189
19.069	82.145
19.260	79.926
19.303	77.455
19.573	86.365
19.647	77.466
19.668	85.132
19.923	88.107
20.068	87.370
20.197	98.501
20.289	96.031
20.326	91.334
20.368	88.863
20.429	93.316
20.535	96.039
20.681	95.302
20.693	99.753
20.849	102.478
21.083	98.282
21.455	108.184
21.672	115.361
21.672	115.609
22.185	122.795
22.273	119.089
22.363	116.125
22.739	127.511
23.672	144.354
24.344	155.997
24.689	156.255];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'Appa1966';

% length-fecundity
data.LN = [ ... % total length (cm), fecindity (#)
    15.5  19155
    16.5  18102
    17.5  31726
    18.5  34184
    19.5  53012
    20.5  91037
    21.5 104195
    22.5  98335];
units.LN   = {'cm', '#'};  label.LN = {'total length', 'fecudity'};  
temp.LN    = C2K(27.6);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Appa1966';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 5 * weights.LdL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.time = time;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01288*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4NT25'; % Cat of Life
metaData.links.id_ITIS = '168556'; % ITIS
metaData.links.id_EoL = '46580695'; % Ency of Life
metaData.links.id_Wiki = 'Lactarius_lactarius'; % Wikipedia
metaData.links.id_ADW = 'Lactarius_lactarius'; % ADW
metaData.links.id_Taxo = '178032'; % Taxonomicon
metaData.links.id_WoRMS = '218381'; % WoRMS
metaData.links.id_fishbase = 'Lactarius-lactarius'; % fishbase642960

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lactarius_lactarius}}';
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
bibkey = 'Appa1966'; type = 'Article'; bib = [ ... 
'author = {Apparao, T.}, ' ... 
'year = {1966}, ' ...
'title = {On some aspects of the biology of \emph{Lactarius lactarius} ({S}chneider)}, ' ...
'journal = {Indian J. Fish.}, ' ...
'volume = {13}, ' ...
'pages = {334-349}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.org/Summary/Lactarius-lactarius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
