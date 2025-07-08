function [data, auxData, metaData, txtData, weights] = mydata_Coryphaenoides_acrolepis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Coryphaenoides_acrolepis'; 
metaData.species_en = 'Pacific grenadier'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 04 01];              
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

data.am = 73*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 50;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Andr1997'; 
data.Li  = 104;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of C. rupestris of 2.6 mm: 4/3*pi*0.13^3';
data.Wwi = 3000;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.Ri  = 3200/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(3);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap=0.9';

% univariate data
% tL-data for females
data.tL_f = [ ... % time since birth (yr), total length (cm)
2.021	6.257
2.898	14.701
3.031	9.753
3.038	7.737
3.701	12.879
4.036	14.350
4.721	13.443
5.056	15.097
5.266	19.499
5.843	17.307
6.067	18.044
6.087	12.728
6.986	15.490
7.098	15.858
7.869	22.284
8.121	15.872
8.885	24.131
9.255	16.621
9.259	15.521
9.358	19.189
10.129	25.798
10.141	22.499
10.158	18.100
11.015	31.859
11.032	27.277
11.071	17.013
11.156	24.712
11.985	15.742
12.116	41.223
12.185	22.894
12.194	50.572
12.734	28.033
13.886	24.017
14.067	36.117
14.883	30.629
14.903	25.497
15.978	41.642
16.961	52.104
16.998	42.389
17.644	21.869
20.072	40.782
22.785	44.669
32.130	67.526
36.006	64.280
37.252	65.214
40.084	67.636
63.026	71.067];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Andr1997';
comment.tL_f = 'data for females';
% tL-data for males
data.tL_m = [ ... % time since birth (yr), total length (cm)
6.951	24.655
6.956	23.372
9.125	20.835
11.932	29.855
13.191	27.307
14.102	26.769
14.680	24.394
16.108	37.245
17.843	29.203
18.199	25.176
20.949	49.409
22.070	53.274
22.235	39.712
24.003	53.117
24.129	49.819
25.029	52.031
26.063	49.296
30.022	54.116
30.037	50.084
30.040	49.168
32.038	61.659
32.293	54.514
39.079	63.039
40.020	54.437
40.092	65.436
41.243	61.603
44.993	61.654
46.928	60.948
50.092	65.574
51.899	68.531
64.077	63.383
71.224	66.781
72.128	67.893
73.179	60.575];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Andr1997';
comment.tL_m = 'data for males';

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
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'temp 1-4 C; bathypelagic; depth range 300 - 3700 m, usually 900 - 1300 m';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'YS27'; % Cat of Life
metaData.links.id_ITIS = '165334'; % ITIS
metaData.links.id_EoL = '46564530'; % Ency of Life
metaData.links.id_Wiki = 'Coryphaenoides'; % Wikipedia
metaData.links.id_ADW = 'Coryphaenoides_acrolepis'; % ADW
metaData.links.id_Taxo = '171920'; % Taxonomicon
metaData.links.id_WoRMS = '272313'; % WoRMS
metaData.links.id_fishbase = 'Coryphaenoides-acrolepis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coryphaenoides}}';
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
bibkey = 'Andr1997'; type = 'Phdthesis'; bib = [ ... 
'author = {A. H. Andrews}, ' ... 
'year = {1997}, ' ...
'title = {Age and growth of the {P}acific grenadier (Family {M}acrouridae, \emph{Coryphaenoides acrolepis}) with age estimate validation using improved radiometric ageing technique}, ' ...
'school = {California State Universities, Faculty of Moss Landing Marine Laboratories}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/8467}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

