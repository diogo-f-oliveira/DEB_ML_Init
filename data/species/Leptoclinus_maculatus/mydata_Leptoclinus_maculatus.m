function [data, auxData, metaData, txtData, weights] = mydata_Leptoclinus_maculatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Stichaeidae';
metaData.species    = 'Leptoclinus_maculatus'; 
metaData.species_en = 'Daubed shanny'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MPN','MAN','MN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mnf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 16];

%% set data
% zero-variate data

data.am = 17*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(2.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Stichaeus punctatus';
  
data.Lp  = 12.5;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'fishbase'; 
data.Li  = 20;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';
  
data.Wwb = 2.6e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7 mm of Stichaeus_punctatus: pi/6*0.17^3';
data.Wwp = 6.1;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00355*Lp^2.95, see F1';
data.Wwi = 24.4; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';  
  comment.Wwi = 'based on 0.00355*Li^2.95, see F1';

data.Ri  = 2793/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 11 cm';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(2.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
2.809	10.148
3.241	8.945
3.694	10.200
3.846	10.462
4.019	10.043
4.040	8.945
4.170	8.945
4.667	12.135
4.731	10.357
4.796	8.945
4.818	9.991
4.861	10.775
4.991	11.037
4.992	8.945
5.012	9.938
5.164	9.102
5.250	10.775
5.315	11.142
5.660	9.572
5.704	13.495
5.705	10.148
5.747	12.345
5.769	10.775
5.833	10.985
5.898	12.292
5.963	9.625
5.985	10.043
6.136	12.606
6.179	9.782
6.222	13.338
6.395	11.978
6.698	12.502
6.699	11.822
6.719	13.443
6.762	12.972
6.806	10.462
6.849	9.938
6.870	12.449
6.914	10.723
7.043	12.920
7.238	10.671
7.346	13.862
7.367	11.612
7.735	11.717
7.756	13.234
7.843	13.600
7.994	14.018
8.059	11.769
8.167	12.658
8.296	12.345
8.404	11.874
8.901	12.868
9.182	13.548
9.183	13.234
9.398	13.182
10.154	12.292
10.370	14.332];
data.tL_f(:,1) = 365 * (0.3 + data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f   = C2K(1.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'OteHop2014'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.917	8.735
3.090	9.520
3.219	9.311
3.954	9.468
4.083	10.462
4.191	8.840
4.299	10.723
4.818	12.449
4.969	8.160
5.077	14.018
5.207	12.031
5.704	12.135
5.725	10.148
5.769	11.822
5.790	13.234
5.812	10.305
5.833	13.077
5.834	11.822
5.941	13.914
5.942	11.926
5.963	9.834
6.006	12.920
6.007	12.135
6.114	11.142
6.157	10.671
6.179	11.351
6.222	13.600
6.223	12.606
6.224	11.978
6.373	9.834
6.611	12.763
6.654	11.560
6.741	12.188
6.762	14.437
6.827	13.025
6.870	11.298
6.871	11.717
6.872	12.031
6.892	13.600
6.914	13.286
6.935	12.188
6.957	11.455
6.978	12.554
7.022	13.129
7.086	11.926
7.130	12.868
7.151	14.123
7.281	12.135
7.346	11.717
7.735	13.338
7.756	10.671
7.778	13.286
7.779	12.658
7.907	12.972
7.908	11.455
7.929	14.698
7.972	13.129
7.994	12.135
8.037	14.437
8.038	12.345
8.167	13.391
8.188	14.803
8.275	13.234
8.340	12.658
8.383	13.077
8.685	12.502
8.686	12.815
8.793	15.431
8.794	12.188
8.815	13.495
8.923	14.018
8.966	15.222
9.008	14.960
9.009	11.455
9.031	11.926
9.052	13.286
9.073	14.280
9.074	14.332
9.269	13.443
9.290	12.658
9.787	13.443
9.960	14.855
10.003	14.280
10.068	12.188
10.133	13.862
10.198	14.855
10.284	14.018
10.327	13.495
10.738	14.646
10.846	14.332
10.932	13.600
11.213	12.972
12.120	14.751
12.207	15.378
12.272	14.385
12.336	13.600];
data.tL_m(:,1) = 365 * (0.3 + data.tL_m(:,1)); % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m   = C2K(1.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'OteHop2014'; 

% time-weight
data.tW_f = [ ... % time since birth (yr), weight (g)
2.874	2.825
3.370	1.465
3.827	4.237
3.933	3.191
3.997	2.563
4.343	2.406
4.540	4.237
4.625	3.348
4.626	3.609
4.645	2.406
4.799	3.975
4.847	8.422
4.970	3.086
5.123	4.289
5.143	3.295
5.252	3.662
5.644	6.382
5.706	4.342
5.900	3.400
5.901	3.818
6.013	7.428
6.078	7.271
6.161	5.231
6.162	5.649
6.288	3.191
6.336	6.695
6.421	5.545
6.730	10.409
6.769	7.062
6.829	3.400
6.831	5.440
6.904	11.612
6.960	4.603
7.006	6.486
7.048	5.597
7.051	8.003
7.246	8.788
7.327	4.760
7.719	6.643
7.826	5.754
7.828	7.480
7.982	9.938
8.007	12.502
8.020	5.440
8.105	4.917
8.107	6.068
8.239	7.898
8.306	9.938
8.322	5.754
8.325	7.532
8.694	9.102
8.803	9.468
9.126	8.683
9.213	9.677
9.317	5.911
9.342	9.049
9.405	7.218
9.733	10.357
9.881	8.055
10.205	8.212];
data.tW_f(:,1) = 365 * (0.3 + data.tW_f(:,1)); % convert yr to d
units.tW_f  = {'d', 'cm'};  label.tW_f = {'time since birth', 'total length', 'females'};  
temp.tW_f   = C2K(1.8);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'OteHop2014'; 
%
data.tW_m = [ ... % time since birth (yr), total length (cm)
2.745	2.982
2.831	2.511
3.739	2.825
3.978	3.923
4.084	2.720
4.214	3.086
4.786	10.671
4.931	6.382
5.013	2.511
5.323	8.735
5.670	9.468
5.712	8.631
5.752	5.858
5.754	7.637
5.791	2.772
5.820	8.369
5.821	9.258
5.859	5.649
5.891	13.391
5.904	6.382
5.921	3.243
5.924	5.858
5.956	13.600
6.016	10.148
6.030	3.714
6.077	7.166
6.080	9.102
6.141	6.486
6.179	1.988
6.189	9.834
6.207	6.957
6.245	2.982
6.249	6.172
6.272	7.637
6.290	4.498
6.293	7.062
6.706	8.683
6.727	8.108
6.732	12.292
6.749	8.578
6.833	6.852
6.858	9.415
6.878	8.474
6.882	11.194
6.923	9.886
6.965	8.997
7.013	12.711
7.092	6.486
7.093	7.323
7.101	13.809
7.113	5.858
7.118	10.148
7.137	7.951
7.199	6.120
7.200	6.486
7.201	7.218
7.202	8.160
7.203	9.102
7.204	9.572
7.264	5.545
7.309	7.114
7.377	9.782
7.680	10.462
7.699	8.317
7.704	12.083
7.722	9.049
7.743	8.631
7.783	6.643
7.887	3.191
7.979	7.742
7.984	11.142
8.005	10.671
8.046	9.258
8.088	8.265
8.111	9.572
8.129	6.120
8.160	13.652
8.262	8.945
8.765	14.175
8.780	8.735
8.806	12.031
8.891	10.985
8.913	11.612
9.016	7.375
9.082	8.108
9.083	8.683
9.084	9.991
9.101	6.591
9.152	12.606
9.167	7.009
9.175	13.182
9.190	8.369
9.258	10.985
9.272	5.022
9.362	7.323
9.369	12.920
9.693	12.868
9.713	11.978
9.750	7.114
9.820	11.037
9.862	10.514
9.904	9.311
9.924	7.585
10.102	12.135
10.115	5.126
10.146	12.397
10.968	13.443
10.970	14.803
11.135	8.683
11.244	9.729
11.747	13.966
11.876	13.548
12.214	7.428
12.263	12.449];
data.tW_m(:,1) = 365 * (0.3 + data.tW_m(:,1)); % convert yr 
units.tW_m  = {'d', 'cm'};  label.tW_m = {'time since birth', 'total length', 'males'};  
temp.tW_m   = C2K(1.8);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'OteHop2014'; 

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
set1 = {'tL_f','tL_m'}; subtitle1 = {'data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00355*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6PF88'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46574693'; % Ency of Life
metaData.links.id_Wiki = 'Leptoclinus_maculatus'; % Wikipedia
metaData.links.id_ADW = 'Leptoclinus_maculatus'; % ADW
metaData.links.id_Taxo = '178588'; % Taxonomicon
metaData.links.id_WoRMS = '127072'; % WoRMS
metaData.links.id_fishbase = 'Leptoclinus-maculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leptoclinus_maculatus}}';
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
bibkey = 'OteHop2014'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-014-1481-2}, ' ...
'author = {Camilla A. Meyer Ottesen and Haakon Hop and Stig Falk-Petersen and J{\o}rgen S. Christiansen}, ' ... 
'year = {2014}, ' ...
'title = {Growth of daubed shanny ({T}eleostei: \emph{Leptoclinus maculatus}) in {S}valbard waters}, ' ...
'journal = {Polar Biol.}, ' ...
'volume = {37}, ' ...
'pages = {809–815}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Leptoclinus-maculatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
