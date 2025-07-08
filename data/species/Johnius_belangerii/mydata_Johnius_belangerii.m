function [data, auxData, metaData, txtData, weights] = mydata_Johnius_belangerii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Johnius_belangerii'; 
metaData.species_en = 'Belanger''s croaker'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 02 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 23];

%% set data
% zero-variate data

data.am = 7*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(28.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 17.5;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'DengLiao2024';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Johnius_coitor: pi/6*0.08^3';
data.Wwi = 126; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'DengLiao2024';

data.Ri = 121849/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(28.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Johnius_coitor';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0  8.0
1  9.9
2 11.2];
data.tL(:,1) = (0.9 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'YeZhan2014';

% length-weight
data.LW = [ ... %
2.708	0.377
3.452	0.389
4.226	1.067
4.822	0.744
5.030	2.078
5.209	2.746
5.239	3.412
5.477	3.083
5.566	4.415
5.804	3.088
5.804	3.421
6.013	4.422
6.281	4.426
6.430	4.762
6.519	5.428
6.638	4.100
6.757	6.097
6.787	7.095
7.026	8.429
7.084	4.440
7.114	5.438
7.293	7.436
7.382	6.108
7.443	9.766
7.443	12.427
7.472	6.109
7.560	4.448
7.651	8.107
7.710	10.103
7.740	6.779
7.889	12.102
8.008	9.443
8.216	10.112
8.275	7.785
8.277	13.438
8.366	12.775
8.574	10.118
8.604	13.776
8.723	11.450
8.813	15.775
8.991	12.453
9.050	10.126
9.080	14.449
9.111	19.105
9.230	16.114
9.231	20.770
9.408	17.115
9.437	13.458
9.438	14.788
9.557	16.452
9.558	19.778
9.647	18.782
9.765	15.126
9.767	22.109
9.885	19.118
10.004	17.790
10.005	23.111
10.094	22.115
10.125	26.106
10.153	17.793
10.214	27.437
10.272	20.787
10.275	32.759
10.362	24.114
10.421	21.455
10.453	30.102
10.661	29.772
10.689	19.797
10.749	22.125
10.779	25.784
10.869	30.108
10.898	24.456
10.929	27.782
11.047	26.121
11.078	29.447
11.137	30.445
11.165	22.132
11.168	33.106
11.198	37.430
11.314	21.137
11.315	24.463
11.345	27.124
11.376	30.449
11.406	32.778
11.554	28.125
11.555	34.775
11.612	23.470
11.615	38.102
11.703	30.455
11.763	32.784
11.792	28.129
11.912	34.781
11.913	36.444
11.913	40.767
11.941	29.794
11.975	50.412
12.122	42.433
12.149	30.795
12.151	39.108
12.179	31.793
12.180	34.121
12.181	37.114
12.301	42.769
12.388	32.462
12.418	36.120
12.419	39.445
12.477	31.465
12.510	49.091
12.567	35.125
12.568	41.443
12.687	38.120
12.718	43.773
12.746	35.460
12.837	47.433
12.867	45.439
12.896	41.116
12.987	50.096
13.014	39.123
13.047	54.753
13.105	47.438
13.164	42.783
13.164	44.778
13.222	38.129
13.226	53.426
13.227	58.414
13.255	51.763
13.284	48.438
13.492	45.782
13.494	54.428
13.554	59.417
13.555	63.407
13.671	50.108
13.702	53.766
13.760	46.451
13.819	45.122
13.910	51.442
13.911	58.093
14.059	52.442
14.061	62.086
14.063	71.064
14.119	55.436
14.149	59.094
14.151	66.743
14.267	51.780
14.268	56.436
14.359	62.423
14.359	64.418
14.387	58.433
14.566	59.101
14.596	61.762
14.625	55.112
14.658	69.079
14.715	58.771
14.776	67.086
14.924	64.428
15.015	71.080
15.017	78.729
15.163	68.422
15.312	67.427
15.402	71.752
15.408	100.350
15.493	79.069
15.581	73.417
15.645	94.368
15.704	91.709
15.735	99.691
15.793	89.050
15.970	84.065
16.150	89.721
16.243	105.352
16.508	92.055
16.569	102.032
16.570	107.020
16.571	111.011
16.659	104.029
17.467	125.658];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'DengLiao2024';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3QQ4J'; % Cat of Life
metaData.links.id_ITIS = '646600'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Johnius'; % Wikipedia
metaData.links.id_ADW = 'JohniusJohnius_belangerii_coitor'; % ADW
metaData.links.id_Taxo = '177645'; % Taxonomicon
metaData.links.id_WoRMS = '276099'; % WoRMS
metaData.links.id_fishbase = 'Johnius-belangerii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Johnius}}';
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
bibkey = 'YeZhan2014'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.12451}, ' ...
'author = {Ye, Z. J. and Zhang, C. and Panhwar, S. K. and Li, Z. G. and Wan, R.}, ' ... 
'year = {2014}, ' ...
'title = {Ageing {B}elanger''s croaker, \emph{Johnius belangerii}({C}uvier, 1830), based on otolith shape analysis}, ' ...
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {31(1)}, ' ...
'pages = {27–31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DengLiao2024'; type = 'Article'; bib = [ ... 
'doi = {10.1371/journal.pone.0314230}, ' ...
'author = {Deng, S. and Liao, D. and Lin, K. and Lyu, S. and Chen, N. and  Wang, X.}, ' ... 
'year = {2024}, ' ...
'title = {Assessing the exploitation status of \emph{Johnius belangerii} in {Z}hanjiang {B}ay}, ' ...
'journal = {PLoS ONE}, ' ...
'volume = {19(11)}, ' ...
'pages = {e0314230}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Johnius-belangerii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

