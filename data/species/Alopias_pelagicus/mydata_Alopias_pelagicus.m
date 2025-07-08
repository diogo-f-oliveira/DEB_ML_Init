function [data, auxData, metaData, txtData, weights] = mydata_Alopias_pelagicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Lamniformes'; 
metaData.family     = 'Alopiidae';
metaData.species    = 'Alopias_pelagicus'; 
metaData.species_en = 'Pelagic thresher'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MI','MP'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCic', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.7); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm     = [2020 07 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data
data.ab = 1.8*365; units.ab = 'd';      label.ab = 'age at birth';               bibkey.ab = 'guess';    
  temp.ab = C2K(26.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 8.6 * 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(26.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 7.5 * 365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'ADW';
  temp.tpm = C2K(26.7); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 38.5*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'LiuChen1999';   
  temp.am = C2K(26.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 82;       units.Lb  = 'cm';  label.Lb  = 'precaudal length at birth'; bibkey.Lb  = 'ADW';  
  comment.Lb = 'at TL 12-40 cm, the yolk sac is completely resorbed; birth at PCL 72-91 cm, TL 173 cm';
data.Lp  = 147.5;    units.Lp  = 'cm';  label.Lp  = 'precaudal length at puberty for females';  bibkey.Lp  = 'ADW'; 
  comment.Lp = 'PCL 145-150 cm, TL 282-292 cm';
data.Lpm  = 142.5;   units.Lpm  = 'cm';  label.Lpm  = 'precaudal length at puberty for males';  bibkey.Lpm  = 'ADW'; 
  comment.Lpm = 'PCL 140-145 cm, TL 267-276 cm';
data.Li  = 187;      units.Li  = 'cm';  label.Li  = 'ultimate precaudal length for females';    bibkey.Li  = 'LiuChen1999';
data.Lim  = 168;     units.Lim  = 'cm';  label.Lim  = 'ultimate precaudal length for males';    bibkey.Lim  = 'LiuChen1999';

data.Wwp = 73.9e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = 'LiuChen1999';
  comment.Wwp = 'based on 1.59e-4*Lp^2.613, see F2';
data.Wwpm = 64.6e3;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';    bibkey.Wwpm = 'LiuChen1999';
  comment.Wwim = 'based on 1.96e-4*Lpm^2.562, see F2';
data.Wwi = 137.3e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';                  bibkey.Wwi = 'LiuChen1999';
  comment.Wwi = 'based on 1.59e-4*Li^2.613, see F2';
data.Wwim = 98.5e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';      bibkey.Wwim = 'LiuChen1999';
  comment.Wwim = 'based on 1.96e-4*Lim^2.562, see F2';

data.Ri  = 2/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'LiuChen1999';   
  temp.Ri = C2K(26.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter, 1 litter each 2 yrs assumed';
  
% uni-variate data
 
% time-length post birth
data.tL_f = [ ... % time since birth (yr), precaudal length (cm)
0       82 % precaudal length at birth
0.978	94.952
2.029	107.339
2.029	104.870
2.977	121.484
2.978	118.310
2.978	116.547
3.959	137.041
3.960	133.867
3.961	128.577
3.996	124.700
3.997	122.231
3.997	120.115
4.912	134.259
4.977	147.310
4.979	136.731
4.980	132.146
5.016	125.800
5.017	122.626
5.929	145.586
5.998	140.652
5.999	138.536
5.999	137.125
6.000	134.657
6.001	131.836
6.002	127.252
6.981	153.741
6.982	149.861
6.983	148.098
6.983	145.277
6.984	140.693
6.985	138.930
6.985	137.519
6.986	135.756
6.986	135.051
7.021	130.820
7.903	137.204
7.936	142.143
7.937	140.027
8.002	149.199
8.003	146.025
8.004	143.909
8.034	158.016
8.035	156.253
8.035	154.842
8.885	154.877
8.888	142.535
8.888	140.419
8.920	149.589
8.921	147.473
8.952	157.701
8.957	136.896
8.989	144.655
9.022	152.415
9.972	159.154
9.972	157.744
9.974	152.454
9.975	148.222
10.007	155.629
10.007	153.866
10.010	141.171
10.926	149.320
10.956	165.190
10.992	160.607
10.992	157.786
10.993	154.965
10.993	153.202
10.994	151.086
11.031	139.803
11.942	168.052
11.944	158.178
11.978	156.769
11.979	155.006
11.979	152.890
12.010	166.292
12.012	160.297
12.079	163.826
12.079	162.416
12.928	167.740
12.928	166.330
12.963	161.042
12.998	158.222
13.981	170.958
13.981	169.547
14.084	165.672
14.899	172.407
15.986	175.978];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'precaudal length', 'female'};  
temp.tL_f    = C2K(26.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'LiuChen1999';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), precaudal length (cm)
0       82 % precaudal length at birth
0.968	93.501
1.938	111.839
1.969	106.196
2.969	125.592
3.000	118.892
3.000	117.834
3.001	114.660
3.001	111.134
3.884	127.355
3.916	116.423
3.973	125.239
3.973	122.771
3.974	119.950
4.944	140.050
4.945	136.171
4.946	131.940
4.976	129.118
5.006	124.887
5.036	126.650
5.918	142.166
5.919	140.403
5.919	138.640
5.919	136.524
5.947	143.929
5.979	133.703
6.950	149.572
6.951	146.751
6.953	135.819
6.953	135.466
6.954	129.824
6.980	145.340
7.011	140.403
7.011	138.640
7.015	122.066
7.040	143.224
7.957	133.350
7.983	149.924
7.984	147.103
7.985	143.929
7.985	141.108
7.986	139.345
8.017	130.882
8.956	158.741
8.957	153.451
8.958	151.335
8.959	142.519
8.989	140.050
9.017	148.161
9.077	146.045
9.902	155.214
9.902	153.451
9.958	167.204
9.959	164.736
9.960	157.683
9.989	162.620
10.019	160.856
10.022	143.577
10.934	160.504
10.935	157.683
10.966	148.161
10.967	143.929
11.024	151.335
11.938	159.093
11.966	165.441
11.969	154.509
11.969	153.804
11.969	150.982
11.996	162.972
12.026	160.856
12.999	168.615
13.000	163.678
13.001	158.035
13.002	154.156
13.974	165.441];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'precaudal length', 'male'};  
temp.tL_m    = C2K(26.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'LiuChen1999';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Mean temp 26.7 C is guessed, usually 0 - 152 m deep';
metaData.bibkey.D2 = 'fishbase'; 
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 1.59e-1 * (PCL in cm)^2.613  for females, 1.96e-1*(PCL in cm)^2.562 for males';
metaData.bibkey.F2 = 'LiuChen1999'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'C5K6'; % Cat of Life
metaData.links.id_ITIS = '159922'; % ITIS
metaData.links.id_EoL = '46559745'; % Ency of Life
metaData.links.id_Wiki = 'Alopias_pelagicus'; % Wikipedia
metaData.links.id_ADW = 'Alopias_pelagicus'; % ADW
metaData.links.id_Taxo = '41893'; % Taxonomicon
metaData.links.id_WoRMS = '220019'; % WoRMS
metaData.links.id_fishbase = 'Alopias-pelagicus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alopias_pelagicus}}';
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
bibkey = 'LiuChen1999'; type = 'Article'; bib = [ ... 
'author = {Kwang-Ming Liu and Che-Tsung Chen and Tai-Hsiang Liao and Shoou-Jeng Joung}, ' ... 
'year = {1999}, ' ...
'title = {Age, Growth, and Reproduction of the Pelagic Thresher Shark, \emph{Alopias pelagicus} in the {N}orthwestern {P}acific}, ' ...
'journal = {Copeia}, ' ...
'volume = {1999(1)}, ' ...
'pages = {68-74}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Alopias-pelagicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Alopias_pelagicus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

