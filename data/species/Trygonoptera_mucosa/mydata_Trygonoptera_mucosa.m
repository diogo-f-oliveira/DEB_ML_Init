function [data, auxData, metaData, txtData, weights] = mydata_Trygonoptera_mucosa

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Urolophidae';
metaData.species    = 'Trygonoptera_mucosa'; 
metaData.species_en = 'Western shovelnose stingaree'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 26];                          
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
data.ab = 11*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'WhitHall2002';    
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 16*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'WhitHall2002';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'for females, 10 yr for males';

data.Lb  = 12;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'WhitHall2002';
data.Lp = 25;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'WhitHall2002';
data.Lpm = 22;   units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty for males'; bibkey.Lpm  = 'WhitHall2002'; 
data.Li  = 36.9;  units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'WhitHall2002'; 
data.Lim  = 28.3;  units.Lim  = 'cm';  label.Lim  = 'ultimate disc width for males';   bibkey.Lim  = 'WhitHall2002'; 
  comment.Lim = 'for males';

data.Wwi = 350000 * (36.9/200)^3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'guess'; 
data.Wwim = 350000 * (28.3/200)^3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'guess'; 
 comment.Wwim = 'based on Trygonoptera testacea grows to 2 m disc width and a weight of 350 kg (Austr museum)';

data.Ri  = 1.1/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'WhitHall2002';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), disk width (cm)
0.171	14.088
0.202	13.434
0.204	15.906
0.235	15.397
0.266	14.670
0.268	16.634
0.298	15.033
0.392	13.579
0.425	16.197
0.455	13.869
0.456	14.451
0.457	16.051
0.488	15.033
0.549	12.923
0.614	15.323
0.647	17.214
0.678	16.268
0.711	18.014
0.712	19.614
0.739	14.159
0.835	16.050
0.867	15.613
0.868	16.850
0.869	18.522
0.929	14.522
0.960	13.795
0.963	18.013
0.990	11.831
0.994	17.285
1.025	16.194
1.054	13.722
1.055	14.522
1.055	14.885
1.085	12.849
1.184	17.721
1.185	19.976
1.214	16.703
1.215	17.939
1.245	16.048
1.246	17.357
1.248	19.030
1.249	20.557
1.311	19.539
1.405	18.011
1.437	18.957
1.470	20.629
1.470	21.356
1.471	21.938
1.564	19.683
1.659	21.065
1.785	20.337
1.818	22.010
2.068	19.536
2.069	20.482
2.164	21.281
2.260	21.935
2.321	20.262
2.481	22.444
2.513	22.953
2.545	23.607
2.640	24.407
2.670	23.025
2.732	21.206
2.827	21.351
2.922	22.297
3.048	21.642
3.112	22.660
3.143	21.787
3.205	21.277
3.238	22.441
3.238	22.805
3.427	22.586
3.430	26.077
3.459	23.022
3.585	22.003
3.617	23.167
3.868	22.002
3.998	26.656
4.059	24.256
4.216	22.874
4.279	22.219
4.311	23.237
4.312	23.892
4.440	26.509
4.442	29.637
4.472	27.455
4.500	23.236
4.501	23.745
4.502	26.000
4.629	26.654
4.690	24.108
4.879	23.599
4.973	22.580
5.321	23.961
5.324	28.033
5.325	29.488
5.355	26.942
5.449	25.851
5.451	28.906
5.544	26.651
5.546	29.705
5.574	24.832
5.667	23.159
5.668	23.959
5.671	27.305
5.827	25.777
5.983	23.085
6.013	21.631
6.016	24.831
6.050	27.812
6.141	23.449
6.205	25.412
6.208	29.121
6.300	25.484
6.330	23.811
6.331	24.393
6.334	28.175
6.364	26.430
6.459	27.084
6.460	28.756
6.461	29.338
6.772	24.173
6.773	25.410
6.806	26.428
6.934	29.337
6.993	23.445
7.057	24.827
7.058	26.063
7.153	26.718
7.220	31.372
7.247	25.481
7.248	27.226
7.437	26.353
7.503	30.934
7.531	25.698
7.686	22.861
8.005	27.296
8.134	30.278
8.192	24.750
8.226	26.932
8.290	28.168
8.291	29.477
8.319	25.550
8.352	27.586
8.417	30.058
8.446	26.131
8.668	27.367
8.795	28.893
9.236	28.019
9.237	28.819
9.240	32.674
9.301	30.782
9.393	27.073
9.426	29.546
9.677	27.145
9.678	28.163
9.708	26.417
9.867	28.017
10.342	30.051
10.436	29.324
10.497	27.433
10.498	28.451
10.655	26.923
10.719	28.886
10.754	32.377
10.846	30.122
10.970	27.213
10.972	29.104
10.974	31.431
11.697	28.810
11.792	29.683
11.983	30.918
12.361	30.626
12.772	31.279
13.277	31.713
13.277	32.150
13.307	29.750
14.001	30.547
14.789	29.672
14.919	34.689
16.244	34.175
16.370	33.811
17.789	33.661
17.855	37.151];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
temp.tL_f = C2K(22); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WhitHall2002';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disk width (cm)
0.076	13.393
0.171	13.974
0.173	15.865
0.175	18.047
0.204	15.065
0.233	12.301
0.234	12.738
0.235	14.556
0.329	13.174
0.361	13.683
0.361	14.119
0.362	14.919
0.364	17.319
0.394	16.519
0.489	16.082
0.522	18.482
0.552	15.500
0.616	17.173
0.647	16.663
0.648	17.827
0.677	14.118
0.678	15.209
0.680	18.554
0.804	15.499
0.807	19.063
0.807	19.281
0.837	17.099
0.901	17.972
0.903	19.717
0.929	13.317
0.930	14.262
0.930	14.990
0.931	16.299
1.087	12.953
1.184	15.643
1.185	17.098
1.185	17.607
1.187	20.371
1.217	18.189
1.218	19.061
1.247	16.079
1.250	19.934
1.315	21.534
1.343	17.315
1.373	15.934
1.377	20.297
1.378	21.170
1.408	19.352
1.410	21.970
1.474	22.842
1.474	23.424
1.566	19.424
1.598	19.715
1.661	20.442
1.694	21.823
1.788	20.950
1.850	19.568
1.884	21.823
1.946	21.241
1.976	18.259
2.071	19.349
2.167	20.585
2.168	21.385
2.169	22.912
2.198	20.221
2.200	21.821
2.200	22.258
2.233	23.858
2.327	22.912
2.388	20.366
2.391	24.439
2.453	22.111
2.454	23.711
2.455	25.384
2.516	22.693
2.865	24.801
2.927	22.401
2.989	21.091
3.053	21.600
3.147	21.236
3.148	22.982
3.211	21.891
3.306	22.763
3.370	23.635
3.403	25.672
3.497	23.780
3.498	25.453
3.561	24.726
3.592	24.362
3.622	23.125
3.654	22.471
3.907	23.488
3.938	23.124
4.004	25.815
4.159	22.396
4.163	27.778
4.225	26.396
4.254	22.978
4.255	23.414
4.255	23.778
4.256	25.087
4.317	21.959
4.350	24.650
4.351	25.450
4.352	26.541
4.384	27.123
4.384	27.777
4.570	22.831
4.634	23.340
4.664	22.322
4.666	24.722
4.698	24.358
4.729	23.630
4.953	28.211
4.982	23.920
4.983	25.230
5.076	23.775
5.171	23.047
5.203	24.574
5.266	23.628
5.268	26.028
5.268	26.465
5.268	26.828
5.330	24.937
5.362	25.446
5.424	24.137
5.489	26.100
5.551	24.718
5.646	24.791
5.708	24.063
5.741	25.663
5.804	24.354
5.897	22.390
5.993	24.499
5.994	25.299
6.056	23.626
6.089	25.662
6.121	25.880
6.215	24.716
6.308	22.897
6.435	23.770
6.468	25.224
6.657	24.351
6.751	23.332
6.752	25.005
6.752	25.732
7.005	25.804
7.066	23.258
7.099	24.495
7.101	27.185
7.288	23.185
7.291	27.039
7.351	23.912
7.353	26.021
7.513	28.057
7.604	23.911
7.701	27.183
7.985	26.310
8.018	27.400
8.143	25.800
8.207	26.963
8.271	27.981
8.459	25.726
8.682	28.634
8.967	29.724
8.996	26.451
9.249	25.796
9.281	27.032
9.314	28.123
9.314	28.850
9.754	25.503
10.041	28.920
10.198	27.320
10.323	25.719
10.767	28.045
10.956	27.462
12.252	28.476];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to 
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
temp.tL_m = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WhitHall2002'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouping
set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'mother feeds neonates with uterine milk';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '59F2S'; % Cat of Life
metaData.links.id_ITIS = '564426'; % ITIS
metaData.links.id_EoL = '51263563'; % Ency of Life
metaData.links.id_Wiki = 'Trygonoptera_mucosa'; % Wikipedia
metaData.links.id_ADW = 'Trygonoptera_mucosa'; % ADW
metaData.links.id_Taxo = '189634'; % Taxonomicon
metaData.links.id_WoRMS = '283060'; % WoRMS
metaData.links.id_fishbase = 'Trygonoptera-mucosa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trygonoptera_mucosa}}';  
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
bibkey = 'WhitHall2002'; type = 'Article'; bib = [ ... 
'author = {W. T. White and  N. G. Hall and I. C. Potter}, ' ...
'year = {2002}, ' ...
'title  = {Reproductive biology and growth during pre- and postnatal life of \emph{Trygonoptera personata} and \emph{T. mucosa} ({B}atoidea: {U}rolophidae)}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {140}, ' ...
'pages = {699-712}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Trygonoptera-mucosa.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
