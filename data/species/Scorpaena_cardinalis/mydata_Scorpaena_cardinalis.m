function [data, auxData, metaData, txtData, weights] = mydata_Scorpaena_cardinalis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Scorpaenidae';
metaData.species    = 'Scorpaena_cardinalis'; 
metaData.species_en = 'Eastern red scorpionfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 21];

%% set data
% zero-variate data

data.ab = 14;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(17.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 33*365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(17.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 22;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'guess';
  comment.Lp = 'based on Scorpaena scrofa';
data.Li  = 40.5;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.5 mm of Scorpaenichthys_marmoratus: pi/6*0.15^3';
data.Wwi = 1.78e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01778*Li^3.03, see F1';
 
data.GSI  = 0.03; units.GSI  = '-'; label.GSI  = 'gonado somatic index'; bibkey.GSI = 'StewHugh2010';   
  temp.GSI = C2K(17); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Parablennius ruber';

% uni-variate data% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
2.057	10.588
2.988	17.771
3.065	14.551
3.065	13.994
4.035	17.709
4.074	16.594
4.074	17.214
4.967	18.204
5.044	19.443
5.044	24.954
5.083	22.477
5.976	18.700
5.976	19.009
6.053	26.192
6.907	20.186
6.984	23.715
6.984	25.944
7.023	24.458
7.023	34.427
7.062	22.167
7.101	17.152
7.877	23.901
7.916	27.926
7.955	30.898
7.993	22.848
8.032	18.885
8.071	29.659
8.071	21.053
8.071	20.062
8.071	17.771
8.110	21.858
8.925	21.548
9.002	16.656
9.002	29.845
9.002	19.628
10.011	19.443
10.089	31.146
10.942	23.096
11.020	22.477
11.020	24.458
11.020	25.449
11.059	29.040
11.990	32.570
11.990	32.198
12.068	22.477
12.960	20.186
12.960	24.025
12.999	20.805
13.891	24.149
13.969	26.625
14.047	22.663
14.047	29.226
15.017	30.464
15.055	24.768
15.987	19.195
16.142	25.820
16.957	34.489
16.996	33.189
18.004	16.347
18.975	19.505
19.052	25.263
19.945	25.820
19.983	29.969
20.992	22.043
24.019	21.858]; 
data.tL_f(:,1) = (0.9 + data.tL_f(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f    = C2K(17.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'StewHugh2010';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
3.027	20.495
3.997	15.975
3.997	18.700
4.035	17.028
4.074	27.245
4.113	20.062
4.113	20.681
4.850	20.743
4.889	29.474
4.889	25.820
4.889	21.734
4.967	18.390
5.006	22.353
5.044	16.842
5.083	28.235
5.083	20.124
5.937	28.793
5.976	22.415
6.014	20.000
6.014	23.591
6.014	26.563
6.014	26.873
6.014	29.102
6.053	23.158
6.131	31.517
6.208	30.712
6.829	18.824
6.868	31.950
6.984	20.433
7.023	28.916
7.062	32.446
7.062	26.068
7.101	24.520
7.101	23.096
7.140	21.796
7.916	25.201
7.955	29.845
7.993	21.115
8.032	25.635
8.032	30.341
8.071	22.848
8.071	30.650
8.187	32.446
8.847	34.303
8.886	26.873
8.925	30.279
8.963	26.502
8.963	25.325
9.041	29.412
9.041	29.102
9.041	22.786
9.041	21.362
9.080	20.681
9.119	28.297
9.119	27.554
9.895	23.406
9.933	27.183
9.933	32.570
9.972	28.669
9.972	23.591
10.011	31.889
10.011	32.136
10.011	24.149
10.050	34.056
10.050	25.820
10.127	25.015
10.166	30.464
10.865	25.139
10.904	28.111
10.904	27.245
10.942	33.498
10.981	35.851
10.981	25.635
11.175	32.322
11.874	27.059
11.874	22.105
11.912	24.334
11.951	23.406
12.068	27.492
12.068	26.068
12.068	25.697
12.106	26.378
12.921	30.402
12.999	27.245
12.999	27.554
12.999	32.817
13.038	22.477
13.038	24.582
13.038	25.077
13.038	25.697
13.076	26.625
13.076	28.111
13.154	28.854
13.348	31.393
13.930	36.718
13.930	35.604
13.930	26.873
13.969	33.684
13.969	23.282
14.008	32.941
14.008	30.712
14.047	35.356
14.047	31.269
14.978	26.440
14.978	27.740
14.978	35.975
15.017	23.591
15.017	24.211
15.017	28.297
15.017	28.483
15.017	31.393
15.055	27.430
15.055	35.046
15.094	23.220
15.094	28.978
15.094	29.412
15.094	34.551
15.133	25.944
15.909	36.718
15.909	28.669
16.025	30.712
16.025	24.768
16.918	25.077
16.957	28.793
16.957	27.740
16.957	26.006
17.073	38.885
17.927	26.687
18.082	28.297
18.082	30.464
18.160	27.307
18.936	29.783
18.936	28.359
18.975	25.820
19.013	26.811
19.945	34.861
20.022	27.059
20.061	29.474
20.100	26.687
20.876	39.505
20.915	27.554
21.031	32.879
21.031	26.873
21.070	28.731
21.109	26.068
22.040	31.827
22.040	31.331
22.079	36.780
22.894	27.802
22.971	28.173
23.049	29.783
23.088	39.938
23.941	26.811
26.037	32.322
27.007	30.464
28.093	34.365
32.982	33.560]; 
data.tL_m(:,1) = (0.9 + data.tL_m(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m    = C2K(17.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'StewHugh2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'GrebCail2010 data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01778*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VWQ8'; % Cat of Life
metaData.links.id_ITIS = '166844'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scorpaena_cardinalis'; % Wikipedia
metaData.links.id_ADW = 'Scorpaena_cardinalis'; % ADW
metaData.links.id_Taxo = '187133'; % Taxonomicon
metaData.links.id_WoRMS = '274702'; % WoRMS
metaData.links.id_fishbase = 'Scorpaena_cardinalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scorpaena_cardinalis}}';
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
bibkey = 'StewHugh2010'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF10040 }, ' ...
'author = {John Stewart and Julian M. Hughes}, ' ... 
'year = {2010}, ' ...
'title = {Life-history traits of the southern hemisphere eastern red scorpionfish, \emph{Scorpaena cardinalis} ({S}corpaenidae: {S}corpaeninae)}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {61}, ' ...
'pages = {1290–1297}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scorpaena-cardinalis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

