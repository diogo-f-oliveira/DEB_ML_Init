function [data, auxData, metaData, txtData, weights] = mydata_Septifer_virgatus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Mytiloida'; 
metaData.family     = 'Mytilidae';
metaData.species    = 'Septifer_virgatus'; 
metaData.species_en = 'Black-ribbed mussel'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Michelle Luk In', 'Alessandro Rinaldi', 'Valeria Montalto', 'Gianluca Sara', 'Gray Williams'};    
metaData.date_subm = [2013 10 27];              
metaData.email     = {'gsara.unipa@gmail.com'};            
metaData.address   = {'Palermo University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 05 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 05 20]; 

%% set data
% zero-variate data

data.ab = 1;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Guess based on Brachidontes pharaonis';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Mort1995';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'Mort1995';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.039; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'HayaKase1993';
data.Lp  = 1.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Mort1995';
data.Li  = 6.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Mort1995';

data.Wwp = 0.1;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Luk2014';
data.Wwi = 5.81;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Luk2014';
  comment.Wwi = 'Based on L-Ww data, given Li';

data.Ri  = 1e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on Crassostrea gigas';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), length (cm)
1	2.06
2	3.49
3	4.29
4	4.59
5	4.90
6	4.98];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RichSeed1995';

% length-wet weight
data.LW = [ ... % length (cm), wet weight (g)
0.22	0.001
0.52	0.003
0.57	0.005
0.58	0.002
0.60	0.003
0.69	0.009
0.80	0.010
1.02	0.023
1.12	0.022
1.20	0.025
1.30	0.058
1.34	0.044
1.53	0.128
1.55	0.072
1.66	0.070
1.66	0.092
1.77	0.150
1.79	0.116
1.81	0.105
1.82	0.196
1.84	0.126
1.84	0.129
1.88	0.116
1.90	0.153
1.90	0.159
1.93	0.114
1.95	0.214
1.98	0.129
1.98	0.222
1.99	0.272
2.00	0.181
2.00	0.306
2.04	0.257
2.04	0.201
2.05	0.249
2.06	0.223
2.08	0.263
2.09	0.191
2.10	0.184
2.16	0.163
2.16	0.244
2.17	0.208
2.20	0.386
2.21	0.220
2.21	0.256
2.22	0.254
2.23	0.234
2.24	0.267
2.25	0.212
2.28	0.360
2.32	0.307
2.35	0.241
2.39	0.338
2.39	0.357
2.40	0.346
2.40	0.287
2.41	0.297
2.41	0.324
2.42	0.324
2.43	0.239
2.44	0.300
2.44	0.188
2.45	0.466
2.47	0.330
2.48	0.397
2.55	0.444
2.60	0.359
2.62	0.324
2.64	0.434
2.64	0.585
2.66	0.412
2.69	0.326
2.70	0.380
2.72	0.514
2.80	0.387
2.81	0.413
2.84	0.579
2.87	0.679
2.89	0.526
2.90	0.631
2.90	0.551
2.92	0.485
2.92	0.397
2.94	0.419
2.95	0.559
2.98	0.514
2.98	0.479
2.98	0.472
2.98	0.673
2.98	0.496
3.01	0.726
3.05	0.698
3.09	0.398
3.11	0.421
3.12	0.976
3.13	0.574
3.13	0.772
3.14	0.942
3.15	0.929
3.15	0.731
3.16	0.924
3.19	0.899
3.22	0.949
3.22	0.987
3.23	0.846
3.25	0.651
3.29	1.161
3.30	0.874
3.31	1.040
3.31	0.683
3.34	0.499
3.35	0.803
3.36	0.902
3.39	0.826
3.40	0.730
3.41	0.654
3.41	0.722
3.43	0.593
3.43	0.849
3.43	0.649
3.45	1.262
3.45	1.249
3.46	0.810
3.46	1.213
3.47	0.906
3.47	1.318
3.47	1.110
3.47	0.946
3.47	0.719
3.50	1.003
3.50	1.107
3.50	1.458
3.50	1.185
3.50	1.070
3.51	1.261
3.52	1.274
3.52	1.173
3.52	0.910
3.53	0.960
3.53	1.265
3.53	1.361
3.53	0.601
3.55	0.769
3.55	0.940
3.55	0.800
3.56	0.992
3.56	0.921
3.56	1.100
3.56	0.841
3.57	1.007
3.57	1.269
3.57	1.138
3.57	1.356
3.57	1.581
3.58	1.029
3.58	1.224
3.58	1.526
3.58	0.995
3.59	1.279
3.59	1.207
3.59	1.266
3.59	0.483
3.59	1.158
3.61	1.490
3.61	0.640
3.61	0.958
3.61	1.531
3.61	1.512
3.61	1.581
3.61	0.521
3.62	1.387
3.62	1.214
3.62	1.629
3.63	0.905
3.64	1.233
3.64	1.353
3.64	0.913
3.64	0.536
3.65	1.497
3.65	1.521
3.65	1.581
3.66	1.284
3.66	1.342
3.67	1.228
3.68	1.308
3.69	1.223
3.69	1.221
3.69	1.449
3.69	1.092
3.70	1.160
3.70	1.164
3.72	0.984
3.72	1.045
3.72	1.724
3.72	1.136
3.72	1.082
3.73	1.264
3.73	1.399
3.74	1.353
3.74	1.140
3.75	0.800
3.76	1.527
3.76	1.658
3.77	1.451
3.77	0.723
3.77	1.177
3.77	1.457
3.78	1.822
3.78	1.239
3.78	1.242
3.79	1.662
3.80	1.180
3.80	1.821
3.81	1.255
3.82	1.010
3.82	1.338
3.82	1.276
3.82	0.993
3.82	1.636
3.82	1.613
3.82	1.368
3.83	1.158
3.83	1.422
3.83	1.120
3.83	1.645
3.84	1.716
3.84	1.089
3.84	1.285
3.85	1.247
3.85	1.413
3.85	1.313
3.85	1.223
3.85	1.005
3.86	1.257
3.86	1.050
3.87	1.669
3.87	1.165
3.87	1.305
3.87	1.648
3.88	1.583
3.89	1.051
3.89	1.034
3.89	0.983
3.89	1.644
3.90	1.352
3.90	1.459
3.90	1.477
3.90	1.006
3.90	1.356
3.91	1.259
3.91	1.342
3.91	1.515
3.92	1.545
3.92	1.616
3.92	1.323
3.93	1.514
3.94	1.342
3.95	1.697
3.95	1.439
3.96	1.078
3.98	1.561
3.99	1.675
3.99	1.183
4.00	1.732
4.00	1.704
4.00	1.376
4.00	1.368
4.00	1.323
4.00	1.335
4.00	1.478
4.01	1.256
4.02	1.260
4.02	1.609
4.02	0.896
4.03	1.442
4.04	1.158
4.04	1.370
4.04	1.319
4.05	1.675
4.05	1.649
4.05	1.565
4.05	1.398
4.06	1.546
4.06	1.602
4.06	0.972
4.08	1.229
4.10	1.106
4.10	1.079
4.11	1.459
4.12	1.613
4.12	1.204
4.14	1.304
4.14	1.139
4.15	1.052
4.16	1.151
4.18	1.418
4.25	1.722
4.26	1.524
4.28	1.495
4.31	1.553
4.31	1.132
4.33	1.474
4.35	1.548
4.36	1.412
4.38	1.464
4.40	1.251
4.41	1.228
4.42	1.160
4.42	1.265
4.46	1.496
4.47	1.697
4.60	1.637
4.61	1.610
4.63	1.517
4.67	1.601
4.78	1.912
4.84	1.915
4.89	2.533];
units.LW   = {'cm', 'g'};  label.LW = {'length', 'wet weight'};  
bibkey.LW = 'Luk2014';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'This entry is discussed in Luk2014';
metaData.bibkey.F1 = 'Luk2014'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6S55N'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46467028'; % Ency of Life
metaData.links.id_Wiki = 'Septifer'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3982445'; % Taxonomicon
metaData.links.id_WoRMS = '506157'; % WoRMS
metaData.links.id_molluscabase = '506157'; % molluscabase


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HayaKase1993'; type = 'Article'; bib = [ ... 
'author = {Hayami, I. and Kase, T.}, ' ... 
'year = {1993}, ' ...
'title = {Submarine cave Bivalvia from the {R}yukyu {I}slands: systematics and evolutionary significance}, ' ...
'journal = {The University of Tokyo Bulletin}, ' ...
'volume = {35}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mort1995'; type = 'Article'; bib = [ ... 
'author = {Morton, B.}, ' ... 
'year = {1995}, ' ...
'title = {The population dynamics and reproductive cycle of \emph{Septifer virgatus} ({B}ivalvia: {M}ytilidae) on an exposed rochy shore in {H}ong {K}ong}, ' ...
'journal = {J. Zool. Lond.}, ' ...
'volume = {235}, ' ...
'pages = {485--500}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RichSeed1995'; type = 'Article'; bib = [ ... 
'author = {Richardson, C. A. and Seed, R. and Brotohadikusumo, N. A. and Owen, R.}, ' ... 
'year = {1995}, ' ...
'title = {Age, growth and allometric relationship in \emph{Septifer virgatus} ({B}ivalvia: {M}ytilidae)}, ' ...
'journal = {Asian Marine Biology}, ' ...
'volume = {12}, ' ...
'pages = {39--52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Luk2014'; type = 'Phdthesis'; bib = [ ... 
'author = {Luk In}, ' ... 
'year = {2014}, ' ...
'title = {Ecophysiology and Dynamic Energy Budget of \emph{Septifer virgatus}}, ' ...
'school = {University of Hong Kong}, ' ...
'howpublished = {\url{http://hub.hku.hk/bitstream/10722/206657/1/FullText.pdf?accept=1}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

