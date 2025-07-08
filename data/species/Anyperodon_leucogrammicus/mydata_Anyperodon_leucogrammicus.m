  function [data, auxData, metaData, txtData, weights] = mydata_Anyperodon_leucogrammicus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Anyperodon_leucogrammicus'; 
metaData.species_en = 'Slender grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 28];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 40*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27.6);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 65;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.3e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.76 mm: pi/6*0.076^3';
data.Wwp = 339;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01096*Lp^3.04, see F1';
data.Wwi = 3557;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01096*Li^3.04, see F1';

data.Ri  = 6.9e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.6);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Epinephelus_fuscoguttatus: 3287515*3557/17000';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1.864	31.443
1.869	27.164
2.935	35.920
2.938	33.930
3.023	32.139
3.677	39.204
3.839	41.692
3.841	40.498
3.841	40.199
3.843	38.806
3.846	37.114
3.847	35.920
3.849	35.124
3.931	35.323
3.936	31.841
4.013	36.318
4.099	33.731
4.841	36.617
4.846	33.134
4.914	44.279
5.002	40.199
5.005	38.109
5.006	37.512
5.006	37.313
5.007	37.114
5.009	35.522
5.825	44.876
5.912	41.990
5.916	39.104
5.918	37.612
5.998	40.000
5.998	39.701
6.004	35.423
6.008	32.338
6.076	43.184
6.086	36.318
6.168	37.015
6.824	42.189
6.831	36.915
6.904	44.279
6.906	42.488
6.909	40.199
6.910	39.801
6.992	40.697
7.071	43.483
7.071	43.284
7.165	35.423
7.737	41.095
7.818	42.786
7.899	44.279
7.901	42.985
7.902	41.891
7.981	44.876
7.984	42.488
8.069	40.896
8.070	40.597
8.811	44.080
8.813	42.488
8.891	46.070
8.893	44.776
8.897	41.692
8.975	45.473
8.976	45.174
8.981	41.393
8.981	41.194
9.804	45.771
9.805	45.075
9.806	44.478
9.885	47.463
9.889	44.080
9.892	42.388
9.967	47.861
9.968	46.866
9.976	41.592
10.878	48.557
10.883	45.274
10.883	44.975
10.884	44.577
10.960	49.154
10.965	45.572
11.045	47.562
11.046	46.766
11.792	47.363
11.876	46.070
12.045	44.179
12.875	43.781
12.955	45.970
13.123	44.080
13.780	48.856
13.862	49.154
14.116	45.672
14.769	52.836
14.772	50.945
14.778	46.368
14.860	47.164
15.771	47.861
15.844	55.025
15.940	45.672
16.023	45.970
17.097	48.557
17.756	51.443
17.842	49.453
18.012	46.269
18.838	48.955
18.839	48.358
21.077	48.557
22.070	50.348
23.893	51.045
24.970	51.542
26.797	49.950
29.028	54.925]; 
data.tL(:,1) = 365 * (0+data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaplCurr2009'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
24.754	163.624
26.808	199.271
27.197	231.837
28.568	234.949
31.397	394.424
31.983	420.447
32.088	286.740
34.821	436.443
34.914	521.216
34.917	465.781
35.018	420.117
35.214	410.314
35.404	508.119
35.409	423.336
35.695	563.522
35.798	459.163
36.285	517.806
36.479	550.393
36.674	566.677
36.876	446.002
36.878	403.611
37.058	693.809
37.167	488.362
37.251	742.701
38.629	605.594
38.824	612.095
39.221	524.008
39.504	719.630
39.901	618.500
40.186	774.990
40.380	810.839
40.383	755.404
40.383	748.882
40.871	771.655
41.064	833.591
41.452	888.983
41.453	872.679
41.467	615.069
41.943	859.582
42.050	696.527
42.239	817.159
42.432	875.833
42.531	846.475
42.723	921.454
43.024	790.986
43.215	875.748
43.507	908.325
43.597	1048.533
43.606	872.445
44.002	797.402
44.190	944.121
44.277	1139.763
44.280	1077.806
44.285	996.284
44.388	904.969
44.877	904.915
44.883	797.306
45.065	1051.634
45.161	1074.450
45.463	921.156
45.660	901.569
45.741	1224.387
45.945	1061.321
46.052	901.527
46.237	1093.898
46.330	1178.670
46.622	1211.247
46.714	1322.107
46.916	1201.433
47.209	1214.444
47.599	1253.533
47.607	1100.271
47.780	1511.121
47.891	1269.805
47.967	1687.188
48.179	1374.122
48.377	1344.752
48.396	999.098
49.065	1292.504
49.151	1507.712
49.942	1354.365
50.718	1497.759
51.199	1647.706
51.312	1357.477]; 
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'MaplCurr2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 15 * weights.tL;
weights.ab = weights.ab * 0;
weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 0;
weights.Li = weights.Li * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01096*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'F5H3'; % Cat of Life
metaData.links.id_ITIS = '167949'; % ITIS
metaData.links.id_EoL = '46579748'; % Ency of Life
metaData.links.id_Wiki = 'Anyperodon_leucogrammicus'; % Wikipedia
metaData.links.id_ADW = 'Anyperodon_leucogrammicus'; % ADW
metaData.links.id_Taxo = '105852'; % Taxonomicon
metaData.links.id_WoRMS = '212549'; % WoRMS
metaData.links.id_fishbase = 'Anyperodon-leucogrammicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Anyperodon_leucogrammicus}}';  
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
bibkey = 'MaplCurr2009'; type = 'techreport'; bib = [ ... 
'howpublished = {https://rrrc.org.au/wp-content/uploads/2014/06/483-JCU-Mapleston-A-et-al-2009-Comparative-biology-of-GBR-serranid-species.pdf}, ' ...
'author = {Mapleston, A. and Currey, L.M.and Williams, A.J. and Pears, R. and Simpfendorfer, C.A. and Penny, A.L. and Tobin, A. and Welch, D}, ' ... 
'year = {2009}, ' ...
'title = {Comparative biology of key inter-reefal serranid species on the Great Barrier Reef.}, ' ...
'institution = {Reef and Rainforest Research Centre Limited, Cairns}, ' ...
'volume = {Project Milestone Report to the Marine and Tropical Sciences Research Facility}, ' ...
'pages = {55pp.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Anyperodon-leucogrammicus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

