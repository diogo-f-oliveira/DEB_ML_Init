function [data, auxData, metaData, txtData, weights] = mydata_Salamandra_lanzai

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Salamandra_lanzai'; 
metaData.species_en = 'Lanza''s alpine salamander'; 

metaData.ecoCode.climate = {'ET'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'biTg', 'biTf'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 17];              
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

data.ab = 3.5*365;  units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'MiauAndre2001';
  temp.ab = C2K(3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '3 till 4 yr in utero; long time linked to short season (< 3 months)';
data.tj = 4.5*30.5;  units.tj = 'd';    label.tj = 'time since birth at metam';             bibkey.tj = 'guess';
  temp.tj = C2K(12);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'guess based on length season';
data.tp = 6*365;  units.tp = 'd';    label.tp = 'time since birth at puberty';         bibkey.tp = 'MiauAndre2001';
  temp.tp = C2K(3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'MiauAndre2001';
  temp.tpm = C2K(3);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = '3 till 5 yr';
data.am = 24*365;  units.am = 'd';    label.am = 'life span';                          bibkey.am = 'MiauAndre2001';   
  temp.am = C2K(3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.3;  units.Lb  = 'cm';  label.Lb  = 'SVL at birth';                        bibkey.Lb  = 'guess';
  comment.Lb = 'guess based on same relative length, compared to S. salamandra: (3.6/25)*9.1';
data.Lj  = 3.4;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';                        bibkey.Lj  = 'MiauAndre2001'; 
data.Lp  = 6.6;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for males';            bibkey.Lp  = 'MiauAndre2001'; 
data.Lpm  = 7.0; units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';          bibkey.Lpm  = 'MiauAndre2001'; 
data.Li  = 9.1;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';            bibkey.Li  = 'MiauAndre2001';
data.Lim  = 9.3; units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';            bibkey.Lim  = 'MiauAndre2001';
  comment.Lim = '16 cm TL, EoL';

data.Wwb = 0.125; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on samle relative weight, compared to S. salamandra: (0.25/40)*20';
data.Wwj = 1.5;  units.Wwj = 'g';   label.Wwj = 'wet weight at metam';                 bibkey.Wwj = 'MiauAndre2001';
data.Wwp = 8;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'MiauAndre2001';
data.Wwpm = 8.5; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';   bibkey.Wwpm = 'MiauAndre2001';
data.Wwi = 20;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'MiauAndre2001';
data.Wwim = 15.5;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'MiauAndre2001';

data.Ri = 6/(3.5*365); units.Ri = '#/d';   label.Ri = 'reprod rate at 25.3 g';         bibkey.Ri = 'EoL';
  temp.Ri = C2K(3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'upto 6 young per clutch, 3.5 yr in utero';

% univariate data

% time-length
data.tL_fw = [... % time since birth (yr), SVL (cm)
0.977	4.203
3.010	7.112
3.019	6.130
3.953	8.557
3.982	5.609
3.987	8.778
4.012	6.291
4.910	8.477
4.919	7.555
4.935	5.951
5.947	7.897
5.949	7.696
5.957	6.854
6.870	7.577
6.872	7.396
6.876	7.035
6.971	8.519
6.976	8.098
6.977	7.898
6.978	7.817
7.933	8.019
7.942	7.116
7.965	8.500
7.966	8.400
7.998	8.901
8.009	7.778
8.011	7.618
8.012	7.497
8.013	7.357
8.896	7.438
8.962	8.180
8.964	8.040
8.968	7.639
9.887	7.740
9.891	7.339
9.919	8.241
9.920	8.081
9.959	7.880
10.026	8.602
10.845	7.620
10.918	7.741
10.944	8.763
10.946	8.643
10.947	8.543
10.951	8.102
10.953	7.921
10.953	7.861
11.968	9.506
11.972	9.105
11.977	8.544
11.979	8.343
11.980	8.223
11.981	8.142
11.983	7.982
11.992	7.040
12.010	8.945
12.012	8.804
12.012	8.704
12.935	8.504
12.936	8.344
12.937	8.223
12.940	8.003
12.942	7.762
12.970	8.705
13.019	7.441
13.021	7.221
13.897	7.964
13.898	7.843
13.920	9.327
13.924	8.926
13.966	8.465
13.969	8.124
14.849	8.526
14.880	9.027
14.883	8.787
14.887	8.386
14.893	7.764
14.925	8.265
14.932	7.543
14.953	9.148
14.963	8.085
15.844	8.366
15.879	8.507
15.883	8.186
15.884	8.045
15.931	7.023
15.947	9.169
15.951	8.727
15.952	8.647
16.946	8.588
16.977	9.149
16.984	8.508
16.985	8.367
16.987	8.187
16.988	8.046
16.990	7.886
16.991	7.746
17.940	8.629
17.942	8.368
17.946	8.007
18.893	9.031
19.852	8.831
21.948	9.033
21.950	8.833
21.989	8.572
21.995	7.950
22.949	8.252];
data.tL_fw(:,1) = data.tL_fw(:,1) * 365; % convert yr to d
units.tL_fw  = {'d', 'cm'}; label.tL_fw = {'time since birth', 'SVL', 'female'};  
temp.tL_fw   = C2K(3); units.temp.tL_fw = 'K'; label.temp.tL_fw = 'temperature';
bibkey.tL_fw = 'MiauAndre2001';
comment.tL_fw = 'Data for females, western population';
%
data.tL_mw = [... % time since birth (yr), SVL (cm)
0.908	4.237
0.912	3.738
0.913	3.698
0.916	3.419
1.894	5.495
1.896	5.276
1.934	5.116
2.966	5.497
2.968	5.317
3.960	5.957
3.961	5.818
3.963	5.678
4.877	6.737
7.939	7.440
7.941	7.280
7.967	8.338
7.979	7.101
9.900	7.324
10.849	8.642
10.931	7.804
10.932	7.704
11.956	8.823
11.961	8.304
11.963	8.145
11.964	8.085
12.048	7.008
12.926	7.987
12.932	7.428
12.934	7.209
12.960	8.306
12.961	8.206
13.003	7.728
13.923	8.148
13.926	7.829
13.948	9.305
13.994	8.428
14.955	8.509
14.958	8.190
14.960	8.010
14.962	7.751
14.965	7.512
15.915	8.670
15.921	8.032
15.953	8.550
15.955	8.311
15.957	8.152
15.968	7.054
16.954	8.233
16.956	8.113
16.956	8.034
16.958	7.874
16.959	7.734
16.989	8.492
17.988	8.374
18.029	7.995
21.978	8.800
22.018	8.481
22.061	7.922
23.019	8.243];
data.tL_mw(:,1) = data.tL_mw(:,1) * 365; % convert yr to d
n=size(data.tL_mw,1); for i=2:n; if data.tL_mw(i,1)<=data.tL_mw(i-1,1); data.tL_mw(i,1)=data.tL_mw(i-1,1)+1e-3; end; end
units.tL_mw  = {'d', 'cm'}; label.tL_mw = {'time since birth', 'SVL', 'male'};  
temp.tL_mw   = C2K(3); units.temp.tL_mw = 'K'; label.temp.tL_mw = 'temperature';
bibkey.tL_mw = 'MiauAndre2001';
comment.tL_mw = 'Data for males, western population';
%
data.tL_fe = [... % time since birth (yr), SVL (cm)
1.066	4.181
3.032	6.100
4.060	6.217
4.065	5.615
5.018	5.913
5.954	7.935
5.955	7.774
5.993	7.654
6.033	7.333
6.036	7.092
6.075	6.791
6.985	7.751
6.986	7.590
6.988	7.470
6.988	7.370
6.994	6.848
8.043	8.529
8.046	8.189
8.051	7.747
8.052	7.587
8.053	7.507
8.084	8.108
8.085	8.008
8.086	7.908
8.103	9.893
9.032	8.887
9.037	8.406
9.039	8.165
9.040	8.045
9.078	7.944
9.080	7.764
9.998	7.801
10.015	9.806
10.060	9.004
10.061	8.884
10.062	8.783
10.063	8.683
10.064	8.603
10.067	8.242
10.068	8.122
10.069	8.041
11.030	7.517
11.050	9.201
11.059	8.279
11.060	8.178
11.061	8.058
11.070	7.176
11.088	9.081
11.089	8.980
11.092	8.720
11.093	8.579
11.094	8.499
12.114	9.438
12.115	9.338
12.115	9.258
12.117	9.137
12.118	9.037
12.121	8.736
12.122	8.596
12.123	8.456
13.113	8.753
13.114	8.593
13.117	8.352
13.118	8.212
13.119	8.071
14.071	8.509
14.093	9.973
14.136	9.371
15.067	8.125
15.093	9.228
16.046	9.425
16.092	8.523
16.093	8.382
17.182	9.842
17.184	9.602
18.105	9.358
18.106	9.238
18.187	8.496
20.134	8.589
21.081	9.489
22.107	9.846];
data.tL_fe(:,1) = data.tL_fe(:,1) * 365; % convert yr to d
units.tL_fe  = {'d', 'cm'}; label.tL_fe = {'time since birth', 'SVL', 'female'};  
temp.tL_fe   = C2K(3); units.temp.tL_fe = 'K'; label.temp.tL_fe = 'temperature';
bibkey.tL_fe = 'MiauAndre2001';
comment.tL_fe = 'Data for females, eastern population';
%
data.tL_me = [... % time since birth (yr), SVL (cm)
0.907	3.644
0.910	3.344
0.938	4.182
0.942	3.763
1.918	5.435
1.920	5.216
1.922	5.036
2.910	5.452
2.913	5.233
3.972	5.927
3.974	5.728
3.975	5.588
4.847	6.642
8.046	6.452
9.904	8.181
9.980	7.842
9.985	7.383
10.972	7.879
10.974	7.679
12.038	7.875
12.072	8.234
12.951	8.530
12.952	8.411
12.990	8.311
12.994	7.872
12.996	7.672
13.916	7.570
13.917	7.430
13.951	7.749
13.978	8.686
13.980	8.507
13.982	8.307
14.023	7.908
15.015	7.945
15.020	7.367
15.891	8.560
15.893	8.341
17.026	8.996
17.069	8.297
17.073	7.898
17.988	8.354
18.066	7.895
19.092	8.191];
data.tL_me(:,1) = data.tL_me(:,1) * 365; % convert yr to d
n=size(data.tL_me,1); for i=2:n; if data.tL_me(i,1)<=data.tL_me(i-1,1); data.tL_me(i,1)=data.tL_me(i-1,1)+1e-3; end; end
units.tL_me  = {'d', 'cm'}; label.tL_me = {'time since birth', 'SVL', 'male'};  
temp.tL_me   = C2K(3); units.temp.tL_me = 'K'; label.temp.tL_me = 'temperature';
bibkey.tL_me = 'MiauAndre2001';
comment.tL_me = 'Data for males, eastern population';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fw','tL_mw'}; subtitle1 = {'Data for females, males of western population'};
set2 = {'tL_fe','tL_me'}; subtitle2 = {'Data for females, males of eastern population'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';     
D2 = 'Seasonal temperature is about 15 C, but off-season much colder; all temps are guessed';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3s',D3);  

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'MiauAndre2001'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6WZLG'; % Cat of Life
metaData.links.id_ITIS = '668394'; % ITIS
metaData.links.id_EoL = '331870'; % Ency of Life
metaData.links.id_Wiki = 'Salamandra_lanzai'; % Wikipedia
metaData.links.id_ADW = 'Salamandra_lanzai'; % ADW
metaData.links.id_Taxo = '151422'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Salamandra+lanzai'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Salamandra_salamandra}}';
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
bibkey = 'MiauAndre2001'; type = 'Article'; bib = [ ... 
'author = {C. Miaud and F. Andreone and A. Riberon and S. De Michelis and V. Clima and J. Castanet and H. Francillon-Vieillot and R. Guyetant}, ' ... 
'year = {2001}, ' ...
'title = {Variations in age, size at maturity and gestation duration among two neighbouring populations of the alpine salamander (\emph{Salamandra lanzai})}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {254}, ' ...
'pages = {251--260}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/species/4283}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'caudata'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.caudata.org/cc/species/Salamandra/Salamandra_sp.shtml}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/331870/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

