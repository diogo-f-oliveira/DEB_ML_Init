function [data, auxData, metaData, txtData, weights] = mydata_Epigonus_crassicaudus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acropomatiformes'; 
metaData.family     = 'Epigonidae';
metaData.species    = 'Epigonus_crassicaudus'; 
metaData.species_en = 'Cardinalfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 01 12]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 12]; 

%% set data
% zero-variate data

data.am = 54*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ContArel2013';   
  temp.am = C2K(7.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 20; units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 43;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.13e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'OkamMoto2011';
  comment.Wwb = 'based egg diameter of 0.6 mm for Epigonus affinis: pi/6*0.06^3'; 
data.Wwi = 874; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^2.97, see F1';

data.Ri = 9e4/365;       units.Ri = '#/d';  label.Ri = 'reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(7.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.95';

% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (yr), standard length (cm)
3.103	13.025
3.793	12.941
3.795	13.866
3.987	11.933
3.995	14.958
4.096	16.050
4.295	17.059
4.877	13.025
4.879	13.782
4.884	15.966
5.078	14.874
5.088	18.992
5.091	20.084
5.283	17.899
5.865	14.118
5.867	15.126
5.871	16.639
5.882	21.008
5.884	22.017
6.066	15.966
6.071	17.899
6.083	22.941
6.173	19.160
6.175	20.000
6.189	25.966
6.850	14.034
6.869	22.101
6.874	24.034
6.876	24.790
6.954	16.387
6.956	17.311
6.958	17.899
6.961	19.160
6.963	20.000
6.970	23.025
6.977	25.882
7.163	21.176
7.742	16.218
7.861	24.874
7.962	25.714
8.040	17.311
8.044	18.824
8.056	24.034
8.150	21.849
8.246	20.840
8.250	22.689
8.852	26.975
8.936	21.261
8.938	21.933
8.946	25.042
9.041	23.950
9.137	22.689
9.145	26.050
9.150	27.983
9.229	20.084
9.640	26.975
9.822	21.008
9.825	22.017
9.829	23.866
10.024	22.941
10.029	25.042
10.032	26.050
10.037	27.983
10.041	29.748
10.115	19.832
10.906	21.008
10.916	24.958
10.923	27.731
11.099	19.160
11.108	22.857
11.110	23.697
11.117	26.807
11.123	28.908
11.199	19.832
11.214	26.134
11.401	22.017
11.805	26.134
11.990	21.008
11.994	22.857
11.998	24.286
12.000	24.958
12.005	27.059
12.007	27.815
12.288	22.017
12.382	20.000
12.882	23.025
12.889	26.134
12.894	27.983
12.896	28.908
12.973	20.084
12.976	21.176
12.983	24.034
12.985	24.874
13.076	21.933
13.088	26.891
13.098	31.008
13.101	32.101
13.571	22.941
13.861	20.840
13.963	21.933
13.968	24.034
13.973	25.966
13.978	27.983
13.980	28.908
14.068	24.874
14.081	30.000
14.270	26.891
14.458	23.109
14.657	24.034
14.751	21.933
14.763	26.891
14.956	25.042
14.958	26.050
15.160	28.067
15.162	29.076
15.165	30.084
15.167	31.092
15.648	26.050
15.835	21.933
15.840	24.202
15.842	24.958
15.852	29.076
15.945	26.891
15.953	30.000
15.958	32.017
15.963	34.202
16.034	22.773
16.047	28.151
16.153	31.092
16.727	24.202
16.731	26.050
16.832	26.975
16.933	28.067
17.115	21.933
17.133	28.908
17.135	30.000
17.137	30.924
17.911	24.874
17.914	26.050
17.916	26.891
17.925	30.756
17.929	32.101
18.020	29.076
18.021	29.832
18.116	28.067
18.699	24.958
18.818	33.193
18.899	26.050
18.901	26.891
18.919	34.118
19.002	27.983
19.005	29.160
19.007	30.084
19.010	31.092
19.683	24.370
19.704	33.109
19.906	35.042
19.985	26.891
19.987	27.983
19.990	28.908
19.995	30.924
19.998	32.185
20.091	30.084
20.968	26.134
21.071	27.983
21.073	28.908
21.175	30.084
21.182	33.025
21.184	33.950
21.265	26.891
21.276	31.008
21.279	32.269
21.864	30.084
21.869	32.101
21.872	33.109
21.874	34.118
21.876	34.874
21.958	27.899
21.961	29.076
21.965	30.924
21.977	35.966
22.054	26.891
22.842	27.143
22.845	28.067
22.849	30.000
22.852	31.092
23.044	29.076
23.051	31.849
23.054	33.109
23.057	34.118
23.648	34.118
23.825	25.966
23.832	28.992
23.927	27.311
23.933	30.000
24.036	31.849
24.044	35.126
24.133	30.924
24.138	33.109
24.623	30.084
24.824	31.849
25.014	28.739
25.025	33.109
25.032	35.966
25.117	30.756
25.126	34.202
25.128	35.126
25.603	27.899
25.805	30.000
25.810	31.849
26.103	30.756
26.209	34.034
26.212	35.210
26.295	28.739
26.305	32.941
26.790	29.832
26.893	31.849
26.997	34.034
27.093	32.941
27.098	35.042
27.100	35.630
27.201	36.807
27.384	30.924
27.874	29.832
27.881	32.941
27.970	28.908
27.977	31.849
28.074	31.008
28.179	33.950
28.183	35.378
28.958	29.916
28.968	34.034
28.970	35.042
28.973	36.050
29.158	31.092
29.261	33.109
29.356	31.849
29.760	35.798
29.862	36.975
29.943	30.000
30.054	34.958
30.143	31.092
30.148	33.109
30.150	34.034
30.342	31.849
30.635	31.008
30.847	36.891
30.928	30.000
30.938	33.782
30.941	35.126
30.943	36.050
31.229	31.933
31.330	33.109
31.721	31.933
31.729	35.126
31.817	31.008
31.928	35.882
32.029	36.807
32.120	33.950
32.315	33.025
32.904	31.933
32.908	33.950
32.911	35.126
32.914	36.050
32.916	36.891
33.000	31.008
33.103	33.025
33.889	32.101
33.894	34.202
33.897	35.126
33.899	36.050
33.901	36.807
34.083	31.008
34.088	32.941
34.377	30.084
34.872	31.008
34.879	33.866
34.883	35.798
34.887	37.143
34.889	37.899
34.980	35.126
34.990	38.908
35.170	32.017
35.172	32.941
35.660	31.008
35.766	34.202
35.859	32.017
36.059	32.941
36.071	38.067
36.165	36.050
36.261	35.126
36.265	36.891
36.844	31.849
36.860	38.067
37.044	33.025
37.047	34.286
37.136	30.168
37.138	31.092
37.148	35.126
37.249	36.050
37.251	36.975
37.729	31.008
37.829	31.849
37.835	34.118
37.838	35.294
38.030	33.109
38.037	36.134
38.044	38.992
38.433	36.975
38.820	34.034
38.913	31.849
38.916	33.109
39.010	31.008
39.118	35.210
39.121	36.134
39.320	36.975
39.803	33.025
39.807	34.790
39.899	31.933
40.007	35.882
40.100	33.782
40.290	31.008
40.786	32.101
40.797	36.807
40.894	36.050
41.182	33.025
41.184	33.782
41.187	35.126
41.670	31.092
41.685	37.059
41.776	34.034
41.884	38.151
41.968	32.101
41.975	35.126
42.069	33.109
42.182	38.908
42.273	36.134
42.557	31.092
42.761	34.118
42.869	37.983
42.953	32.017
42.956	33.109
42.963	36.218
42.966	37.143
43.549	33.950
43.552	35.042
43.850	36.134
43.851	36.807
43.940	32.941
44.135	32.017
44.642	37.899
44.726	32.017
44.731	33.950
44.832	35.042
44.835	35.966
44.941	39.244
45.123	32.941
45.132	36.807
45.522	35.042
45.810	32.017
45.913	33.950
45.919	36.050
45.926	38.992
46.009	32.941
46.020	37.143
46.805	35.882
46.894	31.933
46.898	33.866
47.192	32.941
47.295	34.790
47.406	39.916
47.485	31.933
47.788	35.126
47.882	33.109
47.891	36.975
48.081	33.866
48.184	35.798
48.672	33.950
48.768	33.109
48.970	35.126
49.073	36.807
49.268	35.966
49.455	31.933
49.852	33.025
49.854	33.866
50.054	34.958
50.056	35.966
50.835	32.017
50.837	33.025
50.941	34.958
51.036	33.782
51.051	40.000
51.340	37.143
51.822	32.941
52.120	33.866
52.123	34.958
52.128	37.143
53.002	31.933
53.005	32.941
53.007	34.034
53.012	36.134
53.017	38.151
54.097	36.555
54.187	32.941
54.189	34.034
54.192	35.126
54.584	34.118
54.885	36.303
54.971	31.176
55.571	35.126
56.062	34.118
56.946	33.109
58.031	33.866
58.817	32.941
59.709	34.958
60.007	36.134
60.987	33.866
61.190	36.134];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(7.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ContArel2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length: Ww in g = 0.01230 *(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; bathydemersal; depth range 180 - 400 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6FTK4'; % Cat of Life
metaData.links.id_ITIS = '168307'; % ITIS
metaData.links.id_EoL = '46578391'; % Ency of Life
metaData.links.id_Wiki = 'Epigonus_(fish)'; % Wikipedia
metaData.links.id_ADW = 'Epigonus_crassicaudus'; % ADW
metaData.links.id_Taxo = '173853'; % Taxonomicon
metaData.links.id_WoRMS = '273404'; % WoRMS
metaData.links.id_fishbase = 'Epigonus-crassicaudus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epigonus}}';
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
bibkey = 'ContArel2013'; type = 'Article'; bib = [ ... 
'author = {Javier E. Contreras-Reyes and Reinaldo B. Arellano-Valle}, ' ... 
'year = {2013}, ' ...
'title = {Growth estimates of cardinalfish (\emph{Epigonus crassicaudus}) based onscale mixtures of skew-normal distributions}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {147}, ' ...
'pages = {137-144}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OkamMoto2011'; type = 'Article'; bib = [ ... 
'author = {Makoto Okamoto and Hiroyuki Motomura and Takashi Asahida}, ' ... 
'year = {2011}, ' ...
'title = {Redescription of a Poorly Known Deepwater Cardinalfish, \emph{Epigonus affinis} ({A}ctinopterygii: {P}erciformes: {E}pigonidae), and Comparison with Related Species}, ' ...
'journal = {Species diversity}, ' ...
'volume = {16}, ' ...
'pages = {85-92}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Epigonus-crassicaudus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
