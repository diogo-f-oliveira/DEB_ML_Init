function [data, auxData, metaData, txtData, weights] = mydata_Melanochelys_tricarinata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Geoemydidae';
metaData.species    = 'Melanochelys_tricarinata'; 
metaData.species_en = 'Tricarinate hill turtle'; 

metaData.ecoCode.climate = {'Am', 'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bTd', 'biFm', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 29];              
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

data.ap = 6.5*365;     units.ap = 'd';    label.ap = 'age at puberty for female'; bibkey.ap = 'KumaHari2010';
  temp.ap = C2K(20);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 16*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'KumaHari2010';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 3.3; units.Lb = 'cm';   label.Lb = 'carapace length at birth';             bibkey.Lb = 'KumaHari2010';
data.Lp = 11;  units.Lp = 'cm';   label.Lp = 'carapace length at puberty for female';  bibkey.Lp = 'KumaHari2010';
data.Lpm = 11;  units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for male';  bibkey.Lpm = 'KumaHari2010';
data.Li = 15.1;  units.Li = 'cm';   label.Li = 'ultimate carapace length for female';  bibkey.Li = 'KumaHari2010';
data.Lim = 17.5; units.Lim = 'cm';  label.Lim = 'ultimate carapace length for male';   bibkey.Lim = 'KumaHari2010';

data.Wwb = 8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'KumaHari2010';
data.Wwi = 511;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';   bibkey.Wwi = 'KumaHari2010';
data.Wwim = 621; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'KumaHari2010';

data.Ri  = 9/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Mauremys reevesii';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time (d), straight carapace length (cm)
0.960	4.183
0.960	4.011
0.960	3.769
0.979	3.631
0.999	5.531
0.999	4.874
0.999	4.356
0.999	3.493
0.999	3.320
1.978	5.880
2.017	5.742
2.037	6.087
2.977	9.891
2.997	7.196
3.016	8.889
3.016	8.025
3.036	9.269
3.036	7.335
3.996	12.623
3.996	12.209
3.996	9.480
4.995	13.180
4.995	10.071
4.995	9.587
5.014	10.727
5.014	10.416
5.053	11.764
5.974	11.111
5.993	13.460
6.013	14.116
6.013	13.875
6.013	13.218
6.013	13.115
6.013	11.975
6.013	11.698
6.033	14.358
6.033	12.389
6.973	14.811
6.973	14.396
6.973	13.464
6.973	13.256
6.973	13.153
6.973	12.911
6.992	14.293
6.992	14.016
6.992	13.671
7.991	14.435
7.991	12.777
8.011	13.433
8.011	13.191
9.010	15.130
9.010	15.026
9.049	14.612
9.049	14.335
9.049	14.163
9.049	14.024
9.049	13.886
9.049	13.748
9.049	13.575
9.989	13.855
9.989	14.097
10.009	13.683
10.028	14.443
10.968	14.446
10.968	14.170
10.988	13.894
10.988	13.583
11.987	13.207
11.987	14.899
12.007	13.345
12.007	13.621
12.007	13.967
12.046	14.174
12.986	14.316
12.986	13.901
12.986	13.660
13.005	13.556
13.985	14.976
14.044	14.009
15.023	14.116
16.002	14.086];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'straight carapace length', 'female'};  
temp.tL_f    = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KumaHari2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time (d), straight carapace length (cm)
6.013	14.151
6.033	14.773
6.033	14.496
6.033	13.875
6.992	16.193
6.992	15.847
7.012	15.536
7.012	15.364
7.012	15.122
7.972	15.989
7.991	15.678
7.991	16.093
7.991	16.749
8.011	14.884
8.011	15.126
8.011	15.540
9.010	17.202
9.010	16.788
9.010	16.339
9.010	16.062
9.010	15.820
9.010	15.406
9.989	14.961
9.989	15.859
10.009	16.135
10.009	16.342
10.009	16.791
10.028	16.550
11.008	17.175
11.008	15.897
11.047	16.899
11.047	16.657
11.047	16.485
11.047	16.346
11.987	17.628
12.007	16.108
12.007	16.246
12.007	16.385
12.026	15.279
12.026	15.556
13.005	16.941
13.005	16.319
13.005	15.905
14.004	16.392
14.984	16.914
15.023	16.258
15.983	16.538];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'straight carapace length', 'male'};  
temp.tL_m    = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KumaHari2010';
comment.tL_m = 'Data for male, temp is guessed';

% length-weight
data.LW_f = [ ... % log straight carapace length (cm), log weight (g)
2.459	5.477
2.500	5.594
2.576	5.770
2.577	5.787
2.582	5.931
2.585	5.877
2.585	5.914
2.589	5.839
2.591	5.951
2.593	5.914
2.599	5.839
2.614	5.944
2.623	5.766
2.625	5.976
2.628	5.998
2.630	5.963
2.632	5.994
2.635	6.047
2.635	5.931
2.636	5.897
2.642	5.912
2.642	5.963
2.645	6.049
2.651	6.049
2.657	5.978
2.658	6.000
2.663	6.067
2.665	6.105
2.666	5.996
2.668	6.086
2.674	6.202
2.692	6.073
2.699	6.028
2.715	6.241];
data.LW_f = exp(data.LW_f); % remove log transformation
units.LW_f   = {'cm', 'g'};  label.LW_f = {'straight carapace length', 'wet weight', 'female'};  
bibkey.LW_f = 'KumaHari2010';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % log straight carapace length (cm), log weight (g)
2.540	5.637
2.568	5.708
2.577	5.720
2.634	5.787
2.635	5.811
2.649	5.929
2.653	5.895
2.659	5.830
2.672	5.951
2.702	6.037
2.708	6.015
2.708	6.054
2.708	6.080
2.714	6.080
2.714	6.011
2.721	6.067
2.733	6.146
2.733	6.133
2.737	6.153
2.738	6.099
2.739	6.234
2.742	6.170
2.752	6.174
2.759	6.329
2.759	6.217
2.760	6.234
2.760	6.183
2.760	6.260
2.761	6.155
2.763	6.174
2.765	6.243
2.774	6.265
2.776	6.185
2.776	6.299
2.777	6.159
2.779	6.181
2.784	6.286
2.787	6.226
2.788	6.271
2.795	6.252
2.808	6.346
2.816	6.260
2.819	6.320
2.827	6.417
2.861	6.432];
data.LW_m = exp(data.LW_m); % remove log transformation
units.LW_m   = {'cm', 'g'};  label.LW_m = {'straight carapace length', 'wet weight', 'male'};  
bibkey.LW_m = 'KumaHari2010';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
set2 = {'LW_f', 'LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3Z899'; % Cat of Life
metaData.links.id_ITIS = '551933'; % ITIS
metaData.links.id_EoL = '1056096'; % Ency of Life
metaData.links.id_Wiki = 'Melanochelys_tricarinata'; % Wikipedia
metaData.links.id_ADW = 'Melanochelys_tricarinata'; % ADW
metaData.links.id_Taxo = '460333'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Melanochelys&species=tricarinata'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Melanochelys_tricarinata}}';
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
bibkey = 'KumaHari2010'; type = 'Article'; bib = [ ... 
'author = {R. Suresh Kumar and Abishek Harihar and Bivash Pandav}, ' ... 
'year = {2010}, ' ...
'title = {Population characteristics of a terrestrial geoemydid, \emph{Melanochelys tricarinata}, from the {D}oon {V}alley, northern {I}ndia}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {20}, ' ...
'pages = {139-146}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
