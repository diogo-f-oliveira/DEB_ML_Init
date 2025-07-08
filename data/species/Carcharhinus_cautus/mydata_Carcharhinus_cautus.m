function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_cautus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_cautus'; 
metaData.species_en = 'Nervous shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2020 10 27];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 31];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 31];

%% set data
% zero-variate data

data.ab = 11*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'WhitHall2002';    
  temp.ab = C2K(16.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 22*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'WhitHall2002';   
  temp.am = C2K(27.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 37;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'WhitHall2002';  
  comment.Lb = '35 to 39 cm';
data.Lp  = 101;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'WhitHall2002'; 
  comment.Lp = '180  to 200 cm';
data.Lpm  = 91;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'WhitHall2002'; 
  comment.Lpm = '170  to 190 cm';
data.Li  = 113;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'WhitHall2002';
data.Lim  = 111;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'WhitHall2002';
  comment.Lim = 'based on remark that males are 10 cm shorter than females';

data.Wwi = 167.4e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'fishbase','WhitHall2002'};
  comment.Wwi = 'based on 0.00331*Li^3.10, see F1';
data.Wwim = 167.4e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';      bibkey.Wwim = {'fishbase','WhitHall2002'};
  comment.Wwim = 'based on 0.00331*Lim^3.10, see F1';

data.Ri  = 4.2/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'WhitHall2002';   
  temp.Ri = C2K(27.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.2 per litter, 1 litter each 2 yrs';

% uni-variate data
 
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.080	41.207
0.120	44.390
0.160	49.563
0.160	53.142
0.241	39.225
0.521	49.976
0.601	56.344
1.042	71.477
1.042	76.249
1.122	69.492
1.243	64.326
1.283	67.908
1.443	64.335
1.964	75.097
2.085	83.057
2.165	67.947
2.245	81.075
2.405	77.105
2.486	72.336
2.566	82.283
2.646	88.650
2.686	77.117
3.007	92.245
3.047	88.667
3.087	92.249
3.127	83.103
3.247	100.608
3.247	86.290
3.247	81.517
3.448	81.526
3.448	83.912
3.448	86.299
3.448	92.265
3.648	88.296
3.808	83.928
3.889	86.318
3.929	81.150
4.009	93.483
4.009	91.096
4.089	107.407
4.129	77.181
4.169	89.513
4.209	97.071
4.209	87.526
4.410	97.080
4.410	81.569
4.450	95.491
4.450	78.389
4.530	93.506
4.650	96.693
4.891	78.408
5.051	91.540
5.091	96.315
5.091	95.121
5.212	98.309
5.292	92.744
5.292	89.562
5.372	107.066
5.412	100.306
5.412	98.317
5.492	96.332
5.612	100.713
5.853	100.723
5.933	92.375
6.013	97.151
6.053	99.141
6.174	102.726
6.174	106.306
6.174	109.487
6.254	89.605
6.374	104.326
6.575	98.767
6.895	99.178
7.056	108.731
7.056	110.322
7.096	105.153
7.136	106.348
7.136	101.178
7.136	99.985
7.216	97.999
7.256	90.842
7.376	107.552
8.178	115.940
8.218	106.396
8.218	103.214
8.379	115.949
8.459	109.588
8.579	102.037
8.940	111.996
9.140	112.403
9.220	105.645
9.421	124.347
9.421	112.415
9.661	103.676
9.742	119.191
10.022	116.419
10.183	109.267
10.183	110.858
10.183	115.233
10.183	122.392
10.223	119.212
10.343	116.035
10.383	120.412
10.503	118.031
10.984	112.882
11.065	109.704
11.225	110.108
11.425	116.879
11.425	120.060
11.746	115.302
11.947	112.527
12.107	114.522
12.267	111.348
12.388	128.058
12.388	116.921
12.588	113.351
12.628	116.932
12.628	111.761
12.748	118.926
13.189	110.991
13.229	133.265
13.430	118.558
13.911	124.148
14.192	122.171
14.673	128.159
15.073	125.392
15.194	126.193
16.116	115.495
16.396	133.803];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(27.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'WhitHall2002';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.040	46.653
0.080	43.469
0.161	40.284
0.201	37.100
1.165	60.524
1.165	54.956
1.406	66.081
1.487	61.703
1.688	70.842
1.688	73.626
1.688	65.273
2.049	68.837
2.129	60.083
2.170	65.252
2.371	77.970
2.411	72.798
2.893	77.152
3.134	74.755
3.174	89.867
3.254	79.522
3.335	76.337
3.737	80.694
4.138	79.881
4.219	91.412
4.580	87.021
4.902	86.609
4.942	100.527
5.263	94.547
5.946	93.722
5.987	89.743
6.670	100.053
6.991	98.050
7.071	102.820
7.714	93.643
8.036	99.595
8.116	97.205
8.277	101.573
9.884	105.479
9.924	103.489
9.964	91.953
10.004	107.463
10.326	103.471
12.094	106.177];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(27.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'WhitHall2002';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

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
D1 = 'Males are assumed to differ from females by {p_Am} ans E_Hp only';
D2 = 'Temperatures are guessed';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww on g = 0.00331 * (TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'R3N4'; % Cat of Life
metaData.links.id_ITIS = '160388'; % ITIS
metaData.links.id_EoL = '46559802'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_cautus'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_cautus'; % ADW
metaData.links.id_Taxo = '106446'; % Taxonomicon
metaData.links.id_WoRMS = '271320'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-cautus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_cautus}}';
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
bibkey = 'WhitHall2002'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00227-002-0914-6}, ' ...
'author = {W.T. White and N.G. Hall and I.C. Potter}, ' ... 
'year = {2002}, ' ...
'title = {Size and age compositions and reproductive biology of the nervous shark \emph{Carcharhinus cautus} in a large subtropical embayment, including an analysis of growth during pre- and postnatal life}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {141}, ' ...
'pages = {1153-1164}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Carcharhinus-cautus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

