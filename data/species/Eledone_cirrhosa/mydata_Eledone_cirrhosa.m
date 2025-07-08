function [data, auxData, metaData, txtData, weights] = mydata_Eledone_cirrhosa
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Eledonidae';
metaData.species    = 'Eledone_cirrhosa'; 
metaData.species_en = 'Curled octopus'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 28]; 

%% set data
% zero-variate data

data.ab = 110;     units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'ReguGonz2015';   
  temp.ab = C2K(16);     units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 4*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(13);     units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = '1-5 yrs';
  
data.Wwb = 0.03; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Enteroctopus_dofleini';
data.Wwp = 500;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Wiki';
data.Wwi = 1500;   units.Wwi = 'g';   label.Wwi = 'wet weight at 470 d'; bibkey.Wwi = 'Wiki';

data.Ni  = 5e3; units.Ni  = '#';   label.Ni  = 'cum reprod at death';     bibkey.Ni  = 'Wiki';   
  temp.Ni = C2K(13);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% time-weight
data.tL_f = [ ... % mantle length (cm), time (d)
7.308	234.561
7.511	156.757
8.659	181.786
9.001	310.141
9.141	227.284
9.326	188.359
9.519	276.192
9.619	215.318
9.851	247.366
10.443	372.270
10.500	294.507
10.610	380.673
10.625	294.472
11.188	299.384
11.292	294.284
11.313	302.729
11.340	395.679
11.356	324.688
11.357	333.139
11.438	306.074
11.523	321.261
11.708	295.857
11.709	300.927
11.790	272.172
11.835	319.483
12.003	336.337
12.041	283.932
12.202	204.450
12.247	258.522
12.428	456.218
12.480	304.090
12.696	415.579
12.740	451.059
12.747	260.071
12.824	162.021
12.902	391.858
12.915	275.235
13.305	484.703
13.310	266.673
13.338	369.764
13.343	433.988
13.567	359.559
13.735	381.483
13.848	508.212
13.985	381.413
14.044	323.931
14.112	410.109
14.420	350.867
14.531	448.864
14.707	274.730
14.731	322.048
15.535	507.736
15.815	326.813
15.844	443.424
16.425	422.979];
data.tL_f = data.tL_f(:,[2 1]); [~, ind] = sort(data.tL_f(:,1)); data.tL_f=data.tL_f(ind,:);
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(13);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ReguGonz2015';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % mantle length (cm), time (d)
6.407	158.759
6.716	107.967
7.429	175.372
8.074	163.359
8.286	212.314
8.555	190.266
8.601	247.718
8.661	212.208
8.764	202.038
8.790	274.707
9.012	171.546
9.015	210.418
9.016	223.939
9.077	201.950
9.104	289.830
9.226	247.542
9.263	183.306
9.369	213.699
9.411	208.617
9.415	271.151
9.468	137.615
9.603	284.619
9.783	178.089
9.785	201.751
9.828	222.020
9.848	213.564
9.949	156.071
9.978	277.753
9.998	269.296
10.018	262.530
10.022	311.543
10.182	221.920
10.184	240.512
10.288	238.792
10.331	262.442
10.397	308.057
10.448	152.550
10.497	252.254
10.575	179.556
10.608	355.322
10.815	333.292
10.891	225.101
10.991	170.988
10.997	253.804
11.003	339.999
11.019	263.938
11.020	277.459
11.432	219.878
11.464	377.052
11.520	290.839
12.217	419.094
12.230	312.611
12.705	244.872
13.028	405.344
13.047	376.606
13.419	324.107
14.026	364.500];
data.tL_m = data.tL_m(:,[2 1]); [~, ind] = sort(data.tL_m(:,1)); data.tL_m=data.tL_m(ind,:);
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(13);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ReguGonz2015';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % wet weight (g), time (d)
 64.518	231.609
 81.876	159.630
131.494	203.454
133.238	193.407
136.702	181.693
150.285	230.365
155.368	252.178
196.472	274.172
201.306	383.135
203.563	193.761
223.781	321.237
244.566	250.950
246.123	306.265
252.778	378.366
270.237	271.191
283.844	311.483
287.183	343.343
303.133	164.094
306.065	338.410
306.099	326.679
311.388	276.426
328.454	306.679
330.069	341.883
333.619	300.001
340.461	306.740
345.631	298.386
345.731	263.191
350.705	323.551
378.484	206.372
381.685	286.835
391.645	402.528
400.470	315.421
422.783	310.506
430.760	520.043
436.467	323.982
439.629	417.853
470.934	267.172
501.492	377.940
504.669	466.783
508.315	391.383
514.984	458.455
537.575	356.334
557.918	440.235
558.119	369.845
570.370	284.432
574.903	498.980
578.444	460.450
589.113	328.102
604.709	272.873
605.916	450.533
624.918	403.701
686.619	420.771
700.417	394.024
702.013	435.932
726.333	328.792
748.099	514.935
911.545	341.455
947.249	452.249];
data.tWw_f = data.tWw_f(:,[2 1]); [~, ind] = sort(data.tWw_f(:,1)); data.tWw_f=data.tWw_f(ind,:);
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f    = C2K(13);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'ReguGonz2015';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % wet weight (g), time (d)
68.154	159.561
76.889	104.297
83.544	176.398
110.949	189.943
122.865	221.847
131.470	211.834
133.319	164.916
134.939	198.444
136.525	243.703
150.151	277.291
150.500	154.947
153.888	170.047
162.244	247.184
182.803	255.668
189.850	190.340
195.025	180.310
195.054	170.254
195.135	141.763
196.515	259.089
201.574	289.282
203.328	275.883
204.842	346.281
204.923	317.790
204.933	314.438
205.321	178.686
218.909	225.682
218.962	207.246
220.576	242.450
227.360	269.300
235.970	257.611
239.166	339.750
244.657	219.107
254.756	286.197
254.809	267.762
254.915	230.891
263.687	162.220
269.925	380.128
271.866	301.367
289.133	261.230
314.771	293.203
355.994	273.298
369.745	263.312
374.732	318.644
385.072	301.936
386.816	291.889
405.698	286.956
419.520	251.830
427.718	384.273
494.631	377.906]; 
data.tWw_m = data.tWw_m(:,[2 1]); [~, ind] = sort(data.tWw_m(:,1)); data.tWw_m=data.tWw_m(ind,:);
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m    = C2K(13);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'ReguGonz2015';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;
%weights.ab = 5 * weights.ab;

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
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed not to differ from females, but males tend to live shorter';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'semelparous: death at first spawning, female ventilates eggs and dies after hatching; No food intake during this period';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '396WW'; % Cat of Life
metaData.links.id_ITIS = '82646'; % ITIS
metaData.links.id_EoL = '492409'; % Ency of Life
metaData.links.id_Wiki = 'Eledone_cirrhosa'; % Wikipedia
metaData.links.id_ADW = 'Eledone_cirrhosa'; % ADW
metaData.links.id_Taxo = '84926'; % Taxonomicon
metaData.links.id_WoRMS = '140600'; % WoRMS
metaData.links.id_molluscabase = '140600'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eledone_cirrhosa}}';
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
bibkey = 'ReguGonz2015'; type = 'article'; bib = [ ... 
'doi = {10.3989/scimar.04137.23A}, ' ...
'author = {Marcos Regueira and \''{A}ngel F. Gonz\''{a}lez and \''{A}ngel Guerra}, ' ... 
'year = {2015}, ' ...
'title = {Determination of age and growth of the horned octopus \emph{Eledone cirrhosa} ({C}ephalopoda: {O}ctopoda) using stylet increment analysis}, ' ...
'journal = {Scientia Marina}, ' ...
'volume = {79(1)}, ' ...
'pages = {71-78}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Eledone-cirrhosa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

