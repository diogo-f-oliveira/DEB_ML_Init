function [data, auxData, metaData, txtData, weights] = mydata_Nerodia_sipedon
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Nerodia_sipedon'; 
metaData.species_en = 'Common watersnake'; 

metaData.ecoCode.climate = {'B','Cs','Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg','0iFm'};
metaData.ecoCode.embryo  = {'Ts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'L-dL'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 02];

%% set data
% zero-variate data

data.ab = 122;     units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'AnAge';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9.6*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 26.8;    units.Lb  = 'cm';  label.Lb  = 'SVL at birth';      bibkey.Lb  = 'King1986';
data.Lp  = 60;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';      bibkey.Lp  = 'King1986';
data.Li  = 103;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'King1986';
data.Lim  = 82.3;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';  bibkey.Lim  = 'King1986';

data.Wwb = 10.4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'King1986';
data.Wwi = 745;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'AnAge';
  
% univariate data
% time-length
data.LdL_f = [ ... % SVL (cm), change in SVL (cm/d)
38.083	0.018
40.071	0.058
55.789	0.030
55.846	0.023
58.882	0.035
63.971	0.034
65.081	0.049
65.979	0.030
67.960	0.037
70.021	0.024
70.073	0.000
70.973	0.030
71.928	0.036
71.931	0.020
73.899	0.009
75.148	0.013
76.698	0.016
76.821	0.020
76.888	0.014
76.911	0.018
77.793	0.012
77.897	-0.003
78.888	0.024
78.891	0.009
79.922	0.011
79.928	0.012
79.950	0.015
80.014	0.009
80.815	0.007
80.950	0.012
80.957	0.013
81.813	0.020
83.309	0.014
84.771	-0.012
84.902	0.009
85.935	0.011
86.095	0.020
86.846	-0.006
86.988	0.016
87.744	0.007
88.865	0.007
88.920	-0.017
89.095	0.027
89.144	0.019
89.895	0.008
90.331	0.013
94.058	0.006
94.077	0.009
94.887	0.008
95.022	-0.003
96.109	0.008
96.976	0.000
97.123	0.007
98.932	0.003
102.174	-0.016];
units.LdL_f  = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL', 'female'};  
temp.LdL_f   = C2K(20);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'King1986'; comment.LdL_f = 'Data for females';
%
data.LdL_m = [ ... % SVL (cm), change in SVL (cm/d)
26.849	0.030
34.620	0.050
38.868	0.029
40.711	0.031
43.029	0.026
46.748	0.018
48.905	0.021
51.953	0.003
51.957	0.020
52.865	0.019
53.841	0.028
55.752	0.008
55.769	0.011
56.747	0.004
56.828	0.017
56.841	0.019
58.067	0.003
60.848	0.008
61.857	0.022
62.003	0.013
62.871	0.006
64.783	0.018
64.942	0.011
65.892	0.000
65.910	0.003
66.030	0.006
67.830	0.000
69.818	0.008
69.825	0.009
70.089	0.003
70.719	0.006
70.867	-0.003
71.044	0.009
71.837	0.005
71.868	-0.006
71.907	0.016
81.891	0.000];
units.LdL_m  = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL', 'male'};  
temp.LdL_m   = C2K(20);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'King1986'; comment.LdL_m = 'Data for males';

% time-weight
data.LW_f = [ ... % SVL (cm), weight (g)
17.568	10.372
19.888	10.460
21.232	13.936
22.089	19.105
24.896	14.075
26.972	14.154
28.810	31.347
29.904	17.691
31.250	24.591
31.741	31.459
33.203	21.241
33.818	33.250
34.912	21.306
36.140	38.476
37.115	35.088
38.096	45.400
38.826	38.578
39.681	38.610
39.685	50.597
40.777	30.091
42.004	47.261
43.112	71.275
44.934	43.947
47.872	64.607
49.950	68.111
51.058	92.126
55.099	124.814
56.071	111.152
59.118	94.145
59.124	111.268
60.123	171.238
62.075	166.175
64.154	173.103
64.308	260.438
65.260	193.693
66.466	150.931
68.326	228.057
70.181	291.483
71.114	173.368
72.128	274.434
72.985	279.604
74.244	382.391
75.049	245.436
75.125	454.343
76.029	254.035
76.268	240.345
77.376	264.360
78.244	300.352
78.285	411.655
78.968	276.407
80.206	322.687
80.216	351.797
81.054	303.883
81.240	478.548
81.348	440.881
82.292	351.876
82.345	495.713
83.322	495.750
83.658	411.859
84.136	382.768
84.168	470.098
84.461	605.383
85.110	375.955
85.184	578.013
85.341	340.005
86.181	300.654
86.217	396.546
87.268	598.640
88.451	495.946
88.493	610.673
89.127	341.862
89.390	393.242
89.576	567.906
90.481	371.023
90.493	401.845
91.418	595.374
92.390	580.000
93.347	526.954
93.477	549.219
94.455	550.969
95.377	402.031
95.414	501.348
96.561	633.241
97.302	655.529
98.488	559.684
100.449	578.594
100.583	612.846
103.440	744.804];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'weight', 'female'};  
bibkey.LW_f = 'King1986'; comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % SVL (cm), weight (g)
43.106	54.152
43.344	37.038
44.941	62.783
45.914	52.546
48.004	90.297
50.200	85.244
51.168	61.308
51.795	105.852
53.010	87.063
53.631	117.908
54.478	95.680
56.310	95.750
56.935	135.157
57.410	97.504
58.160	147.190
59.132	131.816
60.850	154.142
61.081	118.192
61.089	140.452
63.050	159.363
63.276	109.714
64.020	140.564
64.890	183.405
65.740	169.739
66.962	173.210
66.995	262.253
67.827	200.640
68.433	186.965
69.278	161.312
69.904	202.432
70.126	140.796
70.263	183.610
71.013	229.871
71.613	200.784
72.961	212.822
74.327	276.230
75.154	200.919
78.334	214.739
82.262	269.683];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'weight', 'male'};  
bibkey.LW_m = 'King1986'; comment.LW_m = 'Data for males';

data.LN = [ ... % SVL (cm), yearly fecundity (#)
72.939	12.860
72.949	16.027
73.996	17.083
75.046	19.194
75.979	20.633
76.041	28.215
76.049	18.234
76.934	16.891
76.979	19.194
78.110	22.073
81.046	21.689
81.103	14.971
82.035	28.791
82.088	20.921
82.098	24.184
82.941	21.689
83.053	20.537
84.962	25.144
85.026	21.017
86.005	25.048
86.064	19.098
87.016	26.967
87.083	36.084
87.123	23.992
88.025	27.927
88.034	31.094
89.998	16.027
90.045	18.810
90.052	21.113
90.103	24.856
91.995	24.184
92.002	13.820
94.085	50.000
95.106	30.038
96.059	25.720
96.075	18.426];
units.LN  = {'d', '#'};  label.LN = {'time since birth', 'yearly fecundity'};  
temp.LN   = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'King1986'; 

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_f = 3 * weights.LdL_f;
weights.LdL_m = 3 * weights.LdL_m;
weights.Lb = 3 * weights.Lb;
weights.Li = 5 * weights.Li;
%weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '476BV'; % Cat of Life
metaData.links.id_ITIS = '174251'; % ITIS
metaData.links.id_EoL = '46559528'; % Ency of Life
metaData.links.id_Wiki = 'Nerodia_sipedon'; % Wikipedia
metaData.links.id_ADW = 'Nerodia_sipedon'; % ADW
metaData.links.id_Taxo = '485020'; % Taxonomicon
metaData.links.id_WoRMS = '344095'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Nerodia&species=sipedon'; % ReptileDB
metaData.links.id_AnAge = 'Nerodia_sipedon'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nerodia_sipedon}}';
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
bibkey = 'King1986'; type = 'article'; bib = [ ... 
'author = {Richard B. King}, ' ... 
'year = {1986}, ' ...
'title = {Population Ecology of the {L}ake {E}rie Water Snake, \emph{Nerodia sipedon insularum}}, ' ...
'journal = {Copeia}, ' ...
'volune = {1986(3)}, ' ...
'pages = {757-772}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Nerodia_sipedon}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Nerodia_sipedon/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'retileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{http://reptile-database.reptarium.cz/species?genus=Nerodia&species=sipedon}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

