function [data, auxData, metaData, txtData, weights] = mydata_Polyprion_oxygeneios
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acropomatiformes'; 
metaData.family     = 'Polyprionidae';
metaData.species    = 'Polyprion_oxygeneios'; 
metaData.species_en = 'Hapuku wreckfish'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MA', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 20];

%% set data
% zero-variate data

data.am = 60*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'FranMull1999';   
  temp.am = C2K(11.7);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 88; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 160;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 1.25 mm of Polyprion_americanus: pi/6*0.125^3'; 
data.Wwp = 4669; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Wiki';
  comment.Wwp = 'based on 0.01072*Lp^2.99, see F1';
data.Wwi = 26.3e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on 0.01072*Li^2.99, see F1';

data.Ri = 5.8e6/365;  units.Ri = '#/d';  label.Ri = 'reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(11.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
2.974	47.933
4.045	57.517
4.197	60.804
4.805	74.226
6.737	58.602
7.885	69.008
8.189	76.130
8.336	88.184
8.881	76.675
9.030	86.263
9.166	117.770
9.496	78.042
9.789	103.794
9.950	91.191
10.111	78.862
10.494	81.600
10.865	105.160
10.869	99.132
11.105	88.172
11.110	80.227
12.021	102.415
12.024	97.210
12.099	99.949
12.640	95.015
13.264	79.396
13.940	109.256
13.946	98.023
13.952	86.791
14.108	83.776
14.189	75.283
14.868	99.389
14.932	124.595
15.787	107.879
15.859	117.467
16.863	109.792
17.102	95.270
17.254	98.557
19.020	103.481
19.787	107.588
19.945	99.642
19.946	97.998
19.948	94.436
21.015	112.514
22.174	103.742
23.009	123.465
23.014	114.972
28.932	123.166
29.077	140.151
30.088	119.599
31.317	122.334
32.005	131.098
33.765	147.255
34.008	125.062
34.083	128.897
34.859	116.839
34.934	120.401
36.933	121.762
37.931	125.046
40.857	120.376
46.850	132.131
51.777	124.987
52.006	129.644];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1));  % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(11.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FranMull1999';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.973	48.755
3.046	55.878
3.048	53.412
3.892	55.874
3.893	53.956
3.972	50.942
4.803	78.062
5.183	86.280
5.970	53.947
6.113	75.043
6.186	80.796
6.192	71.207
6.810	66.273
6.879	80.245
6.962	69.012
7.042	63.258
7.043	61.066
7.111	77.778
7.113	74.765
7.185	83.257
7.191	72.298
8.030	85.172
8.038	71.473
8.109	81.884
8.190	74.212
8.495	79.142
8.646	83.525
8.966	61.058
9.100	97.222
9.184	85.989
9.493	82.426
9.572	78.316
9.959	75.027
9.961	71.739
9.964	65.437
10.336	87.902
10.338	84.888
10.570	82.969
10.867	101.872
10.883	72.283
10.958	76.666
11.024	96.392
11.255	95.021
11.568	85.705
11.569	84.609
12.025	94.470
12.028	89.538
12.109	82.415
12.257	91.729
12.951	90.082
13.034	78.027
13.105	88.712
13.109	82.137
13.880	77.750
13.949	92.544
14.566	90.076
14.783	115.280
14.947	96.923
15.030	85.416
15.792	99.386
15.867	102.673
15.872	93.084
15.881	76.097
16.255	96.096
16.875	88.148
17.027	90.065
17.947	95.815
17.949	93.349
18.106	86.773
19.942	105.943
21.083	129.774
24.865	106.471
25.859	116.055
29.852	129.737
32.011	120.139
32.860	115.478
32.943	104.519
37.926	134.361
43.087	121.736
45.087	121.454
52.010	122.521
60.082	129.884];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1));  % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(11.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FranMull1999';
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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: 0.01072*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LKML'; % Cat of Life
metaData.links.id_ITIS = '167915'; % ITIS
metaData.links.id_EoL = '46578883'; % Ency of Life
metaData.links.id_Wiki = 'Polyprion_oxygeneios'; % Wikipedia
metaData.links.id_ADW = 'Polyprion_oxygeneios'; % ADW
metaData.links.id_Taxo = '184391'; % Taxonomicon
metaData.links.id_WoRMS = '221430'; % WoRMS
metaData.links.id_fishbase = 'Polyprion-oxygeneios'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Polyprion_oxygeneios}}';
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
bibkey = 'FranMull1999'; type = 'Article'; bib = [ ...
'author = {Malcolm P. Francis and Kevin P. Mulligan and Nick M. Davies and Michael P. Beentjes}, ' ... 
'year = {1999}, ' ...
'title = { Age and growth estimates for {N}ew {Z}ealand hapuku, \emph{Polyprion oxygeneios}}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {97}, ' ...
'pages = {227–242}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Polyprion-oxygeneios.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
