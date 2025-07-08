function [data, auxData, metaData, txtData, weights] = mydata_Hypanus_dipterurus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Dasyatidae';
metaData.species    = 'Hypanus_dipterurus'; 
metaData.species_en = 'Diamond stingray'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 31];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 9*30.5; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'fishbase gives 3 mnth, without temperature, but 9 is more likely';
data.am = 29*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'SmitCail2007';   
  temp.am = C2K(14.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 24; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'SmitCail2007';
  comment.Lb = 'TL 19-28 cm';
data.Lp  = 57.3; units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'SmitCail2007';
data.Lpm  = 46.5; units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty for males'; bibkey.Lpm  = 'SmitCail2007';
data.Li  = 92.4;   units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'SmitCail2007';
data.Lim  = 62.2;   units.Lim  = 'cm';  label.Lim  = 'ultimate disc width for males';   bibkey.Lim  = 'SmitCail2007';

data.Wwi = 32.1e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'SmitCail2007','SaadSaid2015'};
 comment.Wwi = 'based on 0.021*Li^3.146, see F1';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(14.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-3 pups per litter, assumed 1 litter per yr';
  
% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.005	29.368
0.394	28.722
0.903	31.721
0.905	36.015
0.945	38.227
1.449	33.810
1.450	35.502
1.452	38.754
1.490	37.063
2.463	34.994
2.932	37.082
2.974	42.938
3.014	44.630
3.015	47.752
3.477	37.610
3.479	40.082
3.873	48.674
3.945	37.356
3.949	44.902
3.949	45.813
3.952	50.107
4.842	38.929
4.845	45.564
4.846	46.735
4.886	48.167
4.923	44.525
4.961	42.834
4.967	54.023
5.894	40.374
5.940	52.084
6.562	49.880
6.910	44.941
6.917	56.781
6.917	58.212
6.952	51.056
6.952	51.317
6.954	53.789
7.499	52.365
7.965	50.419
7.967	53.932
8.395	53.027
8.943	57.718
8.981	55.377
8.983	59.150
9.015	47.440
9.019	54.727
9.024	62.273
9.443	45.754
9.446	51.089
10.037	63.327
10.541	59.300
10.970	58.655
10.970	60.217
11.435	54.237
11.477	60.223
11.515	58.142
11.515	59.053
11.908	65.173
12.023	61.401
12.024	63.093
12.099	57.629
12.416	68.042
12.451	59.455
12.492	64.530
12.534	69.215
12.564	53.992
12.919	60.372
12.919	61.673
12.961	65.967
13.467	64.933
13.501	56.997
13.893	61.165
13.897	68.712
13.974	67.021
14.012	64.159
14.012	65.721
14.910	69.115
14.946	62.090
14.946	63.001
14.947	64.562
14.948	66.253
14.948	66.904
15.454	66.260
15.881	63.273
15.958	61.062
15.958	61.973
15.964	72.382
16.003	71.342
16.469	69.006
16.470	71.218
16.934	64.588
16.934	65.629
16.935	66.670
16.936	67.450
16.936	67.971
16.937	69.532
17.480	65.376
18.062	61.350
18.066	69.156
18.461	78.009
18.496	72.025
18.924	69.818
18.964	72.681
18.966	75.674
19.899	72.563
19.938	71.393
19.940	75.036
20.057	76.339
20.954	76.480
20.954	77.781
20.990	71.927
20.992	75.180
23.913	73.136
24.068	71.316
24.931	83.428
25.982	81.230
27.928	76.571];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
temp.tL_f = C2K(14.9); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SmitCail2007';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.045	30.799
0.081	25.725
0.474	31.455
0.592	33.929
0.980	31.072
0.981	32.373
0.982	33.674
0.984	38.748
1.021	35.236
1.023	37.188
1.917	33.946
1.917	34.857
1.959	39.021
1.996	35.639
2.035	36.680
2.036	37.591
2.504	39.158
2.505	40.850
2.933	38.774
2.973	40.986
3.517	38.911
3.945	38.136
3.948	43.991
3.951	48.155
3.986	40.739
4.025	42.171
4.454	43.087
4.457	47.121
4.531	40.486
4.881	40.100
4.961	43.874
5.390	44.010
5.544	41.020
5.936	44.668
5.936	45.709
5.976	47.140
6.520	43.635
6.520	44.675
6.872	46.502
6.950	47.413
6.951	48.324
6.951	48.975
6.991	50.146
6.992	53.139
7.419	49.241
7.419	49.241
7.454	42.996
7.532	42.347
7.533	44.819
7.534	46.380
7.535	47.421
7.890	55.102
7.959	40.140
8.003	47.947
8.004	51.200
8.005	51.721
8.008	57.055
8.041	46.257
8.078	43.264
8.390	43.789
8.434	53.938
8.469	46.002
8.509	48.214
8.903	56.026
8.977	48.741
8.978	49.782
8.978	50.823
8.979	52.124
9.015	47.570
9.367	48.746
9.448	54.212
9.448	55.643
9.487	55.253
9.563	52.261
9.873	47.972
9.948	43.159
9.951	49.274
9.953	52.397
9.991	50.966
10.028	47.063
10.380	50.190
10.457	47.979
10.495	46.028
10.496	46.939
10.499	53.575
10.501	55.917
10.926	49.807
10.926	50.458
10.926	51.108
10.968	55.142
10.968	56.313
11.005	52.150
11.005	52.801
11.511	51.506
11.981	55.155
12.954	53.216
12.954	54.387
13.889	53.359
13.891	58.043
13.970	59.865
14.434	53.366
16.502	58.337
18.022	59.528
18.956	57.458];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
temp.tL_m = C2K(14.9); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SmitCail2007';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight fro Dasyatis pastinaca: Ww in g =  0.021*(DW in cm)^3.146';
metaData.bibkey.F1 = 'SaadSaid2015';
F2 = 'ovoviviparous';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3NMJC'; % Cat of Life
metaData.links.id_ITIS = '160949'; % ITIS
metaData.links.id_EoL = '49672899'; % Ency of Life
metaData.links.id_Wiki = 'Hypanus_dipterurus'; % Wikipedia
metaData.links.id_ADW = 'Dasyatis_dipterura'; % ADW
metaData.links.id_Taxo = '4974511'; % Taxonomicon
metaData.links.id_WoRMS = '1042857'; % WoRMS
metaData.links.id_fishbase = 'Hypanus-dipterurus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hypanus_dipterurus}}'; 
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
bibkey = 'SmitCail2007'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF06083}, ' ...
'author = {Wade D. Smith and Gregor M. Cailliet and Everardo Mariano Melendez}, ' ...
'year = {2007}, ' ...
'title = {Maturity and growth characteristics of a commercially exploited stingray, \emph{Dasyatis dipterura}}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {58}, ' ...
'pages = {54-66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SaadSaid2015'; type = 'Article'; bib = [ ... 
'author = {Abdesselem SAADAOUI and  B\''{e}chir SAIDI and Samira ENAJJAR and Mohamed Nejmeddine BRADAI}, ' ...
'year = {2015}, ' ...
'title = {Reproductive biology of the common stingray \emph{Dasyatis pastinaca} ({L}innaeus, 1758) off the {G}ulf of {G}ab\`{e}s ({C}entral {M}editerranean {S}ea)}, ' ...
'journal = {Cah. Biol. Mar.}, ' ...
'volume = {56}, ' ...
'pages = {389-396}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Hypanus-dipterurus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  