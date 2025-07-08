function [data, auxData, metaData, txtData, weights] = mydata_Scapholeberis_mucronata

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Scapholeberis_mucronata'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Tbf'};
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

data.Wdi = 21;   units.Wdi = 'mug';   label.Wdi = 'ultimate dry weight';  bibkey.Wdi = 'LemkBenk2003';
  comment.Wdi = 'based F1 for L = 0.85 mm, see facts';
   
% uni-variate data
% t-L data
data.tL_10 = [ ... % time since birth (d), length (mm)
0.000	0.261
2.055	0.273
3.962	0.318
5.876	0.341
8.130	0.363
10.030	0.428
11.830	0.453
13.860	0.471
15.882	0.508
18.016	0.551
19.925	0.588
21.958	0.596
23.988	0.611
25.799	0.611
27.822	0.641
29.850	0.663
31.883	0.668
33.798	0.688
35.942	0.701
37.865	0.701
39.785	0.706
41.816	0.718
43.851	0.718
45.773	0.718
47.804	0.730
49.837	0.738
51.642	0.750
53.791	0.750
55.712	0.750
57.744	0.760
59.665	0.763
61.928	0.763
63.847	0.768
65.769	0.768
67.691	0.768
69.952	0.768
71.761	0.768
73.905	0.780
76.055	0.780
77.863	0.780
79.898	0.780
81.934	0.780
83.965	0.790];
data.tL_10(:,2) = data.tL_10(:,2)/ 10; % convert mm to cm
units.tL_10  = {'d', 'cm'};  label.tL_10 = {'time since birth', 'length', '10 C'};  
temp.tL_10   = C2K(10); units.temp.tL_10 = 'K'; label.temp.tL_10 = 'temperature';
bibkey.tL_10 = 'LemkBenk2003';
%
data.tL_15 = [ ... % time since birth (d), length (mm)
0.000	0.261
2.055	0.273
3.840	0.343
5.980	0.368
7.991	0.438
9.893	0.498
11.917	0.531
13.831	0.556
15.848	0.609
17.880	0.619
20.021	0.639
21.817	0.679
23.962	0.686
25.994	0.696
27.910	0.716
29.715	0.726
31.972	0.738
33.894	0.738
35.817	0.738
37.961	0.748
39.992	0.761
41.795	0.778
43.713	0.791
45.750	0.791
47.663	0.813
49.699	0.813
51.618	0.821
53.992	0.821
55.688	0.821
57.950	0.821
59.645	0.823
61.904	0.828
63.939	0.828
65.862	0.828
67.672	0.828
69.932	0.828
71.968	0.828
73.889	0.828
75.692	0.845
77.845	0.845
79.875	0.847
82.023	0.847
83.831	0.852];
data.tL_15(:,2) = data.tL_15(:,2)/ 10; % convert mm to cm
units.tL_15  = {'d', 'cm'};  label.tL_15 = {'time since birth', 'length', '15 C'};  
temp.tL_15   = C2K(15); units.temp.tL_15 = 'K'; label.temp.tL_15 = 'temperature';
bibkey.tL_15 = 'LemkBenk2003';
%
data.tL_20 = [ ... % time since birth (d), length (mm)
0.000	0.258
1.913	0.358
3.913	0.461
5.933	0.506
7.940	0.589
9.958	0.639
11.990	0.649
14.013	0.684
15.932	0.694
17.966	0.699
19.881	0.719
21.914	0.726
23.948	0.729
25.870	0.729
27.676	0.739
29.704	0.759
31.728	0.791
33.872	0.804
35.795	0.801
37.944	0.798
39.866	0.801
41.675	0.801
43.707	0.808
45.630	0.806
47.889	0.813
49.925	0.811
51.846	0.816
53.764	0.826
55.686	0.826
57.949	0.823
59.531	0.825
61.904	0.828
63.601	0.825
65.857	0.840
67.668	0.835
69.702	0.838
71.966	0.830
73.888	0.830
75.925	0.827
77.734	0.827
79.881	0.830
82.028	0.832];
data.tL_20(:,2) = data.tL_20(:,2)/ 10; % convert mm to cm
units.tL_20  = {'d', 'cm'};  label.tL_20 = {'time since birth', 'length', '20 C'};  
temp.tL_20   = C2K(20); units.temp.tL_20 = 'K'; label.temp.tL_20 = 'temperature';
bibkey.tL_20 = 'LemkBenk2003';
%
data.tL_25 = [ ... % time since birth (d), length (mm)
0.000	0.278
1.879	0.459
3.888	0.536
5.998	0.649
7.915	0.661
9.945	0.679
11.862	0.694
13.891	0.711
15.813	0.711
17.960	0.716
19.994	0.719
21.916	0.719
23.835	0.729
25.868	0.736
27.898	0.749
29.927	0.769
31.962	0.769
33.881	0.779
35.802	0.781
37.831	0.798
39.866	0.801
41.901	0.801
43.711	0.798
45.743	0.808
47.774	0.818
49.809	0.821
51.844	0.821
53.879	0.821
55.801	0.820
57.723	0.820
59.755	0.830
61.677	0.830
63.712	0.830];
data.tL_25(:,2) = data.tL_25(:,2)/ 10; % convert mm to cm
units.tL_25  = {'d', 'cm'};  label.tL_25 = {'time since birth', 'length', '25 C'};  
temp.tL_25   = C2K(25); units.temp.tL_25 = 'K'; label.temp.tL_25 = 'temperature';
bibkey.tL_25 = 'LemkBenk2003';

% T-tp data
data.Ttp = [ ... temperature (C), time since birth at puberty (d)
    10 10
    15 7
    20 3
    25 1];
units.Ttp   = {'C', 'd'};  label.Ttp = {'temperature', 'time since birth at puberty'};  
bibkey.Ttp = 'LemkBenk2003';

% t-N data
data.tN_10 = [ ... % time since birth (d), cumulative number of eggs
0.000	0.000
2.035	0.000
4.070	0.000
5.879	0.000
8.028	0.000
9.837	0.000
11.985	0.249
13.906	1.247
15.828	1.247
17.973	3.491
19.896	3.491
22.044	3.741
23.852	4.489
25.885	5.736
27.806	7.232
29.841	7.481
31.761	9.476
33.795	10.474
35.943	10.474
37.863	12.469
39.898	12.718
41.819	13.716
43.854	13.716
45.774	15.212
47.809	15.960
49.842	17.706
51.876	18.204
53.911	18.454
55.832	19.451
57.867	19.451
59.675	20.948
61.823	20.948
63.745	21.197
65.780	21.197
67.929	21.197
69.850	21.446
71.998	21.446
74.033	22.195
75.842	22.195
77.990	22.444
80.024	23.441
81.715	27.681
83.750	27.930];
units.tN_10   = {'d', '#'};  label.tN_10 = {'time since birth', 'cumulative # of eggs', '10 C'};  
temp.tN_10    = C2K(10);  units.temp.tN_10 = 'K'; label.temp.tN_10 = 'temperature';
bibkey.tN_10 = 'LemkBenk2003';
%
data.tN_15 = [ ... % time since birth (d), cumulative number of eggs
0.000	0.000
2.035	0.000
4.070	0.000
5.992	0.000
7.912	1.995
9.947	1.995
11.982	2.993
13.903	3.990
15.935	6.234
17.970	6.733
19.890	7.980
21.922	10.973
23.956	11.970
25.878	12.469
28.023	15.461
29.943	16.958
31.975	19.451
33.897	19.950
35.817	21.446
37.851	22.943
39.772	23.940
41.805	25.436
43.725	27.681
45.984	29.676
47.904	31.172
49.823	34.165
51.744	35.661
54.005	35.910
55.924	37.905
57.847	37.905
59.881	38.155
61.802	39.900
63.837	40.150
65.872	40.150
67.794	40.150
69.942	40.399
71.864	40.648
73.899	40.648
75.818	42.893
77.852	43.390
80.114	43.390
81.811	43.390
84.185	43.390];
units.tN_15   = {'d', '#'};  label.tN_15 = {'time since birth', 'cumulative # of eggs', '15 C'};  
temp.tN_15    = C2K(15);  units.temp.tN_15 = 'K'; label.temp.tN_15 = 'temperature';
bibkey.tN_15 = 'LemkBenk2003';
%
data.tN_20 = [ ... % time since birth (d), cumulative number of eggs
0.000	0.000
1.922	0.000
4.066	3.990
5.986	5.736
7.903	10.224
9.932	15.960
11.965	17.955
13.998	19.202
16.032	20.948
18.061	25.686
19.981	27.681
22.015	28.928
23.933	32.419
25.966	34.165
27.887	35.411
29.918	39.152
31.949	42.643
33.984	43.142
35.904	45.137
37.937	46.883
39.859	47.132
41.891	50.125
43.924	51.372
45.956	54.863
47.876	56.110
49.908	58.853
51.943	59.102
53.979	59.102
55.901	59.102
57.822	59.601
59.853	63.591
61.888	63.342
63.809	63.342
65.955	63.342
67.880	63.840
70.028	64.090
71.837	64.339
73.873	64.339
75.908	64.339
77.943	64.339
79.865	64.339
81.900	64.339];
units.tN_20   = {'d', '#'};  label.tN_20 = {'time since birth', 'cumulative # of eggs', '20 C'};  
temp.tN_20    = C2K(20);  units.temp.tN_20 = 'K'; label.temp.tN_20 = 'temperature';
bibkey.tN_20 = 'LemkBenk2003';
%
data.tN_25 = [ ... % time since birth (d), cumulative number of eggs
0.000	0.000
1.918	3.741
3.947	9.227
5.976	14.713
8.118	19.950
9.926	20.948
11.844	24.439
13.987	28.928
15.907	31.421
18.053	33.416
19.970	37.656
22.003	39.152
24.038	39.651
25.955	44.389
27.987	47.382
30.017	51.621
31.825	52.618
33.968	57.357
35.888	58.853
38.035	59.850
39.842	62.344
41.876	63.342
43.795	65.337
45.827	68.579
47.861	69.825
49.893	72.319
51.812	74.813
53.960	75.312
55.882	75.312
58.026	79.551
59.937	88.778
61.856	92.020
64.004	92.269];
units.tN_25   = {'d', '#'};  label.tN_25 = {'time since birth', 'cumulative # of eggs', '25 C'};  
temp.tN_25    = C2K(25);  units.temp.tN_25 = 'K'; label.temp.tN_25 = 'temperature';
bibkey.tN_25 = 'LemkBenk2003';


% t-S data
data.tS_10 = [ ... % time since birth (d), surviving fraction
0.107	1.000
2.026	1.000
3.944	1.000
6.079	1.000
7.890	1.000
9.917	1.000
12.050	1.000
13.756	1.000
15.888	1.000
18.022	1.000
20.047	1.000
21.966	1.000
23.886	1.000
25.912	1.000
27.832	1.000
30.071	1.000
31.990	1.000
33.910	1.000
35.936	1.000
37.961	1.000
39.882	1.000
41.800	1.000
43.826	1.000
45.746	1.000
47.772	1.000
49.798	1.000
51.717	1.000
53.851	1.000
55.876	1.000
57.689	1.000
59.822	1.000
61.741	1.000
63.661	1.000
65.900	1.000
67.735	0.900
69.761	0.900
71.680	0.900
73.706	0.900
75.731	0.900
77.864	0.900
79.677	0.900
81.809	0.900
83.941	0.900];
units.tS_10  = {'d', '#'};  label.tS_10 = {'time since birth', 'surviving fraction', '10 C'};  
temp.tS_10   = C2K(10);  units.temp.tS_10 = 'K'; label.temp.tS_10 = 'temperature';
bibkey.tS_10 = 'LemkBenk2003';
%
data.tS_15 = [ ... % time since birth (d), surviving fraction
0.000	1.000
2.026	1.000
3.945	1.000
6.078	1.000
8.104	1.000
9.917	1.000
11.943	1.000
13.862	1.000
15.995	1.000
17.914	1.000
20.047	1.000
21.859	1.000
23.992	1.000
26.018	1.000
27.959	0.900
29.878	0.900
31.905	0.900
33.930	0.900
35.956	0.900
37.876	0.900
39.795	0.900
41.821	0.900
43.847	0.900
45.981	0.900
47.686	0.900
49.819	0.900
51.844	0.900
53.765	0.900
55.791	0.900
57.817	0.900
59.735	0.900
61.868	0.900
63.788	0.900
65.814	0.900
67.627	0.900
69.760	0.900
71.679	0.900
73.812	0.900
75.838	0.900
77.757	0.900
79.890	0.900
81.831	0.800
83.963	0.800];
units.tS_15  = {'d', '#'};  label.tS_15 = {'time since birth', 'surviving fraction', '15 C'};  
temp.tS_15   = C2K(15);  units.temp.tS_15 = 'K'; label.temp.tS_15 = 'temperature';
bibkey.tS_15 = 'LemkBenk2003';
%
data.tS_20 = [ ... % time since birth (d), surviving fraction
0.106	1.000
2.026	1.000
4.094	0.800
6.014	0.800
8.039	0.800
10.065	0.800
12.092	0.800
14.118	0.800
16.144	0.800
18.063	0.800
19.983	0.800
21.902	0.800
23.928	0.800
25.954	0.800
27.980	0.800
29.900	0.800
31.926	0.800
33.952	0.800
36.084	0.800
37.897	0.800
39.923	0.800
41.843	0.800
43.763	0.800
45.895	0.800
47.921	0.800
49.627	0.800
51.867	0.800
53.786	0.800
55.706	0.800
58.051	0.800
59.864	0.800
61.783	0.800
63.703	0.800
65.729	0.800
67.797	0.600
69.823	0.600
71.871	0.500
73.728	0.300
75.753	0.300
77.886	0.300
79.933	0.200
81.959	0.200
83.815	0.001];
units.tS_20  = {'d', '#'};  label.tS_20 = {'time since birth', 'surviving fraction', '20 C'};  
temp.tS_20   = C2K(20);  units.temp.tS_20 = 'K'; label.temp.tS_20 = 'temperature';
bibkey.tS_20 = 'LemkBenk2003';
%
data.tS_25 = [ ... % time since birth (d), surviving fraction
0.000	1.000
1.812	1.000
3.945	1.000
6.078	1.000
7.954	0.700
9.980	0.700
12.006	0.700
13.926	0.700
16.058	0.700
17.977	0.700
19.897	0.700
22.030	0.700
23.949	0.700
25.869	0.700
27.895	0.700
29.815	0.700
31.947	0.700
33.866	0.700
35.892	0.700
37.940	0.600
39.859	0.600
41.779	0.600
43.805	0.600
45.724	0.600
47.772	0.500
49.691	0.500
51.824	0.500
53.849	0.500
55.769	0.500
57.732	0.300
59.779	0.200
61.806	0.200
63.853	0.100
65.793	0.001];
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

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_25','tL_20','tL_15','tL_10'}; subtitle1 = {'LemkBenk2003 data at 25, 20, 15, 10 C'};
set2 = {'tN_25','tN_20','tN_15','tN_10'}; subtitle2 = {'LemkBenk2003 data at 25, 20, 15, 10 C'};
set3 = {'tS_25','tS_20','tS_15','tS_10'}; subtitle3 = {'LemkBenk2003 data at 25, 20, 15, 10 C'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Bad fit of Wdi is ignored, in favour of a typical value for del_M, on the basis of W propto L^1.4, which seems unrealistic';
D2 = 'tN data has been adusted such that they are monotoneous';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'dry weight: ln (W in mug) = 3.281 + 1.420 * ln (L in mm)';
metaData.bibkey.F1 = 'LemkBenk2003'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79V3J'; % Cat of Life
metaData.links.id_ITIS = '83921'; % ITIS
metaData.links.id_EoL = '46498286'; % Ency of Life
metaData.links.id_Wiki = 'Scapholeberis'; % Wikipedia
metaData.links.id_ADW = 'Scapholeberis_mucronata'; % ADW
metaData.links.id_Taxo = '33110'; % Taxonomicon
metaData.links.id_WoRMS = '148398'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Daphniidae}}';
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
