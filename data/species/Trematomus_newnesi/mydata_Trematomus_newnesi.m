  function [data, auxData, metaData, txtData, weights] = mydata_Trematomus_newnesi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Trematomus_newnesi'; 
metaData.species_en = 'Dusky rockcod'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-1.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 27];

%% set data
% zero-variate data
data.ab = 95;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'guess';   
  temp.ab = C2K(0); units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'based on Trematomus_bernacchii';
data.am = 20*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(-1.4); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 13.4;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'guess'; 
  comment.Lp = 'based on Trematomus_bernacchii: 18*24.5/33 cm';
data.Li = 24.5;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.036;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 4.1 mm of based on Trematomus_bernacchii: pi/6*0.41^3';
data.Wwp = 24.1;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00537*Lp^3.24, see F1, F2';
data.Wwi = 170.2; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00537*Li^3.24, see F1, F2';

data.Ri = 3123/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(-1.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
3.030	12.607
4.015	13.643
4.991	17.465
5.002	15.474
5.045	15.190
5.047	16.385
5.058	14.508
5.076	16.841
6.006	18.956
6.044	16.169
6.047	17.762
6.048	18.274
6.061	17.307
6.074	16.568
7.012	14.985
7.027	15.611
7.030	17.375
7.034	19.651
7.043	16.806
7.045	17.887
7.046	18.399
7.057	16.351
7.076	18.968
7.977	21.368
7.996	15.508
8.013	17.272
8.015	18.296
8.016	18.979
8.017	19.377
8.018	19.776
8.019	20.174
8.055	16.476
9.000	18.877
9.004	21.209
9.011	16.715
9.013	17.966
9.024	16.260
9.025	16.886
9.052	15.691
9.985	20.026
10.022	16.214
10.026	18.490
10.038	17.011
10.041	19.059
10.054	17.978
10.074	21.108
11.015	21.517
11.041	20.038
11.043	20.891
11.052	18.046
12.055	21.016
12.086	21.984
12.994	20.060
12.999	23.075
13.009	20.686
13.011	21.710
13.025	21.198
13.997	23.087];
data.tL_f(:,1) = 365 * (0.9 + data.tL_f(:,1));  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-5;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(-1.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'fishbase';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
3.030	12.664
4.030	14.155
5.029	14.451
5.030	14.792
5.033	17.125
5.046	16.044
5.049	17.864
5.989	17.534
6.002	16.965
6.004	17.932
6.031	16.624
6.034	18.558
6.059	16.055
6.988	18.171
6.989	19.024
7.029	16.863
7.041	15.611
7.048	19.253
7.049	19.992
7.059	17.432
7.069	14.815
7.071	16.067
7.980	14.598
7.999	17.215
8.002	18.922
8.019	20.572
8.032	19.491
8.033	19.833
8.040	15.680
8.044	18.297
8.056	16.590
8.058	17.899
8.986	19.161
8.998	17.625
9.009	16.032
9.013	18.478
9.016	19.787
9.019	21.778
9.021	14.496
9.039	16.544
9.055	17.057
9.985	20.082
10.009	16.669
10.023	16.954
10.024	17.238
10.025	17.864
10.026	18.433
10.027	18.945
10.028	19.571
10.029	20.538
10.031	21.676
10.979	17.591
10.985	21.175
11.007	17.079
11.027	19.924
11.039	18.729
11.040	19.184
11.041	19.469
12.009	19.309
12.024	19.651
12.057	21.813
12.983	22.051
13.022	19.434
13.023	20.174
13.069	21.597
13.993	20.811
14.010	22.176
14.014	24.338
14.024	21.835
14.052	21.380];
data.tL_m(:,1) = 365 * (0.9 + data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(-1.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MaheElle2016';
comment.tL_m = 'Data for males';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
11.977	21.591
12.476	21.591
12.510	16.667
13.559	18.939
14.504	26.515
14.745	29.924
14.762	28.030
14.934	35.227
14.986	31.061
15.123	37.500
15.862	40.909
16.017	40.152
16.052	37.500
16.103	43.561
16.172	39.394
16.206	51.894
16.206	47.348
16.344	44.318
16.413	41.288
16.550	39.394
16.550	42.803
16.619	48.864
16.705	54.167
16.722	42.803
16.739	58.712
16.739	39.394
16.756	36.742
16.774	49.242
16.860	55.682
16.980	58.712
17.203	53.030
17.221	53.030
17.358	46.591
17.358	55.682
17.410	60.227
17.427	50.000
17.530	43.182
17.530	53.788
17.616	56.061
17.702	56.061
17.908	60.606
17.960	53.409
17.994	66.667
18.063	50.000
18.115	70.076
18.149	62.121
18.218	68.939
18.252	56.818
18.287	72.727
18.304	63.636
18.355	75.379
18.441	60.227
18.441	66.667
18.458	64.773
18.596	80.303
18.596	57.197
18.630	71.212
18.716	65.152
18.716	63.636
18.905	77.273
18.940	70.455
18.974	63.636
19.043	76.515
19.077	68.182
19.181	63.258
19.198	58.333
19.301	82.576
19.387	72.727
19.473	78.030
19.593	75.758
19.610	66.667
19.628	83.712
19.713	57.955
19.834	67.424
19.971	100.379
19.989	78.409
20.006	76.136
20.006	83.333
20.023	90.152
20.195	92.803
20.332	74.621
20.401	90.909
20.453	84.848
20.487	95.833
20.504	82.197
20.556	92.424
20.917	84.091
21.037	84.848
21.054	89.773
21.054	93.939
21.072	102.652
21.158	98.485
21.450	91.288
21.467	84.470
21.519	112.879
21.845	136.742
22.086	120.455
23.014	110.985
23.049	123.485
23.066	140.530
23.702	121.212
25.043	175.000];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'weight','females'};  
bibkey.LW_f = 'MaheElle2016';
%
data.LW_m = [ ... % total length (cm), weight (g)
12.493	20.076
13.628	22.727
14.109	28.409
14.470	32.197
14.470	25.379
14.573	35.227
14.573	26.136
15.261	35.227
15.381	31.818
15.450	32.197
15.501	41.288
15.553	35.985
15.759	41.288
15.983	38.636
16.034	40.152
16.120	42.424
16.275	42.803
16.292	39.015
16.361	38.636
16.481	43.561
16.481	39.394
16.516	42.045
16.567	53.788
16.670	47.348
16.808	47.727
16.997	54.167
17.014	62.879
17.014	50.000
17.032	45.076
17.100	58.333
17.100	62.879
17.203	52.652
17.324	48.106
17.444	53.788
17.650	48.485
17.719	61.364
17.891	57.955
17.977	65.530
18.029	60.227
18.080	59.848
18.132	62.121
18.252	62.879
18.304	71.591
18.338	66.288
18.407	77.273
18.493	64.394
18.493	65.909
18.596	62.500
18.716	67.424
18.802	74.242
18.888	66.667
18.940	83.333
19.009	70.455
19.112	85.227
19.232	86.742
19.284	64.015
19.438	97.727
19.490	89.773
19.559	95.455
19.593	85.985
19.937	84.091
19.971	96.970
19.989	89.015
20.040	106.061
20.040	77.273
20.057	92.045
20.057	75.000
20.332	80.682
20.436	95.833
20.436	102.273
20.504	115.530
20.762	97.727
20.968	109.848
20.968	112.879
21.072	106.061
21.381	91.667
21.433	102.273
21.484	110.985
21.484	95.833
21.639	107.955
21.656	113.636
22.052	110.985
24.166	142.045];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'weight','males'};  
bibkey.LW_m = 'MaheElle2016';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  3 * weights.tL_f;
weights.tL_m =  3 * weights.tL_m;
% weights.Ri =  5 * weights.Ri;
% weights.Wwi =  5 * weights.Wwi;
% weights.Wwb =  10 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f', 'LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00537*(TL in cm)^3.24';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5838N'; % Cat of Life
metaData.links.id_ITIS = '643041'; % ITIS
metaData.links.id_EoL = '46573013'; % Ency of Life
metaData.links.id_Wiki = 'Trematomus_newnesi'; % Wikipedia
metaData.links.id_ADW = 'Trematomus_newnesi'; % ADW
metaData.links.id_Taxo = '189303'; % Taxonomicon
metaData.links.id_WoRMS = '234628'; % WoRMS
metaData.links.id_fishbase = 'Trematomus-newnesi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Trematomus_newnesi}}';  
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
bibkey = 'MaheElle2016'; type = 'Article'; bib = [ ... 
'author = {K\''{e}lig Mah\''{e} and Romain Elleboode and Christophe Loots and Philippe Koubbi}, ' ...
'year = {2016}, ' ...
'title = {Growth of an Inshore {A}ntarctic fish, \emph{Trematomus newnesi} ({N}ototheniidae), off {A}delie {L}and}, ' ... 
'journal = {Polar Science}, ' ...
'volume = {10(2)}, ' ...
'pages = {167-172}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Trematomus-newnesi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
