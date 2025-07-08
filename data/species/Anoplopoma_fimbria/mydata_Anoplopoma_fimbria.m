function [data, auxData, metaData, txtData, weights] = mydata_Anoplopoma_fimbria

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Anoplopomatidae';
metaData.species    = 'Anoplopoma_fimbria'; 
metaData.species_en = 'Sablefish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2018 12 17];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2022 12 04]; 

%% set data
% zero-variate data

data.ab = 14.5;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = {'ClarJens1999','AldeJens1988'};   
  temp.ab = C2K(6);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 94*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(2.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 60.5;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'fishbase'; 
data.Li  = 120;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';
  
data.Wwb = 4.6e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'ClarJens1999';
  comment.Wwb = 'based on egg diameter of 2.06 mm: pi/6*0.206^3';
data.Wwp = 2.3e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01122*Lp^2.98';
data.Wwi = 17.7e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^2.98, see F1; fishbase reports max of 57 kg';

data.Ri  = 1e6/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(2.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
0.000	18.905
0.099	22.191
0.099	25.963
0.099	26.815
0.099	29.371
0.198	21.460
0.297	20.000
0.297	20.487
0.395	28.398
0.395	32.779
0.593	31.805
0.593	33.753
0.791	30.345
0.988	37.282
0.988	39.838
1.087	34.848
1.087	37.890
1.087	39.229
1.186	34.361
1.186	41.055
1.582	41.907
1.779	36.065
1.779	45.193
1.779	46.045
1.878	38.499
1.878	49.209
1.878	50.183
1.977	38.986
1.977	51.156
2.076	37.282
2.076	41.176
2.076	40.203
2.076	43.854
2.175	47.018
2.175	47.748
2.273	53.103
2.372	43.002
2.768	42.394
2.768	43.002
2.768	43.976
2.768	45.314
2.768	46.288
2.867	47.748
2.867	51.278
2.867	53.103
2.965	48.844
2.965	52.130
2.965	54.077
3.163	46.897
3.163	56.024
3.361	52.495
3.954	59.797
3.954	60.892
4.053	55.903
4.152	58.337
4.152	58.945
4.349	53.469
4.448	56.024
4.646	56.755
4.745	59.067
4.745	60.892
4.942	58.093
5.041	56.511
5.239	65.761
5.832	72.089
5.931	59.797
5.931	69.655
6.030	47.992
6.030	56.146
6.030	60.892
6.030	70.385
6.129	62.110
6.227	66.978
6.227	68.195
6.326	66.247
6.425	64.300
6.425	75.740
6.524	56.024
6.722	60.162
6.722	61.988
6.722	67.465
6.820	59.189
6.919	71.116
7.018	54.686
7.117	56.998
7.117	57.972
7.908	49.087
7.908	52.130
8.007	54.564
8.007	59.919
8.007	60.527
8.007	71.968
8.007	66.126
8.105	59.189
8.105	61.744
8.105	74.158
8.204	55.538
8.204	57.241
8.303	57.972
8.303	67.951
8.303	65.396
8.699	58.945
8.896	52.008
8.995	49.817
9.094	53.103
9.094	55.538
9.094	57.120
9.094	58.215
9.094	75.254
9.094	78.418
9.094	69.899
9.292	74.037
9.292	76.227
9.292	66.004
9.390	68.560
9.390	67.708
9.489	57.485
9.786	81.947
9.885	76.957
9.885	77.931
9.885	65.030
9.984	51.400
9.984	52.130
9.984	52.860
9.984	54.077
9.984	54.929
9.984	60.162
9.984	79.391
9.984	79.878
9.984	69.655
9.984	66.978
10.082	57.972
10.082	60.771
10.082	67.708
10.181	55.538
10.181	61.866
10.181	72.576
10.181	73.671
10.181	75.132
10.280	48.114
10.280	56.998
10.280	64.179
10.675	66.734
10.972	53.225
10.972	59.919
10.972	65.274
11.071	55.538
11.071	60.771
11.170	55.051
11.170	67.708
11.269	53.834
11.269	56.998
11.269	61.988
11.763	53.225
11.960	55.051
11.960	56.998
11.960	57.850
11.960	58.945
11.960	60.162
11.960	67.099
12.059	69.899
12.158	61.988
12.158	83.895
12.257	73.063
12.850	72.089
12.949	48.114
13.048	57.241
13.048	55.781
13.245	60.041
13.839	55.172
13.839	62.231
13.839	71.724
14.036	57.241
14.036	64.179
14.926	76.957
15.222	58.215
15.717	63.205
15.914	65.274
16.013	57.850
16.112	60.284
16.112	60.892
16.705	56.876
17.100	66.004
17.298	59.067
17.891	57.850
18.089	65.030
18.188	82.799
18.979	71.724
19.077	61.379
20.066	69.047
20.264	66.247
20.956	62.840
21.054	63.813
21.153	68.073
21.252	65.882
22.241	60.162
23.031	65.761
23.031	60.892
23.031	67.099
23.031	69.168
24.020	67.951
24.020	71.846
24.119	57.972
24.119	69.899
24.316	56.998
25.206	82.921
26.096	56.268
26.392	59.189
26.491	64.909
27.084	59.310
27.183	60.892
27.282	64.179
27.974	59.310
27.974	75.010
28.072	63.205
28.171	69.168
28.171	66.856
28.171	54.199
30.939	62.840
31.137	68.803
31.137	70.872
32.026	56.146
32.916	66.247
33.213	69.168
34.201	60.284
34.201	61.988
34.201	65.882
35.783	70.629
35.980	71.968
36.079	65.030
37.166	67.221
38.353	67.343
40.033	61.136
40.033	57.241
40.923	59.919
42.109	55.903
42.306	65.274
43.097	63.813
43.888	58.215
44.975	55.051
45.074	73.793
46.063	71.724
46.359	63.083
46.656	65.882
46.952	56.755
46.952	83.043
47.743	60.649
49.028	61.258
49.720	67.951
49.819	69.168
51.301	65.882
51.796	65.639
51.895	62.718
51.895	61.744
51.993	67.221
53.773	60.041
54.069	62.961
54.959	57.241
55.058	59.067
56.145	69.777
56.145	71.968
57.232	65.882
58.913	57.728];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(2.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HeadKell2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'abj has been applied since related species show acceleration; foetal development was ignored because of absence of its combination with abj. The effect is probably very small.';
D3 = 'mod_1: p_M is reduced';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'legnth-weight: Ww in g =0.01122*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '66WKW'; % Cat of Life
metaData.links.id_ITIS = '167123'; % ITIS
metaData.links.id_EoL = '46569739'; % Ency of Life
metaData.links.id_Wiki = 'Anoplopoma_fimbria'; % Wikipedia
metaData.links.id_ADW = 'Anoplopoma_fimbria'; % ADW
metaData.links.id_Taxo = '44957'; % Taxonomicon
metaData.links.id_WoRMS = '159463'; % WoRMS
metaData.links.id_fishbase = 'Anoplopoma-fimbria'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anoplopoma_fimbria}}';
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
bibkey = 'HeadKell2014'; type = 'Article'; bib = [ ... 
'author = {M. A. Head and A. A. Keller and M. Bradburn}, ' ... 
'year = {2014}, ' ...
'title = {Maturity and growth of sablefish, \emph{Anoplopoma fimbria}, along the {U}.{S}. {W}est {C}oast}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {159}, ' ...
'pages = {56-67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ClarJens1999'; type = 'Article'; bib = [ ... 
'author = {W. C. Clarke and J. O. T.  Jensen and J. Klimek and Z. Pakula}, ' ... 
'year = {1999}, ' ...
'title = {Rearing of Sablefish (\emph{Anoplopoma fimbria}) from Egg to Juvenile}, ' ...
'journal = {Bull. Aquacul. Assoc. Canada}, ' ...
'volume = {99}, ' ...
'pages = {11-12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AldeJens1988'; type = 'Article'; bib = [ ... 
'author = {Alderdice, D. F. and Jensen, J. O. T. and Velsen, F. P. J.}, ' ... 
'doi = {10.1016/0044-8486(88)90335-3}, ' ...
'year = {1988}, ' ...
'title = {Preliminary trials on incubation of sablefish eggs (\emph{Anoplopoma fimbria})}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {69}, ' ...
'pages = {271-290}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Anoplopoma-fimbria.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

