function [data, auxData, metaData, txtData, weights] = mydata_Alytes_muletensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Alytidae';
metaData.species    = 'Alytes_muletensis'; 
metaData.species_en = 'Majorcan midwife toad'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ab = 4.5*7;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'ADW';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for Alytes obstetricans: 3-6 weeks';
data.tj = 365+8*7;    units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'amphibiaweb';   
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'PinyPere2013';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 365;    units.tpm = 'd';    label.tpm = 'time since metam at puberty for male';  bibkey.tpm = 'PinyPere2013';
  temp.tpm = C2K(15);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 18*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'PinyPere2013';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'for captive individuals, 4.7 yr for female, 3.2 yr for male in the wild, max 18 yr';

data.Lb  = 1.8;   units.Lb  = 'cm';  label.Lb  = 'total length at birth of tadpoles';  bibkey.Lb  = 'amphibiaweb';
data.Ljb  = 7.6;  units.Ljb  = 'cm'; label.Ljb  = 'total length at metam of tadpoles'; bibkey.Ljb  = 'amphibiaweb';
data.Lj  = 3;     units.Lj  = 'cm';  label.Lj  = 'SVL at metam of toads';      bibkey.Lj  = 'amphibiaweb';
data.Li  = 4.1;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'PinyPere2013';
data.Lim  = 3.9; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';    bibkey.Lim  = 'PinyPere2013';

data.Wwb = 0.1438; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 5.4-7mm: pi/6*0.65^3';
data.Wwi = 5.0;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'nlsoorten';
  comment.Wwi = 'based on Alytes obstetricans of 5 cm, 9 g: (4.1/5)^3*9';
data.Wwim = 4.3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'nlsoorten';
  comment.Wwi = 'based on Alytes obstetricans of 5 cm, 9 g: (3.9/5)^3*9';

data.Ri  = 9/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'amphibiaweb';   
temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7-12 eggs'; 

% uni-variate data
% time-length
data.tL_f = [ ... % time (yr), body length (cm)
1.000	3.059
1.000	3.069
1.000	3.087
1.000	3.184
1.983	3.072
1.983	3.184
1.983	3.197
1.983	3.359
2.011	3.096
2.011	3.101
2.011	3.111
2.011	3.119
2.011	3.122
2.011	3.145
2.011	3.156
2.011	3.163
2.011	3.205
2.011	3.216
2.011	3.229
2.011	3.252
2.011	3.257
2.011	3.268
2.011	3.289
2.011	3.299
2.011	3.310
2.011	3.317
2.011	3.330
2.011	3.377
2.011	3.383
2.011	3.445
2.040	3.239
2.040	3.283
2.977	3.315
2.977	3.325
3.006	3.344
3.006	3.357
3.006	3.362
3.006	3.370
3.006	3.378
3.006	3.422
3.006	3.435
3.006	3.438
3.006	3.466
3.006	3.474
3.006	3.518
3.006	3.539
3.006	3.550
3.006	3.560
3.006	3.565
3.006	3.581
3.034	3.393
3.034	3.406
3.034	3.414
3.034	3.451
3.034	3.492
3.034	3.500
3.034	3.505
3.034	3.727
3.972	3.537
3.972	3.602
3.972	3.613
3.972	3.620
3.972	3.631
3.972	3.641
3.972	3.652
3.972	3.665
3.972	3.673
3.972	3.688
3.972	3.699
3.972	3.774
4.000	3.472
4.000	3.508
4.000	3.519
4.000	3.547
4.000	3.555
4.000	3.563
4.000	3.571
4.000	3.581
4.000	3.592
4.000	3.821
4.000	3.832
4.966	3.626
4.966	3.639
4.966	3.665
4.966	3.678
4.966	3.702
4.966	3.709
4.966	3.720
4.966	3.728
4.966	3.741
4.966	3.751
4.966	3.759
4.966	3.769
4.966	3.853
4.966	3.866
4.966	3.874
4.966	3.989
4.994	3.811
4.994	3.827
5.023	3.780
5.023	3.921
5.903	3.796
5.932	3.814
5.960	3.824
5.960	3.832
5.960	3.853
5.989	3.634
5.989	3.644
5.989	3.670
5.989	3.696
5.989	3.725
5.989	3.877
5.989	3.924
5.989	3.931
5.989	3.957
6.017	4.007
6.983	3.691
6.983	3.728
6.983	3.804
6.983	3.812
6.983	3.840
6.983	3.864
6.983	3.874
6.983	3.887
6.983	3.898
6.983	3.989
6.983	4.010
7.011	4.036
7.949	3.968
7.977	3.848
7.977	3.885
7.977	3.906
7.977	3.916
7.977	3.921
8.034	4.057
8.943	3.741
8.972	3.948
8.972	3.982
9.966	4.016
9.966	4.023
9.966	4.130
9.994	3.896
10.989	3.974
10.989	4.003
10.989	4.042
10.989	4.058
11.955	4.152
12.011	3.987
12.011	4.066
13.943	4.097
13.943	4.113
13.943	4.121
14.000	4.189
14.966	4.082
14.966	4.105
14.966	4.110
14.966	4.191
15.960	4.103
15.960	4.116
15.960	4.124
15.960	4.142
15.989	4.069
15.989	4.082
17.011	4.121
17.977	4.103
17.977	4.116
17.977	4.132];
data.tL_f(:,1) = (data.tL_f(:,1) - 1) * 365; % convert yr to d since metam
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f    = C2K(15); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PinyPere2013';
comment.tL_f = 'Data for female toads';
%
data.tL_m = [ ... % time (yr), body length (cm)
1.000	3.345
1.000	2.998
1.000	3.008
1.000	3.014
1.000	3.024
1.000	3.045
1.000	3.053
1.000	3.060
1.000	3.068
1.000	3.076
1.000	3.087
1.000	3.097
1.000	3.107
1.000	3.115
1.000	3.128
1.000	3.139
1.000	3.149
1.000	3.157
1.000	3.168
1.000	3.191
1.000	3.204
1.000	3.217
1.000	2.802
1.000	2.930
1.000	3.183
1.991	3.055
1.991	3.063
1.991	3.076
1.991	3.097
1.991	3.120
1.991	3.133
1.991	3.144
1.991	3.154
1.991	3.160
1.991	3.191
1.991	3.201
1.991	3.209
1.991	3.230
1.991	3.240
1.991	3.295
1.991	3.308
1.991	3.321
1.991	3.332
1.991	3.342
1.991	3.355
1.991	3.368
1.991	3.379
1.991	3.400
1.991	3.410
1.991	3.418
1.991	3.431
1.991	3.449
1.991	3.462
1.991	3.481
1.991	3.522
2.019	3.026
2.019	3.173
2.019	3.251
2.019	3.264
2.019	3.274
2.019	3.387
2.047	3.285
2.986	3.191
2.986	3.212
2.986	3.319
2.986	3.326
2.986	3.334
2.986	3.342
2.986	3.353
2.986	3.363
2.986	3.371
2.986	3.460
2.986	3.473
2.986	3.783
2.986	3.953
3.014	3.246
3.014	3.264
3.014	3.389
3.014	3.405
3.014	3.423
3.014	3.431
3.014	3.449
3.014	3.483
3.014	3.491
3.014	3.501
3.014	3.512
3.014	3.522
3.014	3.535
3.014	3.543
3.014	3.551
3.014	3.556
3.014	3.567
3.014	3.580
3.014	3.600
3.014	3.614
3.014	3.624
3.014	3.640
3.014	3.650
3.014	3.663
3.014	3.684
3.953	3.509
3.953	3.514
3.953	3.653
3.953	3.660
3.981	3.209
3.981	3.219
3.981	3.243
3.981	3.313
3.981	3.345
3.981	3.420
3.981	3.485
3.981	3.496
3.981	3.566
3.981	3.572
3.981	3.582
3.981	3.595
3.981	3.603
3.981	3.613
3.981	3.629
3.981	3.642
3.981	3.671
3.981	3.692
3.981	3.705
3.981	3.713
3.981	3.723
3.981	3.733
3.981	3.754
3.981	3.765
3.981	3.778
4.009	3.535
4.009	3.543
4.009	3.556
4.009	3.626
4.038	3.269
4.976	3.295
4.976	3.407
4.976	3.412
4.976	3.431
4.976	3.451
4.976	3.483
4.976	3.498
4.976	3.613
4.976	3.723
4.976	3.733
5.005	3.224
5.005	3.527
5.005	3.645
5.005	3.655
5.005	3.665
5.005	3.671
5.005	3.681
5.005	3.689
5.005	3.702
5.005	3.710
5.005	3.783
5.005	3.791
5.005	3.806
5.033	3.749
5.033	3.759
5.972	3.274
5.972	3.543
5.972	3.553
5.972	3.584
5.972	3.595
5.972	3.608
5.972	3.710
5.972	3.723
5.972	3.731
5.972	3.741
5.972	3.749
5.972	3.754
5.972	3.835
6.000	3.650
6.000	3.657
6.000	3.673
6.000	3.775
6.967	3.689
6.995	3.232
6.995	3.535
6.995	3.699
6.995	3.749
6.995	3.756
6.995	3.764
6.995	3.783
7.934	3.806
7.962	3.790
7.991	3.730
7.991	3.741
7.991	3.775
8.019	3.388
8.019	3.905
8.986	3.790
8.986	3.814
8.986	3.842
9.014	3.722
9.014	3.743
9.953	3.824
9.981	3.798
9.981	3.806
9.981	3.868
10.976	3.824
10.976	3.866
10.976	3.879
10.976	3.941
10.976	4.025
12.000	3.878
12.000	3.889
12.028	3.863
12.967	3.907
13.024	3.868
13.934	3.990
15.981	3.930
15.981	3.998
15.981	4.113
18.000	3.940];
data.tL_m(:,1) = (data.tL_m(:,1) - 1) * 365; % convert yr to d since metam
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'male'};  
temp.tL_m    = C2K(15); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PinyPere2013';
comment.tL_m = 'Data for male toads';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 10 * weights.Li;
weights.Lim = 10 * weights.Lim;
weights.Lj = 10 * weights.Lj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.kap = 3 * weights.psd.kap;
weights.psd.v   = 3 * weights.psd.v;

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
D1 = 'Frogs are assumed to differ from tadpoles by del_M and {p_Am} only';
D2 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D3 = 'amphibiaweb states that tadpoles grow from 1.8 to 7.6 cm in a few weeks, but most tadpoles do overwinter (pers. com. Samuel Pinya Fernandez)';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'Lack tongue and ears, but have a lateral line; Is tetraploid and obligate aquatic';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'CCWJ'; % Cat of Life
metaData.links.id_ITIS = '662326'; % ITIS
metaData.links.id_EoL = '1039071'; % Ency of Life
metaData.links.id_Wiki = 'Alytes_muletensis'; % Wikipedia
metaData.links.id_ADW = 'Alytes_muletensis'; % ADW
metaData.links.id_Taxo = '107488'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Alytes+muletensis'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alytes_muletensis}}';
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
bibkey = 'PinyPere2013'; type = 'Article'; bib = [ ... 
'author = {S. Pinya and V. Perez-Mellado}, ' ... 
'year = {2013}, ' ...
'title = {Ageing and growth of the endangered midwife toad \emph{Alytes muletensis}}, ' ...
'journal = {Endang Species Res}, ' ...
'volume = {22}, ' ...
'pages = {263-268}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1039071/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Alytes_obstetricans/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?where-genus=Alytes&where-species=muletensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nlsoorten'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.nederlandsesoorten.nl/linnaeus_ng/app/views/species/nsr_taxon.php?id=139971&cat=151&epi=1}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

