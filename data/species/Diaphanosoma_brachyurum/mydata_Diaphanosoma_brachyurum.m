function [data, auxData, metaData, txtData, weights] = mydata_Diaphanosoma_brachyurum

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Ctenopoda'; 
metaData.family     = 'Sididae';
metaData.species    = 'Diaphanosoma_brachyurum'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Ri'}; 
metaData.data_1     = {'t-L_T'; 't-N_T'; 't-S_T'; 'T-ab'; 'T-ap'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 12 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 01 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 05]; 

%% set data
% zero-variate data

data.ab_20 = 47.3/24; units.ab_20 = 'd';    label.ab_20 = 'age at birth'; bibkey.ab_20 = 'LemkBenk2003';   
  temp.ab_20 = C2K(22.2);  units.temp.ab_20 = 'K'; label.temp.ab_20 = 'temperature';
data.ab_28 = 26/24;   units.ab_28 = 'd';    label.ab_28 = 'age at birth'; bibkey.ab_28 = 'LemkBenk2003';   
  temp.ab_28 = C2K(28); units.temp.ab_28 = 'K'; label.temp.ab_28 = 'temperature';
data.tp = 3;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'LemkBenk2003';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  
data.Lb  = 0.047; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'LemkBenk2003';
data.Lp  = 0.079; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'LemkBenk2003';
data.Li  = 0.180; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'LemkBenk2003';

data.Wdb = 0.61e-6; units.Wdb = 'g'; label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'LemkBenk2003';
data.Wdp = 1.78e-6; units.Wdp = 'g'; label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'LemkBenk2003';

data.Ri  = 1; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'LemkBenk2003';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (d), length (mm)
0.042	0.410
6.873	1.020
14.036	1.175
21.190	1.271
28.040	1.375
35.035	1.423
42.026	1.446
49.170	1.469
56.157	1.453
63.001	1.517
70.145	1.541
76.986	1.580
84.130	1.605];
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length', '25 C'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Vijv1980';
%
data.tL_10 = [ ... % time since birth (d), length (mm)
0.000	0.497
2.099	0.523
3.959	0.624
6.039	0.661
8.018	0.678
10.100	0.697
12.080	0.709
14.060	0.717
16.037	0.748
18.013	0.779
19.992	0.799
21.974	0.796
23.955	0.799
25.937	0.796
28.023	0.799
30.109	0.799
31.881	0.802
33.852	0.864
35.939	0.861
37.913	0.903
39.896	0.901
41.981	0.904
44.068	0.898
45.840	0.904];
data.tL_10(:,2) = data.tL_10(:,2)/ 10; % convert mm to cm
units.tL_10  = {'d', 'cm'};  label.tL_10 = {'time since birth', 'length', '10 C'};  
temp.tL_10   = C2K(10); units.temp.tL_10 = 'K'; label.temp.tL_10 = 'temperature';
bibkey.tL_10 = 'LemkBenk2003';
%
data.tL_15 = [ ... % time since birth (d), length (mm)
0.000	0.475
2.097	0.537
4.069	0.596
6.041	0.647
8.009	0.731
9.883	0.748
11.965	0.770
14.046	0.799
16.026	0.810
18.008	0.807
19.987	0.827
21.962	0.861
23.944	0.861
26.027	0.881
27.902	0.892
29.987	0.900
31.863	0.909
33.940	0.962
35.921	0.962
38.007	0.962
39.885	0.963
41.969	0.971
43.847	0.971
45.926	1.011
47.907	1.013
49.991	1.025
51.973	1.025
54.060	1.022
56.041	1.022
57.818	1.002
59.904	1.003
61.990	1.003
63.868	1.000
65.842	1.045
68.033	1.042
69.911	1.039
72.100	1.042
73.977	1.045
75.960	1.040
77.941	1.045
79.924	1.040
82.009	1.046];
data.tL_15(:,2) = data.tL_15(:,2)/ 10; % convert mm to cm
units.tL_15  = {'d', 'cm'};  label.tL_15 = {'time since birth', 'length', '15 C'};  
temp.tL_15   = C2K(15); units.temp.tL_15 = 'K'; label.temp.tL_15 = 'temperature';
bibkey.tL_15 = 'LemkBenk2003';
%
data.tL_20 = [ ... % time since birth (d), length (mm)
0.000	0.548
1.965	0.697
3.940	0.736
6.018	0.784
7.882	0.857
9.967	0.866
12.051	0.877
14.136	0.880
15.906	0.900
17.984	0.948
19.859	0.959
21.841	0.959
23.921	0.993
25.903	0.990
28.092	1.001
29.759	1.010
32.054	1.010
33.822	1.041
35.908	1.038
37.889	1.041
39.972	1.064
41.954	1.061
43.935	1.064
45.917	1.061
48.003	1.064
49.982	1.081
51.857	1.092
53.942	1.101
55.923	1.104
57.802	1.092
59.993	1.090
61.974	1.093
64.060	1.095];
data.tL_20(:,2) = data.tL_20(:,2)/ 10; % convert mm to cm
units.tL_20  = {'d', 'cm'};  label.tL_20 = {'time since birth', 'length', '20 C'};  
temp.tL_20   = C2K(20); units.temp.tL_20 = 'K'; label.temp.tL_20 = 'temperature';
bibkey.tL_20 = 'LemkBenk2003';
%
data.tL_25 = [ ... % time since birth (d), length (mm)
0.000	0.503
1.977	0.630
4.044	0.736
6.014	0.807
8.092	0.849
9.970	0.849
11.944	0.891
14.026	0.917
15.899	0.942
17.876	0.970
20.062	0.996
21.934	1.027
24.019	1.032
26.001	1.029
28.084	1.049
29.752	1.052
31.942	1.052
33.717	1.041
36.011	1.044];
data.tL_25(:,2) = data.tL_25(:,2)/ 10; % convert mm to cm
units.tL_25  = {'d', 'cm'};  label.tL_25 = {'time since birth', 'length', '25 C'};  
temp.tL_25   = C2K(25); units.temp.tL_25 = 'K'; label.temp.tL_25 = 'temperature';
bibkey.tL_25 = 'LemkBenk2003';

% T-ab data
data.Tab = [ ... temperature (C), number of brood per week
15   1.0
20   1.9
25   2.1];
data.Tab(:,2) = 7./data.Tab(:,2); % convert week to d
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Vijv1980';

% T-tp data
data.Ttp = [ ... temperature (C), time since birth at puberty (d)
    10 15
    15  9
    20  3
    25  1];
units.Ttp   = {'C', 'd'};  label.Ttp = {'temperature', 'time since birth at puberty'};  
bibkey.Ttp = 'LemkBenk2003';

% t-N data
data.tN_10 = [ ... % time since birth (d), cumulative number of eggs
0.000	0.000
1.984	0.000
3.865	0.000
6.057	0.000
8.041	0.100
9.817	0.100
12.011	0.100
13.890	0.100
15.979	0.210
17.963	0.323
19.947	0.321
21.821	1.600
24.015	1.600
26.104	1.600
28.089	1.600
29.970	1.600
32.058	1.600
33.837	1.600
36.032	1.600
38.012	1.600
39.995	1.600
42.085	1.600
43.860	1.600
45.844	1.600];
units.tN_10   = {'d', '#'};  label.tN_10 = {'time since birth', 'cumulative # of eggs', '10 C'};  
temp.tN_10    = C2K(10);  units.temp.tN_10 = 'K'; label.temp.tN_10 = 'temperature';
bibkey.tN_10 = 'LemkBenk2003';
%
data.tN_15 = [ ... % time since birth (d), cumulative number of eggs
0.000	0.000
1.985	0.000
3.969	0.000
6.057	0.000
7.937	0.000
9.815	0.685
11.900	1.498
13.988	1.728
15.970	2.305
17.954	2.305
19.938	2.535
22.128	3.115
24.008	3.115
25.884	4.158
27.973	4.158
29.952	5.318
31.933	6.247
34.016	7.526
36.105	7.523
37.978	9.152
39.963	9.152
41.947	9.152
43.929	9.726
45.905	11.588
47.889	11.588
49.973	12.864
52.062	12.864
53.835	13.441
56.021	15.070
58.006	15.070
59.881	16.113
62.082	16.113
63.962	16.113
65.842	16.113
67.931	16.113
69.915	16.113
71.900	16.113
73.989	16.113
75.973	16.113
77.957	16.113
79.941	16.113
81.925	16.113];
units.tN_15   = {'d', '#'};  label.tN_15 = {'time since birth', 'cumulative # of eggs', '15 C'};  
temp.tN_15    = C2K(15);  units.temp.tN_15 = 'K'; label.temp.tN_15 = 'temperature';
bibkey.tN_15 = 'LemkBenk2003';
%
data.tN_20 = [ ... % time since birth (d), cumulative number of eggs
0.000	0.000
1.776	0.000
3.966	0.694
5.842	1.623
7.924	3.368
10.008	4.414
11.993	4.414
13.869	5.341
15.843	7.786
17.919	10.697
19.993	14.190
21.974	15.120
23.945	18.380
25.925	19.426
28.013	19.426
29.995	20.003
31.873	20.583
33.948	23.727
35.927	25.122
38.012	25.935
39.987	28.147
41.867	28.261
43.842	30.356
45.817	32.567
48.010	32.797
49.879	35.242
51.849	38.852
53.833	38.852
56.021	40.012
57.897	41.058
60.090	41.171
61.865	41.171
63.849	41.171];
units.tN_20   = {'d', '#'};  label.tN_20 = {'time since birth', 'cumulative # of eggs', '20 C'};  
temp.tN_20    = C2K(20);  units.temp.tN_20 = 'K'; label.temp.tN_20 = 'temperature';
bibkey.tN_20 = 'LemkBenk2003';
%
data.tN_25 = [ ... % time since birth (d), cumulative number of eggs
0.000	0.000
1.982	0.580
3.961	1.976
5.939	3.488
7.914	5.816
9.889	7.911
11.975	8.491
14.058	10.003
15.822	12.797
17.997	16.990
19.974	18.735
21.939	23.511
23.913	25.956
25.888	28.284
27.873	28.284
29.852	29.211
31.946	29.211
33.931	29.211
35.914	29.211];
units.tN_25   = {'d', '#'};  label.tN_25 = {'time since birth', 'cumulative # of eggs', '25 C'};  
temp.tN_25    = C2K(25);  units.temp.tN_25 = 'K'; label.temp.tN_25 = 'temperature';
bibkey.tN_25 = 'LemkBenk2003';


% t-S data
data.tS_10 = [ ... % time since birth (d), surviving fraction
2.086	1.000
3.963	0.630
6.154	0.630
8.031	0.630
10.117	0.625
12.099	0.623
14.081	0.540
16.167	0.500
18.044	0.500
19.922	0.375
21.799	0.375
24.198	0.375
25.971	0.375
27.953	0.253
30.039	0.248
32.125	0.248
34.003	0.124
36.089	0.124
38.175	0.124
40.156	0.124
41.930	0.125
44.016	0.125
45.997	0.125
47.875	0.001];
units.tS_10  = {'d', '#'};  label.tS_10 = {'time since birth', 'surviving fraction', '10 C'};  
temp.tS_10   = C2K(10);  units.temp.tS_10 = 'K'; label.temp.tS_10 = 'temperature';
bibkey.tS_10 = 'LemkBenk2003';
%
data.tS_15 = [ ... % time since birth (d), surviving fraction
2.086	1.000
4.172	0.850
6.154	0.850
8.136	0.850
10.013	0.850
11.995	0.600
13.977	0.550
15.958	0.450
18.044	0.450
20.026	0.460
22.112	0.460
24.094	0.380
25.971	0.380
27.953	0.380
29.935	0.380
32.021	0.380
34.107	0.380
35.984	0.380
38.070	0.380
39.948	0.380
41.930	0.380
43.911	0.300
45.893	0.300
47.979	0.300
49.961	0.300
51.943	0.300
53.820	0.300
56.010	0.300
57.992	0.230
59.974	0.230
61.956	0.080
63.937	0.080
66.023	0.080
68.005	0.080
69.987	0.080
72.073	0.080
73.950	0.080
75.828	0.080
78.018	0.080
80.000	0.080
81.982	0.001];
units.tS_15  = {'d', '#'};  label.tS_15 = {'time since birth', 'surviving fraction','15 C'};  
temp.tS_15   = C2K(15);  units.temp.tS_15 = 'K'; label.temp.tS_15 = 'temperature';
bibkey.tS_15 = 'LemkBenk2003';
%
data.tS_20 = [ ... % time since birth (d), surviving fraction
1.982	1.000
4.172	0.975
6.154	0.975
8.240	0.760
10.222	0.600
12.099	0.450
13.872	0.340
15.958	0.340
18.044	0.237
22.008	0.211
23.885	0.215
25.971	0.211
27.953	0.170
30.039	0.170
31.917	0.170
34.003	0.170
35.984	0.170
37.966	0.170
39.948	0.170
41.825	0.170
43.911	0.170
45.893	0.170
47.875	0.170
49.961	0.170
52.151	0.140
53.924	0.140
55.906	0.140
57.888	0.100
59.974	0.100
61.956	0.100
64.042	0.001];
units.tS_20  = {'d', '#'};  label.tS_20 = {'time since birth', 'surviving fraction', '20 C'};  
temp.tS_20   = C2K(20);  units.temp.tS_20 = 'K'; label.temp.tS_20 = 'temperature';
bibkey.tS_20 = 'LemkBenk2003';
%
data.tS_25 = [ ... % time since birth (d), surviving fraction
1.982	1.000
4.276	1.000
6.154	1.000
8.240	0.950
10.117	0.780
12.099	0.560
14.081	0.500
16.063	0.500
18.044	0.319
20.130	0.211
22.008	0.160
23.781	0.100
25.971	0.100
27.953	0.100
30.039	0.100
31.917	0.100
34.003	0.050
35.984	0.050
37.966	0.001];
units.tS_25  = {'d', '#'};  label.tS_25 = {'time since birth', 'surviving fraction', '25 C'};  
temp.tS_25   = C2K(25);  units.temp.tS_25 = 'K'; label.temp.tS_25 = 'temperature';
bibkey.tS_25 = 'LemkBenk2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tN_25(data.tN_25(:,2) == 0) = 0;
weights.tN_20(data.tN_20(:,2) == 0) = 0;
weights.tN_15(data.tN_15(:,2) == 0) = 0;
weights.tN_10(data.tN_10(:,2) == 0) = 0;
weights.tS_25(data.tS_25(:,2) < .05) = 0;
weights.tS_20(data.tS_20(:,2) < .05) = 0;
weights.tS_15(data.tS_15(:,2) < .05) = 0;
weights.tS_10(data.tS_10(:,2) < .05) = 0;
weights.tL_25 = 5 * weights.tL_25;
weights.tL_20 = 5 * weights.tL_20;
weights.tL_15 = 5 * weights.tL_15;
weights.tL_10 = 5 * weights.tL_10;
weights.tL    = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Group plots
set1 = {'tL_25','tL_20','tL_15','tL_10'}; subtitle1 = {'LemkBenk2003 data at 25, 20, 15, 10 C'};
set2 = {'tL'}; subtitle2 = {'Vijv1980 data at 25 C'};
set3 = {'tN_25','tN_20','tN_15','tN_10'}; subtitle3 = {'LemkBenk2003 data at 25, 20, 15, 10 C'};
set4 = {'tS_25','tS_20','tS_15','tS_10'}; subtitle4 = {'LemkBenk2003 data at 25, 20, 15, 10 C'};
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'tN data has been adusted such that they are monotoneous';     
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'D.leuchtenbergianum: W in mug = 5.0713 (L in mm)^1.0456 (no eggs)';
metaData.bibkey.F1 = 'CulvBouc1985'; 
F2 = '3-4 juvenile instars in females';
metaData.bibkey.F2 = 'Boik2005'; 
F3 = 'dry-weight: ln (W in mug) = 1.023 + 2.099 * ln (L in mm)';
metaData.bibkey.F3 = 'LemkBenk2003'; 
F4 = 'parthenogenetic reproduction; continuous moulting; cladocerans reach maturity in 3-8 moults';
metaData.bibkey.F4 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '35BQG'; % Cat of Life
metaData.links.id_ITIS = '83838'; % ITIS
metaData.links.id_EoL = '46498299'; % Ency of Life
metaData.links.id_Wiki = 'Diaphanosoma'; % Wikipedia
metaData.links.id_ADW = 'Diaphanosoma_brachyurum'; % ADW
metaData.links.id_Taxo = '33086'; % Taxonomicon
metaData.links.id_WoRMS = '234063'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://de.wikipedia.org/wiki/Diaphanosoma_brachyurum}}';
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
bibkey = 'Boik2005'; type = 'Article'; bib = [ ... 
'author = {Boikova, O. S.}, ' ... 
'year = {2005}, ' ...
'title = {Postembryonic development in \emph{Diaphanosoma brachyurum} ({L}ievin, 1848) ({C}rustacea: {C}tenopoda: {S}ididae)}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {537}, ' ...
'pages = {7-14}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LemkBenk2003'; type = 'Article'; bib = [ ... 
'author = {Lemke, A. M. and Benke, A. C.}, ' ... 
'year = {2003}, ' ...
'title = {Growth and reproduction of three cladoceran species from a small wetland in the {S}outh-{E}astern {U}.{S}.{A}.}, ' ...
'journal = {Freshwater Biology}, ' ...
'volume = {48}, ' ...
'pages = {589--603}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CulvBouc1985'; type = 'Article'; bib = [ ... 
'author = {Culver, D. A. and Boucherie, M. M. and Bean, D. J. and Fletcher, J. W.}, ' ... 
'year = {1985}, ' ...
'title = {Biomass of freshwater crustacean zooplankton from length-weight regressions}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {42}, ' ...
'pages = {1380--1390}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Vijv1980'; type = 'Article'; bib = [ ... 
'author = {Vijverberg, J.}, ' ... 
'year = {1980}, ' ...
'title = {Effect of temperature in laboratory studies on the development and growth of Cladocera and copepoda from {T}jeukemeer, the {N}etherlands.}, ' ...
'journal = {Freshwater Biol}, ' ...
'volume = {10}, ' ...
'pages = {317--340}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

