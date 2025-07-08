function [data, auxData, metaData, txtData, weights] = mydata_Pontinus_clemensi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Scorpaenidae';
metaData.species    = 'Pontinus_clemensi'; 
metaData.species_en = 'Mottled scorpionfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.tp = 11.8 * 365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'JarrAndr2018';   
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 11.8 * 365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'JarrAndr2018';   
  temp.tpm = C2K(15);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 18 * 365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'JarrAndr2018';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 33.6;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females';  bibkey.Lp  = 'JarrAndr2018'; 
data.Lpm  = 43.4;   units.Lpm  = 'cm';  label.Lpm  = 'fork length at puberty for males';  bibkey.Lpm  = 'JarrAndr2018'; 
data.Li  = 63;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'JarrAndr2018';
data.Lim  = 67;     units.Lim  = 'cm';  label.Lim  = 'ultimate fork length';    bibkey.Lim  =  'JarrAndr2018';

data.Wwb = 1.8e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwim = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwi = 2505.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'JarrAndr2018';
data.Wwim = 3504.5;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';      bibkey.Wwim = 'JarrAndr2018';
 
data.GSI = 0.04;     units.GSI = '-';    label.GSI = 'gonado somatic index';   bibkey.GSI = 'JarrAndr2018';   
  temp.GSI = C2K(15);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... %  year class (yr), fork length(cm)
10.005	28.618
10.006	29.948
10.022	29.283
10.038	27.288
11.158	35.913
11.174	33.254
11.174	34.029
11.188	26.162
11.189	30.262
11.190	31.037
11.190	31.813
11.190	32.589
11.204	25.275
11.205	28.156
11.220	24.056
11.220	24.832
11.222	29.485
12.295	42.987
12.340	30.908
12.340	32.792
12.340	33.014
12.341	33.789
12.341	34.565
12.341	35.230
12.342	35.894
12.353	23.817
12.359	37.445
12.359	37.556
12.359	38.332
12.360	39.107
12.372	28.802
13.456	31.555
13.480	47.400
13.493	38.203
13.493	38.979
13.494	42.746
13.495	43.411
13.495	43.854
13.512	45.516
13.525	35.322
13.525	36.208
13.525	36.651
13.526	37.538
13.527	40.308
13.527	40.973
13.527	41.416
13.528	42.081
14.626	38.296
14.626	38.961
14.627	41.177
14.662	44.390
14.676	37.741
14.679	46.716
14.680	47.603
14.680	48.378
14.691	34.306
14.695	44.832
14.695	44.943
14.713	46.162
15.777	41.159
15.831	50.022
15.831	51.241
15.845	42.930
15.845	43.928
15.846	45.368
15.850	56.005
15.862	44.481
15.865	52.016
15.865	52.127
15.866	53.235
16.986	61.195
17.043	39.809
17.050	55.764];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.75) * 365; % convert yr to d
units.tL_f = {'d' 'cm'}; label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f = C2K(15); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JarrAndr2018';
comment.tL_f = 'Data for females';
%
data.tL_m = [... %  year class (yr), fork length(cm)
8.787	24.316
8.818	18.554
8.821	25.867
8.872	29.855
9.951	19.090
9.969	20.752
9.969	21.417
9.969	22.636
9.970	23.522
9.984	17.760
9.987	24.962
10.021	26.624
11.156	30.595
11.156	31.370
11.157	32.811
11.171	27.381
11.218	19.956
12.257	31.907
12.291	34.676
12.292	35.895
12.302	21.269
12.303	22.155
12.310	40.327
12.322	29.357
12.337	25.257
12.345	43.097
12.355	27.141
12.361	41.545
13.474	33.439
13.506	30.114
13.527	41.637
13.541	34.989
13.543	39.199
13.546	45.626
14.645	44.833
14.645	45.165
14.646	45.719
14.650	56.135
14.673	31.425
14.677	41.619
14.692	36.522
14.695	43.059
14.697	49.153
14.698	51.148
14.708	35.081
14.710	39.957
15.826	37.944
15.829	46.255
15.847	48.360
15.847	48.803
15.883	54.232
15.893	40.049
17.001	58.868
17.038	66.845
17.094	41.138
18.128	42.894
18.177	41.564];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.75) * 365; % convert yr to d
units.tL_m = {'d' 'cm'}; label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m = C2K(15); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JarrAndr2018';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 3 * weights.psd.v;

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
D2 = 'temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length-weight: Ww in g =  0.02*(FL in cm)^3.02 (females); 0.056*(FL in cm)^2.68 (males), but this gives value much larger than reported for Wwi, Wwim';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6W7RW'; % Cat of Life
metaData.links.id_ITIS = '644364'; % ITIS
metaData.links.id_EoL = '46567852'; % Ency of Life
metaData.links.id_Wiki = 'Pontinus'; % Wikipedia
metaData.links.id_ADW = 'Pontinus_clemensi'; % ADW
metaData.links.id_Taxo = '184525'; % Taxonomicon
metaData.links.id_WoRMS = '274683'; % WoRMS
metaData.links.id_fishbase = 'Pontinus-clemensi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pontinus_clemensi}}';
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
bibkey = 'JarrAndr2018'; type = 'Article'; bib = [ ... 
'author = {J. R. Marin Jarrin and S. Andrade-Vera and C. Reyes-Ojedis and P. Salinas-de-L\''{e}on}, ' ... 
'year = {2018}, ' ...
'title = {Life History of the Mottled Scorpionfish, \emph{Pontinus clemensi}, in the {G}alapagos {M}arine {R}eserve}, ' ...
'journal = {Copeia}, ' ...
'volume = {106(3)}, ' ...
'pages = {515-523}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Pontinus-clemensi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

