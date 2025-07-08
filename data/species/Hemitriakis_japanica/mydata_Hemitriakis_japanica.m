function [data, auxData, metaData, txtData, weights] = mydata_Hemitriakis_japanica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Hemitriakis_japanica'; 
metaData.species_en = 'Japanese topeshark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biSvm'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data

data.ab = 7.8*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'guess';   
  temp.ab = C2K(20.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(20.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 20.5;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase'; 
  comment.Lb = '20 to 21  cm';
data.Lp  = 81;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 120;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';
data.Lim  = 110; units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';

data.Wwb = 44.4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on 0.00417*Lb^3.07, see F3';
data.Wwp = 3e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00417*Lp^3.07, see F3';
data.Wwi = 10e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00417*Lim^3.07, see F3';
data.Wwim = 7.7e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';  bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00417*Lim^3.07, see F3';
 
data.Ri  = 15/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(20.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8 till 22 pups per litter, one litter per yr';

% uni-variate data
 
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.982	52.184
1.960	62.529
2.009	74.483
2.013	70.115
2.070	72.644
3.017	71.724
3.031	78.391
3.052	77.011
3.091	77.011
3.989	88.276
3.992	85.057
3.993	84.138
3.993	83.218
4.007	90.345
4.010	87.126
4.042	96.552
4.043	94.713
4.044	93.333
4.045	91.954
4.046	90.805
4.048	88.966
4.069	87.816
4.110	85.057
4.123	94.023
5.005	100.000
5.010	94.023
5.011	92.644
5.012	91.034
5.023	101.609
5.025	99.080
5.027	96.782
5.033	89.885
5.034	89.195
5.064	99.770
5.076	85.517
5.093	89.195
5.095	86.437
5.110	91.954
5.173	88.046
5.230	90.115
5.231	88.736
5.233	86.207
5.272	87.356
5.934	97.471
5.986	105.747
5.988	103.448
5.995	94.483
6.017	91.954
6.022	85.977
6.024	83.908
6.025	82.299
6.031	99.080
6.036	93.103
6.049	101.149
6.058	90.115
6.071	98.391
6.097	91.264
6.125	104.828
6.127	102.069
6.132	96.782
6.132	96.092
6.134	93.793
6.186	102.989
6.188	100.690
6.189	98.391
6.273	92.874
6.348	97.701
6.981	95.402
6.983	92.414
7.005	89.425
7.035	100.920
7.038	97.471
7.073	103.218
7.079	95.632
7.117	97.931
7.132	103.448
7.134	100.920
7.217	95.862
7.235	97.701
7.315	96.552
7.964	98.391
7.982	100.920
7.999	103.908
8.007	94.253
8.036	106.437
8.072	110.575
8.080	100.920
8.101	99.540
8.156	104.368
8.986	102.529
8.987	100.920
8.992	94.713
8.994	92.644
9.002	107.356
9.003	105.287
9.011	96.322
9.017	112.644
9.067	100.460
9.069	97.701
9.126	99.540
9.942	91.264
10.005	110.345
10.011	103.448
10.023	111.954
10.067	106.207
10.941	99.540
10.970	112.184
10.978	101.839
11.055	104.828
11.078	100.000
11.133	105.057
13.002	111.034
13.042	109.655
13.139	111.494
13.180	109.425
14.031	105.517
14.088	108.276];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth','total length','female'};  
temp.tL_f    = C2K(20.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'TanaChen1978';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.955	64.673
1.990	61.071
2.011	63.314
2.088	64.199
2.109	65.769
2.970	66.288
2.973	69.209
2.975	71.680
3.024	63.132
3.035	74.591
3.036	75.714
3.052	72.116
3.113	75.701
3.133	76.596
3.942	83.192
3.956	77.347
3.963	84.986
4.021	86.099
4.031	76.434
4.071	78.225
4.077	83.842
4.116	84.509
4.117	86.082
4.993	82.104
4.995	84.800
5.018	88.392
5.041	92.433
5.058	89.958
5.136	91.966
5.152	89.042
5.153	89.940
5.157	93.760
5.998	94.058
6.059	96.969
6.174	97.173
7.011	93.651
7.019	101.515
7.054	97.913
10.044	105.241];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth','total length','male'};  
temp.tL_m    = C2K(20.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'TanaChen1978';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 2 * weights.psd.p_M;
weights.psd.kap = 5 * weights.psd.kap;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Ovoviparity (aplacental viviparity)';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Preferred temp 20.2 C, usually 20 - 345 m deep';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Ww (in g) = 0.00417*(TL in cm)^3.07';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '3KTLY'; % Cat of Life
metaData.links.id_ITIS = '160543'; % ITIS
metaData.links.id_EoL = '46559977'; % Ency of Life
metaData.links.id_Wiki = 'Hemitriakis_japanica'; % Wikipedia
metaData.links.id_ADW = 'Hemitriakis_japanica'; % ADW
metaData.links.id_Taxo = '106416'; % Taxonomicon
metaData.links.id_WoRMS = '281042'; % WoRMS
metaData.links.id_fishbase = 'Hemitriakis-japanica'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hemitriakis_japanica}}';
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
bibkey = 'TanaChen1978'; type = 'Article'; bib = [ ... 
'author = {Sho Tanaka and Che-Tsung Chen and Kazuhiro Mizue}, ' ... 
'year = {1978}, ' ...
'title = {Studies an Sharks-{X}{V}{I}: {A}ge and Growth of Eiraku Shark \emph{Galeorhinus japonicus} ({M}\"{u}ller et {H}enle)}, ' ...
'journal = {Bull. Fac. Fish. Nagasaki Univ.}, ' ...
'volume = {45}, ' ...
'pages = {19-28}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hemitriakis-japanica.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

