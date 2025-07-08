  function [data, auxData, metaData, txtData, weights] = mydata_Lophius_gastrophysus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lophiiformes'; 
metaData.family     = 'Lophiidae';
metaData.species    = 'Lophius_gastrophysus'; 
metaData.species_en = 'Blackfin goosefish'; 

metaData.ecoCode.climate = {'MB', 'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 02 22]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 22];

%% set data
% zero-variate data
data.am = 20*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'VazdRoss2019';   
  temp.am = C2K(22.6);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 37;   units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'guess'; 
data.Li = 67.5;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.7 mm for Lophius piscatorius: pi/6*0.07^3'; 
data.Wwp = 603;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01148*Lp^3.01, see F1';
data.Wwi = 3683; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^3.01, see F1; max. published weight: 329.80 g';

data.Ri  = 5e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(22.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lophius_americanus';
    
% uni-variate data
% time-length
data.tL = [ ... % age (yr), total length (cm)
1.973	13.238
2.838	14.371
2.908	31.473
2.908	23.108
2.942	21.622
2.942	21.436
2.942	16.046
3.946	30.007
3.946	32.238
3.946	36.513
3.981	13.651
3.981	22.015
3.981	28.893
4.015	34.098
4.015	35.213
4.050	26.292
4.050	27.221
4.881	33.558
4.950	39.879
4.950	38.020
4.985	45.084
4.985	25.382
5.019	43.412
5.019	36.535
5.019	34.862
5.019	30.401
5.019	29.843
5.054	48.432
5.054	28.543
5.054	27.800
5.088	32.261
5.088	26.685
5.885	37.482
5.885	38.411
5.919	40.085
5.919	40.643
5.919	42.130
5.919	45.847
5.919	47.892
5.919	50.308
5.919	51.609
5.954	33.952
5.954	34.881
5.954	36.182
5.988	46.964
6.023	25.961
6.023	29.121
6.023	31.537
6.058	26.705
6.058	33.211
6.092	30.237
6.888	40.663
6.923	53.489
6.923	52.373
6.923	50.515
6.923	26.909
6.958	61.668
6.958	57.765
6.958	51.073
6.958	49.028
6.958	48.099
6.958	47.170
6.958	43.266
6.958	32.672
6.992	45.683
6.992	44.940
6.992	44.196
6.992	42.338
6.992	41.780
6.992	39.735
6.992	35.832
7.027	56.093
7.027	38.807
7.027	36.948
7.027	35.089
7.027	25.424
7.062	59.440
7.062	56.837
7.096	38.251
7.892	56.297
7.927	38.082
7.927	47.004
7.927	52.394
7.962	51.651
7.962	53.696
7.962	55.741
7.996	36.596
7.996	39.756
7.996	43.474
7.996	50.165
7.996	55.184
7.996	59.459
8.031	31.393
8.031	33.995
8.031	34.367
8.031	57.415
8.031	65.593
8.065	48.494
8.100	32.881
8.965	53.159
9.000	64.126
9.000	62.639
9.000	62.082
9.000	58.736
9.000	51.487
9.000	50.372
9.000	45.167
9.035	60.596
9.035	60.038
9.035	51.859
9.035	40.335
9.035	32.714
9.069	57.065
9.069	56.321
9.069	53.905
9.069	38.291
9.069	36.619
9.104	57.623
9.104	55.578
9.969	54.853
9.969	53.923
9.969	52.994
9.969	52.622
9.969	49.834
10.004	68.236
10.004	60.801
10.004	56.340
10.004	52.437
10.004	47.790
10.038	64.334
10.038	63.218
10.038	61.546
10.038	58.386
10.073	62.476
10.073	60.059
10.073	59.502
11.008	59.335
11.008	57.662
11.042	70.117
11.042	69.187
11.042	67.886
11.042	66.957
11.042	59.893
11.042	56.362
11.042	55.061
11.077	71.976
11.112	65.843
11.112	64.914
11.112	64.356
11.112	63.055
11.977	72.924
11.977	70.136
12.012	71.438
12.012	68.835
12.046	65.490
12.081	66.235
13.015	73.689
13.050	67.370
13.050	74.433
13.085	70.159
13.085	72.389
13.119	71.089
14.054	75.569
14.054	73.710
14.054	69.807
14.054	68.692
14.088	76.313
14.123	66.649
15.023	78.005
15.058	78.750
15.092	75.219
15.127	71.688
15.127	72.989
15.162	76.335
16.062	76.912
16.096	74.682
16.131	77.842
16.131	75.612
17.065	85.854
17.065	84.925
17.065	81.022
17.135	80.465
17.135	79.350
18.035	85.317];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1);if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(22.6); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'VazdRoss2019'};
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 3 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed on the basis of preferred temperature from fishbase';
metaData.discussion = struct('D1', D1);
                                 
%% Facts
F1 = 'length-weight: Ww in g = 0.01148*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3W2LX'; % Cat of Life
metaData.links.id_ITIS = '164500'; % ITIS
metaData.links.id_EoL = '46566108'; % Ency of Life
metaData.links.id_Wiki = 'Lophius'; % Wikipedia
metaData.links.id_ADW = 'Lophius_gastrophysus'; % ADW
metaData.links.id_Taxo = '179103'; % Taxonomicon
metaData.links.id_WoRMS = '159185'; % WoRMS
metaData.links.id_fishbase = 'Lophius-gastrophysus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lophius}}';  
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
bibkey = 'VazdRoss2019'; type = 'techreport'; bib = [ ... 
'author = {Andr\''{e} Martins Vaz-dos-Santos and Carmen L\''{u}cia Del Bianco Rossi-Wongtschowski}, '...
'year = {2019}, ' ...
'title = {Growth in fisheries resources from the {S}outhwestern {A}tlantic}, ' ...
'institution = {Instituto Oceanogr\''{a}fico – USP S\~{a}o Paulo}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lophius-gastrophysus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
