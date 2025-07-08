  function [data, auxData, metaData, txtData, weights] = mydata_Esox_masquinongy

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Esociformes'; 
metaData.family     = 'Esocidae';
metaData.species    = 'Esox_masquinongy'; 
metaData.species_en = 'Muskellunge'; 

metaData.ecoCode.climate = {'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data
data.ab = 10;     units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'WallYeag1990'; 
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*365;  units.tp = 'd';   label.tp = 'time since birth at puberty';  bibkey.tp = 'WallYeag1990';
  temp.tp = C2K(13);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 30*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 77;   units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
data.Li = 183;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.28e-2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'WallYeag1990';
  comment.Wwb = 'based on egg diameter of 2.9 mm: pi/6*0.29^3';
data.Wwp = 2.8e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wp = 'based on 0.00578*Lp^3.016, see F1';
data.Wwi = 38.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00578*Li^3.016, see F1';
  
data.Ri = 4.5e5/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'WallYeag1990';   
  temp.Ri = C2K(13);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
4.017	86.664
4.023	80.637
4.910	93.921
4.912	92.376
4.943	97.320
4.945	95.620
4.949	90.985
4.953	87.585
4.954	86.503
4.955	85.267
4.995	82.176
5.058	90.057
5.060	88.975
5.984	100.868
5.987	97.932
5.992	93.451
6.062	95.459
7.994	108.273
7.995	107.191
8.013	89.266
8.973	101.777
9.002	108.575
9.036	110.893
9.953	94.508
9.977	105.788
10.003	116.141
10.048	107.642
10.833	114.900
10.903	116.290
10.935	120.307
10.937	118.608
10.938	117.217
10.964	127.415
10.968	123.552
10.970	121.853
11.019	108.718
11.945	119.529
12.993	115.814
12.996	113.341
13.028	116.740
16.949	121.816
16.989	118.107
17.104	111.461
17.959	121.346
17.964	116.401
17.993	122.582
18.025	126.754
18.026	125.518
18.028	123.972
18.933	119.794
18.956	132.465
18.963	125.048
19.972	125.042
22.028	122.093];
data.tL_f(:,1) = (0.5 + data.tL_f(:,1)) * 365;  % convert year to d 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'length', 'female'};
temp.tL_f = C2K(13); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = {'CranCorn2020'};
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
3.040	67.798
3.109	70.722
3.961	82.555
3.964	78.615
3.968	74.548
4.038	77.091
4.039	75.693
4.041	73.660
4.070	80.777
5.003	82.825
5.038	83.588
5.041	80.283
5.044	77.233
5.069	89.435
5.073	85.114
5.112	81.556
5.114	78.505
5.858	91.353
6.008	84.492
6.009	83.730
6.033	96.440
6.041	87.924
6.046	81.442
6.146	90.341
6.975	87.430
7.010	88.955
7.860	102.949
7.903	95.069
8.012	94.054
8.013	92.148
8.947	93.306
8.979	97.246
10.021	98.024
10.054	101.329
10.059	95.356
10.088	102.855
10.091	99.169
10.987	102.106
10.998	89.269
11.021	105.029
11.040	83.296
11.061	100.200
11.063	97.150
11.065	95.879
11.066	94.989
11.067	93.464
12.066	100.978
12.963	102.262
13.858	106.597
15.978	106.501
16.947	108.041
17.058	104.356
17.846	107.800
17.920	105.386
17.962	98.015
18.066	102.084
18.072	95.856
18.997	106.546
18.999	104.385
19.072	102.734
20.038	107.832
20.046	98.046
21.047	104.797
25.034	106.381];
data.tL_m(:,1) = (0.5 + data.tL_m(:,1)) * 365; % convert year to d
units.tL_m = {'d', 'cm'}; label.tL_m= {'time since birth', 'total length', 'male'}; 
temp.tL_m = C2K(13); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = {'CranCorn2020'};
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

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
D1 = 'males are supposed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts 
F1 = 'length-weight: Ww in g = 0.00578*(TL in cm)^3.016';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3BHYM'; % Cat of Life
metaData.links.id_ITIS = '162144'; % ITIS
metaData.links.id_EoL = '223145'; % Ency of Life
metaData.links.id_Wiki = 'Esox_masquinongy'; % Wikipedia
metaData.links.id_ADW = 'Esox_masquinongy'; % ADW
metaData.links.id_Taxo = '96371'; % Taxonomicon
metaData.links.id_WoRMS = '1021830'; % WoRMS
metaData.links.id_fishbase = 'Esox-masquinongy'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Esox_masquinongy}}';  
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
bibkey = 'CranCorn2020'; type = 'Article'; bib = [ ...
'doi = {10.1139/cjfas-2018-0404}, ' ...
'author = {Derek P. Crane and Marinda R. Cornett and Cory J. Bauerlien and Michael L. Hawkins and Daniel A. Isermann and Jeff L. Hansbarger and Kevin L. Kapuscinski and Jonathan R. Meerbeek and Timothy D. Simonson and Jeffrey M. Kampa}, ' ...
'year = {2020}, ' ...
'title = {Validity of age estimates from muskellunge (\emph{Esox masquinongy}) fin rays and associated effects on estimates of growth}, ' ... 
'journal = {Canadian Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {77}, '...
'pages = {69-80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WallYeag1990'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Robert Wallus and Bruce L. Yeager and Thomas P. Simon}, ' ...
'year = {1990}, ' ...
'title  = {The reproductive biology and early life history of fishes of the Ohio river}, ' ...
'publisher = {Tennessee Valley Authority}, ' ...
'volume  = {1: Acipenseridae through Esocidae}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Esox-masquinongy.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

