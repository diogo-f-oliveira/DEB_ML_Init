function [data, auxData, metaData, txtData, weights] = mydata_Mustelus_canis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Mustelus_canis'; 
metaData.species_en = 'Dusky smooth-hound'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.4); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 20];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data;
data.ab = 10.5*30.5; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';   
  temp.ab = C2K(22.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 16*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'ConrGels2002';   
  temp.am = C2K(22.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 35;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'Wiki';
  comment.Lb = 'TL 34-39 cm';
data.Lp = 100;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'Wiki';
  comment.Lp = 'TL 70 - 130 cm';
data.Lpm = 82; units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'Wiki';
  comment.Lpm = 'TL 68 - 93 cm';
data.Li  = 150;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwi  = 13.6e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00245*Li^3.10, see F3';

data.Ri  = 20/365/2;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(22.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '20 pups per litter, 1 litter per 2 yr assumed';
    
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	61.569
0.000	53.725
0.000	54.118
0.000	55.294
0.000	36.667
0.000	38.235
0.000	63.137
0.000	44.902
0.015	64.118
0.016	67.059
0.030	48.627
0.032	54.706
0.034	58.431
0.049	43.725
0.052	51.961
0.068	38.627
0.074	57.255
0.092	49.216
0.095	59.216
0.096	61.373
0.097	63.137
0.196	53.922
0.899	69.020
0.918	64.706
0.921	73.529
1.002	71.765
1.005	79.412
1.007	84.510
1.020	64.510
1.021	66.667
1.045	75.294
1.124	67.843
1.124	69.020
1.890	88.824
1.950	83.922
1.951	85.882
1.953	91.176
2.050	75.686
2.054	88.431
2.094	83.529
2.096	90.588
2.097	92.353
2.097	93.137
2.218	86.471
2.918	95.882
2.919	98.235
2.959	94.706
3.063	99.216
3.064	103.333
3.065	106.471
3.144	96.667
3.945	100.196
3.946	101.569
3.947	103.725
3.947	104.706
4.009	106.078
4.031	109.804
4.071	107.843
4.110	100.392
4.110	101.569
4.111	104.118
4.151	102.941
4.973	105.490
4.975	111.176
4.975	112.353
4.975	113.137
5.015	109.804
5.018	116.471
5.035	107.843
5.058	113.922
5.059	117.843
5.060	119.804
5.077	110.980
5.137	105.490
5.897	109.804
5.898	111.765
5.899	113.137
5.939	112.941
5.961	117.059
5.962	118.235
6.022	114.510
6.023	116.667
6.046	125.098
6.062	110.392
6.065	119.412
6.065	121.373
6.066	123.137
6.082	109.216
6.084	114.706
6.124	113.529
6.165	111.961
6.246	110.392
6.863	115.098
6.924	114.118
6.947	119.608
6.967	117.059
6.984	108.824
6.985	109.804
6.987	118.431
7.006	112.549
7.009	122.157
7.010	125.098
7.011	126.078
7.021	96.078
7.026	111.569
7.050	120.392
7.051	122.941
7.051	124.118
7.069	115.490
7.086	105.686
7.087	108.039
7.088	110.980
7.089	113.922
7.090	116.863
7.090	118.431
7.128	109.804
7.253	115.294
7.911	120.784
7.954	125.490
7.970	113.529
7.971	115.490
7.972	118.627
8.010	108.039
8.011	111.176
8.014	121.373
8.053	115.294
8.054	116.667
8.054	117.843
8.056	122.941
8.072	110.784
8.073	113.529
8.076	121.176
8.078	128.235
8.116	118.824
8.957	118.824
8.979	124.314
8.997	115.686
9.000	125.098
9.037	112.745
9.040	122.745
9.041	126.275
9.055	106.863
9.057	111.176
9.058	115.882
9.059	118.824
9.060	120.392
9.064	132.157
9.080	117.647
9.983	121.569
10.000	109.804
10.001	111.569
10.003	119.608
10.022	113.529
10.022	114.706
10.027	127.843
10.044	119.216
10.087	123.725
10.168	121.373
10.229	120.196
10.949	124.510
10.990	125.294
11.010	123.333
11.027	114.706
11.028	116.863
11.029	119.412
11.029	120.588
11.030	121.765
11.092	124.510
12.013	118.039
12.018	131.373
12.034	118.235
12.035	121.373
12.035	122.353
12.036	124.510
12.057	126.667
12.976	113.922
13.001	127.059
13.001	128.235
13.018	117.059
13.018	118.627
13.019	119.608
13.020	123.922
13.040	121.961
13.984	124.118
14.027	128.824
14.043	115.294
15.031	124.902
15.031	126.471
16.034	119.412
16.071	108.824];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(22.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ConrGels2002';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.000	56.471
0.000	51.765
0.000	53.137
0.000	54.510
0.000	59.412
0.000	62.549
0.000	42.353
0.000	49.804
0.000	51.373
0.000	56.471
0.000	61.961
0.000	37.059
0.000	38.431
0.000	39.412
0.000	42.941
0.000	44.510
0.000	47.059
0.000	47.843
0.008	55.294
0.007	60.784
0.005	33.529
0.005	35.098
0.027	40.000
0.028	41.373
0.031	49.412
0.033	57.843
0.034	58.824
0.057	66.471
0.070	46.078
0.088	36.471
0.114	54.510
0.134	52.353
0.155	53.529
0.178	60.980
0.237	52.353
0.817	70.000
0.922	75.686
0.941	73.333
0.942	73.922
0.942	75.686
0.956	56.471
0.961	70.784
0.979	62.157
0.980	66.078
0.980	67.255
0.996	53.333
0.999	60.784
1.002	71.569
1.004	76.078
1.004	77.647
1.005	79.412
1.005	80.196
1.020	63.333
1.021	66.667
1.040	62.745
1.041	64.510
1.042	67.451
1.047	81.373
1.081	61.765
1.106	73.725
1.126	74.902
1.165	68.627
1.309	70.000
1.868	84.510
1.887	78.039
1.950	82.745
1.990	80.980
1.990	81.569
1.992	87.843
1.994	91.176
2.012	83.922
2.049	72.353
2.049	73.529
2.054	86.667
2.071	77.255
2.072	79.412
2.073	82.745
2.075	90.392
2.113	80.980
2.114	84.706
2.133	78.431
2.794	91.373
2.916	89.412
2.918	94.118
2.938	94.706
2.956	86.863
2.978	90.784
2.999	92.353
3.019	91.176
3.037	81.765
3.037	82.941
3.039	88.627
3.041	96.078
3.042	97.255
3.043	100.980
3.059	87.059
3.063	98.627
3.078	83.725
3.102	92.941
3.103	94.902
3.141	86.275
3.164	94.118
3.204	90.392
3.882	95.098
3.883	98.627
3.921	88.627
3.924	97.059
3.944	95.294
3.946	101.765
3.963	92.157
3.984	94.314
4.002	85.490
4.006	97.647
4.027	100.000
4.042	83.725
4.048	101.176
4.049	103.922
4.067	96.275
4.085	89.020
4.086	90.588
4.107	92.941
4.108	94.902
4.171	99.020
4.868	98.627
4.931	102.157
4.969	94.314
4.971	100.588
5.011	96.667
5.011	97.843
5.032	99.608
5.034	103.137
5.034	104.314
5.049	87.059
5.050	91.176
5.050	92.549
5.072	95.098
5.074	102.157
5.075	105.686
5.136	103.725
5.196	98.824
5.218	101.373
5.914	98.824
5.915	102.157
5.916	105.294
5.975	96.471
5.992	86.667
5.994	91.765
5.997	99.804
6.015	94.510
6.015	95.098
6.017	100.196
6.019	104.510
6.040	105.882
6.078	98.627
6.100	101.765
6.102	107.059
6.121	105.098
6.962	104.706
6.983	105.294
7.002	101.176
7.003	103.137
7.004	106.275
7.004	107.255
7.042	98.824
7.043	100.196
7.082	95.098
7.125	101.765
8.131	104.314
8.132	105.882
9.015	109.608
9.075	104.510
9.075	105.098
10.040	106.078];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(22.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ConrGels2002';
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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'aplacental viviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'demersal; depth range 0 - 800 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.00245 * (TL in cm)^3.10';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '44QZX'; % Cat of Life
metaData.links.id_ITIS = '160230'; % ITIS
metaData.links.id_EoL = '46559986'; % Ency of Life
metaData.links.id_Wiki = 'Mustelus_canis'; % Wikipedia
metaData.links.id_ADW = 'Mustelus_canis'; % ADW
metaData.links.id_Taxo = '106422'; % Taxonomicon
metaData.links.id_WoRMS = '158518'; % WoRMS
metaData.links.id_fishbase = 'Mustelusc-anis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mustelus_canis}}';  
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
bibkey = 'ConrGels2002'; type = 'article'; bib = [ ... 
'author = {Christina L. Conrath and James Gelsleichter and John A. Musick}, ' ...
'year = {2002}, ' ...
'title  = {Age and growth of the smooth dogfish (\emph{Mustelus canis}) in the northwest {A}tlantic {O}cean}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {100}, ' ...
'pages = {674-682}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mustelus-canis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

