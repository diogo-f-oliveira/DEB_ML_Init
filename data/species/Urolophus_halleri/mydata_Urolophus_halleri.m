function [data, auxData, metaData, txtData, weights] = mydata_Urolophus_halleri

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Urolophidae';
metaData.species    = 'Urolophus_halleri'; 
metaData.species_en = 'Round stingray'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2019 02 28];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 3*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'floridamuseum';    
  temp.ab = C2K(23.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 16*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'HaleLowe2008';   
  temp.am = C2K(23.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 7.2;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'floridamuseum';
  comment.Lb = '6.3 to 8 cm';
data.Lp_f = 14.6;   units.Lp_f  = 'cm';  label.Lp_f  = 'disc width at puberty for females'; bibkey.Lp_f  = 'HaleLowe2008';
data.Lp_m = 14.4;   units.Lp_m  = 'cm';  label.Lp_m  = 'disc width at puberty for males'; bibkey.Lp_m  = 'HaleLowe2008'; 
data.Li_f  = 22.4;  units.Li_f  = 'cm';  label.Li_f  = 'ultimate disc width for females';   bibkey.Li_f  = 'HaleLowe2008';
data.Li_m  = 31;  units.Li_m  = 'cm';  label.Li_m  = 'ultimate disc width for males';   bibkey.Li_m  = 'HaleLowe2008'; 

data.Wwi_m = 1.4e3; units.Wwi_m = 'g';   label.Wwi_m = 'ultimate wet weight for males'; bibkey.Wwi_m = 'fishbase'; 

data.Ri  = 4.5/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'floridamuseum';   
  temp.Ri = C2K(23.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 to 6 pups per litter';
  
% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), disk width (cm)
0.003	7.672
0.005	9.655
0.005	9.871
0.024	8.836
0.027	11.552
0.264	8.621
0.527	10.345
0.527	10.862
0.547	9.914
0.549	12.198
0.748	10.517
0.749	11.552
0.990	11.681
1.007	9.483
1.009	11.207
1.009	11.379
1.534	14.828
2.013	12.155
2.031	10.000
2.032	11.552
2.054	13.362
2.496	14.138
2.497	14.483
2.497	14.914
2.497	15.129
2.515	12.371
2.515	12.629
2.558	15.517
2.998	14.009
3.039	15.345
3.519	13.966
3.521	15.517
3.524	18.879
4.002	15.388
4.022	15.690
4.485	17.586
4.504	16.207
4.522	14.310
4.522	14.440
4.523	15.474
4.525	16.552
4.567	19.310
5.004	14.224
5.004	15.000
5.004	15.129
5.027	18.060
5.028	18.233
5.524	13.405
5.525	14.181
5.525	14.526
5.526	15.388
5.528	17.371
5.529	17.716
5.529	17.974
5.529	18.362
6.008	15.690
6.029	16.552
6.031	18.621
6.509	15.819
6.532	17.888
6.532	18.534
7.032	16.853
7.032	17.155
7.033	17.414
7.514	17.241
7.536	19.440
8.014	15.991
8.015	17.241
8.493	13.750
8.537	17.629
8.540	20.603
9.000	19.655
9.539	16.983
9.542	19.828
10.023	19.310
10.564	18.534
11.032	25.345
11.045	18.750
11.548	20.000
12.094	24.397
12.550	19.526
14.016	21.336];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
temp.tL_f = C2K(23.6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HaleLowe2008'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disk width (cm)
0.001	6.164
0.005	10.043
0.023	7.500
0.023	7.586
0.023	8.017
0.023	8.276
0.023	8.319
0.024	8.621
0.024	9.310
0.025	9.483
0.548	11.379
0.548	11.638
0.549	11.897
1.030	12.241
1.510	10.948
1.531	11.724
2.033	12.629
2.514	11.595
2.540	17.974
2.996	12.543
3.018	14.009
3.039	15.733
3.518	12.759
3.519	13.491
3.520	15.129
3.523	17.586
3.542	16.509
3.545	19.655
3.997	10.474
4.021	14.957
4.039	12.586
4.506	18.147
4.768	19.267
5.047	17.414
5.509	18.103
5.525	14.181
5.530	19.569
5.748	16.293
6.006	13.448
6.029	16.983
6.514	20.388
6.530	16.422
6.532	18.664
7.016	21.034
7.052	17.026
7.055	20.043
7.295	19.483
7.533	16.552
8.016	17.845
8.017	18.793
8.017	19.009
8.018	20.172
8.500	20.517
8.518	18.362
8.518	18.491
8.520	20.991
8.522	23.103
9.023	22.069
9.038	17.069
9.039	18.233
9.040	19.526
9.041	20.560
9.523	20.603
9.523	21.034
9.544	21.767
9.544	22.026
9.563	20.388
10.028	24.483
10.504	18.448
10.507	21.552
11.027	20.948
11.030	23.578
11.032	25.043
11.549	20.862
11.549	21.336
11.550	21.552
11.550	21.810
11.550	22.155
12.276	25.517
14.039	23.966
];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1)); % convert yr to 
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
temp.tL_m = C2K(23.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HaleLowe2008'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Li_m = 5 * weights.Li_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouping
set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'ovoviviparus';
metaData.bibkey.F1 = 'floridamuseum'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DW7Z'; % Cat of Life
metaData.links.id_ITIS = '160966'; % ITIS
metaData.links.id_EoL = '46561066'; % Ency of Life
metaData.links.id_Wiki = 'Urolophus_halleri'; % Wikipedia
metaData.links.id_ADW = 'Urolophus_halleri'; % ADW
metaData.links.id_Taxo = '626911'; % Taxonomicon
metaData.links.id_WoRMS = '283085'; % WoRMS
metaData.links.id_fishbase = 'Urolophus-halleri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urobatis_halleri}}'; 
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
bibkey = 'HaleLowe2008'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2008.01940.x}, ' ...
'author = {L. F. Hale and C. G. Lowe}, ' ...
'year = {2008}, ' ...
'title  = {Age and growth of the round stingray \emph{Urobatis halleri} at {S}eal {B}each, {C}alifornia}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {73}, ' ...
'pages = {510-523}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Urolophus-halleri.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'floridamuseum'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.floridamuseum.ufl.edu/discover-fish/species-profiles/urobatis-halleri/}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 