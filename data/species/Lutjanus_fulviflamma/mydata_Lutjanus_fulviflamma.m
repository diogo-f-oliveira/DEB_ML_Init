function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_fulviflamma
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_fulviflamma'; 
metaData.species_en = 'Dory snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jpMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 12]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 23*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 18.7; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Lpm  = 16.7; units.Lpm  = 'cm';  label.Lpm  = 'fork length at puberty for males'; bibkey.Lpm  = 'fishbase'; 
data.Li  = 35;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'HamaKuma1992';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: 4/3*pi*0.0425^3'; 
data.Wwp = 119; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'GranAbde2006';
  comment.Wwp = 'based on 0.0239 * Lp^2.906, see F1';
data.Wwpm = 85; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty';   bibkey.Wwpm = 'GranAbde2006';
  comment.Wwpm = 'based on 0.0239 * Lpm^2.906, see F1';
data.Wwi = 736; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0239 * Li^2.906, see F1';

data.GSI  = 0.04;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'GranAbde2006';   
  temp.GSI = C2K(28);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.091	2.323
0.211	4.448
0.227	5.634
0.801	16.606
0.801	16.804
0.816	16.260
0.921	16.804
1.042	17.792
1.133	17.941
1.178	15.272
1.193	14.036
1.193	16.161
1.208	14.580
1.208	14.827
1.208	15.519
1.254	17.990
1.269	14.580
1.314	16.804
1.329	17.595
1.344	16.310
1.495	19.918
1.511	16.409
1.511	19.275
1.541	17.348
1.556	18.138
1.647	21.301
1.647	18.929
1.662	17.743
1.677	19.522
1.707	20.115
1.722	18.040
1.737	19.127
1.767	16.903
1.782	20.412
1.782	20.659
1.782	19.918
1.782	19.522
1.782	18.929
1.888	19.522
1.903	18.929
1.918	21.054
1.949	20.560
1.964	21.598
1.979	21.895
1.994	21.351
2.054	19.769
2.085	17.694
2.100	21.153
2.130	20.214
2.175	16.656
2.221	17.002
2.281	16.656
2.296	19.769
2.296	20.066
2.326	20.511
2.492	19.275
2.492	19.967
2.492	20.511
2.492	20.807
2.523	21.647
2.553	18.336
2.553	18.534
2.553	22.932
2.553	23.575
2.568	20.758
2.568	21.005
2.583	24.069
2.598	19.275
2.613	17.644
2.659	21.549
2.659	21.845
2.659	22.883
2.719	21.005
2.795	16.804
2.825	21.549
2.855	21.499
2.885	22.735
2.885	21.944
2.915	20.758
2.946	22.636
2.946	21.153
2.946	19.868
2.976	21.746
2.976	20.264
2.991	23.575
2.991	20.906
3.021	24.366
3.066	20.758
3.066	20.264
3.066	19.769
3.157	20.165
3.263	20.214
3.263	19.572
3.459	21.993
3.459	22.735
3.459	23.130
3.459	23.476
3.489	20.165
3.489	20.708
3.505	20.956
3.520	22.290
3.580	22.636
3.580	23.427
3.580	23.871
3.580	25.206
3.625	21.845
3.656	20.165
3.671	21.351
3.701	23.180
3.701	22.784
3.701	22.339
3.701	21.993
3.776	23.871
3.776	23.526
3.776	21.104
3.792	20.708
3.792	20.362
3.792	20.214
3.807	22.883
3.822	22.092
3.867	23.871
3.867	21.746
3.867	21.499
3.867	21.104
3.867	20.758
3.882	22.537
3.912	19.671
3.927	24.613
3.958	22.339
3.958	20.412
4.033	22.982
4.033	23.278
4.033	21.993
4.033	21.549
4.063	24.415
4.139	22.241
4.154	23.427
4.169	20.956
4.184	21.549
4.335	21.697
4.335	22.142
4.381	22.982
4.396	25.997
4.411	23.278
4.411	24.069
4.411	24.366
4.441	22.043
4.456	19.918
4.486	23.921
4.517	23.575
4.577	25.750
4.577	21.400
4.622	22.932
4.637	25.305
4.637	22.735
4.653	20.857
4.743	22.537
4.789	23.278
4.804	20.857
4.819	22.043
4.849	22.834
4.894	24.959
4.909	23.526
4.909	22.932
4.940	24.415
4.940	21.351
5.000	24.119
5.030	23.476
5.045	22.537
5.045	22.883
5.106	21.993
5.121	23.526
5.136	24.316
5.151	23.180
5.166	27.331
5.363	21.746
5.408	18.830
5.408	21.400
5.408	22.982
5.408	24.217
5.408	24.662
5.423	23.921
5.438	20.264
5.453	20.758
5.483	21.104
5.483	21.549
5.529	22.982
5.650	21.993
5.665	22.784
5.665	25.008
5.755	20.560
5.755	23.427
5.861	21.746
5.861	22.339
5.891	23.081
5.891	24.415
5.906	20.906
5.906	25.305
5.952	21.845
6.027	22.636
6.088	21.845
6.118	22.537
6.118	25.206
6.163	21.054
6.284	20.511
6.299	23.970
6.329	19.077
6.390	25.157
6.390	22.290
6.390	20.708
6.526	19.769
6.647	23.773
6.647	23.377
6.798	22.241
6.798	24.712
6.934	21.993
6.994	24.712
7.039	20.264
7.054	23.822
7.054	24.119
7.069	25.552
7.085	19.522
7.100	24.465
7.115	22.636
7.115	26.343
7.221	27.479
7.236	24.514
7.266	24.811
7.296	24.316
7.341	24.020
7.356	20.906
7.402	24.662
7.417	25.305
7.417	24.217
7.613	24.563
7.825	23.822
7.885	22.586
8.278	23.377
8.338	24.761
9.154	25.997
9.230	26.590
9.532	19.769
9.592	21.499
9.592	24.069
9.683	20.857
9.728	25.008
9.819	22.735
10.227	26.689
10.257	19.028
10.317	26.985
10.619	20.066
10.619	24.020
10.891	25.502
11.269	24.712
11.284	28.863
11.284	28.666
12.523	24.069
14.245	28.072];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f    = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GranAbde2006';
comment.tL_f = 'data for females; temp 21 till 34 C';
% 
data.tL_m = [ ... % time since birth (yr), fork length (cm)
1.314	16.507
1.314	17.051
1.344	18.188
1.586	17.792
1.616	16.013
1.616	16.804
1.616	18.583
1.677	19.176
1.707	18.336
1.813	15.618
1.813	16.211
1.813	19.325
1.858	17.990
1.994	19.473
2.024	19.176
2.054	20.264
2.100	16.755
2.100	19.374
2.160	17.743
2.160	18.237
2.175	16.409
2.190	20.610
2.236	18.979
2.266	19.275
2.402	17.298
2.417	16.705
2.447	16.013
2.477	18.830
2.492	22.735
2.523	21.203
2.568	19.819
2.598	21.796
2.598	22.438
2.628	20.115
2.628	21.450
2.704	20.115
2.764	18.583
2.764	18.237
2.764	19.226
2.764	19.572
2.779	17.298
2.779	17.792
2.825	21.203
2.915	18.979
2.946	19.176
2.946	23.031
2.991	17.792
3.006	18.731
3.006	21.796
3.036	21.351
3.066	18.484
3.142	21.400
3.142	21.203
3.157	19.374
3.157	20.264
3.278	20.165
3.308	18.830
3.308	19.522
3.308	21.944
3.414	17.990
3.429	21.549
3.550	23.328
3.580	21.944
3.610	21.153
3.625	22.834
3.640	17.792
3.686	19.868
3.686	20.956
3.701	19.028
3.761	21.697
3.776	21.252
3.837	16.952
3.897	20.016
3.897	20.807
3.927	21.400
3.958	21.993
3.973	18.830
4.003	21.104
4.033	21.301
4.124	20.659
4.139	21.944
4.275	18.979
4.290	20.362
4.305	19.819
4.426	21.647
4.441	17.694
4.456	19.325
4.486	20.264
4.502	20.758
4.532	23.822
4.532	24.168
4.607	21.993
4.622	18.435
4.637	19.918
4.728	22.883
4.743	21.598
4.849	18.435
4.879	21.944
4.940	17.743
5.000	22.784
5.030	21.549
5.060	21.944
5.151	20.560
5.166	21.252
5.166	21.796
5.287	19.572
5.347	20.758
5.423	22.488
5.438	19.769
5.453	22.142
5.483	25.453
5.544	23.526
5.544	21.796
5.604	21.598
5.680	21.499
5.785	19.226
5.816	21.647
5.816	21.450
5.906	21.450
5.906	20.016
5.921	23.081
5.921	23.526
5.937	22.290
6.012	21.499
6.027	19.423
6.042	18.731
6.057	21.005
6.073	23.427
6.088	22.488
6.088	22.932
6.208	23.575
6.239	22.092
6.631	22.932
6.692	19.769
6.692	21.697
6.903	19.819
6.903	23.921
6.934	20.066
6.934	18.781
6.934	21.153
7.054	19.819
7.069	23.575
7.100	23.081
7.190	24.020
7.281	24.069
7.341	22.142
7.356	22.982
7.417	18.781
7.613	20.956
7.628	22.488
7.704	20.758
7.931	24.168
8.248	25.898
8.263	24.909
8.323	21.301
8.505	19.918
8.912	22.685
9.230	23.526
9.335	23.921
9.517	20.511
10.302	19.868
10.846	22.241
12.356	18.979];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(28);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GranAbde2006';
comment.tL_m = 'data for males; temp 21 till 34 C';

%% set weights for all real data
weights = setweights(data, []);

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

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am}  and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'weight-length relationship: W = 0.0239 * FL^2.906';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 3 - 35 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3WG9S'; % Cat of Life
metaData.links.id_ITIS = '168880'; % ITIS
metaData.links.id_EoL = '46580745'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_fulviflamma'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_fulviflamma'; % ADW
metaData.links.id_Taxo = '106193'; % Taxonomicon
metaData.links.id_WoRMS = '218490'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-fulviflamma'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_fulviflamma}}';
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
bibkey = 'GranAbde2006'; type = 'Article'; bib = [ ... 
'author = {E. M. Grandcourt and T. Z. Al Abdessalaam and F. Francis}, ' ... 
'year = {2006}, ' ...
'title = {Age, growth, mortality and reproduction of the blackspot snapper, \emph{Lutjanus fulviflamma} ({F}orssk\r{a}l, 1775), in the southern {A}rabian {G}ulf}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {78}, ' ...
'pages = {203-210}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HamaKuma1992'; type = 'Article'; bib = [ ... 
'author = {S. Hamamoto and S. Kumagai and K. Nosaka and S. Manabe and A. Kasuga and Y. Iwatsuki}, ' ... 
'year = {1992}, ' ...
'title = {Reproductive Behavior, Eggs and Larvae of a {L}utjanid Fish, \emph{Lutjanus stellatus}, Observed in an Aquarium}, ' ...
'journal = {Japanese Journal of Ichthyology}, ' ...
'volume = {30}, ' ...
'pages = {219-228}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lutjanus-fulviflamma.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
