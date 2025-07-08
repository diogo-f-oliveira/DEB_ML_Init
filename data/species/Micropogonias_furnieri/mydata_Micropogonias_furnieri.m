function [data, auxData, metaData, txtData, weights] = mydata_Micropogonias_furnieri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Micropogonias_furnieri'; 
metaData.species_en = 'Whitemouth croaker'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 11 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 02];

%% set data
% zero-variate data

data.am = 21*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'SantCost2017';   
  temp.am = C2K(26.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30.6;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
data.Li  = 60;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';  bibkey.Wwb = 'BarbCit1994';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 276.5;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00871*Lp^3.03, see F1';
data.Wwi = 2.12e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00871*Li^3.03, see F1';

data.Ri = 1.8e6/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate';     bibkey.Ri = 'fishbase';
  temp.Ri = C2K(26.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), total length (cm)
3.062	21.000
3.065	23.563
3.096	21.690
4.068	30.558
4.099	27.896
5.035	34.004
5.058	23.652
5.062	27.990
5.065	30.948
5.103	35.976
5.104	36.567
5.138	37.947
5.159	24.834
6.059	27.591
6.068	37.745
6.130	32.717
6.922	26.798
6.989	27.586
7.026	31.628
7.027	33.008
7.057	29.755
7.069	41.783
7.095	33.895
7.164	36.853
7.168	40.895
7.999	41.680
8.064	40.299
8.087	29.750
8.088	31.031
8.090	33.003
8.120	28.961
9.018	30.731
9.021	33.787
9.027	39.703
9.049	27.477
9.057	36.646
9.061	40.886
9.083	28.364
9.086	31.421
9.089	35.167
9.126	38.716
9.132	45.815
10.055	38.022
10.059	41.867
10.081	30.430
10.146	29.049
10.152	34.866
10.154	36.739
10.157	39.796
11.055	40.777
11.061	47.876
11.078	30.031
11.113	32.397
11.114	33.481
11.118	37.819
11.148	34.467
11.150	35.847
12.046	34.857
12.049	37.913
12.053	43.040
12.080	36.040
12.084	39.885
12.119	41.856
13.041	33.570
13.049	41.753
13.114	39.880
14.016	45.889
14.140	35.931
15.008	41.053
15.071	37.602
16.040	43.119
16.100	36.513
17.074	47.156
17.166	38.972
17.196	35.719
18.000	42.912
18.029	37.884
18.032	41.729
18.093	35.616
19.124	36.597
20.096	45.859
20.156	39.648];
data.tL_f(:,1) = (0.9 + data.tL_f(:,1))*365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f    = C2K(26.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SantCost2017';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), total length (cm)
2.039	20.491
2.044	25.298
3.023	21.745
3.058	22.707
3.059	23.092
3.094	24.246
3.164	27.227
3.907	23.673
4.016	31.750
4.041	22.904
4.085	32.616
4.110	23.289
4.111	24.827
4.146	25.885
4.181	27.424
4.992	24.736
5.057	21.947
5.063	28.005
5.098	28.582
5.137	33.871
5.163	25.698
6.007	22.625
6.014	30.029
6.042	23.971
6.043	24.837
6.045	26.664
6.050	31.279
6.050	31.568
6.055	36.856
6.085	32.914
6.091	39.068
6.113	27.145
6.152	31.953
6.999	31.764
7.028	26.572
7.059	23.592
7.094	25.034
7.097	27.534
7.097	28.207
7.132	28.592
7.133	29.746
7.133	29.938
7.135	32.438
7.135	32.438
7.136	32.823
7.138	34.938
7.168	30.900
7.200	29.169
7.201	30.515
7.205	33.785
7.986	35.423
8.012	27.827
8.013	28.885
8.044	25.904
8.082	29.750
8.111	24.558
8.153	32.828
8.188	34.655
9.028	26.197
9.099	29.851
9.102	32.544
9.108	39.082
9.139	36.486
9.166	29.275
9.171	33.794
9.207	35.910
9.230	25.141
9.236	31.775
10.079	26.779
10.083	31.202
10.089	36.875
10.112	26.202
10.116	30.145
10.120	33.606
10.189	34.953
10.192	38.511
11.033	31.976
11.037	35.822
11.068	33.034
11.072	37.072
11.075	39.861
11.096	26.207
11.103	33.996
11.107	38.226
11.108	38.707
11.131	27.938
11.984	33.904
12.014	29.289
12.051	32.943
12.053	34.866
12.054	35.346
12.061	42.750
12.088	35.924
12.090	38.039
12.118	31.693
12.123	36.789
13.067	31.697
13.100	30.832
13.106	37.178
13.138	34.775
13.142	39.198
13.145	41.890
14.056	38.241
14.058	40.068
14.082	29.683
14.093	41.606
14.094	41.895
14.130	43.818
14.130	44.779
15.035	34.207
15.041	40.168
15.073	37.861
15.111	41.900
15.138	34.977
15.139	35.746
15.139	36.034
15.176	38.919
15.207	36.612
16.055	36.904
16.091	39.308
16.093	41.135
16.124	38.443
16.126	40.174
16.128	42.001
17.070	35.082
17.075	39.986
17.103	33.832
17.113	43.928
18.055	36.914
18.056	37.875
18.091	38.933
18.125	39.318
18.159	39.703
18.160	40.472
18.162	41.914
19.071	35.765
19.074	39.034
19.106	36.919
19.107	38.265
20.089	37.020
20.095	42.981];
data.tL_m(:,1) = (0.9 + data.tL_m(:,1))*365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m    = C2K(26.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SantCost2017';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00871*(TL in cm)^3.03'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL=0.84*TL';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '4343F'; % Cat of Life
metaData.links.id_ITIS = '169285'; % ITIS
metaData.links.id_EoL = '46578964'; % Ency of Life
metaData.links.id_Wiki = 'Micropogonias_furnieri'; % Wikipedia
metaData.links.id_ADW = 'Micropogonias_furnieri'; % ADW
metaData.links.id_Taxo = '180093'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Micropogonias-furnieri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Micropogonias_furnieri}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Micropogonias-furnieri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SantCost2017'; type = 'Article'; bib = [ ... 
'doi = {10.1590/1982-0224-20160131}, ' ...
'author = {Rosa S. Santos and Marcus R. da Costa and Francisco G. Ara\''{u}jo}, ' ...
'year = {2017}, ' ...
'title  = {Age and growth of the white croaker \emph{Micropogonias furnieri} ({P}erciformes: {S}ciaenidae) in a coastal area of {S}outheastern {B}razilian {B}ight}, ' ...
'journal = {Neotropical Ichthyology}, ' ...
'volume = {15(1)}, ' ...
'pages = {e160131}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

