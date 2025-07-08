function [data, auxData, metaData, txtData, weights] = mydata_Merluccius_melluccius
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Merlucciidae';
metaData.species    = 'Merluccius_merluccius'; 
metaData.species_en = 'European hake'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jpCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % in K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'R_L'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 03 15]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data
data.ab = 10;  units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'fishbase'; 
  temp.ab = C2K(9.1); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 4.4*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'PineSain2003'; 
  temp.tp = C2K(19); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2.5*365;  units.tpm = 'd';   label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'PineSain2003'; 
  temp.tpm = C2K(19); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 20*365;     units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';  
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 45;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';  bibkey.Lp = 'PineSain2003';
data.Lpm = 32.8;  units.Lpm = 'cm';  label.Lpm = 'total length at puberty for males';   bibkey.Lpm = 'PineSain2003';
data.Li = 140;    units.Li = 'cm';   label.Li = 'ultimate total length';       bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1  mm: 4/3*pi*0.05^3';
data.Wwi = 17.8e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on Wwi = 0.0086471 * Li^2.942563, given by PineSain2003';
  
data.Ri = 3.7e6/365; units.Ri = '#/d';  label.Ri = 'max reprod rate at 78 cm'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'data for Bay of Biscay, max L of tL_f data was assummed';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years) ~ total length (cm) 
 0 16.8
 1 20.9
 2 28.4
 3 37.0
 4 44.5
 5 48.7
 6 53.7
 7 56.4
 8 62.7
 9 68.7
10 75.0
11 78.0];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(19);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PineSain2003';
comment.tL_f = 'data for females; temperature guessed';
%
data.tL_m = [ ... % age (years) ~ total length (cm) 
0 17.0
1 21.0
2 29.5
3 36.4
4 42.7
5 45.7
6 49.7
7 54.2
9 60.0];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(19);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PineSain2003';
comment.tL_m = 'data for males; temperature guessed';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g), sexes combined
15.953	32.258
16.907	32.258
17.167	32.258
17.861	32.258
18.207	64.516
18.901	43.011
19.941	53.764
19.941	43.011
20.981	96.774
20.982	53.764
21.762	53.764
22.889	86.022
24.102	107.527
24.102	96.774
24.968	150.538
24.969	107.527
26.182	161.290
26.183	107.527
26.963	139.785
27.048	215.054
28.002	204.301
28.003	161.290
28.263	139.785
28.609	193.548
29.130	150.538
29.216	225.806
29.997	193.548
30.169	236.559
30.430	193.548
31.036	279.570
31.037	204.301
32.077	236.559
32.077	215.054
32.944	225.806
33.029	311.828
33.117	279.570
33.895	365.592
33.896	333.334
33.897	279.570
34.936	354.839
35.024	258.065
35.111	279.570
35.976	397.850
36.063	365.592
36.064	322.581
36.065	279.570
36.843	397.850
36.843	365.592
36.844	322.581
38.056	430.108
38.057	397.850
38.058	344.086
38.315	483.871
39.011	354.839
39.095	516.129
39.096	451.613
39.097	387.097
40.048	559.140
40.052	322.581
40.136	494.624
40.137	451.613
40.138	397.850
40.916	483.871
40.917	430.108
41.001	591.398
41.436	537.635
41.956	537.635
42.041	623.656
42.042	580.645
42.044	440.861
42.650	494.624
42.995	634.409
43.082	602.151
43.083	548.387
43.084	494.624
43.861	666.667
43.862	623.656
44.123	591.398
44.124	505.377
44.900	763.441
44.902	645.161
44.903	612.903
44.904	559.140
45.937	946.237
45.939	849.463
45.940	806.452
45.941	763.441
45.941	709.678
45.943	645.161
45.944	537.635
46.204	580.645
46.979	892.473
46.980	838.710
46.980	795.699
46.981	752.688
46.982	709.678
46.983	666.667
46.984	612.903
48.018	989.248
48.019	881.721
48.020	838.710
48.021	774.194
48.022	741.936
48.023	698.925
48.023	645.161
48.800	870.968
48.801	827.957
48.802	763.441
48.803	720.430
48.885	956.990
49.753	903.226
49.754	827.957
49.924	1032.258
49.926	956.990
50.016	752.688
50.967	881.721
50.968	838.710
50.969	784.947
51.048	1225.807
51.050	1118.280
51.050	1096.774
51.051	1032.258
51.053	967.742
51.832	1021.506
51.833	967.742
51.834	892.473
51.836	784.947
51.915	1225.807
51.916	1150.538
51.918	1075.269
52.953	1354.839
52.958	1107.527
52.959	1053.764
52.959	1010.753
52.960	967.742
52.962	881.721
52.962	881.721
53.129	1247.312
53.909	1258.065
53.993	1408.602
53.997	1172.043
54.085	1118.280
54.085	1086.022
54.086	1043.011
54.087	1000.000
54.088	924.731
54.946	1473.118
54.948	1311.828
54.950	1236.559
54.951	1182.796
54.953	1043.011
54.954	1010.753
54.954	967.742
55.038	1139.785
55.039	1096.774
55.042	935.484
55.987	1440.860
55.988	1365.592
55.988	1333.334
55.989	1311.828
55.990	1258.065
55.990	1225.807
55.991	1172.043
55.993	1096.774
56.071	1580.645
56.761	1774.194
56.859	1129.032
56.860	1096.774
56.938	1569.893
56.939	1526.882
56.940	1473.118
56.941	1376.344
57.027	1440.860
57.029	1333.334
57.030	1268.818
57.030	1247.312
57.982	1397.850
57.983	1333.334
58.072	1161.290
58.073	1129.032
58.930	1698.925
58.936	1354.839
58.937	1322.581
59.107	1483.871
59.111	1268.818
59.112	1225.807
59.881	1881.721
59.890	1344.086
59.891	1290.323
59.972	1634.409
59.973	1569.893
59.974	1516.129
59.976	1397.850
60.061	1462.366
60.834	1903.226
60.927	1526.882
60.928	1494.624
60.929	1408.602
60.930	1376.344
61.005	2032.258
61.877	1763.441
61.879	1655.914
61.884	1365.592
62.832	1666.667
62.833	1645.162
63.000	2010.753
63.177	1774.194
63.779	2064.516
63.780	2000.000
63.781	1946.237
63.783	1849.463
63.784	1817.204
63.785	1741.935
64.908	1989.247
65.685	2172.043
65.691	1838.710
65.691	1827.957
66.724	2258.065
66.901	2043.011
66.906	1741.935
67.936	2365.591
68.112	2182.796
68.113	2139.785
68.115	2053.764
68.116	1978.495
68.894	2118.280
68.895	2043.011
68.976	2387.097
68.978	2290.323
69.755	2451.613
69.757	2365.591
69.841	2526.882
70.020	2204.301
70.964	2720.430
73.911	2784.946
74.858	3182.796
75.726	3107.527
77.898	2860.215];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'PineSain2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

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

%% Discussion
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3ZV78'; % Cat of Life
metaData.links.id_ITIS = '164795'; % ITIS
metaData.links.id_EoL = '46564937'; % Ency of Life
metaData.links.id_Wiki = 'Merluccius_merluccius'; % Wikipedia
metaData.links.id_ADW = 'Merluccius_merluccius'; % ADW
metaData.links.id_Taxo = '44371'; % Taxonomicon
metaData.links.id_WoRMS = '126484'; % WoRMS
metaData.links.id_fishbase = 'Merluccius-merluccius'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Merluccius_merluccius}}';
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
bibkey = 'PineSain2003'; type = 'article'; bib = [ ...
'author = {C. Pineiro and M. Sainza}, ' ... 
'year   = {2003}, ' ...
'title  = {Age estimation, growth and maturity of the {E}uropean hake (\emph{Merluccius merluccius} ({L}innaeus, 1758)) from {I}berian {A}tlantic waters}, ' ...
'journal = {ICES Journal of Marine Science}, ' ...
'page = {1086-1102}, ' ...
'volume = {60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Merluccius-merluccius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

