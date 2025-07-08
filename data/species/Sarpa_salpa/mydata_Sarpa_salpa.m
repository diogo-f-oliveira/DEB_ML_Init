function [data, auxData, metaData, txtData, weights] = mydata_Sarpa_salpa

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Sarpa_salpa'; 
metaData.species_en = 'Dreamfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lj';'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 'L-W'; 'T-jO'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 01 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Evridiki Klagkou','Orestis Stavrakidis-Zachou','Eleni Livanou','Dina Lika'};    
metaData.date_mod_1 = [2024 06 26];              
metaData.email_mod_1    = {'lika@uoc.gr'};            
metaData.address_mod_1  = {'University of Crete, UoC'};    

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2024 06 28]; 

%% set data
% zero-variate data
data.aj = 73;    units.aj = 'd';    label.aj = 'age at metamorphosis';               bibkey.aj = 'CrisColl2006';   
  temp.aj = C2K(20);  units.temp.aj = 'K'; label.temp.aj = 'temperature'; 
  comment.aj = 'agrees with other species of the family';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'PallDulc2008';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 5;   units.Lj  = 'cm';  label.Lj  = 'total length at metamorphosis';  bibkey.Lj  = 'ChemLeDi2021';
    comment.Lj ='based on average 4-7cm, agrees with other publications as well';
data.Lp  = 16.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'AissaGued2020';
data.Li  = 51;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'Bauc1987';

data.Wwb = 2.68e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*.08^3';
data.Wwp = 61.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01259*Lp^3.03, see F1';
data.Wwi = 1.9e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01259*Li^3.03, see F1';

data.Ri  = 2662*921.62/365;   units.Ri  = '#/d'; label.Ri  = 'reprod rate';     bibkey.Ri  = 'PaivNeve2018';   
  temp.Ri = C2K(17.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  length.Ri = 41.2; units.length.Ri = 'cm'; label.length.Ri = 'length';
  comment.Ri = 'realised annual fecundity, no info on temp, used average of the area';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.014	6.920
0.014	4.078
0.014	4.281
0.014	4.585
0.014	4.839
0.014	5.093
0.014	5.397
0.014	5.499
0.014	5.702
0.014	5.753
0.014	5.956
0.014	6.108
0.014	6.260
0.014	6.565
0.957	12.825
0.970	12.673
0.970	13.282
0.970	13.384
0.984	10.237
0.984	13.587
0.984	13.638
0.984	13.891
0.984	14.501
0.984	15.414
0.998	11.760
0.998	12.369
0.998	16.887
1.011	11.405
1.011	11.912
1.011	12.014
1.025	9.121
1.025	11.202
1.995	13.604
1.995	16.294
1.995	16.447
1.995	16.700
1.995	17.056
1.995	17.157
1.995	17.157
1.995	18.528
1.995	19.188
1.995	19.442
1.995	19.594
1.995	20.051
1.995	20.507
2.009	14.264
2.009	14.873
2.009	15.939
2.009	17.868
2.009	17.919
2.009	18.325
2.009	18.579
2.009	18.985
2.023	15.280
2.023	15.584
2.938	24.534
2.966	23.468
2.993	15.956
2.993	16.159
2.993	16.514
2.993	20.829
2.993	21.692
2.993	22.098
2.993	22.656
3.007	17.733
3.007	17.885
3.007	18.494
3.007	19.103
3.007	19.256
3.007	19.408
3.007	19.611
3.007	19.814
3.007	20.677
3.007	21.185
3.007	21.286
3.021	16.768
3.021	17.530
3.021	18.241
3.021	18.900
3.021	20.170
3.964	18.104
3.964	23.383
3.977	18.358
3.977	18.815
3.977	19.678
3.977	20.389
3.977	20.592
3.977	20.846
3.977	21.404
3.977	21.607
3.977	21.658
3.977	22.724
3.977	24.602
3.991	19.171
3.991	19.526
3.991	20.135
3.991	21.049
3.991	22.166
3.991	22.470
4.005	24.146
4.005	25.465
4.961	23.248
4.961	23.603
4.975	19.390
4.989	21.624
4.989	21.726
4.989	21.827
4.989	21.929
4.989	22.030
4.989	22.030
4.989	22.436
4.989	22.842
5.002	21.523
5.002	21.726
5.002	24.467
5.016	20.102
5.016	20.559
5.016	20.914
5.016	21.168
5.016	21.269
5.016	24.772
5.016	25.127
6.014	21.134
6.014	24.586
6.014	25.804
6.014	27.682
6.027	20.119]; 
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2) * 1.09; % convert fork length to total length from photo
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
bibkey.tL = 'WaltBeck1997';
%
tT = [... % Month,    Temperatrue (°C)
   0   C2K(21.7164154052734)    % October
   1   C2K(23.158655166626)    % November
   2   C2K(23.5706424713135)    % December
   3   C2K(24.2876720428466)    % January
   4   C2K(25.5517024993896)    % February
   5   C2K(25.7050514221191)    % March
   6   C2K(24.9381237030029)    % April
   7   C2K(24.0149173736572)    % May
   8   C2K(22.7170734405518)    % June
   9  C2K(21.2447872161865)    % July
   10  C2K(20.6701354980469)    % August
   11  C2K(20.425142288208)];  % September
tT_months = 30 * tT(:,1);
tT = [tT; tT; tT; tT; tT; tT]; % 6 years, same temp
tT(:,1) = [tT_months; 360+tT_months; 2*360+tT_months; 3*360+tT_months; 4*360+tT_months; 5*360+tT_months]; % 6 years, same temp
temp.tL = tT; units.temp.tL = 'K'; label.temp.tL = 'temperature';

% length-weight
data.LW = [... length (cm), weight (g)
   22.46	138.71
   22.75	174.12
   23.00	189.86
   23.14	156.41
   23.38	146.58
   23.67	172.15
   23.72	207.57
   24.34	172.15
   24.44	197.73
   24.63	207.57
   25.06	180.02
   25.30	199.70
   25.40	223.31
   26.17	205.60
   26.12	221.34
   25.70	270.53
   26.18	256.76
   26.27	272.50
   26.46	229.21
   26.65	211.51
   27.04	229.21
   27.04	274.47
   27.57	278.40
   27.72	262.66
   27.57	235.12
   28.19	237.08
   28.39	266.60
   28.82	266.60
   27.81	292.17
   27.63	317.75
   27.29	319.72
   28.68	302.01
   29.02	315.78
   29.21	341.36
   29.50	305.95
   30.08	305.95
   30.08	347.27
   30.08	368.91
   30.47	384.65
   30.66	361.04
   30.66	337.43
   30.94	303.98
   30.79	276.43
   32.39	355.14
   32.39	374.81
   32.10	388.58
   31.43	388.58
   31.63	439.74
   32.49	402.36
   33.21	414.16
   32.60	492.86
   33.27	502.70
   33.28	544.02
   34.53	565.66
   34.77	581.40
   35.11	577.47
   34.97	640.43
   36.56	693.55
   37.81	691.58
   38.15	725.03];
units.LW   = {'cm', 'g'};  label.LW = {'length', 'weight'};  
temp.LW    = C2K(18.1175);  units.temp.LW= 'K'; label.temp.LW = 'temperature';
bibkey.LW = 'DabaUgur2023';
comment.LW = 'data for females';

% time-length
data.tL_juv = [... age (d), total length (cm)
    1.43	1.82
    1.43	2.05
    1.43	2.34
    1.42	2.86
    2.41	1.98
    2.41	2.56
    2.41	2.62
    2.41	2.91
    2.46	3.37
    2.46	3.60
    3.48	2.38
    3.47	2.61
    3.47	2.73
    3.45	3.08
    3.45	3.25
    3.42	3.60
    3.42	3.77
    3.42	3.95
    4.40	2.61
    4.40	2.61
    4.40	3.07
    4.40	3.25
    4.40	3.77
    4.40	3.94
    4.40	4.23
    4.40	4.40
    5.47	2.72
    5.47	2.89
    5.47	3.24
    5.44	3.64
    5.41	4.05
    5.41	4.40
    6.48	3.00
    6.48	3.29
    6.48	3.70
    6.42	3.93
    6.37	4.45
    6.37	4.68
    6.36	5.09
    7.43	3.34
    7.43	3.92
    7.43	4.27
    7.43	4.50
    7.43	4.85
    7.43	5.02
    7.43	5.20
    7.43	5.66
    7.43	5.95
    8.50	4.09
    8.50	4.38
    8.50	4.55
    8.50	4.96
    8.47	5.36
    8.47	5.77
    8.46	6.35
    8.46	6.52
    8.46	6.99
    9.51	4.84
    9.51	4.84
    9.48	5.65
    9.48	5.94
    9.47	6.75
    9.47	7.15
    9.47	7.62
    10.46	6.05
    10.40	6.45
    10.40	6.97
    10.40	7.38
    10.40	7.78
    10.40	7.96
    10.40	8.36
    10.40	8.83
    10.40	9.52
    11.44	7.43
    11.49	7.95
    11.49	8.47
    11.49	8.82
    11.46	9.69
    11.43	9.86
    11.41	10.50
    11.40	10.96
    12.53	8.18
    12.50	8.41
    12.50	8.87
    12.50	9.39
    12.50	9.92
    12.50	10.15
    12.50	10.61
    12.50	11.02
    12.50	11.36
    12.49	11.77
    13.46	9.74
    13.46	9.74
    13.46	10.26
    13.45	10.43
    13.45	11.13
    13.45	11.36
    13.45	11.88
    13.45	12.17
    13.45	12.63
    13.45	12.75];
data.tL_juv(:,1) = data.tL_juv(:,1) * 30; % convert months to d
units.tL_juv   = {'d', 'cm'};  label.tL_juv = {'time since birth', 'total length'};  
bibkey.tL_juv = 'MatiKral2004';
%
tT_juv = [... % Month,    Temperatrue (°C)
   1   C2K(20.5188236236572)    % October
   2   C2K(17.4462242126465)    % November
   3   C2K(14.8267002105713)    % December
   4   C2K(12.5524387359619)    % January
   5   C2K(11.5855484008789)    % February
   6   C2K(11.7224760055541)    % March
   7   C2K(12.7152500152588)    % April
   8   C2K(16.7694396972656)    % May
   9   C2K(19.9652004241943)    % June
   10  C2K(23.0246601104736)    % July
   11  C2K(25.0638694763183)    % August
   12  C2K(22.8201503753662)];  % September
tT_months_1 = 30 * tT_juv(:,1);
tT_juv = [tT_juv; tT_juv]; % 2 years, same temp
tT_juv(:,1) = [tT_months_1; 360+tT_months_1]; % 2 years, same temp
temp.tL_juv = tT_juv; units.temp.tL_juv = 'K'; label.temp.tL_juv = 'temperature';
%
data.tL_fm = [...age(d), length (cm)
    1*365	16.68
    1*365	17.49
    1*365	18.81
    2*365	17.62
    2*365	19.75
    2*365	20.41
    2*365	22.70
    2*365	21.06
    2*365	23.19
    2*365	24.67
    2*365	25.49
    2*365	25.09
    2*365	23.93
    2*365	22.93
    2*365	21.77
    3*365	28.60
    3*365	20.38
    3*365	21.36
    3*365	21.85
    3*365	22.67
    3*365	22.83
    3*365	23.49
    3*365	24.14
    3*365	24.47
    3*365	25.13
    3*365	26.27
    3*365	26.93
    3*365	27.26
    3*365	27.61
    3*365	25.95
    3*365	24.79
    3*365	22.80
    4*365	24.11
    4*365	25.59
    4*365	26.24
    4*365	27.06
    4*365	27.55
    4*365	28.21
    4*365	28.86
    4*365	29.19
    4*365	29.68
    4*365	30.01
    4*365	30.99
    4*365	30.62
    4*365	29.46
    4*365	27.97
    4*365	26.81
    4*365	26.15
    4*365	24.99
    5*365	34.63
    5*365	32.98
    5*365	31.82
    5*365	30.33
    5*365	29.83
    5*365	28.34
    5*365	27.18
    5*365	26.85
    5*365	26.54
    5*365	27.59
    5*365	28.01
    5*365	28.34
    5*365	28.66
    5*365	29.32
    5*365	29.98
    5*365	30.47
    5*365	32.43
    6*365	28.96
    6*365	29.45
    6*365	29.61
    6*365	30.11
    6*365	30.93
    6*365	31.42
    6*365	31.74
    6*365	32.24
    6*365	32.73
    6*365	34.20
    6*365	36.66
    6*365	35.99
    6*365	35.17
    6*365	33.51
    6*365	32.51
    6*365	31.35
    6*365	30.52
    6*365	29.70
    7*365	38.18
    7*365	35.37];
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length (females-males)'};  
bibkey.tL_fm = 'DabaUgur2023';
comment.tL_fm = 'data for males & females';
%
tT_fm = [... % Month,    Temperatrue (°C)
   1   C2K(21.7058200836182)    % October
   2   C2K(17.9660739898682)    % November
   3   C2K(15.8555746078491)    % December
   4   C2K(15.4283361434937)    % January
   5   C2K(14.8837308883666)    % February
   6   C2K(13.3389711380005)    % March
   7   C2K(13.7690830230713)    % April
   8   C2K(17.4494762420654)    % May
   9   C2K(21.5175056457519)    % June
   10  C2K(24.3188858032227)    % July
   11  C2K(23.6783351898193)    % August
   12  C2K(22.6256618499756)];  % September
tT_months_2 = 30 * tT_fm(:,1);
tT_fm = [tT_fm; tT_fm; tT_fm; tT_fm; tT_fm; tT_fm; tT_fm]; % 7 years, same temp
tT_fm(:,1) = [tT_months_2; 360+tT_months_2; 2*360+tT_months_2; 3*360+tT_months_2; 4*360+tT_months_2; 5*360 + tT_months_2; 6*360+tT_months_2]; % 7 years, same temp
temp.tL_fm = tT_fm; units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
% 
data.TjO = [ ... % temp (C), metabolic scope (mg O2/h.kg)
       17.347	541.334
       20.331	639.021
       23.113	689.962
       25.870	605.236];
units.TjO  = {'C', 'mg O2/h.kg'};  label.TjO = {'temp', 'metabolic scope'};  
bibkey.TjO = 'Marr2015';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 3 * weights.Ri;
weights.Lj = 3*weights.Lj;
weights.aj = 3*weights.aj;
weights.tL_fm = 3*weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.length = length;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures, when not specified, are the average of the area at the time of study';
D2 = 'for the tL data, average monthly temperatures were used as described in Stavrakidis et al. (2024)';
D3 = 'The estimation for the temperature parameters (T_A, T_H, T_AH) was performed seperately using the Marras et al. (2015) data and a reference temperature of 19.95oC';
D4 = 'mod1: New data added';
metaData.discussion = struct('D1', D1, 'D2',D2, 'D3', D3, 'D4', D4);

%% Facts
F1 = 'length-weight: Ww in g = 0.01259*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase';
F2 = 'protogynous sequential hermaphrodite. Sex change occurs at 25.0 cm TL and 3.75 years of age';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '79PJZ'; % Cat of Life
metaData.links.id_ITIS = '182942'; % ITIS
metaData.links.id_EoL = '46579976'; % Ency of Life
metaData.links.id_Wiki = 'Sarpa_salpa'; % Wikipedia
metaData.links.id_ADW = 'Sarpa_salpa'; % ADW
metaData.links.id_Taxo = '186591'; % Taxonomicon
metaData.links.id_WoRMS = '127064'; % WoRMS
metaData.links.id_fishbase = 'Sarpa-salpa'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sarpa_salpa}}';
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
bibkey = 'AissaGued2020'; type = 'article'; bib = [ ...  
'author = {Aissat-Ziamni, F. and Guedioura, A. and Nouar, A.}, ' ...
'year = {2020}, ' ...
'title  = {Sex ratio, length-weight relationships and maturity stages of salema (\textit{Sarpa salpa} ({L}innaeus, 1758)) from the central {A}lgerian coast ({S}outhern {M}editerranean {S}ea)}, ' ...
'journal = {Appl. Ecol. Environ. Res.}, ' ...
'volume = {18} '...
'pages = {7829-7841}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bauc1987'; type = 'inbook'; bib = [ ...  
'author = {Bauchot, M.-L}, ' ...
'year = {1987}, ' ...
'title  = {Poissons osseux. p. 891-1421. In W. Fischer, M.L. Bauchot and M. Schneider (eds.) \textit{Fiches FAO d identification pour les besoins de la pêche. (rev. 1). Méditerranée et mer Noire. Zone de pêche 37. Vol. II.}}, ' ...
'publisher = {Commission des Communautés Européennes and FAO, Rome}, ' ...
'pages = {891-1421}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChemLeDi2021'; type = 'article'; bib = [ ...  
'author = {Cheminée, A. and Le Direach, L. and Rouanet, E. and Astruch, P. and Goujard, A. and Blanfuné, A. and Bonhomme, D. and Chassaing, L. and Jouvenel, J. and Ruitton, S. and Thibaut, T. and Harmelin-Vivien, M.}, ' ...
'year = {2021}, ' ...
'title  = {All shallow coastal habitats matter as nurseries for {M}editerranean juvenile fish}, ' ...
'journal = {Scientific Reports}, ' ...
'volume = {11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CrisColl2006'; type = 'article'; bib = [ ...  
'author = {Criscoli, A. and Colloca, F. and Carpentieri, P. and Belluscio, A. and Ardizzone, G.}, ' ...
'year = {2006}, ' ...
'title  = {Observations on the reproductive cycle, age and growth of the salema, \emph{Sarpa salpa} ({O}steichthyes: Sparidae) along the western central coast of {I}taly}, ' ...
'journal = {Scientia Marina}, ' ...
'volume = {70}, ' ...
'pages = {131-138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DabaUgur2023'; type = 'article'; bib = [ ...  
'author = { Deban, I. B. and Ugur, G. E. and Ismen, A.}, ' ...
'year = {2023}, ' ...
'title  = {Growth and exploitation of Salema \emph{Sarpa salpa} ({L}innaeus, 1758) ({S}paridae) in the {N}orth {A}egean Sea, {T}ürkiye}, ' ...
'journal = {J. BAUN Inst. Sci. Technol}, ' ...
'volume = {25}, ' ...
'pages = {501-515}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Sarpa-salpa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Marr2015'; type = 'article'; bib = [ ...  
'author = {Marras, S. and Cucco, A. and Antognarelli, F. and Azzurro, E. and Milazzo, M. and Bariche, M. and Butensch\ddot{o}m, M. and Kay, S. and Di Bitetto, M. and Quattrocchi, G. and Sinerchia, M. and Domenici, P.}, ' ...
'year = {2015}, ' ...
'title  = {Predicting future thermal habitat suitability of competing native and invasive fish species: from metabolic scope to oceanographic modelling}, ' ...
'journal = {Conservation Physiology}, ' ...
'volume = {3} '];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MatiKral2004'; type = 'article'; bib = [ ...  
'author = {Matik-Skoko, S. and Kraljevic, M. and Dulčić, J. and Pallaoro, A.}, ' ...
'year = {2004}, ' ...
'title  = {Growth of juvenile salema, \emph{Sarpa salpa} ({T}eleostei:Sparidae), in the {K}ornati {A}rchipelago, eastern {A}driatic {S}ea}, ' ...
'journal = {Sci. Mar.}, ' ...
'volume = {68}, ' ...
'pages = {411-417}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PaivNeve2018'; type = 'article'; bib = [ ...  
'author = {Barros-Paiva, R. and Neves, A. and Vieira, A. R. and Costa, M. J. and Serrano-Gordo, L.}, ' ...
'year = {2018}, ' ...
'title  = {Age, growth and reproduction of the protandrous hermaphrodite fish, \textit{Sarpa salpa}, from the {P}ortuguese continental coast}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom }, ' ...
'volume = {98}, ' ...
'pages = {269-281}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PallDulc2008'; type = 'article'; bib = [ ...  
'author = {Pallaoro, A. and Dulčić, J. and Matić-Skoko, S. and Kraljević, M. and Jardas, I.}, ' ...
'year = {2008}, ' ...
'title  = {Biology of the salema, \textit{Sarpa salpa} ({L}. 1758) ({P}isces, {S}paridae) from the middle-eastern {A}driatic}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {24} '];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StavKlag2024'; type = 'article'; bib = [ ...  
'author = {Stavrakidis-Zachou, O. and Klagkou, E. and  Livanou, E. and Lika, K.}, ' ...
'year = {2024}, ' ...
'title  = {Modeling the bioenergetics of two herbivorous fish species in the {M}editerranean sea: the native \textit{Sarpa salpa} and the invasive \textit{Siganus rivulatus}}, ' ...
'journal = {Ecol. Model.}, ' ...
'volume = {}, '...
'pages = {}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WaltBeck1997'; type = 'article'; bib = [ ...  
'author = {van der Walt, B. A. and Beckley, L. E.}, ' ...
'year = {1997}, ' ...
'title  = {Age and growth of \emph{Sarpa salpa} ({P}isces: {S}paridae) off the east coast of {S}outh {A}frica}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {31}, ' ...
'pages = {241-248}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
