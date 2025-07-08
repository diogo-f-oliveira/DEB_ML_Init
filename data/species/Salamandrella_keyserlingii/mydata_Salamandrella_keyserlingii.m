function [data, auxData, metaData, txtData, weights] = mydata_Salamandrella_keyserlingii

global tT

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Hynobiidae';
metaData.species    = 'Salamandrella_keyserlingii'; 
metaData.species_en = 'Siberian salamander'; 

metaData.ecoCode.climate = {'BWk', 'BSk', 'Dfb', 'Dfc', 'Dsc', 'Dwa', 'Dwc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Hasu2010';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lj  = 3;     units.Lj  = 'cm';  label.Lj  = 'SLV at metam';    bibkey.Lj  = 'Hasu2010'; 
data.Lp  = 6.12;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'Hasu2010'; 
data.Lpm  = 5.76; units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males'; bibkey.Lpm  = 'Hasu2010'; 
data.Li  = 7;    units.Li  = 'cm';  label.Li  = 'ultimate SVL  for females';   bibkey.Li  = 'Hasu2010';
  comment.Li = 'Wiki: TL = 12.5 cm';
data.Lim  = 6.5;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'Hasu2010';

data.Wwb = 0.0141; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 3 mm: pi/6*0.3^3';
data.Wwi = 3.8;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Onychodactylus japonicus: (12.5/17)^3*9.65';

data.Ri = 200/365;  units.Ri = '#/d';    label.Ri = 'max reprod rate';       bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '200 eggs in 2 sacs, one clutch per yr';
  
% univariate data
% time-length of larvae
data.tL_f = [... % time since 1 Aug 1976 (d), total length (cm)
0.220	3.738
0.220	3.792
0.275	3.341
0.275	3.937
0.303	2.312
0.303	2.709
0.331	2.637
0.331	3.467
0.358	3.052
0.358	3.160
0.358	3.178
0.386	2.528
0.386	2.853
0.386	2.926
0.386	2.998
0.441	3.305
0.468	3.413
0.970	4.623
0.997	4.767
1.053	5.147
1.080	4.262
1.108	4.117
1.108	4.190
1.136	3.702
1.136	4.840
1.219	4.280
1.302	4.894
1.385	4.749
1.468	4.424
1.828	4.695
1.911	4.406
1.967	4.695
2.078	5.074
2.078	4.244
2.078	3.883
2.105	4.334
2.133	4.749
2.133	3.774
2.188	4.966
2.216	4.190
2.271	4.153
2.299	4.370
2.327	5.074
2.327	4.569
2.327	4.479
2.355	4.912
2.355	4.786
3.130	4.767
3.186	4.912
3.186	5.074
3.186	5.183
3.296	4.786
3.324	5.255
3.324	5.093
3.546	5.183
2.167	5.253
2.196	5.614
2.332	5.235
2.525	5.181
2.966	5.272
2.966	5.327
3.186	5.164
3.186	5.327
3.187	5.544
3.188	5.670
3.243	5.761
3.379	5.183
3.435	5.364
3.985	5.346
4.207	5.546
4.320	6.629
5.089	5.944
5.146	6.324
2.956	5.735
2.957	5.898
2.982	5.230
3.122	5.736
3.150	5.664
3.204	5.411
3.235	6.368
3.290	6.080
3.290	6.206
3.291	6.477
3.343	5.592
3.345	6.044
3.372	5.791
3.398	5.267
3.457	6.369
3.925	5.450
3.925	5.594
3.927	6.100
3.927	6.244
4.009	5.757
4.009	5.956
4.011	6.534
4.012	6.678
4.036	5.739
4.040	6.841
4.065	5.884
4.119	5.559
4.147	5.740
4.176	6.173
4.177	6.245
4.203	5.884
4.233	6.625
4.258	5.740
4.260	6.336
4.260	6.408
4.287	6.173
4.312	5.235
4.317	6.751
4.370	6.120
4.894	5.526
4.895	5.670
4.949	5.273
4.951	5.941
4.981	6.429
4.982	6.971
5.009	6.519
5.009	6.555
5.009	6.628
5.035	6.104
5.089	5.743
5.089	5.815
5.117	5.888
5.230	6.466
5.313	6.538
5.314	6.647
5.395	6.033
5.398	7.044
5.398	7.117
5.421	5.708
5.619	6.738
5.893	5.890
5.895	6.540
5.923	6.667
5.924	6.992
5.949	6.125
5.975	5.746
6.005	6.198
6.005	6.324
6.061	6.433
6.062	6.776
6.115	6.180
6.117	6.686
6.197	5.801
6.227	6.506
6.257	7.065
6.281	6.108
6.282	6.397
6.365	6.109
6.367	6.939
6.394	6.705
6.396	7.192
6.423	7.066
7.003	6.526
7.004	6.743
7.030	6.382
7.366	7.268
7.890	6.602
7.947	7.270
8.057	6.765];
data.tL_f(:,1) = 365 * data.tL_f(:,1);
units.tL_f  = {'d', 'cm'}; label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(12);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Hasu2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [... % time since birth (yr), SVL(cm)
1.840	5.626
1.860	4.881
1.880	5.391
1.900	5.652
1.900	5.064
1.940	4.907
1.960	4.972
1.980	5.365
1.980	4.724
2.180	5.457
2.220	5.535
2.240	5.235
2.240	5.666
2.240	5.797
2.240	5.797
2.240	5.679
2.240	5.901
2.280	4.960
2.360	5.039
2.800	5.798
2.820	4.766
2.860	5.589
2.880	6.021
2.880	5.851
2.880	5.511
2.900	6.112
2.920	5.001
2.920	5.367
2.920	5.223
2.940	4.609
2.940	4.805
2.940	5.341
2.960	4.910
2.960	4.962
2.960	5.851
2.980	5.158
2.980	5.629
3.040	5.694
3.060	5.158
3.200	5.237
3.220	5.930
3.220	6.270
3.260	5.577
3.280	6.100
3.340	5.447
3.340	5.708
3.380	6.048
3.380	6.310
3.400	5.852
3.440	4.676
3.440	5.146
3.440	5.565
3.440	5.669
3.440	5.996
3.460	5.225
3.520	5.447
3.800	5.866
3.820	6.010
3.860	5.513
3.860	5.853
3.900	5.631
3.900	5.697
3.900	6.076
3.920	6.651
3.960	5.435
3.960	5.501
3.960	6.259
4.000	6.377
4.120	6.024
4.120	6.181
4.160	5.292
4.160	5.932
4.180	5.776
4.200	6.364
4.200	6.168
4.200	6.586
4.220	5.684
4.280	5.109
4.280	5.645
4.300	6.220
4.320	5.384
4.320	5.854
4.320	5.815
4.320	6.077
4.360	5.528
4.400	6.286
4.440	5.253
4.460	5.646
4.460	5.999
4.520	5.384
4.880	6.444
4.920	5.660
4.940	6.405
4.940	6.327
4.940	6.222
4.940	6.118
4.960	5.412
4.960	5.987
4.960	5.961
5.000	6.510
5.020	6.079
5.080	5.700
5.180	5.491
5.220	6.131
5.280	6.275
5.280	6.602
5.300	5.818
5.300	6.471
5.320	6.341
5.340	6.001
5.360	6.262
5.840	6.421
5.860	6.290
5.880	6.721
5.920	5.767
5.940	6.787
5.940	6.708
5.960	6.695
5.960	5.597
6.000	6.512
6.080	6.094
6.240	6.173
6.240	6.944
6.320	6.566
6.360	6.945
6.400	6.605
6.900	6.123
6.960	6.227
6.960	6.332
6.980	5.966
6.980	6.018
7.280	6.620
7.380	6.699
7.440	6.163
7.940	6.282
8.000	6.544
8.340	6.689
8.360	6.492
10.020	7.177];
data.tL_m(:,1) = 365 * data.tL_m(:,1);
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'}; label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m  = C2K(12);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Hasu2010';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;
weights.Wwi = 10 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';     
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'Can survive many years of deep frost (-45C)';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XBLN'; % Cat of Life
metaData.links.id_ITIS = '668238'; % ITIS
metaData.links.id_EoL = '332597'; % Ency of Life
metaData.links.id_Wiki = 'Salamandrella_keyserlingii'; % Wikipedia
metaData.links.id_ADW = 'Salamandrella_keyserlingii'; % ADW
metaData.links.id_Taxo = '47231'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Salamandrella+keyserlingii'; % AmphibiaWeb
metaData.links.id_AnAge = 'Salamandrella_keyserlingii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Salamandrella_keyserlingii,}}';
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
bibkey = 'Hasu2010'; type = 'Article'; bib = [ ...  
'doi = {10.1007/s11692-010-9080-9}, ' ...
'author = {Masato Hasumi}, ' ...
'year = {2010}, ' ...
'title  = {Age, Body Size, and Sexual Dimorphism in Size and Shape in \emph{Salamandrella keyserlingii} ({C}audata: {H}ynobiidae)}}, ' ...
'journal = {Evol Biol}, ' ...
'volme = {37}, ' ...
'pages = {38-48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?where-genus=Salamandrella&where-species=keyserlingii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Salamandrella_keyserlingii,}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

