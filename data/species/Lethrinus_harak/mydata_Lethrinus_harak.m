function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_harak
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_harak'; 
metaData.species_en = 'Thumbprint emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 21];

%% set data
% zero-variate data

data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'EbisOzaw2009';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 19.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 54.9;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'GomaSiju2021';
  comment.Wwb = 'based egg diameter of 0.7 mm of Lethrinus_lentjan: pi/6*0.07^3'; 
data.Wwp = 105.8;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01514*Lp^2.98, see F1';
data.Wwi = 2312;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^2.98, see F1';

data.GSI = 0.11; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'Ebis2006';
  temp.GSI = C2K(28.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.637	14.725
1.157	16.181
1.157	15.600
1.215	17.634
1.331	19.572
1.389	19.088
1.389	16.570
1.505	20.832
1.562	17.249
1.649	22.673
1.707	20.930
1.765	21.124
1.881	21.028
1.939	22.965
1.996	21.222
1.996	22.094
2.112	20.933
2.199	22.192
2.228	21.902
2.257	21.708
2.286	20.546
2.286	23.161
2.286	19.384
2.315	22.580
2.315	21.418
2.373	22.096
2.401	23.937
2.459	23.065
2.546	23.260
2.546	22.097
2.575	26.553
2.604	24.616
2.604	26.069
2.633	22.098
2.633	21.420
2.691	22.486
2.691	22.486
2.749	25.004
2.778	25.489
2.778	23.648
2.807	27.426
2.835	26.361
2.893	24.714
2.893	24.618
2.922	26.264
2.951	23.456
2.951	27.717
2.980	26.555
3.067	23.456
3.154	24.716
3.154	27.622
3.183	23.070
3.269	24.136
3.327	24.233
3.327	25.492
3.356	22.102
3.414	24.815
3.472	30.529
3.472	24.912
3.501	22.491
3.530	22.588
3.588	26.559
3.617	24.235
3.646	28.690
3.646	27.625
3.646	25.494
3.675	25.688
3.675	24.719
3.703	26.172
3.732	27.238
3.732	24.623
3.732	23.848
3.732	23.170
3.819	22.008
3.935	26.077
4.051	24.237
4.080	25.690
4.080	25.690
4.108	26.465
4.108	28.305
4.137	27.531
4.166	25.013
4.166	27.047
4.195	23.657
4.195	25.885
4.253	23.076
4.253	27.822
4.311	24.142
4.398	22.399
4.427	27.048
4.427	25.499
4.427	24.821
4.427	22.496
4.542	26.662
4.571	26.274
4.571	26.274
4.687	26.953
4.687	24.241
4.716	25.888
4.716	23.660
4.745	27.631
4.745	26.178
4.832	28.600
4.861	30.538
4.861	25.792
4.890	27.051
4.890	26.470
4.919	29.860
4.948	24.921
5.034	27.730
5.063	29.377
5.208	27.150
5.208	27.150
5.237	25.407
5.382	25.989
5.410	26.376
5.468	28.507
5.497	26.667
5.613	26.281
5.642	28.896
5.700	29.284
5.758	28.219
5.758	25.894
5.816	26.960
5.816	26.863
5.816	28.994
5.844	25.023
5.873	27.735
5.931	25.217
5.989	26.186
6.105	26.187
6.192	30.642
6.221	26.769
6.365	26.576
6.452	26.867
6.568	27.352
6.597	28.805
6.684	26.965
6.684	29.096
6.741	29.484
6.799	27.256
6.973	31.228
7.002	32.294
7.089	32.682
7.118	30.454
7.233	26.678
7.262	25.806
7.320	27.647
7.349	28.519
7.436	30.650
7.436	26.485
7.552	28.036
7.609	32.298
8.130	29.783
8.333	30.268
8.506	29.204
8.622	27.170
8.709	28.140
8.796	28.043
8.969	32.693
9.085	30.951
9.230	30.467
9.461	27.854
9.490	28.822
10.763	30.283
10.763	31.639
11.429	28.640
11.544	34.452
12.094	30.581
12.788	31.651
14.582	34.180];
data.tL_f(:,1) = 365 * (0+data.tL_f(:,1));  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f    = C2K(28.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'EbisOzaw2009';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
1.128	11.435
2.401	23.356
2.517	25.003
2.546	23.841
2.922	26.845
3.038	23.359
3.269	21.521
3.385	23.362
3.761	24.526
3.906	25.786
3.993	26.949
4.108	27.821
4.137	21.429
4.253	24.626
4.282	27.241
4.369	24.433
4.485	23.756
4.600	29.664
5.005	25.212
5.063	24.243
5.063	25.502
5.150	26.375
5.237	24.438
5.237	25.407
5.295	23.373
5.353	25.407
5.700	27.831
5.700	28.702
5.758	27.250
5.787	25.894
5.873	25.120
5.960	27.058
6.047	28.414
6.134	27.930
6.250	28.028
6.250	24.832
6.336	26.188
6.365	27.157
6.394	24.155
6.510	27.545
6.568	26.867
6.597	28.224
6.597	26.190
6.626	29.870
6.712	26.578
6.857	27.450
6.944	28.323
6.944	25.901
7.146	26.774
7.175	27.452
7.349	28.034
7.725	28.715
7.725	27.359
7.783	28.715
7.783	27.650
7.783	26.681
8.014	28.813
8.101	27.458
8.391	25.038
8.477	28.138
8.477	26.879
8.622	30.657
8.622	27.655
8.680	27.946
8.882	27.656
9.027	28.141
9.056	27.851
9.201	27.368
9.288	27.465
9.316	29.015
9.432	28.338
9.635	29.017
9.808	28.727
9.866	29.502
9.895	26.694
9.953	27.663
10.242	26.987
10.503	26.698
10.763	28.249
10.908	26.797
11.081	28.638
11.168	26.121
11.515	28.350
11.631	26.898
11.776	27.964
12.325	28.743
12.470	27.581
12.499	26.903
13.222	28.554
13.367	26.812
13.570	29.719
14.293	28.754];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));  % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length','males'};  
temp.tL_m    = C2K(28.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'EbisOzaw2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Wwb = 5 * weights.Wwb;
weights.GSI = 5 * weights.GSI;

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

%% Discussion
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww ing g = 0.01514*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'protogynous hermaphrodite';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6Q2NY'; % Cat of Life
metaData.links.id_ITIS = '169133'; % ITIS
metaData.links.id_EoL = '46580940'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus_harak'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_harak'; % ADW
metaData.links.id_Taxo = '178740'; % Taxonomicon
metaData.links.id_WoRMS = '212063'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-harak'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus_harak}}';
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
bibkey = 'EbisOzaw2009'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s12562-009-0061-9}, ' ...
'author = {Akihiko Ebisawa and Takakazu Ozawa}, ' ... 
'year = {2009}, ' ...
'title = {Life-history traits of eight \emph{Lethrinus} species from two local populations in waters off the {R}yukyu Islands}, ' ...
'journal = {Fish Sci}, ' ...
'volume = {75}, ' ...
'pages = {553–566}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ebis2006'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10228-006-0345-3}, ' ...
'author = {Akihiko Ebisawa}, ' ... 
'year = {2006}, ' ...
'title = {Reproductive and sexual characteristics in five Lethrinus species in waters off the {R}yukyu {I}slands}, ' ...
'journal = {Ichthyol Res}, ' ...
'volume = {53}, ' ...
'pages = {269–280}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GomaSiju2021'; type = 'Article'; bib = [ ... 
'doi = {10.1111/are.15461}, ' ...
'author = {Pitchaimuthu Gomathi and Ramachandran Siju and Mathavankonathu Kuttan Anil and Gopidas P. Ambarish and Sumathi Surya and Bhargavan Raju and Padikkala Kandiyil Raheem and Boby Ignatius and Achamveettil Gopalakrishnan}, ' ... 
'year = {2021}, ' ...
'title = {Embryonic and larval development of Pink ear emperor, \emph{Lethrinus lentjan} ({L}acepede, 1802) under captive conditions}, ' ...
'journal = {Aquaculture Research}, ' ...
'volume = {52}, ' ...
'pages = {5857–5869}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DegoAli2013'; type = 'Article'; bib = [ ... 
'author = {A. S. O. Abu Degoon and S. M. Ali}, ' ... 
'year = {2013}, ' ...
'title = {On some reproductive aspects of the Sky Emperor, \emph{Lethrinus mahsena} ({P}ieces) in the {S}udanese {R}ed {S}ea}, ' ...
'journal = {SJBS (B)}, ' ...
'volume = {17}, ' ...
'pages = {51-62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-harak.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
