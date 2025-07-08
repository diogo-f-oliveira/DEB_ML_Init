function [data, auxData, metaData, txtData, weights] = mydata_Lacerta_agilis_boemica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Lacerta_agilis_boemica'; 
metaData.species_en = 'Sand lizard'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTa'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011 %TODO

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2024 02 17];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr>\'}; 
metaData.date_acc    = [2024 02 17];


%% set data
% zero-variate data 
data.ab = 56;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'EngeFrit1993';   
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '7 till 10 weeks';
data.tp = 22.5*30.5;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'RoitSmir2006';
  temp.tp = C2K(23.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7.5*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'RoitSmir2006';   
  temp.am = C2K(23.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.1;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'RoitSmir2006';  
data.Li  = 10;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'RoitSmir2006';  

data.Ri  = 11/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'EngeFrit1993';   
  temp.Ri = C2K(22);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7 till 15';

data.Wwi = 12;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'arkive';

% univariate data 
% time-length
data.tL_Kof = [ ... % time since birth (yr), SVL (cm)
1.000	5.324
1.001	4.827
1.002	6.029
1.003	5.428
1.004	5.055
1.005	5.470
1.006	5.221
1.007	5.905
1.008	5.822
1.009	6.589
1.010	6.278
1.011	6.195
1.012	5.781
1.013	4.143
1.014	4.537
2.000	8.457
2.001	7.918
2.002	7.566
2.003	7.421
2.004	7.297
2.005	6.820
2.006	8.291
2.007	6.675
2.008	8.105
2.009	7.152
3.000	8.273
3.001	8.108
3.002	9.393
3.003	8.626
3.004	8.419
3.005	7.652
3.006	8.999
3.007	8.481
3.008	7.921
4.000	8.194];
data.tL_Kof(:,1) = data.tL_Kof(:,1)*365; % convert yr to d 
units.tL_Kof  = {'d', 'cm'};  label.tL_Kof = {'time since birth', 'snout-vent length','female'};
temp.tL_Kof   = C2K(24);  units.temp.tL_Kof = 'K'; label.temp.tL_Kof = 'temperature';
bibkey.tL_Kof = 'RoitSmir2006'; 
comment.tL_Kof = 'Data for females from Kostek, Alt 50 m';
%
data.tL_Kom = [ ... % time since birth (yr), SVL (cm)
1.000	5.635
1.001	6.401
1.002	6.091
1.003	5.780
1.004	5.241
1.005	5.448
1.006	5.407
1.007	5.013
1.008	4.785
1.009	4.557
1.010	6.257
2.000	8.622
2.001	8.539
2.002	6.819
2.003	9.119
2.004	8.726
2.005	8.311
2.006	8.954
2.007	8.166
2.008	9.555
2.009	9.451
3.000	9.350
3.001	9.247
3.002	9.102
3.003	9.910
3.004	8.687
2.005	9.744
4.000	9.913
4.001	9.789
4.002  10.431
4.003  10.037
4.004	9.540
5.000  10.227
5.001  10.517
5.002	9.937
6.000  10.644];
data.tL_Kom(:,1) = data.tL_Kom(:,1)*365; % convert yr to d 
units.tL_Kom  = {'d', 'cm'};  label.tL_Kom = {'time since birth', 'snout-vent length','male'};
temp.tL_Kom   = C2K(24);  units.temp.tL_Kom = 'K'; label.temp.tL_Kom = 'temperature';
bibkey.tL_Kom = 'RoitSmir2006'; 
comment.tL_Kom = 'Data for males from Kostek, Alt 50 m';
%
data.tL_Sef = [ ... % time since birth (yr), SVL (cm)
1.000	4.544
1.001	4.357
1.002	4.212
1.003	3.963
1.004	4.689
1.005	4.026
2.000	7.572
2.001	7.925
2.002	7.863
2.003	7.738
2.004	7.655
2.005	7.407
2.006	6.806
3.000	8.114
3.001	7.306];
data.tL_Sef(:,1) = data.tL_Sef(:,1)*365; % convert yr to d 
units.tL_Sef  = {'d', 'cm'};  label.tL_Sef = {'time since birth', 'snout-vent length','female'};
temp.tL_Sef   = C2K(22);  units.temp.tL_Sef = 'K'; label.temp.tL_Sef = 'temperature';
bibkey.tL_Sef = 'RoitSmir2006'; 
comment.tL_Sef = 'Data for females from Sergokala, Alt 550';
%
data.tL_Sem = [ ... % time since birth (yr), SVL (cm)
1.000	4.916
1.002	4.418
2.000	6.266
2.001	7.571
2.002	8.318
2.003	7.509
2.004	7.116
2.005	7.820
2.006	7.696
2.007	7.240
2.008	6.867
2.009	6.618
2.010	8.028
3.000	8.901
3.001	8.611
3.002	8.714
3.003	8.113
3.004	7.243
3.005	8.341
4.000	8.427
4.001	9.215
5.000	9.570
5.001	8.824
6.000	9.676
6.001	8.930];
data.tL_Sem(:,1) = data.tL_Sem(:,1)*365; % convert yr to d 
units.tL_Sem  = {'d', 'cm'};  label.tL_Sem = {'time since birth', 'snout-vent length','male'};
temp.tL_Sem   = C2K(22);  units.temp.tL_Sem = 'K'; label.temp.tL_Sem = 'temperature';
bibkey.tL_Sem = 'RoitSmir2006'; 
comment.tL_Sem = 'Data for males from Sergokala, Alt 550 m';
%
data.tL_Khf = [ ... % time since birth (yr), SVL (cm)
1.000	4.890
1.001	4.268
1.002	4.186
1.003	4.683
1.004	4.558
1.005	5.056
2.000	8.576
2.001	8.473
2.002	8.369
2.003	8.100
2.004	8.701
2.005	7.934
2.006	7.727
2.007	7.872
3.000	9.382
3.001	8.635
3.002	8.076
4.000	9.544];
data.tL_Khf(:,1) = data.tL_Khf(:,1)*365; % convert yr to d 
units.tL_Khf  = {'d', 'cm'};  label.tL_Khf = {'time since birth', 'snout-vent length','female'};
temp.tL_Khf   = C2K(21);  units.temp.tL_Khf = 'K'; label.temp.tL_Khf = 'temperature';
bibkey.tL_Khf = 'RoitSmir2006'; 
comment.tL_Khf = 'Data for females from Khuchni, Alt 800 m';
%
data.tL_Khm = [ ... % time since birth (yr), SVL (cm)
1.000	4.870
1.001	4.829
1.002	4.559
1.003	4.331
1.004	4.249
1.005	4.186
1.006	5.140
1.007	4.995
2.000	8.660
2.001	7.500
2.002	8.681
2.003	7.997
2.004	7.893
2.005	7.790
2.006	7.748
2.007	7.272
2.008	8.515
2.009	7.624
2.010	7.582
2.011	8.225
2.012	8.163
2.013	7.437
2.014	7.147
3.000	9.072
3.001	7.538
3.002	9.279
3.003	8.989
4.000	9.815
5.000  10.081];
data.tL_Khm(:,1) = data.tL_Khm(:,1)*365; % convert yr to d 
units.tL_Khm  = {'d', 'cm'};  label.tL_Khm = {'time since birth', 'snout-vent length','male'};
temp.tL_Khm   = C2K(21);  units.temp.tL_Khm = 'K'; label.temp.tL_Khm = 'temperature';
bibkey.tL_Khm = 'RoitSmir2006'; 
comment.tL_Khm = 'Data for males from Khuchni, Alt 600 m';
%
data.tL_Tef = [ ... % time since birth (yr), SVL (cm)
1.000	3.809
1.001	3.976
1.002	4.268
1.003	3.518
1.004	3.663
1.005	4.434
2.000	7.452
2.001	7.140
2.002	7.035
2.003	8.785
2.004	6.681
2.005	6.848
2.006	6.785
2.007	8.452
2.008	8.160
2.009	7.285
3.000	7.262
3.001	7.366
3.002	7.991
3.003	9.220
3.004	8.157
3.005	8.262
3.006	8.803
3.007	9.137
3.008	8.386
3.009	7.553
3.010	8.553
4.000	8.988
4.001	7.759
4.002	7.863
4.003	8.321
4.004	8.571
4.005	8.675
4.006	9.238
4.007	9.467
4.008	9.133
5.000	9.443
5.001	8.047
5.002	8.214
5.003	9.756
5.004	9.360
5.005	8.693
5.006	8.776
5.007	8.943
6.000	8.419
6.001	9.503
6.002	9.774
6.003   8.898
6.004	9.357
6.005	8.232];
data.tL_Tef(:,1) = data.tL_Tef(:,1)*365; % convert yr to d 
units.tL_Tef  = {'d', 'cm'};  label.tL_Tef = {'time since birth', 'snout-vent length','female'};
temp.tL_Tef   = C2K(19);  units.temp.tL_Tef = 'K'; label.temp.tL_Tef = 'temperature';
bibkey.tL_Tef = 'RoitSmir2006'; 
comment.tL_Tef = 'Data for females from Termenlik, Alt 960 m';
%
data.tL_Tem = [ ... % time since birth (yr), SVL (cm)
1.000	3.539
1.001	3.373
1.002	3.706
1.003	3.810
1.004	4.164
1.005	4.018
2.000	7.016
2.001	7.349
2.002	7.911
2.003	7.953
2.004	8.078
2.005	8.161
2.006	7.640
2.007	6.078
2.008	7.244
2.009	6.703
2.010	7.578
3.000	8.158
3.001	8.887
3.002	8.971
3.003	9.116
3.004	8.512
3.005	8.700
4.000	9.135
4.001	9.509
4.002	9.239
4.003	8.738
5.000	9.465
5.001	9.590
5.002	9.298
5.003	8.986
6.000	9.233
6.001	9.483
6.002	9.816
7.000	9.855
7.001	9.563
7.002	9.438];
data.tL_Tem(:,1) = data.tL_Tem(:,1)*365; % convert yr to d 
units.tL_Tem  = {'d', 'cm'};  label.tL_Tem = {'time since birth', 'snout-vent length','male'};
temp.tL_Tem   = C2K(19);  units.temp.tL_Tem = 'K'; label.temp.tL_Tem = 'temperature';
bibkey.tL_Tem = 'RoitSmir2006'; 
comment.tL_Tem = 'Data for males from Termenlik, Alt 960 m';
%
data.tL_Kuf = [ ... % time since birth (yr), SVL (cm)
1.000	4.063
1.001	4.292
2.000	7.271
2.001	7.042
2.002	7.813
2.003	6.854
2.004	8.042
2.005	7.646
2.006	7.521
3.000	8.688
3.001	8.813
3.002	8.979
3.003	8.583
3.004	8.438
4.000	8.833
4.001	9.125
4.003	9.271
4.004	9.375
5.000	9.417
5.001	9.583
6.000	9.771];
data.tL_Kuf(:,1) = data.tL_Kuf(:,1)*365; % convert yr to d 
units.tL_Kuf  = {'d', 'cm'};  label.tL_Kuf = {'time since birth', 'snout-vent length','female'};
temp.tL_Kuf   = C2K(14);  units.temp.tL_Kuf = 'K'; label.temp.tL_Kuf = 'temperature';
bibkey.tL_Kuf = 'RoitSmir2006'; 
comment.tL_Kuf = 'Data for females from Kuli, Alt 1900 m';
%
data.tL_Kum = [ ... % time since birth (yr), SVL (cm)
1.000	4.333
2.000	7.417
2.001	7.625
2.002	6.771
2.003	6.979
2.004	7.250
2.005	6.667
2.006	5.938
3.000	9.167
3.001	8.583
3.002	8.750
3.003	7.917
3.004	8.208
3.005	8.375
4.000	9.083
4.001	8.604
4.002	9.833
4.003	9.354
5.000	9.479
5.001	9.563
6.000	9.646];
data.tL_Kum(:,1) = data.tL_Kum(:,1)*365; % convert yr to d 
units.tL_Kum  = {'d', 'cm'};  label.tL_Kum = {'time since birth', 'snout-vent length','male'};
temp.tL_Kum   = C2K(14);  units.temp.tL_Kum = 'K'; label.temp.tL_Kum = 'temperature';
bibkey.tL_Kum = 'RoitSmir2006'; 
comment.tL_Kum = 'Data for males from Kuli, Alt 1900 m';

%% set weights for all real data
weights = setweights(data, []); % all equal weights

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Kof','tL_Kom'}; subtitle1 = {'Data for females, males from Kostek'};
set2 = {'tL_Sef','tL_Sem'}; subtitle2 = {'Data for females, males from Sergokala'};
set3 = {'tL_Khf','tL_Khm'}; subtitle3 = {'Data for females, males from Khuchni'};
set4 = {'tL_Tef','tL_Tem'}; subtitle4 = {'Data for females, males from Termenlik'};
set5 = {'tL_Kuf','tL_Kum'}; subtitle5 = {'Data for females, males from Kuli'};
metaData.grp.sets = {set1,set2,set3,set4,set5};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5};

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} only';
D2 = 'mod_2: subspecies Lacerta agilis boemica splitted from Lacerta agilis';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% facts
F1 = 'T_typical based on range (23-38C) reported in BlanFear2015'; 
metaData.bibkey.F1 = 'BlanFear2015';
metaData.facts = struct('F1', F1);

%% Links
metaData.links.id_CoL = '6NRCH'; % Cat of Life
metaData.links.id_ITIS = '1155305'; % ITIS
metaData.links.id_EoL = '791768'; % Ency of Life
metaData.links.id_Wiki = 'Lacerta_agilis'; % Wikipedia
metaData.links.id_ADW = 'Lacerta_agilis'; % ADW
metaData.links.id_Taxo = '642580'; % Taxonomicon
metaData.links.id_WoRMS = '1506598'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Lacerta&species=agilis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

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
bibkey = 'RoitSmir2006'; type = 'Article'; bib = [ ... 
'author = {Evgeny S. Roitberg and Ella M. Smirna}, ' ... 
'year = {2006}, ' ...
'title = {AGE, BODY SIZE AND GROWTH OF {\it Lacerta agilis boemica} AND {\it L. Strigata}: {A} COMPARATIVE STUDY OF TWO CLOSELY RELATED LIZARD SPECIES BASED ON SKELETOCHRONOLOGY}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {16}, ' ...
'pages = {133-148}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EngeFrit1993'; type = 'Book'; bib = [ ... 
 'title = {Lurche und Kriechtiere Europas}, ' ...
 'publisher = {Neumann Verlag}, ' ...
 'year = {1993}, ' ...
 'author = {Engelmann, W.-E. and Fritzsche, J. and G\"{u}nther, R. and Obst, F. J.}, ' ...
 'address = {Radebeul}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/sand-lizard/lacerta-agilis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

