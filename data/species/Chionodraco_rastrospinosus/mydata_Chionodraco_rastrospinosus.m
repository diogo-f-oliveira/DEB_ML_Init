  function [data, auxData, metaData, txtData, weights] = mydata_Chionodraco_rastrospinosus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Channichthyidae';
metaData.species    = 'Chionodraco_rastrospinosus'; 
metaData.species_en = 'Ocellated icefish'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 29];

%% set data
% zero-variate data
data.ab = 70;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'guess';   
  temp.ab = C2K(0); units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'based on Trematomus_bernacchii';
data.am = 13*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'MesaAshf2008';   
  temp.am = C2K(0.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 30;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'MesaAshf2008'; 
data.Li = 52;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'MesaAshf2008';

data.Wwb = 0.0654;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'MesaDona2023';
  comment.Wwb = 'based on egg diameter of 5 mm: pi/6*0.5^3';
data.Wwp = 202;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'MesaAshf2008';
  comment.Wwp = 'based on 0.00132*Lp^3.51, see F1';
data.Wwi = 1.39e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'MesaAshf2008';
  comment.Wwi = 'based on 0.00132*Li^3.51, see F1';

data.Ri = 6389/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'MesaDona2023';   
  temp.Ri = C2K(0.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL_f = [ ... % time(yr), total length (cm)
0.927	15.893
0.972	14.050
0.996	14.856
2.938	35.931
2.983	33.167
3.004	28.330
3.006	32.361
3.028	29.251
3.050	26.257
3.975	37.889
4.019	31.900
4.020	34.434
4.021	36.046
4.022	37.083
4.921	41.459
4.966	38.810
4.987	37.198
4.988	38.119
5.033	34.203
5.034	35.125
5.057	35.931
5.058	40.077
5.930	33.167
5.977	35.355
5.982	47.217
6.001	39.386
6.002	40.307
6.003	42.150
6.047	37.083
6.993	41.919
7.016	43.186
7.017	44.223
7.018	45.720
7.062	40.307
7.939	46.065
8.029	42.035
8.030	44.914
8.997	42.956
9.021	45.259
9.022	48.484
9.965	45.259
10.103	46.411
10.954	42.841
10.977	41.804
10.979	48.369
12.015	48.944
12.084	48.023];
data.tL_f(:,1) = 365 * (0.3+data.tL_f(:,1));  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time', 'total length','females'};  
temp.tL_f = C2K(0.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MesaAshf2008'; 
%
data.tL_m = [ ... % time(yr), total length (cm)
1.035	14.912
1.174	16.673
3.022	31.233
3.067	30.294
3.115	34.403
3.159	28.180
3.182	28.767
4.105	34.873
4.127	30.411
4.128	33.464
4.129	33.933
4.152	35.695
4.198	37.221
5.028	38.043
5.072	33.464
5.073	34.286
5.096	35.225
5.097	36.869
5.119	36.164
5.120	39.100
6.064	38.395
6.065	40.274
6.066	40.861
6.087	39.335
6.109	36.047
6.110	37.339
7.078	40.157
7.146	38.160
7.953	40.978
7.977	43.327
8.023	44.384
8.114	40.274
9.060	44.384
10.004	44.501
10.026	42.153
10.993	43.092
11.984	45.323];
data.tL_m(:,1) = 365 * (0.3+data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time', 'total length','males'};  
temp.tL_m = C2K(0.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MesaAshf2008'; 

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
13.619	19.537
14.571	33.027
15.714	32.962
25.905	110.266
27.524	181.280
27.810	154.176
28.952	127.024
30.190	194.674
31.714	238.606
32.000	255.520
32.000	285.994
32.571	333.366
32.762	313.039
32.762	299.495
33.048	262.233
33.619	397.641
33.714	350.231
33.714	326.529
33.714	312.985
34.095	292.648
34.762	397.576
34.762	455.138
34.857	340.009
35.238	353.531
35.619	370.440
36.000	417.822
36.000	522.788
36.381	424.573
36.381	360.239
36.476	455.041
36.571	380.544
36.857	397.458
37.238	427.910
37.333	475.309
37.714	444.814
37.810	438.036
37.810	404.176
37.810	387.246
37.905	556.541
38.000	576.852
38.095	482.038
38.952	471.832
39.048	630.969
39.714	458.245
39.810	776.524
39.810	674.944
39.810	647.856
39.905	813.764
40.000	563.195
40.190	624.132
40.667	681.667
41.048	806.928
41.714	668.064
41.905	871.214
41.905	837.354
41.905	810.266
42.095	728.991
42.095	728.991
42.190	918.602
42.286	745.910
42.857	830.528
43.048	1006.589
43.238	891.454
43.810	762.754
43.905	928.663
43.905	871.101
44.667	1121.622
44.667	996.340
44.762	952.316
44.952	908.288
45.714	1009.825
45.905	1168.956
46.000	1067.371
46.000	1050.441
46.952	1019.913
47.810	972.460
47.905	1182.387
47.905	908.121
48.095	1074.025];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'MesaAshf2008'; 
%
data.LW_m = [ ... % total length (cm), weight (g)
14.530	22.826
15.843	26.087
27.927	176.087
29.050	205.435
29.051	189.130
30.077	273.913
30.173	231.522
30.175	202.174
30.550	211.957
31.202	267.391
31.204	244.565
31.300	198.913
33.072	348.913
33.171	277.174
33.260	352.174
33.355	322.826
33.534	459.783
33.632	397.826
33.919	309.783
34.007	394.565
34.197	361.957
34.561	528.261
34.668	322.826
34.752	472.826
34.756	407.609
34.852	368.478
34.947	348.913
35.034	459.783
35.130	423.913
35.320	391.304
35.598	443.478
35.687	515.217
35.787	417.391
35.795	286.957
35.973	443.478
35.974	417.391
36.065	472.826
36.065	466.304
36.166	355.435
36.441	450.000
36.537	407.609
36.624	515.217
36.629	443.478
37.010	352.174
37.090	564.130
37.095	492.391
37.654	538.043
37.658	472.826
37.840	567.391
37.847	456.522
37.848	433.696
38.312	515.217
39.061	534.783
39.438	505.435
39.528	564.130
39.619	606.522
39.621	567.391
39.894	701.087
40.085	648.913
40.181	616.304
40.374	525.000
40.551	688.043
40.558	570.652
41.213	596.739
41.299	720.652
41.868	626.087
41.959	658.696
42.041	857.609
42.889	782.609
42.985	746.739
42.990	668.478
44.192	942.391
44.289	877.174
44.298	740.217
44.758	870.652
45.041	857.609
45.226	896.739];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'MesaAshf2008'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  3 * weights.tL_f;
weights.tL_m =  3 * weights.tL_m;
weights.ab =  0 * weights.ab;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00132*(TL in cm)^3.51';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4BZCY'; % Cat of Life
metaData.links.id_ITIS = '642901'; % ITIS
metaData.links.id_EoL = '46573066'; % Ency of Life
metaData.links.id_Wiki = 'Chionodraco_rastrospinosus'; % Wikipedia
metaData.links.id_ADW = 'Chionodraco_rastrospinosus'; % ADW
metaData.links.id_Taxo = '182489'; % Taxonomicon
metaData.links.id_WoRMS = '234796'; % WoRMS
metaData.links.id_fishbase = 'Chionodraco-rastrospinosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chionodraco_rastrospinosus}}';  
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
bibkey = 'MesaAshf2008'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-008-0471-7}, ' ...
'author = {Mario La Mesa and Julian Ashford}, ' ...
'year = {2008}, ' ...
'title = {Age and growth of ocellated icefish, \emph{Chionodraco rastrospinosus} {D}e{W}itt and {H}ureau, 1979, from the {S}outh {S}hetland {I}slands}, ' ... 
'journal = {Polar Biology}, ' ...
'volume = {31(11)}, ' ...
'pages = {1333–1342}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MesaDona2023'; type = 'Article'; bib = [ ... 
'author = {Mario La Mesa and Fortunata Donato and Emilio Riginella}, ' ...
'year = {2023}, ' ...
'title = {Life history and population structure of the {A}ntarctic icefish, \emph{Pagetopsis maculata} ({N}otothenioidei, {C}hannichthyidae) from the {W}eddell {S}ea}, ' ... 
'journal = {Polar Science}, ' ...
'volume = {35}, ' ...
'pages = {100917}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chionodraco-rastrospinosus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
