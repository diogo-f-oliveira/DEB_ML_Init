function [data, auxData, metaData, txtData, weights] = mydata_Crotalus_oreganus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Viperidae';
metaData.species    = 'Crotalus_oreganus'; 
metaData.species_en = 'Western rattlesnake'; 

metaData.ecoCode.climate = {'BWk', 'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 70;     units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'ADW';
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '27 to 32 C; 5 to 16 weeks incubation';
data.tp = 3*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'DillWall2002';
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'DillWall2002';
  temp.tpm = C2K(25); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 24*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 27.4;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';     bibkey.Lb  = 'DillWall2002';  
data.Lp  = 58.8;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';      bibkey.Lp  = 'DillWall2002';  
data.Lpm  = 51.8;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';      bibkey.Lpm  = 'DillWall2002';  
data.Li  = 68.3;    units.Li  = 'cm';  label.Li  = 'ultimate SVL of females';  bibkey.Li  = 'DillWall2002';
data.Lim  = 75.1;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL of males';  bibkey.Lim  = 'DillWall2002';

data.Wwb = 14.5;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'DillWall2002';
  comment.Wwb = '10 to 21 g';
data.Wwi = 226.9;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of females';  bibkey.Wwi = 'DillWall2002';
data.Wwim = 279.3;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of males'; bibkey.Wwim = 'DillWall2002';
  
data.Ri  = 8/365/1.5;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'DillWall2002';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 to 8 young per clutch, mostly 1 clutch each 2 yrs';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
0.003	30.507
0.001	24.353
0.043	26.633
0.064	31.648
0.109	29.598
0.110	25.268
0.154	27.092
0.220	30.968
0.220	27.777
0.243	25.954
0.398	29.832
0.620	34.168
0.620	31.433
0.821	29.842
0.842	33.717
0.861	47.621
0.862	44.202
0.864	37.820
0.864	34.857
0.885	39.872
0.907	42.608
0.954	33.264
1.016	50.815
1.018	44.206
1.041	39.192
1.043	31.898
1.085	41.472
1.086	37.370
1.105	49.222
1.107	42.612
1.109	34.863
1.220	38.512
1.243	35.094
1.307	44.896
1.328	49.455
1.486	41.937
1.574	46.270
1.862	52.202
1.904	59.041
1.930	47.645
1.930	46.050
1.975	44.455
2.018	52.661
2.039	54.941
2.198	45.144
2.349	60.418
2.726	66.809
2.748	68.860
2.796	57.693
2.972	65.447
2.996	59.749
3.065	51.090
3.085	57.016
3.262	61.807
3.305	68.417
3.330	59.073
3.350	65.911
3.397	56.340
3.441	60.671
3.507	62.268
3.508	60.673
3.573	64.777
3.707	64.096
3.930	62.961
3.997	61.140
4.019	64.559
4.043	58.406
4.064	62.509
4.107	66.384
4.286	64.565
4.465	61.378
5.041	71.876
5.220	68.917
5.287	70.286
5.353	73.250
5.356	60.943
5.378	63.678
5.443	66.871
5.489	62.313
5.888	70.072
5.890	63.462
5.931	74.403
6.111	67.342
7.003	65.767
7.136	66.909
7.315	65.546
7.871	65.558];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'DillWall2002';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
0.049	25.965
0.050	26.880
0.072	28.709
0.095	31.452
0.140	31.910
0.161	26.196
0.184	29.854
0.228	28.027
0.274	33.513
0.296	30.999
0.339	26.658
0.340	29.172
0.474	29.861
0.541	31.691
0.631	36.264
0.699	38.094
0.719	33.066
0.720	35.352
0.745	43.810
0.788	39.011
0.876	36.727
0.879	44.727
0.900	43.128
0.920	33.757
0.966	39.015
0.969	47.701
0.989	40.158
0.991	48.387
1.147	49.076
1.169	48.391
1.170	52.048
1.190	43.591
1.212	41.992
1.259	49.536
1.278	39.479
1.303	50.451
1.322	37.194
1.414	48.168
1.415	51.825
1.480	46.112
1.750	53.890
1.793	50.005
1.817	55.491
1.971	47.038
1.972	52.752
1.974	57.781
1.974	59.152
2.060	48.411
2.127	47.270
2.131	63.499
2.151	55.042
2.152	59.156
2.195	54.129
2.196	58.472
2.264	61.673
2.329	56.189
2.511	68.764
2.575	58.709
2.707	52.997
2.712	70.598
2.753	57.570
2.798	60.771
2.954	59.632
3.042	55.519
3.089	64.435
3.222	60.781
3.222	63.524
3.311	62.840
3.511	60.102
3.649	75.648
3.802	66.280
3.980	66.284
4.002	63.770
4.027	74.742
4.496	77.953
4.717	72.015
4.805	66.988
4.808	77.731
5.051	71.565
5.094	67.681
5.185	73.397
5.677	80.037
5.873	66.098
5.876	74.556
6.030	68.159
6.345	78.681
7.121	68.184
7.147	82.128
8.326	76.669
8.772	77.593];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'DillWall2002';
comment.tL_m = 'Data for males';

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Sex is determined by incubation temperature';
metaData.bibkey.F1 = 'retileDB'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'ZPCJ'; % Cat of Life
metaData.links.id_ITIS = '209548'; % ITIS
metaData.links.id_EoL = '289213'; % Ency of Life
metaData.links.id_Wiki = 'Crotalus_oreganus'; % Wikipedia
metaData.links.id_ADW = 'Crotalus_oreganus'; % ADW
metaData.links.id_Taxo = '337016'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Crotalus&species=oreganus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crotalus_oreganus}}';
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
bibkey = 'DillWall2002'; type = 'Article'; bib = [ ... 
'author = {Lowell V. Diller and Richard L. Wallace}, ' ... 
'year = {2002}, ' ...
'title = {GROWTH, REPRODUCTION, AND SURVIVAL IN A POPULATION OF \emph{Crotalus viridis oreganus}  IN NORTH CENTRAL {I}DAHO}, ' ...
'journal = {Herpetological Monographs}, ' ...
'volume = {16}, ' ...
'pages = {26-45}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Crotalus_viridis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Crotalus_horridus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'retileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{http://reptile-database.reptarium.cz/species?genus=Crotalus&species=oreganus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

