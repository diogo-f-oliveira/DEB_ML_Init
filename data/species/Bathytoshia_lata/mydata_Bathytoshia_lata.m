function [data, auxData, metaData, txtData, weights] = mydata_Bathytoshia_lata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Dasyatidae';
metaData.species    = 'Bathytoshia_lata'; 
metaData.species_en = 'Broad stingray'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 09];                          
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
data.ab = 1.8*365; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(20.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 28*365; units.am = 'd';    label.am = 'life span';             bibkey.am = 'DaleHoll2012';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 40;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth'; bibkey.Lb  = 'DaleHoll2012';
data.Lp  = 104.9;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty for females'; bibkey.Lp  = 'DaleHoll2012';
data.Lpm  = 74.9;  units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty for males'; bibkey.Lpm  = 'DaleHoll2012';
data.Li  = 260;  units.Li  = 'cm';  label.Li  = 'ultimate disc width '; bibkey.Li  = 'fishbase';
 
data.Ri  = 6/365/2; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on DaleHoll2012 who remark that fecundity is low: 6 pups per litter, 1 litter each 2 yrs, in view of ab ';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.087	35.381
0.089	41.905
0.090	44.002
1.029	45.655
1.029	47.286
1.110	42.861
1.969	48.939
2.051	51.038
2.090	46.612
2.990	52.458
3.112	49.432
3.114	55.956
3.850	58.303
3.930	55.509
4.010	51.317
4.953	61.824
4.954	66.251
5.073	56.701
5.156	58.800
6.014	62.781
6.015	64.179
6.016	66.276
6.016	68.839
6.095	60.453
6.099	72.336
6.873	67.694
6.874	70.723
6.916	73.054
6.954	65.599
6.958	77.016
7.034	60.475
7.035	63.038
7.816	80.066
7.937	75.874
7.977	73.778
8.055	63.528
8.058	72.149
8.097	65.626
8.098	68.189
8.098	70.053
8.960	82.655
9.038	73.570
9.039	74.968
9.079	71.707
9.080	77.299
9.081	79.629
9.941	87.571
9.942	90.834
9.979	78.019
10.063	85.011
10.225	81.753
10.960	82.469
11.002	87.596
11.779	91.575
11.985	95.308
12.186	86.226
12.227	88.790
13.045	93.935
13.047	99.760
14.150	101.184
15.009	107.728
15.988	105.188
16.030	109.150
17.011	112.435
17.050	106.844
17.950	114.554
18.030	109.896
19.011	114.113
19.952	120.659
20.033	116.467
21.014	122.781
21.993	119.775
22.974	123.759
23.996	130.074
24.077	125.881
25.997	132.683
27.017	131.309
27.998	133.895];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};
temp.tL_f = C2K(20.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'DaleHoll2012';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.088	38.410
1.069	42.394
1.069	44.025
1.927	46.375
1.928	49.171
2.008	43.115
3.031	51.527
3.071	48.965
3.152	46.637
4.135	58.776
4.136	60.873
4.910	56.464
5.032	54.137
6.014	61.383
6.096	63.249
6.995	66.299
7.034	61.407
7.198	62.342
8.138	66.326
8.139	68.889
9.200	70.078
9.201	72.875
9.284	74.508
10.142	78.256
10.266	81.754
11.164	83.173
11.165	85.736
12.147	92.283
12.187	89.255
12.226	86.460
14.148	94.893
15.005	94.680
15.128	96.314
16.148	96.104
16.148	97.269
16.149	99.134
17.210	98.226
18.109	101.509
18.149	98.015
18.967	105.024
19.048	102.696
20.029	104.816
21.008	103.674
21.009	106.237
22.970	111.875
24.969	110.757];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};
temp.tL_m = C2K(20.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'DaleHoll2012';
comment.tL_m = 'data for males';

% time-weight
data.tWw_f = [ ... % time since birth (yr), wet weight (g)
0.122	1784.735
0.245	2464.493
1.061	2475.564
1.061	3696.149
1.837	2892.935
2.082	4388.085
2.898	2907.327
3.061	5350.711
3.143	4402.477
3.918	5362.336
3.959	3464.207
4.163	6857.474
4.939	8631.052
5.020	4834.794
5.020	6191.001
5.020	7411.586
5.959	10950.438
5.959	6610.598
6.000	8102.968
6.041	9595.339
6.857	8792.690
6.898	10285.072
6.898	13539.950
7.020	11236.074
7.020	12321.037
7.102	6897.330
7.878	14502.576
7.959	8807.636
8.000	12334.322
8.000	11520.591
8.000	10435.640
8.041	7859.402
8.041	7181.305
9.020	16688.001
9.020	15196.185
9.020	14111.222
9.020	13433.112
9.061	12077.471
9.061	10450.032
9.918	22667.470
9.918	19276.959
9.959	18192.550
9.959	16971.977
10.000	15480.702
10.082	14396.846
10.939	15900.299
11.020	20783.733
12.041	25815.510
12.041	22289.389
12.122	18628.753
12.939	30574.394
12.980	28540.643
13.061	26507.458
13.837	29501.609
14.898	37517.596
14.939	39688.075
15.918	35632.752
15.918	40786.323
16.980	44598.080
16.980	35240.279
17.959	47866.243
18.000	44205.053
18.000	39322.726
18.816	43538.027
19.102	43541.902
19.878	54130.782
20.041	49657.534
20.939	49940.956
20.939	50754.675
22.000	49006.007
26.000	61944.165
27.020	60873.041
27.959	66039.338];
data.tWw_f(:,1) = data.tWw_f(:,1) * 365; % convert yr to d
n=size(data.tWw_f,1); for i=2:n; if data.tWw_f(i,1)<=data.tWw_f(i-1,1); data.tWw_f(i,1)=data.tWw_f(i-1,1)+1e-3; end; end
units.tWw_f = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};
temp.tWw_f = C2K(15);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'DaleHoll2012';
comment.tWw_f = 'data for females';
%
data.tWw_m = [ ... % time since birth (yr), wet weight (g)
0.041	1648.006
1.959	1945.255
2.857	3042.396
6.204	7292.017
6.898	5945.221
7.918	10570.143
7.918	8807.083
8.980	10448.925
8.980	13025.705
10.000	14802.604
10.000	16430.043
14.082	25165.090
14.816	23547.615
14.898	29244.769
14.939	26532.921
15.878	27630.604
16.000	26818.545
16.041	25462.904
17.061	25747.975
18.000	27930.632
18.000	27116.913
18.939	32825.692
18.939	31469.485
20.000	32161.986
20.939	33395.291
21.061	31091.416
22.980	33694.212
25.020	37248.011];
data.tWw_m(:,1) = data.tWw_m(:,1) * 365; % convert yr to d
n=size(data.tWw_m,1); for i=2:n; if data.tWw_m(i,1)<=data.tWw_m(i-1,1); data.tWw_m(i,1)=data.tWw_m(i-1,1)+1e-3; end; end
units.tWw_m = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};
temp.tWw_m = C2K(15);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'DaleHoll2012';
comment.tWw_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Lb = 10 * weights.Lb;
weights.ab = 3 * weights.ab;

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
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';     
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length - weight: Ww in g = 0.00575  * (TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'KYL3'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '52572075'; % Ency of Life
metaData.links.id_Wiki = 'Bathytoshia_lata'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '4974514'; % Taxonomicon
metaData.links.id_WoRMS = '1018707'; % WoRMS
metaData.links.id_fishbase = 'Bathytoshia-lata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dasyatis_lata}}';   
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
bibkey = 'DaleHoll2012'; type = 'article'; bib = [ ...  
'doi = {10.1071/MF11231}, ' ...
'author = {J. J. Dale and K. N. Holland}, ' ...
'year = {2012}, ' ...
'title  = {Age, growth and maturity of the brown stingray (\emph{Dasyatis lata}) around {O}ahu, {H}awai''i}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {63}, ' ...
'pages = {475-484}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bathytoshia-lata.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];