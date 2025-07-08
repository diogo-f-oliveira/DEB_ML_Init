function [data, auxData, metaData, txtData, weights] = mydata_Centroscyllium_fabricii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Etmopteridae';
metaData.species    = 'Centroscyllium_fabricii'; 
metaData.species_en = 'Black dogfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN','MAS'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.2); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 0.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 03];                          
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
% zero-variate data
data.ab = 2.7*365;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(4.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 40*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'Qvis2012';   
  temp.am = C2K(4.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 16;    units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Qvis2012';  
data.Lp  = 65;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Qvis2012';
data.Lpm  = 43;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'Qvis2012'; 
data.Li  = 90.3;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'Qvis2012';
data.Lim  = 82.7; units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'Qvis2012';

data.Ri  = 14/365/3;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(4.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '14 pups per litter, 1 litter per 3 yrs assumed, in view of ab';

% uni-variate data
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.908	21.604
3.935	22.219
5.881	25.829
8.951	35.245
15.914	50.479
16.951	58.685
17.903	58.289
18.897	64.294
19.978	53.500
20.886	61.904
21.968	60.110
22.919	69.714
23.914	64.919
25.038	63.725
25.946	59.930
26.897	63.734
27.935	65.739
29.968	69.350
32.865	73.364
37.968	76.590];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','female'};  
temp.tL_f    = C2K(4.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'Qvis2012';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.908	22.804
1.946	18.210
3.935	20.819
6.876	25.034
15.870	55.279
16.908	51.884
17.859	51.889
18.854	43.294
19.935	60.899
20.886	55.304
21.924	53.909
22.919	56.314
23.870	54.119
24.822	59.324
25.946	55.130
27.027	56.335
29.838	58.949
30.876	66.354
32.043	60.360
35.849	67.379];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','male'};  
temp.tL_m    = C2K(4.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'Qvis2012';
comment.tL_m = 'Data for males';
  
% length - weight
data.LWw_f = [ ... % total length (cm), wet weight (g)
16.865	35.088
17.971	23.392
19.077	35.088
22.946	70.175
24.605	70.175
25.849	93.567
26.677	128.655
27.645	116.959
28.890	116.959
29.719	128.655
31.377	140.351
33.449	187.135
34.556	163.743
36.074	257.310
40.772	304.094
43.676	292.398
44.638	467.836
45.606	444.444
45.609	374.269
47.265	444.444
48.645	538.012
50.024	631.579
50.573	748.538
51.683	631.579
52.642	877.193
53.200	748.538
53.756	654.971
54.026	842.105
54.713	947.368
54.998	725.146
55.965	748.538
56.237	877.193
56.921	1076.023
56.926	923.977
56.931	783.626
57.336	1064.327
57.893	947.368
58.164	1099.415
58.851	1228.070
59.396	1450.292
59.409	1099.415
59.688	1005.848
60.231	1298.246
60.513	1157.895
60.516	1052.632
60.639	1508.772
61.349	970.760
61.612	1356.725
61.615	1274.854
62.439	1426.901
62.702	1801.170
62.722	1239.766
62.997	1274.854
63.002	1122.807
63.534	1742.690
63.954	1590.643
64.105	1228.070
64.779	1719.298
64.921	1602.339
64.926	1450.292
64.930	1356.725
64.937	1134.503
65.074	1192.982
65.479	1450.292
65.737	1988.304
65.742	1859.649
65.897	1356.725
65.901	1239.766
66.830	2374.269
66.851	1766.082
67.670	2081.871
67.830	1426.901
67.957	1766.082
68.379	1543.860
68.495	2210.526
68.800	1380.117
68.925	1766.082
69.206	1625.731
69.480	1707.602
69.749	1918.129
69.875	2269.006
69.907	1345.029
70.716	1929.825
70.839	2374.269
70.848	2105.263
70.857	1859.649
71.103	2748.538
71.120	2257.310
71.269	1941.520
71.667	2432.749
71.954	2105.263
72.772	2456.140
72.780	2233.918
72.798	1707.602
72.904	2631.579
72.927	1953.216
73.580	3087.719
73.582	3005.848
73.605	2339.181
73.726	2853.801
73.736	2573.099
73.888	2152.047
73.891	2070.175
73.894	1988.304
74.437	2280.702
74.611	1251.462
74.705	2514.620
74.836	2736.842
74.960	3157.895
75.642	3415.205
75.681	2280.702
75.791	3111.111
75.800	2830.409
76.777	2561.404
76.928	2198.830
77.864	3111.111];
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'total length','wet weight','female'};  
bibkey.LWw_f  = 'Qvis2012';
comment.LWw_f = 'Data for frmales';
%
data.LWw_m = [ ... % total length (cm), wet weight (g)
20.869	47.909
21.955	47.979
23.881	84.310
24.603	94.702
24.608	63.668
25.571	79.247
26.411	110.336
27.618	110.414
28.825	105.320
29.665	141.581
33.759	203.914
34.842	224.674
34.849	178.123
37.860	214.524
38.217	255.927
42.915	313.127
43.507	395.924
43.741	452.836
43.753	364.905
45.789	473.658
46.760	437.514
47.833	530.686
48.063	618.632
48.919	530.757
49.745	670.465
49.753	608.397
49.758	572.190
50.488	530.858
50.601	582.590
50.976	489.510
51.676	665.418
51.921	639.571
51.939	505.090
52.239	965.454
52.414	562.017
52.636	706.859
52.886	639.634
53.491	629.328
53.605	675.887
53.621	562.095
53.988	525.912
54.800	769.068
54.803	743.206
54.807	712.172
55.061	619.085
55.504	913.941
55.778	670.855
56.252	738.127
56.727	795.055
57.094	758.871
57.681	877.875
57.693	784.772
57.820	738.229
58.498	1079.652
58.625	1038.281
58.629	1007.247
58.875	971.056
58.884	903.815
58.958	1255.544
59.711	1038.351
59.806	1229.736
59.839	981.463
60.546	1110.819
60.645	1271.170
60.677	1033.241
60.794	1059.111
61.385	1147.080
61.658	914.339
61.994	1105.740
62.013	966.086
62.102	1198.850
62.348	1167.832
62.726	1048.891
62.731	1007.512
62.820	1245.449
63.516	1452.390
63.537	1297.219
63.909	1224.829
64.475	1504.176
64.480	1467.970
64.619	1328.323
64.660	1023.154
64.751	1240.401
64.763	1152.471
65.453	1405.964
65.977	1095.653
66.328	1178.434
66.640	1556.040
67.520	1287.132];
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'total length','wet weight','male'};  
bibkey.LWw_m  = 'Qvis2012';
comment.LWw_m = 'Data for males';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.Lp = 3 * weights.Lp;
weights.Lpm = 3 * weights.Lpm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} anf E_Hp only';
D2 = 'temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'aplacental viviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'upper continental slope at a depth of 180-2250 m m'; 
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'length-weight: Ww in g = 0.00302 * (TL in cm)^3.07';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '5XHK3'; % Cat of Life
metaData.links.id_ITIS = '160703'; % ITIS
metaData.links.id_EoL = '46560234'; % Ency of Life
metaData.links.id_Wiki = 'Centroscyllium_fabricii'; % Wikipedia
metaData.links.id_ADW = 'Centroscyllium_fabricii'; % ADW
metaData.links.id_Taxo = '41810'; % Taxonomicon
metaData.links.id_WoRMS = '105906'; % WoRMS
metaData.links.id_fishbase = 'Centroscyllium-fabricii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Centroscyllium_fabricii}}';  
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
bibkey = 'Qvis2012'; type = 'phdthesis'; bib = [ ... 
'author = {Trine Qvist}, ' ... 
'year = {2012}, ' ...
'title = {Age Estimates and Distribution of the Black dogfish (\emph{Centroscyllium fabricii})}, ' ...
'school = {Aarhus University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Centroscyllium-fabricii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
