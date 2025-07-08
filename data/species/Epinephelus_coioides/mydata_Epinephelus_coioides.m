function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_coioides

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_coioides'; 
metaData.species_en = 'Orange-spotted grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L'}; 

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

data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 22 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(28.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 43.3;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 120;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 1109;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01175*Lp^3.04, see F1';
data.Wwi = 24589;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^3.04, see F1';

data.Ri  = 463940/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.1);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.368	32.301
0.472	34.443
0.473	30.357
0.555	36.779
0.555	35.806
0.576	32.693
0.639	34.056
0.641	24.329
0.744	28.999
0.807	27.639
0.890	29.002
0.995	25.307
1.037	21.805
1.077	30.755
1.097	35.425
1.139	32.507
1.140	28.227
1.160	33.675
1.199	42.820
1.221	37.956
1.283	40.681
1.286	28.618
1.369	29.982
1.369	26.480
1.370	24.145
1.410	32.706
1.451	34.068
1.473	27.843
1.492	39.906
1.514	33.486
1.534	36.015
1.638	37.768
1.678	46.523
1.744	27.653
1.786	26.097
1.869	30.378
1.890	29.406
1.931	30.379
1.972	33.298
1.993	32.520
2.034	36.023
2.078	24.545
2.099	25.129
2.118	35.246
2.158	39.916
2.244	28.633
2.265	29.995
2.265	28.439
2.306	32.330
2.369	30.775
2.431	29.414
2.468	51.204
2.473	29.025
2.493	31.166
2.530	56.069
2.531	50.427
2.569	67.159
2.576	32.918
2.617	36.420
2.618	33.891
2.633	59.572
2.635	53.736
2.654	62.102
2.656	52.569
2.677	49.262
2.700	39.145
2.744	30.002
2.760	51.014
2.845	45.179
2.865	46.735
2.952	30.783
2.972	34.675
2.972	33.702
3.057	26.505
3.092	56.661
3.114	53.354
3.114	51.798
3.116	43.432
3.156	49.464
3.158	41.876
3.194	68.725
3.218	53.550
3.238	57.247
3.303	44.018
3.323	49.855
3.324	46.353
3.343	52.774
3.344	48.494
3.384	54.331
3.406	51.024
3.444	68.923
3.445	63.087
3.451	33.126
3.464	73.204
3.468	51.803
3.488	59.196
3.488	57.640
3.489	54.721
3.527	68.730
3.548	71.259
3.549	66.785
3.610	74.179
3.630	76.903
3.630	74.373
3.631	70.677
3.637	41.689
3.637	41.105
3.656	49.666
3.657	45.580
3.676	53.362
3.680	36.436
3.700	39.550
3.700	37.604
3.718	51.807
3.718	51.223
3.719	48.888
3.797	75.738
3.801	52.975
3.803	43.053
3.822	53.170
3.906	51.226
3.906	50.253
3.906	49.669
3.909	34.689
3.945	62.121
3.951	33.717
3.964	73.600
3.969	46.947
3.991	41.305
4.009	56.675
4.030	58.037
4.073	50.645
4.073	48.505
4.093	55.703
4.114	54.925
4.114	53.953
4.157	48.117
4.157	44.031
4.172	75.743
4.178	46.366
4.240	49.091
4.278	67.574
4.281	50.842
4.298	69.714
4.338	76.330
4.342	58.042
4.343	52.594
4.384	55.708
4.407	47.731
4.421	77.887
4.422	75.942
4.423	67.576
4.445	64.853
4.446	60.183
4.448	51.234
4.467	57.460
4.468	54.542
4.486	68.161
4.506	72.246
4.549	66.216
4.569	69.718
4.570	64.271
4.593	52.792
4.615	46.762
4.636	45.789
4.651	73.805
4.653	67.579
4.657	48.124
4.677	50.459
4.679	38.397
4.693	71.860
4.718	52.016
4.759	56.102
4.780	57.854
4.796	81.006
4.823	47.154
4.845	45.014
4.865	49.295
4.900	78.478
4.905	53.964
4.925	61.163
4.943	74.782
4.946	57.272
4.968	51.047
5.003	84.316
5.027	70.114
5.050	58.830
5.051	52.605
5.066	81.399
5.071	60.387
5.113	57.080
5.134	58.248
5.151	73.423
5.256	71.090
5.282	48.328
5.297	74.593
5.299	65.449
5.301	56.694
5.303	45.410
5.361	68.952
5.364	53.971
5.400	77.513
5.548	68.371
5.628	86.855
5.692	78.295
5.754	81.215
5.759	54.366
5.795	82.966
5.818	74.406
5.858	79.271
5.925	59.816
5.942	80.050
5.943	71.490
5.961	85.303
6.022	93.475
6.066	82.386
6.067	78.690
6.089	71.686
6.091	61.764
6.130	76.745
6.130	74.216
6.134	55.150
6.194	70.910
6.215	68.965
6.215	68.381
6.232	87.253
6.238	56.124
6.239	53.401
6.257	64.880
6.299	65.658
6.340	69.550
6.358	79.667
6.359	78.500
6.383	62.547
6.421	78.112
6.461	85.700
6.464	72.276
6.526	76.168
6.650	77.921
6.711	85.120
6.772	93.487
6.838	79.285
6.879	81.620
6.879	81.231
6.900	77.924
6.901	76.368
6.902	71.699
6.961	86.096
6.964	74.034
7.003	83.373
7.008	62.945
7.022	92.128
7.086	88.238
7.087	84.542
7.087	80.067
7.150	77.928
7.212	80.069
7.213	76.956
7.214	74.622
7.234	78.318
7.301	56.724
7.320	64.312
7.711	86.302
7.774	84.552
7.775	82.023
7.775	80.467
7.842	58.872
8.023	89.420
8.025	80.470
8.128	85.141
8.147	92.534
8.173	71.523
8.773	89.431
9.026	76.983
9.042	95.855
9.063	98.190
9.087	83.015
9.106	92.938
9.878	87.113
10.214	71.554
12.172	74.307];
data.tL(:,1) = (0.8+data.tL(:,1)) * 365;
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GranAbde2005';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6G5MZ'; % Cat of Life
metaData.links.id_ITIS = '551050'; % ITIS
metaData.links.id_EoL = '46579621'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_coioides'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_coioides'; % ADW
metaData.links.id_Taxo = '105895'; % Taxonomicon
metaData.links.id_WoRMS = '218200'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-coioides'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_coioides}}';
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
bibkey = 'GranAbde2005'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.fishres.2005.04.009}, ' ...
'author = {E.M. Grandcourt and T.Z. Al Abdessalaam and F. Francis and A.T. Al Shamsi}, ' ... 
'year = {2005}, ' ...
'title = {Population biology and assessment of the orange-spotted grouper, \emph{Epinephelus coioides} ({H}amilton, 1822), in the southern {A}rabian {G}ulf}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {74}, ' ...
'pages = {55–68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Epinephelus-coioides.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

