function [data, auxData, metaData, txtData, weights] = mydata_Coryphaenoides_rupestris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Coryphaenoides_rupestris'; 
metaData.species_en = 'Rock grenadier'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 03 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.am = 54*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AllaLora2000';   
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 52.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 110;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2.6 mm: 4/3*pi*0.13^3';
data.Wwi = 1700;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.Ri  = 68780/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(8);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), pre-anal length (cm)
3.036	7.574
3.040	6.677
3.896	7.430
4.029	4.887
4.030	4.588
4.139	7.955
4.998	7.960
5.012	4.594
5.865	5.945
6.778	7.746
6.836	8.420
7.941	8.427
8.908	11.949
9.050	7.161
9.648	10.980
9.651	10.232
10.810	11.885
11.973	12.565
12.952	13.245
13.925	15.345
14.044	16.094
14.895	18.119
14.907	15.201
15.821	16.628
15.889	15.133
15.942	17.003
16.736	17.980
16.738	17.532
16.740	16.933
16.916	18.879
17.723	16.715
17.771	19.932
17.842	17.613
17.896	19.334
18.874	20.312
18.878	19.190
18.880	18.667
18.884	17.769
18.992	21.361
19.801	18.523
19.857	19.795
19.921	19.197
20.889	22.569
20.967	18.455
21.941	20.256
21.993	22.725
22.121	21.304
22.800	20.261
22.853	22.356
22.854	22.057
22.855	21.907
22.857	21.458
22.858	21.159
22.860	20.636
23.771	22.811
23.832	23.110
23.835	22.287
23.837	21.838
23.839	21.390
23.843	20.342
23.906	19.894
24.072	24.234
24.697	21.470
24.699	21.095
24.812	23.490
24.819	21.695
24.823	20.722
25.731	23.645
25.795	22.972
25.798	22.224
25.801	21.626
25.802	21.327
25.804	20.803
25.867	20.429
25.981	22.525
26.714	23.427
26.778	22.754
26.779	22.529
26.782	21.781
26.821	12.131
26.842	22.006
26.845	21.408
26.908	20.884
26.910	20.435
27.829	20.815
27.874	24.631
27.939	23.883
28.006	22.537
28.008	21.938
28.014	20.442
28.917	24.637
28.921	23.814
29.792	20.901
29.848	22.024
30.149	23.372
32.000	20.915
32.658	24.959
32.667	22.939
34.814	22.952
36.034	24.530
36.901	22.590
36.902	22.291
36.912	20.046
37.076	24.910
37.171	16.607
37.189	27.230
37.819	23.194
37.820	22.895
37.822	22.446
37.879	23.494
38.053	25.963
38.870	21.105
38.873	20.582
39.002	19.011
39.965	23.581
39.969	22.533
40.766	22.688
40.909	17.676
40.913	16.629
41.022	20.146
41.756	20.524
41.876	21.123
42.911	23.150
42.916	21.878
42.918	21.429
43.706	23.902
44.939	22.414
44.942	21.665
44.946	20.543
44.949	19.945
45.917	23.168
54.632	22.472];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
data.tL_f(:,2) = 3.54*data.tL_f(:,2); % convert pre-anal length to total length
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AllaLora2000';
comment.tL_f = 'data for females';
% tL-data for males
data.tL_m = [ ... % time since birth (yr), pre-anal length (cm)
0.847	2.923
2.855	6.825
2.862	5.179
3.837	6.831
3.838	6.457
4.026	5.485
4.032	4.064
4.874	8.259
4.945	5.940
4.999	7.586
5.001	7.062
5.799	6.992
5.801	6.543
5.804	5.945
5.805	5.646
6.965	6.924
6.967	6.550
7.025	7.374
7.878	8.875
7.880	8.351
7.885	7.005
7.887	6.556
7.889	5.957
8.853	10.452
8.858	9.255
8.862	8.133
9.833	10.757
9.835	10.308
9.837	9.785
9.962	9.336
9.965	8.364
10.746	12.483
10.756	10.089
10.819	9.641
10.822	9.042
10.823	8.593
11.012	7.472
11.735	10.694
11.799	10.170
11.802	9.347
11.803	8.973
11.853	11.966
11.854	11.592
11.867	8.450
11.870	7.777
12.163	11.070
12.835	11.673
12.838	11.074
12.839	10.775
12.841	10.326
12.844	9.503
12.847	8.905
12.910	8.531
12.953	13.020
13.808	13.848
13.877	12.053
13.879	11.604
13.883	10.482
13.885	9.958
13.888	9.360
13.890	8.836
14.717	16.547
14.726	14.303
14.730	13.554
14.794	12.882
14.797	12.133
14.799	11.535
14.802	10.787
14.804	10.338
14.807	9.590
14.809	9.141
15.668	9.146
15.700	16.254
15.721	11.166
15.771	14.010
15.772	13.710
15.774	13.187
15.830	14.534
15.838	12.514
15.841	11.766
15.848	10.195
16.728	20.000
16.740	17.083
16.745	15.811
16.747	15.287
16.750	14.539
16.751	14.240
16.753	13.791
16.754	13.492
16.757	12.893
16.803	16.559
16.804	16.335
16.882	12.221
16.884	11.772
16.885	11.473
16.888	10.874
16.952	10.276
16.958	8.705
17.659	17.238
17.714	18.809
17.716	18.360
17.717	18.061
17.719	17.687
17.786	16.341
17.786	16.266
17.788	15.817
17.789	15.443
17.791	14.994
17.792	14.695
17.794	14.171
17.795	14.022
17.797	13.498
17.798	13.274
17.800	12.900
17.863	12.451
17.924	12.601
17.926	12.077
17.927	11.703
17.928	11.479
17.929	11.254
17.930	10.955
17.931	10.806
17.933	10.282
17.936	9.609
18.758	18.516
18.764	17.244
18.767	16.496
18.771	15.449
18.772	15.150
18.818	19.040
18.818	18.891
18.821	18.143
18.823	17.619
18.828	16.422
18.897	14.627
18.899	14.103
18.900	13.804
18.905	12.682
18.964	13.281
18.965	13.056
18.969	12.084
18.973	11.111
19.619	18.073
19.621	17.549
19.679	18.447
19.684	17.100
19.686	16.801
19.687	16.352
19.690	15.754
19.754	15.006
19.756	14.632
19.758	14.108
19.762	13.061
19.821	13.809
19.822	13.435
19.824	12.837
19.827	12.164
19.831	11.266
19.852	21.066
19.889	12.014
20.657	19.201
20.663	17.780
20.666	17.181
20.667	16.957
20.668	16.508
20.731	16.209
20.733	15.610
20.735	15.311
20.751	11.421
20.751	11.197
20.753	10.822
20.755	10.374
20.798	14.713
20.799	14.489
20.801	14.115
20.801	13.965
20.802	13.740
20.804	13.366
20.805	13.217
20.807	12.693
20.808	12.319
20.809	12.020
20.836	20.474
21.580	18.533
21.582	18.234
21.583	17.785
21.585	17.411
21.586	17.112
21.590	16.289
21.640	18.908
21.729	12.100
21.730	12.025
21.731	11.576
21.738	10.080
21.760	19.656
21.776	15.766
21.779	14.869
21.780	14.794
21.782	14.195
21.783	13.971
21.785	13.522
21.785	13.447
21.787	13.073
21.788	12.849
21.789	12.400
21.858	10.530
22.710	12.330
22.711	12.031
22.775	11.508
22.808	18.316
22.814	16.820
22.830	13.004
22.831	12.630
22.864	19.738
22.865	19.513
22.867	18.990
22.868	18.616
22.872	17.793
22.874	17.269
22.877	16.521
22.878	16.147
22.880	15.773
22.881	15.399
22.887	13.977
22.890	13.229
22.950	13.529
23.718	20.940
23.723	19.668
23.724	19.519
23.725	19.219
23.728	18.471
23.788	18.771
23.805	14.656
23.808	13.833
23.853	17.873
23.854	17.574
23.856	17.125
23.856	17.051
23.859	16.452
23.861	15.928
23.873	13.011
23.875	12.562
23.875	12.412
23.877	12.038
23.879	11.440
23.925	15.181
24.764	20.123
24.786	14.662
24.792	13.390
24.830	19.076
24.832	18.478
24.833	18.328
24.835	17.730
24.837	17.356
24.838	17.131
24.839	16.757
24.840	16.533
24.841	16.233
24.842	16.159
24.843	15.859
24.844	15.485
24.847	14.887
24.854	13.166
24.856	12.568
24.862	11.072
25.766	15.042
25.771	13.845
25.773	13.546
25.775	12.947
25.807	20.055
25.819	17.212
25.820	16.838
25.822	16.539
25.823	16.165
25.825	15.641
25.872	19.157
25.879	17.437
25.935	18.709
25.937	18.335
26.000	18.036
26.686	15.272
26.688	14.823
26.688	14.673
26.691	14.000
26.745	15.796
26.746	15.572
26.791	19.537
26.796	18.340
26.797	18.115
26.798	17.741
26.800	17.293
26.803	16.619
26.804	16.320
26.818	12.879
27.608	29.866
27.774	19.244
27.775	18.944
27.777	18.421
27.778	18.196
27.780	17.747
27.782	17.224
27.798	13.408
27.799	12.959
27.834	19.618
27.844	17.074
27.857	13.858
27.909	16.252
27.910	15.953
27.914	14.830
27.915	14.681
27.917	14.232
27.974	15.354
28.599	12.366
28.762	17.604
28.763	17.304
28.764	17.080
28.767	16.332
28.769	15.958
28.770	15.658
28.771	15.509
28.774	14.761
28.827	16.781
29.749	16.263
29.750	15.964
29.752	15.440
29.804	17.834
29.806	17.460
29.807	17.011
29.808	16.787
29.817	14.617
29.825	12.672
29.857	19.855
29.864	18.134
29.893	11.176
30.840	19.561
30.842	19.037
30.843	18.813
30.845	18.439
30.845	18.215
30.846	18.140
30.849	17.317
30.855	15.970
30.900	19.861
31.819	20.091
31.821	19.717
31.822	19.343
31.825	18.819
31.830	17.472
31.833	16.649
31.835	16.275
31.892	17.323
31.896	16.425
31.898	15.976
32.514	15.157
32.750	17.478
32.861	20.321
32.864	19.723
32.865	19.349
32.867	18.825
33.903	20.702
33.967	20.029
33.975	18.084
33.976	17.710
33.981	16.513
33.987	15.091
34.655	16.891
34.774	17.565
34.834	18.014
34.943	21.306
35.073	19.661
35.869	19.890
35.873	18.993
35.881	16.973
35.883	16.599
39.789	21.485
43.856	17.170];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
data.tL_m(:,2) = 3.54*data.tL_m(:,2); % convert pre-anal length to total length
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AllaLora2000';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

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
D1 = 'Pre-anal length PL of tL-data has been converted to total length TL = 3.54 * PL based on photo';
D2 = 'males are assumed to differ from females by {p_Am} only';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'preferred temp 8 C; bathypelagic; depth range 180 - 2600 m, usually 400 - 1200 m';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6B6SH'; % Cat of Life
metaData.links.id_ITIS = '165350'; % ITIS
metaData.links.id_EoL = '46564517'; % Ency of Life
metaData.links.id_Wiki = 'Coryphaenoides_rupestris'; % Wikipedia
metaData.links.id_ADW = 'Coryphaenoides_rupestris'; % ADW
metaData.links.id_Taxo = '44412'; % Taxonomicon
metaData.links.id_WoRMS = '158960'; % WoRMS
metaData.links.id_fishbase = 'Coryphaenoides-rupestris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coryphaenoides_rupestris}}';
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
bibkey = 'AllaLora2000'; type = 'Article'; bib = [ ... 
'author = {V. Allain and P. Lorance}, ' ... 
'year = {2000}, ' ...
'title = {AGE ESTIMATION AND GROWTH OF SOME DEEP-SEA FISH FROM THE {N}ORTHEAST {A}TLANTIC {O}CEAN}, ' ...
'journal = {Cybium}, ' ...
'volume = {24}, ' ...
'number = {3, suppl}, '...
'pages = {7--16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Summary/SpeciesSummary.php?ID=332&AT=Rock+grenadier}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

