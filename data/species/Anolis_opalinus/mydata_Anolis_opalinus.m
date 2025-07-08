function [data, auxData, metaData, txtData, weights] = mydata_Anolis_opalinus
%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Dactyloidae';
metaData.species    = 'Anolis_opalinus';
metaData.species_en = 'Jamaican opal-bellied anole';

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg','0iTd'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 06];

%% set data
% zero-variate data;
data.ab = 50;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'guess';
temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 2.5;  units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'JensAndr1984';
data.Lp  = 3.7;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'JensAndr1984';
data.Li  = 4.4;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'JensAndr1984';
data.Lim = 5.2;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'JensAndr1984';

data.Wwb = 0.36; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwim = 'based on Anolis_gundlachi and Li: (2.5/5)^3*2.9';
data.Wwi = 1.98; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Anolis_gundlachi and Li: (4.4/5)^3*2.9';
data.Wwim = 3.26; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Anolis_gundlachi and Li: (5.2/5)^3*2.9';

data.Ri  = 18/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';
temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Anolis_gundlachi';

% uni-variate data
% length-change in length
data.LdL_f = [... % SVL (m), change in SVL (cm/d)
1.99329	0.00997
2.10356	0.00990
2.13490	0.01593
2.14196	0.01183
2.15423	0.01392
2.18362	0.02389
2.19957	0.01786
2.25610	0.02260
2.26850	0.02485
2.29952	0.01175
2.30053	0.01296
2.35675	0.00484
2.40568	0.01304
2.41495	0.00532
2.48206	0.01015
2.54309	0.01401
2.54372	0.02100
2.54666	0.01200
2.59849	0.02366
2.65382	0.00822
2.80620	0.01450
2.84046	0.00525
2.84134	0.00630
2.88581	0.00919
3.01441	0.01217
3.03373	0.01016
3.08666	0.00438
3.09651	0.00984
3.14250	0.00205
3.19539	0.00872
3.24038	0.00599
3.28819	0.00036
3.32990	0.00623
3.37981	0.00310
3.41088	0.00881
3.42366	0.00527
3.43358	0.01082
3.45541	0.01178
3.47600	0.00503
3.48982	0.00897
3.53023	0.00704
3.54331	0.01010
3.54430	0.00503
3.55988	0.01106
3.58242	0.00037
3.59592	0.01018
3.60416	0.01999
3.64063	0.00712
3.64645	0.01404
3.68767	0.01307
3.69275	0.00037
3.72685	0.00343
3.72752	0.00423
3.73419	0.00592
3.73870	0.00504
3.74644	0.00174
3.78194	0.00022
3.78410	0.00279
3.79057	0.00423
3.79758	0.00632
3.83409	0.00600
3.83455	0.00030
3.83617	0.00223
3.83705	0.00327
3.84318	0.00432
3.85129	0.01396
3.88056	0.00504
3.88176	0.00022
3.88420	0.00311
3.89438	0.00898
3.90232	0.00593
3.92657	0.00351
3.93451	0.00046
3.93991	0.00689
3.94138	0.00239
3.95150	0.00818
3.98490	0.00416
3.98685	0.00022
4.01992	0.00207
4.03420	0.00030
4.04195	0.00328
4.05032	0.00697
4.07616	0.00022
4.11483	0.00247
4.12345	0.00022
4.18131	0.00031
4.22860	0.00031
4.23029	0.00232
4.27056	0.00023
4.32035	0.00320
4.33699	0.00425
4.34312	0.00529
4.34574	0.00216
4.38615	0.00023
4.43358	0.00039
4.49123	0.00023
4.57005	0.00024];
units.LdL_f  = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL', 'female'};  
temp.LdL_f   = C2K(20);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'JensAndr1984'; 
%
data.LdL_m = [... % SVL (m), change in SVL (cm/d)
1.97064	0.00901
2.24689	0.01384
2.29615	0.01698
2.32039	0.01376
2.34227	0.01513
2.36042	0.01891
2.41563	0.01481
2.49369	0.02197
2.55167	0.01393
2.61241	0.01859
2.69934	0.01482
2.76112	0.01281
2.76376	0.01699
2.76812	0.02390
2.80664	0.01000
2.84904	0.01892
2.90420	0.01474
2.93905	0.01169
2.96973	0.01868
3.00178	0.00285
3.00801	0.01273
3.08909	0.00799
3.11445	0.00655
3.12397	0.02166
3.14659	0.01587
3.16508	0.01185
3.20645	0.01081
3.20927	0.00695
3.25286	0.02609
3.25899	0.01081
3.28901	0.01676
3.29445	0.00872
3.29682	0.00414
3.32349	0.00479
3.39514	0.01009
3.39752	0.01387
3.44930	0.01267
3.47103	0.01379
3.48547	0.01170
3.51760	0.01267
3.60060	0.01098
3.67688	0.00697
3.71369	0.02369
3.75968	0.00496
3.76956	0.02063
3.78843	0.00890
3.79107	0.01308
3.80990	0.00962
3.83881	0.01380
3.84521	0.00729
3.86734	0.00906
3.87006	0.00504
3.90331	0.00778
3.92781	0.00496
3.94090	0.00906
3.94276	0.00368
3.99798	0.00794
3.99910	0.00971
4.03627	0.00199
4.08992	0.00376
4.09274	0.00010
4.12094	0.00296
4.20223	0.00690
4.25073	0.00883
4.29155	0.00690
4.29775	0.00007
4.35470	0.00706
4.43745	0.00498
4.44608	0.00200
4.54055	0.00184
4.54778	0.00498
4.54989	0.00001
4.58532	0.00619
4.60027	0.00490
4.60248	0.00008
4.63583	0.00297
4.64048	0.00201
4.64452	0.00008
4.64822	0.00595
4.68893	0.00386
4.70231	0.00008
4.73627	0.00394
4.74429	0.00000
4.74607	0.00281
4.74738	0.00490
4.74809	0.00603
4.78957	0.00515
4.79158	0.00000
4.79356	0.00314
4.79952	0.00426
4.84412	0.00000
4.84589	0.00282
4.86242	0.00402
4.89656	0.00016
4.89793	0.00201
4.90985	0.00427
4.93859	0.00016
4.94052	0.00290
4.95047	0.00202
4.98067	0.00007
4.98725	0.00202
5.02928	0.00202
5.03509	0.00290
5.04100	0.00395
5.08580	0.00001
5.09951	0.00507
5.12910	0.00202
5.19609	0.00007
5.28541	0.00007
5.34982	0.00211
5.39049	0.00006];
units.LdL_m  = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL', 'male'};  
temp.LdL_m   = C2K(20);  units.temp.LdL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.LdL_m = 'JensAndr1984'; 

%% set weights for all real data
weights = setweights(data, []);
%weights.LdL_f = 3 * weights.LdL_f;
%weights.LdL_m = 3 * weights.LdL_m;
weights.Li = 10 * weights.Li;
weights.Lim = 10 * weights.Lim;
weights.Lb = 3 * weights.Lb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '675R5'; % Cat of Life
metaData.links.id_ITIS = '1056297'; % ITIS
metaData.links.id_EoL = '453479'; % Ency of Life
metaData.links.id_Wiki = 'Anolis_opalinus'; % Wikipedia
metaData.links.id_ADW = 'Anolis_opalinus'; % ADW
metaData.links.id_Taxo = '3806692'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Anolis&species=opalinus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anolis_opalinus}}';   
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
bibkey = 'JensAndr1984'; type = 'Article'; bib = [ ...  
'doi = {10.2307/1564090}, ' ...
'author = {Jenssen, T. A. and Andrews, R. M.}, ' ...
'title = {Growth Rates in the {J}amaican Lizard, \emph{Anolis opalinus}}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {18(3)}, ' ...
'pages = {338-341}, ' ...
'year = {1984}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

