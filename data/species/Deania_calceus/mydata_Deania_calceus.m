function [data, auxData, metaData, txtData, weights] = mydata_Deania_calceus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Centrophoridae';
metaData.species    = 'Deania_calceus'; 
metaData.species_en = 'Birdbeak dogfish'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAm', 'MAE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2018 12 24];                          
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
data.ab = 17*30.5;units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';    
  temp.ab = C2K(5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 12.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'ClarConn2002';
  temp.tp = C2K(5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 12*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'ClarConn2002';
  temp.tpm = C2K(5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 35*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'ClarConn2002';   
  temp.am = C2K(5); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'highest observed age for female';

data.Lb  = 31;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';       bibkey.Lb  = 'fishbase';
  comment.Lb = '29 to 34 cm';
data.Lp  = 106;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for female';    bibkey.Lp  = 'ClarConn2002';
data.Lpm  = 85;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for male';    bibkey.Lpm  = 'ClarConn2002';
data.Li  = 117;  units.Li  = 'cm';  label.Li  = 'ultimate total length for female';      bibkey.Li  = 'ClarConn2002';
data.Lim  = 109;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for male';      bibkey.Lim  = 'ClarConn2002';

data.Wwb = 87.3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = {'ClarConn2002','fishbase'};
  comment.Wwb = 'based on 0.0012*Lb^3.26, see F2';
data.Wwp = 4.8e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'ClarConn2002','fishbase'};
  comment.Wwp = 'based on 0.0012*Lp^3.26, see F2';
data.Wwi = 6.6e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'ClarConn2002','fishbase'};
  comment.Wwb = 'based on 0.0012*Li^3.26, see F2';

data.Ri  = 13/365/4; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'ClarConn2002';   
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '13 pups per litter, assumed: 1 litter per 4 yr';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
2.013	29.819
2.063	25.309
2.063	32.827
2.969	49.690
3.019	24.428
3.069	30.143
3.975	34.073
3.975	35.276
3.975	35.878
3.975	36.780
3.975	50.615
5.031	42.218
5.031	43.120
5.031	51.842
5.987	44.645
5.987	36.525
6.994	48.878
6.994	52.487
6.994	54.292
8.000	46.796
8.000	51.608
8.956	42.306
10.013	66.089
10.918	75.734
10.918	86.561
10.918	88.666
10.969	65.509
10.969	67.915
11.019	50.172
11.019	79.345
12.881	91.417
14.994	89.059
14.994	90.863
15.044	78.534
15.044	81.541
15.044	83.045
15.044	104.699
15.899	81.861
15.950	94.193
16.000	86.074
16.000	88.781
16.956	99.930
16.956	101.735
16.956	107.148
16.956	108.351
17.006	85.495
17.006	87.601
17.057	77.075
17.862	92.733
17.912	96.343
17.912	103.862
18.013	65.067
19.019	103.586
19.019	106.894
20.075	83.459
20.075	105.113
20.931	89.494
20.931	102.125
22.088	93.429
22.088	98.843
22.088	100.948
22.943	109.088
23.094	101.572
24.000	99.788
24.050	85.654
24.805	105.521
24.805	107.025
25.962	104.344
26.013	109.759
27.019	107.676
27.119	100.761
29.031	107.421
29.937	102.629
31.044	105.662
35.069	113.873];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};     label.tL_f = {'age', 'total length', 'female'};  
temp.tL_f = C2K(5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ClarConn2002';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (mm)
1.966	29.417
2.971	33.925
2.971	38.425
3.889	49.233
4.981	42.643
4.981	39.943
4.981	36.943
5.069	45.343
5.943	41.451
5.986	46.251
6.991	40.560
6.991	46.260
7.996	48.069
8.914	57.676
8.914	61.876
12.890	86.210
12.890	90.410
12.934	66.411
12.934	77.511
13.983	64.620
13.983	70.020
13.983	87.720
13.983	90.120
14.856	82.327
14.856	83.527
14.900	84.728
14.900	86.228
14.944	88.328
15.905	89.836
15.905	92.836
15.993	81.137
15.993	82.637
15.993	85.937
16.036	78.137
16.954	85.645
16.954	87.145
16.954	89.245
16.998	83.546
17.871	88.653
17.959	84.754
17.959	86.554
17.959	90.754
17.959	92.254
18.002	82.354
19.051	86.263
19.969	84.471
19.969	79.971
19.969	77.571
20.930	83.579
22.066	83.289
22.066	84.789
22.066	97.389
23.027	84.497
23.945	95.605
23.989	92.006
24.994	84.814
25.955	88.422
26.042	85.123
27.965	84.540
28.883	82.748];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};     label.tL_m = {'age', 'total length', 'male'};  
temp.tL_m = C2K(5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ClarConn2002';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Ovoviviparous. bathydemersal; depth range 60 - 1490 m, usually 400 - 1400 m';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-weight: Ww in g = 0.0012*(TL in cm)^3.26';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6CG9G'; % Cat of Life
metaData.links.id_ITIS = '160742'; % ITIS
metaData.links.id_EoL = '46560171'; % Ency of Life
metaData.links.id_Wiki = 'Deania_calcea'; % Wikipedia
metaData.links.id_ADW = 'Deania_calcea'; % ADW
metaData.links.id_Taxo = '41817'; % Taxonomicon
metaData.links.id_WoRMS = '105903'; % WoRMS
metaData.links.id_fishbase = 'Deania-calcea'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Deania_calcea}}';  
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
bibkey = 'ClarConn2002'; type = 'Article'; bib = [ ... 
'author = {M. W. Clarke and P. L. Connolly and  J. J. Bracken}, ' ...
'year = {2002}, ' ...
'title  = {Catch, discarding, age estimation, growth and maturity of the squalid shark \emph{Deania calceus} west and north of {I}reland}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {56}, ' ...
'pages = {139-153}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Deania-calcea.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

