function [data, auxData, metaData, txtData, weights] = mydata_Simocephalus_serrulatus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Simocephalus_serrulatus'; 
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
metaData.data_0     = {'Wdi'}; 
metaData.data_1     = {'t-L_T'; 't-N_T'; 't-S_T'; 'T-ap'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 01 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 01 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 10 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 09]; 

%% set data
% zero-variate data

data.Wdi = 60;   units.Wdi = 'mug';   label.Wdi = 'ultimate dry weight';  bibkey.Wdi = 'LemkBenk2003';
  comment.Wdi = 'based F1 for L = 2 mm, see facts';
   
% uni-variate data
% time-length
data.tL_15 = [ ... % time since birth (d), length (mm)
0.000	0.595
3.042	0.725
6.112	0.912
9.077	1.093
12.043	1.241
15.009	1.399
17.981	1.445
21.057	1.524
24.028	1.575
26.999	1.649
29.970	1.700
32.942	1.739
35.915	1.768
38.994	1.802
42.074	1.802
45.046	1.836
48.017	1.904
51.096	1.932
53.964	1.938
56.937	1.943
60.018	1.938
63.099	1.938
65.860	1.938
69.047	1.938
72.127	1.938];
data.tL_15(:,2) = data.tL_15(:,2)/ 10; % convert mm to cm
units.tL_15  = {'d', 'cm'};  label.tL_15 = {'time since birth', 'length', '15 C'};  
temp.tL_15   = C2K(15); units.temp.tL_15 = 'K'; label.temp.tL_15 = 'temperature';
bibkey.tL_15 = 'LemkBenk2003';
%
data.tL_20 = [ ... % time since birth (d), length (mm)
0.000	0.595
3.037	0.810
5.991	1.190
9.168	1.371
12.137	1.467
15.003	1.518
17.974	1.575
20.945	1.632
24.129	1.688
26.995	1.722
29.967	1.751
32.940	1.785
36.016	1.864
38.885	1.847
41.964	1.870
45.044	1.881
48.017	1.904
50.991	1.898];
data.tL_20(:,2) = data.tL_20(:,2)/ 10; % convert mm to cm
units.tL_20  = {'d', 'cm'};  label.tL_20 = {'time since birth', 'length', '20 C'};  
temp.tL_20   = C2K(20); units.temp.tL_20 = 'K'; label.temp.tL_20 = 'temperature';
bibkey.tL_20 = 'LemkBenk2003';
%
data.tL_25 = [ ... % time since birth (d), length (mm)
0.000	0.601
3.020	1.127
5.981	1.388
9.056	1.479
12.132	1.558
14.999	1.581
17.970	1.637
20.940	1.717
24.019	1.745
27.099	1.751
29.964	1.819
32.938	1.819
36.018	1.819];
data.tL_25(:,2) = data.tL_25(:,2)/ 10; % convert mm to cm
units.tL_25  = {'d', 'cm'};  label.tL_25 = {'time since birth', 'length', '25 C'};  
temp.tL_25   = C2K(25); units.temp.tL_25 = 'K'; label.temp.tL_25 = 'temperature';
bibkey.tL_25 = 'LemkBenk2003';


% T-tp data
data.Ttp = [ ... temperature (C), time since birth at puberty (d)
    15 13
    20  8
    25  5];
units.Ttp   = {'C', 'd'};  label.Ttp = {'temperature', 'time since birth at puberty'};  
bibkey.Ttp = 'LemkBenk2003';

% t-N data
data.tN_15 = [ ... % time since birth (d), cumulative number of eggs
0.000	0.000
3.080	0.000
6.161	0.000
9.029	0.000
12.109	0.000
14.977	1.856
17.951	2.318
21.138	4.814
24.006	6.066
27.193	8.675
30.061	9.701
33.141	11.858
36.009	12.545
38.983	14.024
42.064	14.825
45.038	15.060
48.012	16.539
50.986	16.548
53.961	18.253
57.041	18.263
60.015	18.273
63.096	18.282
66.070	18.282
69.044	18.282];
units.tN_15   = {'d', '#'};  label.tN_15 = {'time since birth', 'cumulative # of eggs', '15 C'};  
temp.tN_15    = C2K(15);  units.temp.tN_15 = 'K'; label.temp.tN_15 = 'temperature';
bibkey.tN_15 = 'LemkBenk2003';
%
data.tN_20 = [ ... % time since birth (d), cumulative number of eggs
0.000	0.000
3.080	0.000
6.161	0.000
9.135	4.210
12.109	8.174
15.190	10.105
18.270	11.471
21.032	13.627
24.112	16.801
27.086	20.200
30.061	22.244
33.141	24.626
36.115	26.557
39.090	26.567
42.064	30.079
45.038	30.993
48.118	31.115
51.093	31.125];
units.tN_20   = {'d', '#'};  label.tN_20 = {'time since birth', 'cumulative # of eggs', '20 C'};  
temp.tN_20    = C2K(20);  units.temp.tN_20 = 'K'; label.temp.tN_20 = 'temperature';
bibkey.tN_20 = 'LemkBenk2003';
%
data.tN_25 = [ ... % time since birth (d), cumulative number of eggs
0.000	0.000
3.080	0.000
6.161	5.556
9.135	9.521
12.215	15.067
15.190	17.337
18.164	19.267
21.138	20.294
24.112	22.789
27.086	22.912
30.061	23.713
33.035	24.400
36.115	24.862
39.196	24.862];
units.tN_25   = {'d', '#'};  label.tN_25 = {'time since birth', 'cumulative # of eggs', '25 C'};  
temp.tN_25    = C2K(25);  units.temp.tN_25 = 'K'; label.temp.tN_25 = 'temperature';
bibkey.tN_25 = 'LemkBenk2003';


% t-S data
data.tS_15 = [ ... % time since birth (d), surviving fraction
3.007	1.000
6.013	1.000
9.124	0.903
12.131	0.900
14.949	0.900
18.050	0.900
20.963	0.900
24.063	0.900
26.976	0.900
29.983	0.900
33.083	0.900
35.996	0.900
39.003	0.900
42.019	0.800
44.932	0.800
48.042	0.700
50.870	0.600
53.980	0.500
56.987	0.500
60.088	0.500
63.094	0.500
66.101	0.500
69.014	0.500
72.208	0.500];
units.tS_15  = {'d', '#'};  label.tS_15 = {'time since birth', 'surviving fraction', '15 C'};  
temp.tS_15   = C2K(15);  units.temp.tS_15 = 'K'; label.temp.tS_15 = 'temperature';
bibkey.tS_15 = 'LemkBenk2003';
%
data.tS_20 = [ ... % time since birth (d), surviving fraction
3.007	1.000
6.117	0.900
8.936	0.900
11.943	0.900
15.043	0.900
17.871	0.800
21.076	0.700
24.176	0.700
27.005	0.600
30.199	0.600
33.027	0.500
36.043	0.400
38.956	0.400
41.972	0.300
44.885	0.300
48.088	0.200
51.114	0.001];
units.tS_20  = {'d', '#'};  label.tS_20 = {'time since birth', 'surviving fraction', '20 C'};  
temp.tS_20   = C2K(20);  units.temp.tS_20 = 'K'; label.temp.tS_20 = 'temperature';
bibkey.tS_20 = 'LemkBenk2003';
%
data.tS_25 = [ ... % time since birth (d), surviving fraction
3.101	1.000
6.013	1.000
8.936	0.900
12.130	0.903
15.053	0.799
18.059	0.801
20.982	0.701
24.007	0.500
27.014	0.502
30.030	0.400
32.858	0.301
35.959	0.303
38.965	0.301
41.906	0.001];
units.tS_25  = {'d', '#'};  label.tS_25 = {'time since birth', 'surviving fraction', '25 C'};  
temp.tS_25   = C2K(25);  units.temp.tS_25 = 'K'; label.temp.tS_25 = 'temperature';
bibkey.tS_25 = 'LemkBenk2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tN_25(data.tN_25(:,2) == 0) = 0;
weights.tN_20(data.tN_20(:,2) == 0) = 0;
weights.tN_15(data.tN_15(:,2) == 0) = 0;
weights.tS_25(data.tS_25(:,2) < .05) = 0;
weights.tS_20(data.tS_20(:,2) < .05) = 0;
weights.tS_15(data.tS_15(:,2) < .05) = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_25','tL_20','tL_15'}; subtitle1 = {'LemkBenk2003 data at 25, 20, 15 C'};
set2 = {'tN_25','tN_20','tN_15'}; subtitle2 = {'LemkBenk2003 data at 25, 20, 15 C'};
set3 = {'tS_25','tS_20','tS_15'}; subtitle3 = {'LemkBenk2003 data at 25, 20, 15 C'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'tN data has been adusted such that they are monotoneous';     
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'dry weight: ln (W in mug) = 2.568 + 2.192 * ln (L in mm)';
metaData.bibkey.F1 = 'LemkBenk2003'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4XFJY'; % Cat of Life
metaData.links.id_ITIS = '83901'; % ITIS
metaData.links.id_EoL = '46498284'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Simocephalus_serrulatus'; % ADW
metaData.links.id_Taxo = '156184'; % Taxonomicon
metaData.links.id_WoRMS = '412852'; % WoRMS


%% References
bibkey = 'WORMS'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marinespecies.org/aphia.php?p=taxdetails&id=412852}}';
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
bibkey = 'LemkBenk2003'; type = 'Article'; bib = [ ... 
'author = {Lemke, A. M. and Benke, A. C.}, ' ... 
'year = {2003}, ' ...
'title = {Growth and reproduction of three cladoceran species from a small wetland in the {S}outh-{E}astern {U}.{S}.{A}.}, ' ...
'journal = {Freshwater Biology}, ' ...
'volume = {48}, ' ...
'pages = {589--603}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
