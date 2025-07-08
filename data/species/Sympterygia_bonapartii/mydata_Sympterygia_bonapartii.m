function [data, auxData, metaData, txtData, weights] = mydata_Sympterygia_bonapartii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Sympterygia_bonapartii'; 
metaData.species_en = 'Blonde ray'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temperature
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 09 04];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 04]; 

%% set data
% zero-variate data;
data.ab = 135; units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'JaneMeij2018';    
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp is guessed for all data';
data.tp = 22*30.5;  units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'JaneMeij2018';
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'JaneMeij2018';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 13.2;   units.Lb  = 'cm';  label.Lb = 'total length at birth'; bibkey.Lb  = 'JaneMeij2018';
data.Lp  = 61.7;   units.Lp  = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp  = 'JaneMeij2018';
data.Li  = 80.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'JaneMeij2018';
data.Lim  = 74.6;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males'; bibkey.Lim  = 'JaneMeij2018';

data.Wwp = 2121.7;   units.Wwp  = 'g';  label.Wwp = 'wet weight at puberty'; bibkey.Wwp  = 'JaneMeij2018';
data.Wwi = 4.71e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'JaneMeij2018';
  comment.Wwi = 'based on (Li/Lp)^3*Wwp'; 

data.Ri  = 192/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';  bibkey.Ri  = 'JaneMeij2018';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
% time - length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.007	13.242
0.014	14.053
0.058	14.864
0.072	13.239
0.151	16.484
0.201	14.371
0.223	17.456
0.252	16.155
0.259	18.429
0.288	19.889
0.289	16.966
0.345	21.348
0.360	19.561
0.374	18.749
0.396	21.346
0.439	20.370
0.453	23.780
0.460	22.318
0.468	22.968
0.482	25.566
0.511	26.377
0.525	24.265
0.568	27.186
0.569	25.562
0.590	29.946
0.640	27.346
0.662	29.294
0.676	33.354
0.719	35.463
0.727	30.591
0.748	32.701
0.784	34.324
0.799	32.049
0.813	35.947
0.849	34.483
0.856	34.808
0.899	36.268
0.906	38.704
0.914	39.840
0.921	39.678
0.928	37.729
0.950	36.753
0.951	42.762
0.957	41.138
0.986	37.889
0.993	39.675
1.007	45.034
1.079	40.971
1.086	42.919
1.094	46.979
1.122	41.294
1.137	49.251
1.138	45.841
1.180	41.941
1.187	49.249
1.201	45.026
1.252	52.820
1.259	44.536
1.266	50.058
1.295	48.433
1.296	47.134
1.309	52.817
1.324	46.320
1.381	52.327
1.382	52.327
1.396	55.088
1.417	51.514
1.438	57.847
1.439	50.214
1.475	56.546
1.482	55.409
1.532	60.279
1.547	53.457
1.604	54.267
1.612	59.789
1.655	62.711
1.662	57.838
1.705	59.623
1.706	60.272
1.741	64.981
1.763	59.133
1.777	55.884
1.791	63.192
1.813	55.233
1.856	61.728
1.878	64.001
1.899	58.640
1.921	65.623
1.934	60.913
1.935	55.878
1.964	64.160
1.965	59.125
2.022	62.208
2.043	66.593
2.094	62.693
2.101	65.291
2.137	62.366
2.158	67.075
2.173	65.288
2.180	62.364
2.245	66.585
2.246	62.849
2.273	62.523
2.302	65.933
2.309	68.044
2.381	63.331
2.410	65.928
2.424	63.491
2.453	67.713
2.475	64.951
2.554	62.674
2.597	64.784
2.655	67.218
2.734	64.941
2.748	63.316
2.856	66.885
2.935	65.095
2.971	63.307
3.036	64.928
3.043	66.715
3.129	63.788
3.137	66.224
3.194	62.973
3.209	66.221
3.360	66.539
3.361	63.291
3.417	65.562
3.496	65.559
3.683	64.090];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(15); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JaneMeij2018';
comment.tL_f = 'data for females';
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.000	12.785
0.065	14.178
0.115	14.316
0.137	15.850
0.165	14.175
0.187	17.104
0.245	15.567
0.252	18.358
0.302	21.007
0.309	19.472
0.317	16.123
0.338	17.518
0.345	16.820
0.353	22.401
0.367	21.703
0.368	19.331
0.417	19.747
0.424	23.235
0.453	18.909
0.475	21.001
0.496	25.326
0.518	23.232
0.554	21.277
0.590	28.113
0.597	25.462
0.626	23.089
0.633	26.996
0.655	24.483
0.669	31.878
0.683	30.203
0.705	28.807
0.748	26.852
0.755	30.898
0.756	34.247
0.784	33.828
0.820	28.524
0.842	32.988
0.863	38.709
0.928	31.032
0.929	34.799
0.930	37.311
0.942	39.543
0.971	42.333
1.007	36.890
1.014	39.820
1.050	42.051
1.058	46.934
1.065	43.864
1.086	34.236
1.094	44.561
1.108	38.281
1.115	35.351
1.165	42.745
1.173	47.070
1.194	40.650
1.201	51.255
1.230	36.742
1.231	46.928
1.245	41.207
1.266	42.741
1.288	49.577
1.331	44.971
1.338	50.832
1.345	37.017
1.374	55.854
1.388	43.295
1.453	53.200
1.456	39.525
1.482	41.617
1.511	46.639
1.518	55.151
1.525	58.778
1.604	46.078
1.612	43.287
1.626	59.473
1.662	53.750
1.669	59.192
1.691	56.401
1.741	49.841
1.742	45.376
1.770	61.700
1.777	55.281
1.778	55.839
1.856	56.953
1.871	52.627
1.899	49.556
1.921	56.114
1.935	59.183
1.957	52.763
1.986	61.972
2.014	52.343
2.036	59.040
2.037	54.714
2.072	57.364
2.137	53.455
2.144	59.594
2.145	52.059
2.151	61.687
2.180	58.198
2.223	54.289
2.281	53.031
2.288	62.659
2.302	55.961
2.303	57.914
2.309	59.588
2.388	58.190
2.389	54.841
2.390	53.446
2.410	63.073
2.489	60.280
2.518	54.976
2.532	62.511
2.619	57.764
2.620	53.717
2.676	60.273
2.698	62.365
2.741	55.108
2.763	53.293
2.784	59.572
2.849	62.779
2.856	57.337
2.899	54.126
2.906	57.614
2.907	55.242
2.993	53.146
3.058	63.190
3.079	55.655
3.086	58.026
3.087	53.840
3.122	53.141
3.144	57.466
3.209	57.045
3.237	53.975
3.245	55.509
3.281	58.299
3.317	53.414
3.324	63.181
3.338	55.227
3.353	52.854
3.468	54.106
3.612	58.566];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
  temp.tL_m = C2K(15); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JaneMeij2018';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 8 * weights.tL_f; 
weights.tL_m = 8 * weights.tL_m; 
weights.Li = 5 * weights.Li; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M; 

%% pack data and txt_data for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouping
set1 = {'tL_f', 'tL_m'}; subtitle1 = 'Data for females, males';
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'food availebility in tL data is assumed to avry in time';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '53SCV'; % Cat of Life
metaData.links.id_ITIS = '564291'; % ITIS
metaData.links.id_EoL = '46560854'; % Ency of Life
metaData.links.id_Wiki = 'Sympterygia_bonapartii'; % Wikipedia
metaData.links.id_ADW = 'Sympterygia_bonapartii'; % ADW
metaData.links.id_Taxo = '188514'; % Taxonomicon
metaData.links.id_WoRMS = '282917'; % WoRMS
metaData.links.id_fishbase = 'Sympterygia-bonapartii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sympterygia_bonapartii}}';   % replace my_pet by latin species name
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
bibkey = 'JaneMeij2018'; type = 'Article'; bib = [ ... 
'doi = {10.1590/1982-0224-20180013}, ' ...
'author = {Julieta A. Ja\~{n}ez and Fernando J. Meijide and Luis O. Lucifora and Carolina Abraham and Federico Argemi}, ' ...
'year = {2018}, ' ...
'title  = {Growth and reproduction in captivity unveils remarkable life-history plasticity in the smallnose fanskate, \emph{Sympterygia bonapartii} ({C}hondrichthyes: {R}ajiformes)}, ' ...
'journal = {Neotropical Ichthyology}, ' ...
'volume = {16(4)}, ' ...
'pages = {e180013}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Sympterygia-bonapartii.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

