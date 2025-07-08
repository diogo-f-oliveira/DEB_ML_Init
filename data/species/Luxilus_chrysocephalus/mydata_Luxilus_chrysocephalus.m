function [data, auxData, metaData, txtData, weights] = mydata_Luxilus_chrysocephalus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Luxilus_chrysocephalus'; 
metaData.species_en = 'Striped shiner'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'};  
metaData.data_1     = {'t-L'; 't_Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data

data.tp = 2*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'fishbase';   
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 9*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'fishbase';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 10;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = {'fishbase','SimmBeck2012'}; 
  comment.Lp = 'bsed on tp and tL data';
data.Li = 24;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishbase'; 
  
data.Wwb = 1e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Cobu1986';
  comment.Wwb = 'based on egg diameter of 1.24 mm: pi/6*0.124^3';

data.GSI = 0.07 ; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';  bibkey.GSI = 'SimmBeck2012'; 
  temp.GSI = C2K(13); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

%% univariate data
 
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.319	4.998
0.352	5.712
0.462	5.092
0.582	5.520
0.659	4.043
0.736	4.614
0.736	4.043
0.758	4.995
0.835	5.042
0.912	5.803
0.912	5.565
0.912	5.280
0.945	6.089
1.000	6.707
1.000	7.088
1.011	6.374
1.011	5.707
1.066	8.040
1.066	6.612
1.088	7.469
1.132	7.088
1.154	7.897
1.154	8.421
1.154	8.945
1.154	7.992
1.187	7.135
1.231	8.515
1.242	9.134
1.253	9.515
1.297	9.801
1.308	9.420
1.319	10.658
1.319	8.229
1.363	8.515
1.396	8.610
1.396	10.086
1.396	10.419
1.407	9.562
1.407	9.990
1.418	7.467
1.418	8.133
1.418	8.419
1.418	8.990
1.418	9.371
1.418	9.705
1.462	10.276
1.484	8.418
1.484	8.704
1.484	9.371
1.484	9.752
1.505	9.561
1.593	8.084
1.648	6.322
1.648	6.751
1.659	6.941
1.659	7.322
1.659	7.703
1.670	9.084
1.681	8.512
1.725	7.131
1.758	8.750
1.802	9.035
1.868	8.940
1.890	8.035
2.000	9.796
2.022	10.510
2.055	11.510
2.077	9.033
2.099	9.510
2.209	13.747
2.242	12.366
2.242	12.509
2.264	11.223
2.275	13.032
2.297	12.556
2.451	10.698
2.538	10.507
2.747	12.315
2.802	11.743
3.077	12.503
3.242	13.264
3.736	13.213
3.736	12.879
3.736	12.356
3.835	16.879
3.846	13.212
3.857	13.736
3.912	14.402
4.011	13.544
4.066	15.163
4.165	14.876
4.231	15.114
4.253	13.876
4.253	14.828
4.857	19.157
5.000	13.585
5.000	16.918
5.165	15.060
5.264	15.821
5.275	16.536
5.418	16.439
5.418	16.963
5.758	16.247
5.769	13.485
6.264	17.005];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(21.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SimmBeck2012'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.473	5.092
0.637	6.900
0.637	4.615
0.703	5.281
0.769	5.995
0.879	6.946
0.890	8.661
0.912	6.232
0.912	4.756
0.945	7.422
1.000	5.374
1.044	5.707
1.066	6.707
1.066	7.850
1.066	6.374
1.154	9.802
1.154	7.564
1.154	8.706
1.165	7.040
1.297	8.705
1.319	10.134
1.330	9.229
1.330	8.991
1.352	11.991
1.363	10.895
1.363	7.848
1.407	10.705
1.418	8.181
1.473	10.180
1.516	7.418
1.549	10.561
1.560	9.561
1.571	11.418
1.637	7.656
1.681	8.179
1.714	10.893
1.714	8.941
1.725	11.512
1.725	9.369
1.725	9.655
1.758	8.226
1.802	11.369
1.802	8.273
1.824	6.654
1.835	10.226
1.835	7.511
1.835	7.845
1.835	8.035
1.857	10.606
1.857	8.559
1.890	10.559
1.890	11.130
1.890	8.225
1.901	10.892
1.945	9.653
1.978	11.082
2.000	9.082
2.011	14.082
2.022	13.034
2.055	12.319
2.055	11.653
2.066	14.510
2.066	10.224
2.088	12.938
2.132	13.366
2.154	12.985
2.176	13.747
2.209	12.223
2.253	13.461
2.253	13.985
2.275	11.508
2.319	11.889
2.341	11.556
2.352	13.317
2.374	12.603
2.407	17.507
2.440	13.602
2.451	14.793
3.011	14.503
3.110	17.550
3.165	12.978
3.319	17.311
4.011	18.973
4.022	17.877
4.275	16.876];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(21.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SimmBeck2012'; 
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (yr), wet weight (g)
0.307	2.992
0.438	2.661
0.515	2.331
0.614	2.661
0.636	2.331
0.702	2.000
0.746	1.339
0.855	2.331
0.954	4.975
0.954	3.322
0.976	6.958
1.020	4.644
1.020	3.983
1.129	5.636
1.162	8.611
1.195	7.289
1.195	4.975
1.228	7.619
1.282	10.263
1.305	7.619
1.315	12.908
1.403	11.585
1.403	9.933
1.403	7.289
1.426	5.305
1.546	10.594
1.546	8.611
1.546	5.966
1.656	6.958
1.667	9.272
1.667	4.975
1.721	10.594
1.776	10.924
1.787	7.289
1.809	7.950
1.820	12.908
1.930	8.611
1.995	12.246
2.006	12.577
2.017	13.899
2.039	13.899
2.072	17.535
2.072	9.933
2.225	21.501
2.225	18.857
2.280	14.891
2.412	12.246
2.522	11.585
2.751	22.824
2.839	22.493
3.103	21.501
3.234	23.815
3.760	28.443
3.826	25.468
3.845	66.784
3.881	32.078
3.924	40.011
4.088	45.961
4.187	37.036
4.232	29.104
4.243	34.392
4.253	38.689
4.253	36.706
4.818	96.863
5.011	28.112
5.030	61.826
5.175	37.036
5.261	50.258
5.273	44.639
5.426	49.597
5.438	42.325
5.766	51.580
5.779	28.443
6.281	63.479];
data.tWw_f(:,1) = 365 * (0 + data.tWw_f(:,1));
n=size(data.tWw_f,1); for i=2:n; if data.tWw_f(i,1)<=data.tWw_f(i-1,1); data.tWw_f(i,1)=data.tWw_f(i-1,1)+1e-3; end; end
units.tWw_f = {'d', 'g'}; label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f = C2K(13);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'SimmBeck2012'; 
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (yr), wet weight (g)
0.680	4.644
0.778	4.314
0.942	9.272
1.162	9.272
1.173	5.966
1.294	9.272
1.294	7.289
1.304	11.585
1.326	14.230
1.348	17.866
1.414	12.246
1.502	5.305
1.524	8.280
1.578	13.899
1.590	11.255
1.623	9.933
1.721	9.602
1.743	14.891
1.753	19.518
1.842	13.569
1.842	5.966
1.843	3.983
1.929	15.221
1.930	11.916
1.962	19.849
1.971	34.392
1.994	27.451
1.995	17.535
1.996	9.272
2.071	22.824
2.081	35.053
2.082	25.468
2.083	13.569
2.094	17.535
2.147	29.104
2.158	31.087
2.181	24.807
2.225	26.129
2.236	24.476
2.236	17.535
2.257	28.443
2.302	21.832
2.324	20.179
2.345	25.137
2.368	15.221
2.410	33.070
2.411	22.824
2.419	55.216
3.013	45.961
3.168	25.798
3.341	54.224
3.995	105.457
4.008	80.667];
data.tWw_m(:,1) = 365 * (0 + data.tWw_m(:,1));
n=size(data.tWw_m,1); for i=2:n; if data.tWw_m(i,1)<=data.tWw_m(i-1,1); data.tWw_m(i,1)=data.tWw_m(i-1,1)+1e-3; end; end
units.tWw_m = {'d', 'g'}; label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m = C2K(13);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'SimmBeck2012'; 
comment.tWw_m = 'Data for males';

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
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f', 'tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Mean temperature is guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3WH77'; % Cat of Life
metaData.links.id_ITIS = '163832'; % ITIS
metaData.links.id_EoL = '217906'; % Ency of Life
metaData.links.id_Wiki = 'Luxilus_chrysocephalus'; % Wikipedia
metaData.links.id_ADW = 'Luxilus_chrysocephalus'; % ADW
metaData.links.id_Taxo = '179241'; % Taxonomicon
metaData.links.id_WoRMS = '1016147'; % WoRMS
metaData.links.id_fishbase = 'Luxilus-chrysocephalus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Luxilus_chrysocephalus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Luxilus-chrysocephalus.html}}';  
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
bibkey = 'SimmBeck2012'; type = 'Article'; bib = [ ... 
'author = {Bryan R. Simmons and DanielW. Beckman}, ' ... 
'year = {2012}, ' ...
'title = {Age Determination, Growth, and Population Structure of the Striped Shiner and Duskystripe Shiner}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {141}, ' ...
'pages = {846-854}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cobu1986'; type = 'Article'; bib = [ ... 
'author = {Coburn, Miles M.}, ' ... 
'year = {1986}, ' ...
'title = {Egg Diameter Variation in {E}astern {N}orth {A}merican {M}innows ({P}isces: {C}yprinidae): {C}orrelation with Vertebral Number, Habitat and Spawning Behavior}, ' ...
'journal = {The Ohio Journal of Science}, ' ...
'volume = {86(1)}, ' ...
'pages = {110-120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

