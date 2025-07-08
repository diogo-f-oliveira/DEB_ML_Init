function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_ciliatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_ciliatus'; 
metaData.species_en = 'Dusky rockfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNE','MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 29];

%% set data
% zero-variate data

data.am = 67 *365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(4.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 29;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 53;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 330;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 2.1e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 8e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(4.1);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Sebastes_flavidus for 53 cm:';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
2.997	19.851
3.137	19.099
3.207	17.844
4.134	23.498
4.845	26.264
4.915	25.386
4.918	27.897
4.984	24.257
6.053	30.414
6.119	26.021
6.125	31.293
6.126	32.423
6.128	33.929
6.193	28.783
6.262	26.901
6.975	31.173
6.980	35.692
6.981	36.571
7.115	29.919
7.120	34.689
7.125	39.082
7.190	34.061
7.260	32.681
7.902	37.204
8.042	36.075
8.045	38.209
8.047	40.092
8.111	33.942
8.112	34.695
8.116	38.963
8.894	37.838
8.899	41.855
8.967	39.847
8.968	40.851
8.970	42.608
9.032	34.575
9.042	43.487
9.176	37.086
9.242	32.945
9.246	36.208
9.320	38.970
9.953	35.836
9.959	40.857
10.028	38.975
10.031	41.485
10.034	43.745
10.035	44.372
10.036	45.627
10.103	42.364
11.024	43.249
11.025	44.253
11.029	47.014
11.094	42.496
11.154	33.333
11.164	41.492
11.168	45.258
11.169	45.886
11.233	40.112
11.234	40.614
11.373	38.983
11.946	44.761
12.016	44.134
12.086	43.255
12.089	45.640
12.225	40.871
12.232	47.147
12.870	47.151
13.012	47.905
13.073	39.998
13.077	42.885
13.078	44.266
13.081	46.149
13.087	51.170
13.146	41.881
13.150	45.019
13.216	41.129
13.933	48.790
13.996	41.636
14.065	40.381
14.066	40.757
14.068	42.766
14.130	35.235
14.143	46.783
14.282	44.022
14.284	45.529
14.286	47.411
14.854	49.172
14.918	43.022
14.923	47.792
14.990	44.027
14.992	45.910
14.993	46.663
15.050	35.240
15.051	35.868
15.058	42.019
15.062	45.031
15.123	37.124
16.122	43.783
16.195	45.917
16.196	46.670
16.198	48.177
16.262	42.528
16.906	47.930
16.968	40.399
16.972	44.165
16.974	45.796
17.042	43.035
17.044	44.793
17.107	38.266
17.120	49.061
17.971	51.075
18.034	43.920
18.174	42.791
18.180	48.063
18.181	48.942
18.887	47.064
19.026	44.931
19.031	49.073
20.090	46.820
20.093	48.829
20.157	42.929
21.012	48.081
21.151	45.572
21.153	47.078
21.221	44.693
21.995	40.682
22.073	46.958
22.074	47.962
22.075	48.967
22.142	45.201
23.058	41.818
23.062	45.207
23.063	45.960
23.196	38.806
23.983	45.715
24.059	50.234
24.967	40.198
25.115	44.969
25.188	46.978
25.889	41.334
25.958	39.953
26.105	44.222
26.177	45.227
27.019	39.081
27.100	47.617
28.228	43.106
28.232	47.248
28.867	44.867
28.935	42.859
28.946	52.022
29.928	44.120
30.138	42.364
30.145	48.390
30.851	46.888
30.911	37.725
30.919	44.001
30.998	50.905
31.850	53.296
32.122	44.009
34.034	43.895
37.931	46.556];
data.tL_f(:,1) = 365*(0.3+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f   = C2K(4.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Reut1999';  comment.tL_f = 'females from Gulf of Alaska';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
2.659	19.823
2.770	20.828
2.772	21.832
2.985	18.820
3.324	24.971
3.758	22.964
3.982	26.102
4.631	22.087
4.857	26.104
4.860	27.861
5.523	32.131
5.634	33.135
5.847	29.872
6.063	28.617
6.503	29.873
6.507	32.133
6.615	31.254
6.730	34.518
6.836	32.761
6.838	33.891
6.841	35.522
7.062	37.029
7.610	37.909
7.612	38.662
7.718	37.156
7.723	39.667
7.820	33.265
7.821	33.767
7.823	34.771
7.826	36.529
7.923	29.751
7.927	31.759
7.929	32.638
8.144	30.755
8.707	40.171
8.802	31.886
8.813	38.163
8.815	39.041
8.816	39.543
8.818	41.175
8.820	41.928
8.822	43.184
8.918	36.154
8.919	36.657
9.030	37.284
9.136	35.276
9.479	43.812
9.580	39.419
9.582	40.173
9.591	45.570
9.687	38.039
9.794	36.533
9.795	37.286
9.802	41.177
9.912	41.805
10.011	36.031
10.896	41.933
10.899	43.439
11.013	45.950
11.221	40.301
11.777	45.449
11.878	40.679
11.883	43.566
11.885	44.947
11.891	47.834
12.100	42.563
12.645	42.062
12.650	44.698
12.862	40.933
12.981	46.581
13.195	43.820
13.637	46.583
13.640	48.089
13.738	41.939
13.848	42.441
13.851	43.822
14.622	47.087
14.721	41.941
14.722	42.443
14.727	45.079
14.728	45.706
14.943	43.698
15.597	42.570
15.818	44.077
15.922	41.064
15.930	45.458
16.040	45.709
16.151	46.839
16.692	43.828
16.694	44.832
16.810	48.723
16.907	41.694
16.915	46.213
16.918	47.594
17.574	47.846
17.670	40.692
17.783	42.700
17.897	45.085
18.113	44.082
18.558	47.974
18.651	39.438
18.874	41.824
18.989	45.088
19.095	43.205
19.645	45.215
19.856	40.696
19.859	42.705
19.971	43.960
20.195	46.847
20.729	40.070
20.732	41.577
21.934	41.705
23.792	41.834
23.798	44.721
24.889	43.970
25.221	45.979
27.622	44.604
28.062	45.860
29.807	43.981
29.924	47.872
30.024	42.851
30.905	46.870
31.008	42.979
31.654	37.834
31.891	48.127
32.761	45.744
33.737	41.604
33.852	44.868
38.113	43.747
41.625	51.788
43.036	46.770
46.098	47.655
47.737	47.658
49.050	48.038
50.029	45.655
51.232	46.034];
data.tL_m(:,1) = 365*(0.3+data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m   = C2K(4.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Reut1999'; comment.tL_m = 'males from Gulf of Alaska';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
%weights.Wwp = 0 * weights.Wwp;
%weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7LH'; % Cat of Life
metaData.links.id_ITIS = '166714'; % ITIS
metaData.links.id_EoL = '46568128'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_ciliatus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_ciliatus'; % ADW
metaData.links.id_Taxo = '187261'; % Taxonomicon
metaData.links.id_WoRMS = '274782'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-ciliatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_ciliatus}}, ';
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
bibkey = 'Reut1999'; type = 'phdthesis'; bib = [ ... 
'howpublished = {\url{https://scholarworks.calstate.edu/downloads/6d5702326}}, ' ...
'author = {Rebecca Francesca Reuter},' ...
'year = {1999}, ' ...
'title = {DESCRIBING DUSKY ROCKFISH (\emph{Sebastes ciliatus}) HABITAT IN THE {G}ULF OF {A}LASKA USING HISTORICAL DATA}, ' ...
'school = {California State University, Hayward}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-ciliatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
