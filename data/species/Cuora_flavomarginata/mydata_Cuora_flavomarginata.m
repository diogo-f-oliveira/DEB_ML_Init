function [data, auxData, metaData, txtData, weights] = mydata_Cuora_flavomarginata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Geoemydidae';
metaData.species    = 'Cuora_flavomarginata'; 
metaData.species_en = 'Chinese box turtle'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bTd', 'biFm', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 11];              
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

data.ab = 85;     units.ab = 'd';    label.ab = 'age at birth';      bibkey.ab = 'ADW';
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '68 till 101 d';
data.tp = 14*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for female';      bibkey.tp = 'ADW';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 13*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for male';      bibkey.tpm = 'ADW';
  temp.tpm = C2K(24);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 19.1*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 4.2; units.Lb = 'cm';   label.Lb = 'carapace length at birth';                bibkey.Lb = 'ChenLue2002';
data.Lp = 14.6;  units.Lp = 'cm';   label.Lp = 'carapace length at puberty for female';  bibkey.Lp = 'ChenLue2002';
data.Lpm = 13.1;  units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for male'; bibkey.Lpm = 'ChenLue2002';
data.Li = 16.7;  units.Li = 'cm';   label.Li = 'ultimate carapace length for female';   bibkey.Li = 'ChenLue2002';
data.Lim = 16.1; units.Lim = 'cm';  label.Lim = 'ultimate carapace length for male';  bibkey.Lim = 'ChenLue2002';

data.Wwb = 10; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                bibkey.Wwb = 'ADW';
  comment.Wwb = '8 till 13 g';
data.Wwp = 668; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';  bibkey.Wwp = {'ADW','ChenLue2002'};
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwpm = 483; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males'; bibkey.Wwpm = {'ADW','ChenLue2002'};
  comment.Wwpm = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 1000;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';    bibkey.Wwi = 'ADW';
data.Wwim = 896; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';      bibkey.Wwim = {'ADW','ChenLue2002'};
  comment.Wwim = 'based on (Lim/Li)^3*Wwi';

data.Ri  = 9/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL_f = [ ... % time (d), carapace length (cm)
0.000	4.196
1.002	4.397
1.906	5.519
1.971	5.320
2.035	6.142
2.972	5.745
2.972	7.215
3.005	6.318
4.006	6.419
4.006	6.892
4.006	7.963
4.975	8.014
4.975	8.139
5.008	7.790
5.008	8.912
5.137	7.915
5.977	8.041
5.977	8.215
5.977	8.389
6.009	8.913
6.946	8.291
6.946	9.587
6.978	7.917
7.011	8.914
7.915	9.787
7.980	7.968
7.980	8.915
7.980	9.962
8.982	8.817
8.982	10.287
9.886	10.961
9.918	10.537
10.952	11.111
10.952	11.360
8.885	10.860
8.982	11.931
9.918	11.459
9.918	11.783
10.015	13.652
10.048	13.128
10.952	13.080
10.952	13.279
10.952	13.478
10.952	13.802
10.952	13.927
10.952	14.051
10.952	11.311
11.922	11.910
11.922	12.109
11.954	12.807
11.954	13.305
11.954	13.579
11.954	13.679
11.954	13.803
12.891	13.132
12.891	13.705
12.891	15.374
12.891	15.524
12.891	15.599
12.923	13.954
12.923	15.175
12.955	11.288
12.955	14.154
12.988	14.652
13.020	12.733
13.925	13.905
13.925	14.229
13.925	14.553
13.957	14.753
13.957	14.902
13.957	15.002
13.957	15.151
13.957	15.575
13.957	15.824
14.894	15.875
14.894	16.074
14.926	14.206
14.926	15.402
14.926	15.601
14.926	15.726
14.958	14.878
14.958	15.078
14.958	15.202
14.958	16.598
15.895	16.300
15.895	16.574
15.895	17.097
15.928	15.328
15.960	14.032
15.960	14.356
15.960	14.680
15.960	15.154
15.992	14.905
15.992	15.752
16.897	14.706
16.897	15.329
16.897	15.479
16.897	16.525
16.897	16.625
16.897	16.874
16.897	17.622
16.929	14.831
16.929	14.956
16.929	15.778
16.929	15.977
16.929	16.201
16.994	13.859
17.931	15.007
17.931	15.804
17.931	15.978
17.931	16.502
17.963	15.654];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'carapace length', 'female'};  
temp.tL_f    = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ChenLue2002';
comment.tL_f = 'Data for females, temp is guessed';
%
data.tL_m = [ ... % time (d), carapace length (cm)
0.000	4.196
1.002	4.397
1.906	5.519
1.971	5.320
2.035	6.142
2.972	5.745
2.972	7.215
3.005	6.318
4.006	6.419
4.006	6.892
4.006	7.963
4.975	8.014
4.975	8.139
5.008	7.790
5.008	8.912
5.137	7.915
5.977	8.041
5.977	8.215
5.977	8.389
6.009	8.913
6.946	8.291
6.946	9.587
6.978	7.917
7.011	8.914
7.915	9.787
7.980	7.968
7.980	8.915
7.980	9.962
8.982	8.817
8.982	10.287
9.886	10.961
9.918	10.537
10.952	11.111
10.952	11.360
8.982	10.710
8.982	11.109
8.982	11.856
9.014	11.557
9.014	11.732
9.918	10.637
9.951	11.608
10.048	11.957
10.048	12.481
10.952	10.912
10.952	12.083
10.952	12.257
10.952	12.482
10.952	12.905
10.985	11.410
11.954	11.810
11.986	12.010
11.986	12.707
11.986	13.006
11.986	14.053
12.018	12.209
12.891	13.007
12.923	12.110
12.923	12.235
12.923	12.335
12.923	12.683
12.923	12.758
12.923	12.883
12.955	13.132
12.955	13.281
12.955	13.531
13.860	14.105
13.925	14.329
13.957	12.211
13.957	12.361
13.957	12.535
13.957	13.009
13.957	13.108
13.957	13.258
13.957	13.357
13.957	13.507
14.022	12.710
14.894	15.252
14.926	13.757
14.926	14.330
14.958	13.408
14.958	13.608
14.958	14.455
14.958	14.704
14.991	13.907
15.895	14.207
15.928	14.356
15.928	14.581
15.960	14.730
15.960	15.378
15.960	15.602
15.992	14.930
16.897	14.557
16.929	13.411
16.929	15.205
16.929	15.703
16.929	16.326
16.929	16.500
17.931	15.480
17.963	14.633
17.963	14.807
17.963	15.306
17.963	16.103];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'carapace length', 'male'};  
temp.tL_m    = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ChenLue2002';
comment.tL_m = 'Data for males, temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
%weights.tL_f = 5 * weights.tL_f;
%weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'This species is known to hybridize with the Chinese pond turtle, the Japanese pond turtle, and the Chinese stripe-necked turtle';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Can bring the plastron to the edges of the carapace, so becoming a closed box';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'Omnovorous';
metaData.bibkey.F3 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '6BRPF'; % Cat of Life
metaData.links.id_ITIS = '551909'; % ITIS
metaData.links.id_EoL = '1056709'; % Ency of Life
metaData.links.id_Wiki = 'Cuora_flavomarginata'; % Wikipedia
metaData.links.id_ADW = 'Cuora_flavomarginata'; % ADW
metaData.links.id_Taxo = '48541'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Cuora&species=flavomarginata'; % ReptileDB
metaData.links.id_AnAge = 'Cuora_flavomarginata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cuora_flavomarginata}}';
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
bibkey = 'ChenLue2002'; type = 'Article'; bib = [ ... 
'author = {T.-H. Chen and K.-Y. Lue}, ' ... 
'year = {2002}, ' ...
'title = {Growth Patterns of the Yellow-Margined Box Turtle (\emph{Cuora flavomarginata}) in {N}orthern {T}aiwan}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {36}, ' ...
'number = {2}, ' ...
'pages = {201-208}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cuora_flavomarginata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Cuora_flavomarginata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

