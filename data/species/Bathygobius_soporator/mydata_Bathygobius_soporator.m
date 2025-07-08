function [data, auxData, metaData, txtData, weights] = mydata_Bathygobius_soporator

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Bathygobius_soporator'; 
metaData.species_en = 'Frillfin goby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW','MAE','MAm'};
metaData.ecoCode.habitat = {'0iMm', '0iFr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 25];

%% set data
% zero-variate data

data.ab = 16;   units.ab = 'd';   label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(27.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 4.5*365;   units.am = 'd';   label.am = 'life span'; bibkey.am = 'fishbase';   
  temp.am = C2K(27.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 8.2; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 15; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 0.0023; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.48 mm of Acentrogobius_pflaumii: pi/6*0.048^3';
data.Wwp = 5.2;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'BarrGome2021';
  comment.Wwp = 'based on 0.00776*Lp^3.10, see F1';
data.Wwi = 34.3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00776*Li^3.10, see F1';

data.GSI = 0.06; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'BarrGome2021';
  temp.GSI = C2K(27.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time (yr), total length (cm)
0.718	6.949
0.871	7.419
1.041	7.949
1.203	9.467
1.391	10.521
1.562	10.993
1.715	11.580
1.894	11.470
2.047	12.522];
data.tL_f(:,1) = 365*(0.2+data.tL_f(:,1)); % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time', 'total length', 'females'};  
temp.tL_f   = C2K(27.3);  units.temp.tL_f = 'K'; label.temp.tL_TVST = 'temperature';
bibkey.tL_f = 'BarrGome2021'; comment.tL_f = 'Data for females 1997/1998';
%
data.tL_m = [ ... % time (yr), total length (cm)
0.712	6.908
0.877	7.316
1.062	9.013
1.210	10.535
1.394	10.943
1.560	10.942
1.753	11.525
1.882	11.934
2.048	13.163
2.204	13.337
2.379	13.393
2.545	14.505];
data.tL_m(:,1) = 365*(0.2+data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time', 'total length', 'males'};  
temp.tL_m  = C2K(27.3);  units.temp.tL_m = 'K'; label.temp.tL_BLCM = 'temperature';
bibkey.tL_m = 'BarrGome2021';  comment.tL_m = 'Data for males 1997/1998';

% length-weight
data.LW_f = [ ... %total length (cm), weight (g)
6.200	2.383
6.936	2.987
7.252	3.780
7.358	4.373
7.483	3.587
7.568	4.376
7.590	5.755
7.652	4.968
7.736	4.182
7.800	5.365
7.841	4.381
7.905	5.170
7.989	5.565
8.116	6.355
8.178	5.765
8.348	7.934
8.368	7.147
8.494	5.377
8.515	6.165
8.516	7.740
8.600	7.741
8.663	7.349
8.810	8.336
8.852	6.368
8.915	7.944
8.979	8.732
9.105	7.357
9.210	7.358
9.210	9.130
9.252	8.147
9.316	10.116
9.421	8.740
9.547	9.727
9.589	8.153
9.715	8.942
9.716	10.911
9.821	11.700
9.841	9.338
9.884	9.930
10.031	10.523
10.137	12.099
10.221	11.904
10.305	10.528
10.306	13.874
10.368	11.316
10.411	12.695
10.557	11.123
10.580	15.651
10.622	14.273
10.684	11.519
10.791	15.458
10.810	12.702
10.959	14.870
10.979	13.296
11.043	15.856
11.062	11.329
11.234	19.796
11.254	16.844
11.336	13.302
11.420	12.910
11.443	17.241
11.527	15.077
11.527	16.652
11.570	19.212
11.589	13.503
11.653	14.686
11.714	10.553
11.717	18.624
11.842	15.870
11.928	19.612
11.948	17.644
12.055	20.992
12.075	18.630
12.242	15.877
12.306	17.453
12.392	23.163
12.413	22.376
12.475	20.409
12.517	18.835
12.539	21.788
12.600	17.065
12.643	20.215
12.707	22.578
12.792	24.352
12.812	21.202
12.835	26.321
12.855	23.172
12.941	27.110
13.002	21.796
13.276	23.573
13.656	26.926
13.804	30.472];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'BarrGome2021'; 
%
data.LW_m = [ ... %total length (cm), weight (g)
6.397	2.514
6.842	3.288
7.105	4.064
7.207	3.476
7.308	4.061
7.388	4.840
7.652	4.640
7.713	3.467
7.773	5.029
8.036	6.587
8.198	6.193
8.239	5.411
8.279	6.778
8.380	7.362
8.502	5.602
8.623	8.529
8.785	8.527
8.866	8.525
8.866	7.158
9.007	9.109
9.129	8.130
9.230	9.886
9.271	7.541
9.392	10.078
9.514	8.709
9.635	9.097
9.695	11.049
9.737	8.510
9.837	10.656
9.939	9.287
10.080	10.847
10.100	12.800
10.181	12.994
10.222	10.649
10.303	12.406
10.444	12.403
10.566	12.011
10.667	13.767
10.668	11.032
10.726	16.305
10.849	14.349
10.890	13.567
10.990	14.542
11.052	12.002
11.132	14.735
11.154	12.000
11.172	15.711
11.233	16.686
11.374	16.684
11.456	15.901
11.598	15.313
11.637	17.656
11.657	19.022
11.760	16.091
11.882	13.940
11.882	12.768
11.899	20.971
11.982	17.454
12.001	19.407
12.022	18.625
12.163	21.162
12.226	15.106
12.244	21.356
12.265	19.793
12.447	19.594
12.487	20.570
12.527	22.523
12.529	17.835
12.627	25.646
12.688	23.692
12.790	22.323
12.831	20.955
12.972	23.882
13.031	27.201
13.032	25.443
13.075	20.364
13.094	21.731
13.174	24.074
13.255	26.221
13.336	25.438
13.477	26.998
13.519	24.263
13.557	29.536
13.575	35.590
13.578	27.973
13.598	28.754
13.640	24.651
13.698	31.486
13.720	26.603
13.823	23.671
13.861	30.311
13.982	30.895
14.083	31.089
14.104	28.549
14.226	29.328
14.285	32.062
14.467	33.621
14.527	34.792
14.590	29.713
14.608	34.790
14.628	35.962
14.729	37.523
14.750	35.960
14.809	38.498
14.892	34.785
14.994	33.416
15.277	35.560
15.682	35.553
15.803	36.527];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'BarrGome2021'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% weights.psd.v = 5 * weights.psd.v;
% weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00776*(TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'KX5C'; % Cat of Life
metaData.links.id_ITIS = '171820'; % ITIS
metaData.links.id_EoL = '46575537'; % Ency of Life
metaData.links.id_Wiki = 'Bathygobius_soporator'; % Wikipedia
metaData.links.id_ADW = 'Bathygobius_soporator'; % ADW
metaData.links.id_Taxo = '46561'; % Taxonomicon
metaData.links.id_WoRMS = '277638'; % WoRMS
metaData.links.id_fishbase = 'Bathygobius-soporator'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathygobius_soporator}}';
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
bibkey = 'BarrGome2021'; type = 'article'; bib = [ ...
'doi = {10.11606/1807-0205/2021.61.15}, ' ...
'author = {Barrilli, G.H.C. and  J. Gomes do Vale and G. Stahelin and J.O. Branco}, ' ... 
'year = {2021}, ' ...
'title = {Biological and ecological aspects of \emph{Bathygobius soporator} ({V}alenciennes, 1837) ({P}erciformes, {G}obiidae) from {S}anta {C}atarina, {S}outhern {B}razil}, ' ...
'jurnal = {Pap. Avulsos Zool.}, ' ...
'volume = {61}, ' ...
'pages = {e20216115,1-9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bathygobius-soporator.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


