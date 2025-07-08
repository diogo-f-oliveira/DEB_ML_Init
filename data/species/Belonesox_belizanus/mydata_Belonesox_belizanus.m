  function [data, auxData, metaData, txtData, weights] = mydata_Belonesox_belizanus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Poeciliidae';
metaData.species    = 'Belonesox_belizanus'; 
metaData.species_en = 'Pike topminnow'; 

metaData.ecoCode.climate = {'Aw','Af','Cfa'};
metaData.ecoCode.ecozone = {'TN','THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 07 31];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU Univ. Amsterdam'};      

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc    = [2020 07 31]; 

%% set data
% zero-variate data
data.tp = 163;        units.tp = 'd';  label.tp = 'age at puberty';        bibkey.tp = 'TurnSnel1984';
  temp.tp = C2K(26); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 84;        units.tpm = 'd';  label.tpm = 'age at puberty for males';        bibkey.tpm = 'TurnSnel1984';
  temp.tpm = C2K(26); units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 3.5*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'guess';
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 1.62;  units.Lb = 'cm';  label.Lb = 'total length at birth';  bibkey.Lb = 'TurnSnel1984';
  comment.Lb = 'based on SL 1.4 cm, see F2: 0.97*1.4 + 0.262';
data.Lp = 7.5;  units.Lp = 'cm';  label.Lp = 'mean total length at puberty';  bibkey.Lp = 'TurnSnel1984';
  comment.Lp = 'based on SL 6.2 of LN data, mean TL is however 10.1 cm';
data.Lpm = 6.1;  units.Lpm = 'cm';  label.Lpm = 'total length at puberty for male';  bibkey.Lpm = 'TurnSnel1984';
data.Li = 20;  units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'Wiki';
data.Lim = 10; units.Lim = 'cm'; label.Lim = 'ultimate total length for male';  bibkey.Lim = 'Wiki';

data.Wwb = 0.0206;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'TurnSnel1984';   
  comment.Wwb = 'based on egg diameter of 3.4 mm: pi/6*0.34^3';
data.Wwp = 4; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','TurnSnel1984'};
   comment.Wwp = 'based on 0.00724*Lp^3.14, see F1';
data.Wwi = 88; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
   comment.Wwi = 'based on 0.00724*Li^3.14, see F1';
data.Wwim = 10; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';      bibkey.Wwim = 'fishbase';
   comment.Wwim = 'based on 0.00724*Lim ^3.14, see F1';
   
% univariate data% length = fertility
data.LN = [ ... std length (cm), litter size (#)
6.166	22.035
7.121	43.376
7.122	32.844
7.125	11.780
7.275	44.231
7.402	19.962
7.511	7.841
7.568	49.177
7.692	43.541
7.821	3.879
7.825	88.140
7.875	63.039
7.999	53.353
8.050	24.200
8.075	68.768
8.075	63.097
8.082	13.677
8.096	19.353
8.117	97.137
8.160	4.788
8.172	33.148
8.193	107.691
8.201	48.550
8.204	23.435
8.340	43.729
8.476	72.125
8.477	58.352
8.542	33.255
8.661	72.988
8.683	20.333
8.695	45.452
8.696	39.781
8.785	68.163
8.787	53.580
8.839	9.845
8.869	129.762
8.951	98.188
9.096	53.670
9.102	120.107
9.108	80.409
9.110	65.016
9.145	27.758
9.166	102.301
9.254	140.405
9.266	48.858
9.284	28.609
9.305	103.152
9.333	124.225
9.376	38.357
9.386	76.439
9.461	89.424
9.502	133.996
9.509	79.715
9.510	72.424
9.545	44.888
9.580	9.250
9.610	135.647
9.673	128.374
9.701	143.776
9.712	64.380
9.750	123.535
9.757	73.306
9.846	104.118
9.901	36.889
9.991	53.929
10.113	68.547
10.123	109.060
10.124	100.958
10.254	54.005
10.349	32.157
10.360	64.568
10.363	43.504
10.400	113.191
10.475	131.036
10.499	64.608
10.502	45.165
10.661	128.660
10.825	174.077
10.825	55.790
11.029	28.303
11.059	33.173
11.102	176.588
11.108	134.460
11.114	200.897
11.161	83.434
11.175	89.920
11.371	130.485
11.378	196.112
11.505	168.603
11.593	84.369
11.708	150.027
11.928	118.494
11.986	149.298
12.163	94.256
12.201	154.221
12.348	210.977
12.375	129.156
12.442	88.666
12.514	122.715
12.537	68.439
12.776	128.462
12.992	129.334
13.015	194.156
13.033	174.716
13.066	155.282
13.137	204.723
13.197	99.417
13.266	163.441
13.276	81.616
13.355	190.203
13.401	73.550
13.433	62.217
13.434	55.735
13.437	149.718
13.438	264.764
13.506	214.552
13.616	84.954
13.655	254.295
13.674	114.138
13.709	315.884
13.731	145.752
13.821	166.032
13.967	115.033
14.103	134.517
14.153	111.036
14.316	159.694
14.408	165.392
14.498	303.960
14.555	218.097
14.604	199.477
14.682	193.828
14.696	321.031
14.790	194.669];
data.LN(:,1) = data.LN(:,1)/ 0.82; % convert SL to TL
units.LN = {'cm','#'};  label.LN = {'total length','litter size'};     bibkey.LN = 'TurnSnel1984';
temp.LN = C2K(26); units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
comment.LN = 'Litter interval of 40 d';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am}, E_Hp and [p_M] only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight length relationship: Ww in g = 0.00724 * (TL in cm)^3.14'; 
  metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length relationship from photo: SL = 0.82 * TL; for neonates: TL in cm = 0.97 * (SL in cm) + 0.262';
    metaData.bibkey.F2 = 'TurnSnel1984';
F3 = 'Neonates are directly piscivorous';
    metaData.bibkey.F3 = 'TurnSnel1984';
F4 = 'Ovoviviparous; minimum sperm storage estimate: 80-83 days; among the most fecund of poeciliid fishes';
metaData.bibkey.F4 = 'TurnSnel1984';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '5WGFZ'; % Cat of Life
metaData.links.id_ITIS = '165913'; % ITIS
metaData.links.id_EoL = '46566812'; % Ency of Life
metaData.links.id_Wiki = 'Belonesox_belizanus'; % Wikipedia
metaData.links.id_ADW = 'Belonesox_belizanus'; % ADW
metaData.links.id_Taxo = '44571'; % Taxonomicon
metaData.links.id_WoRMS = '279891'; % WoRMS
metaData.links.id_fishbase = 'Belonesox-belizanus'; % fishbase


%% References

bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Belonesox-belizanus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Belonesox_belizanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/belonesox%20belizanus.htm}}';
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
bibkey = 'TurnSnel1984'; type = 'Article'; bib = [ ...  
'author = {James S. Turner and Franklin F. Snelson}, ' ...
'year = {1984}, ' ...
'title = {Population structure, reproduction and laboratory behavior of the introduced \emph{Belonesox belizanus} ({P}oeciliidae) in {F}lorida}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {10(l/2)}, '...
'pages = {89-100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

