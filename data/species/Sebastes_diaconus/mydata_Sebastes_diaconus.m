function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_diaconus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_diaconus'; 
metaData.species_en = 'Deacon rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 25];

%% set data
% zero-variate data

data.am = 32*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 28;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 33;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 296;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 492;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.GSI  = 0.22;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'RasmRank2021';   
  temp.GSI = C2K(20);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.902	15.602
0.980	14.742
1.058	14.128
1.129	8.968
1.131	9.951
1.132	10.811
1.134	11.794
1.207	7.985
1.215	12.776
1.851	13.759
1.942	20.639
1.943	21.499
2.012	14.988
2.014	15.971
2.019	19.165
2.020	19.902
2.024	22.604
2.094	16.462
2.095	17.076
2.096	17.936
2.811	18.059
2.890	18.428
2.985	27.887
3.056	22.604
3.140	25.676
3.142	26.658
3.212	20.885
3.213	21.744
3.217	23.833
3.218	24.816
3.940	29.361
4.007	21.744
4.008	22.604
4.011	24.079
4.099	29.853
4.172	26.044
4.176	28.501
4.244	21.130
4.250	24.816
4.254	27.150
4.896	31.695
5.054	31.204
5.120	22.850
5.125	26.044
5.130	29.115
5.131	29.975
5.136	32.801
5.202	24.570
5.205	26.781
5.207	27.887
5.842	27.887
5.924	29.853
6.009	33.047
6.010	33.907
6.082	28.870
6.086	31.818
6.165	31.081
7.041	33.538
7.112	28.010
7.115	29.730
7.119	32.555
7.193	28.993
7.198	31.941
7.202	34.889
7.275	30.958
7.836	34.029
7.986	28.624
7.997	35.749
8.065	28.133
8.068	29.975
8.072	33.047
8.149	31.081
8.155	34.889
8.230	32.432
8.943	31.695
8.953	37.715
9.101	30.958
9.106	33.907
9.107	34.644
9.108	35.627
9.110	36.486
9.183	32.801
9.819	33.292
9.820	33.907
9.895	31.327
9.896	32.187
9.902	35.872
9.904	36.855
10.060	35.012
10.211	30.344
10.775	35.872
10.853	34.767
10.936	36.978
11.097	38.821
11.248	33.784
11.880	32.064
11.883	33.907
11.890	38.084
11.964	34.767
11.967	36.855
11.974	41.032
12.051	39.803
12.124	35.749
12.760	36.118
12.840	36.855
12.996	35.135
13.001	37.961
13.791	35.504
14.034	38.821
14.825	36.978
15.855	35.872
15.937	37.838
15.940	39.681
16.891	38.943
17.128	37.838
18.877	39.926
18.953	37.961
18.955	38.943
19.907	39.066
19.988	40.172
20.064	37.961
20.301	36.855
20.940	39.926
21.017	37.838
21.022	41.032
21.972	39.681
22.837	35.012
22.841	36.978
23.004	39.803
23.723	42.998
23.798	39.926
23.954	38.698
24.826	37.838
24.831	41.032
24.834	43.120
24.909	39.926
26.022	41.032
26.972	39.926
27.842	37.838
29.038	41.155
29.834	42.875
30.785	42.260
30.942	40.909
31.893	40.049
31.980	44.963];
data.tL_f(:,1) = 365*(0+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f   = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ShawArch1981';  
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.873	12.670
0.874	13.609
1.032	16.424
1.111	14.781
1.190	17.362
1.270	21.235
2.063	17.355
2.064	16.416
2.065	15.477
2.141	23.341
2.142	20.406
2.143	18.646
2.222	22.166
2.223	19.349
2.302	24.278
2.303	21.227
2.937	26.856
3.016	25.799
3.017	20.517
3.095	24.742
3.096	23.920
3.097	23.216
3.098	21.103
3.175	22.394
3.968	21.331
3.969	26.965
4.125	24.029
4.126	24.968
4.127	25.907
4.128	28.020
4.129	28.724
4.286	23.207
5.077	26.017
5.078	26.956
5.079	29.069
5.080	23.787
5.158	28.012
5.159	29.890
5.873	31.175
5.952	30.001
6.032	28.944
6.190	27.182
6.348	28.003
6.349	26.242
6.905	29.994
6.983	27.176
6.984	30.697
7.063	28.349
7.064	29.171
7.143	31.752
7.144	34.452
7.698	30.926
7.937	29.868
8.016	32.098
8.095	26.933
8.175	29.045
8.810	29.274
8.811	29.979
9.047	28.451
9.048	30.564
9.206	31.619
10.000	30.908
10.001	29.148
10.873	29.962
11.032	27.966
11.111	30.900
11.983	30.775
11.984	27.724
12.063	33.240
12.143	28.896
12.222	30.187
12.936	29.829
12.937	30.651
13.015	29.007
13.016	31.706
13.889	32.169
14.048	30.759
15.000	32.747
15.873	29.806
16.032	30.744
17.937	30.846
18.889	31.660
19.127	30.485
19.921	30.831
20.078	32.003
20.079	29.773
20.952	30.588
21.032	32.583
22.063	30.697
22.937	32.685
23.254	31.039
23.968	33.733
25.000	30.204
26.190	30.664
30.159	32.511];
data.tL_m(:,1) = 365*(0+data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m   = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ShawArch1981';  

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 3 * weights.Wwi;
weights.Li = 3 * weights.Li;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7LS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '47059335'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_diaconus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5661542'; % Taxonomicon
metaData.links.id_WoRMS = '1384909'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-diaconus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_diaconus}}';
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
bibkey = 'RasmRank2021'; type = 'article'; bib = [ ... 
'author = {Leif K. Rasmuson and Polly S. Rankin and Lisa A. Kautzi and Aaron Berger and Matthew T. O. Blume and Kelly A. Lawrence and Katelyn Bosley},' ...
'year = {2021}, ' ...
'title = {Cross-Shelf Variability of Deacon Rockﬁsh Sebastes diaconus Age,Growth, and Maturity in {O}regon Waters and Their Effect on Stock Status}, ' ...
'journal = {Marine and Coastal Fisheries: Dynamics, Management, and Ecosystem Science}, ' ...
'volume = {13}, ' ...
'pages = {379–395}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-diaconus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
