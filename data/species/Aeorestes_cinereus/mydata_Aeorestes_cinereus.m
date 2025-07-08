function [data, auxData, metaData, txtData, weights] = mydata_Aeorestes_cinereus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Aeorestes_cinereus'; 
metaData.species_en = 'Hoary bat'; 

metaData.ecoCode.climate = {'BSk','Cfa','Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 24];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 56;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 49;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'KoehBarc2000';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Wiki: female become mature in their 1st yr, males in their 2nd yr';
data.am = 14*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 4.73; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'KoehBarc2000';
data.Wwi = 30;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'KoehBarc2000';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter; 1 litter per yr';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
1.232	5.915
1.826	6.310
2.217	5.768
6.074	8.086
6.159	5.919
8.050	8.876
8.740	8.877
8.932	8.138
9.241	10.158
9.932	10.454
10.522	10.307
10.612	8.928
11.416	11.342
11.896	9.471
12.091	9.126
12.116	12.968
12.782	9.274
12.902	12.575
14.283	12.822
14.384	13.266
14.752	9.276
14.980	14.054
15.157	10.902
15.563	12.725
15.862	13.316
16.947	13.416
17.146	13.810
17.149	14.204
17.550	15.239
18.146	16.027
19.122	14.550
19.130	15.831
20.016	15.684
20.315	16.226
20.319	16.867
21.299	16.079
21.886	15.390
22.386	16.524
22.783	16.967
23.475	17.411
24.461	17.510
24.557	17.067
25.055	17.954
25.241	16.280
25.446	17.462
25.832	16.231
26.041	17.955
26.052	19.728
27.309	16.035
27.411	16.626
28.203	17.169
28.409	18.499
29.090	17.169
29.101	18.894
29.184	16.578
29.804	20.865
30.782	19.782
31.844	16.581
32.150	18.157
32.443	17.763
32.540	17.419
33.249	20.424
33.331	17.961
33.345	20.030
33.440	19.538
34.023	18.208
34.034	19.883
34.879	13.627
34.917	19.342
35.525	21.904
36.006	20.180
36.508	21.560
37.090	20.181
37.280	19.196
37.284	19.738
37.399	22.250
37.843	14.812
37.987	21.758
38.396	24.024
38.843	17.128
39.561	21.365
40.058	22.154
40.803	15.603
41.139	21.662
41.342	22.647
41.352	24.076
41.704	17.771
42.110	19.545
43.111	21.861
43.508	22.304
44.111	24.226
44.114	24.669
44.402	23.438
44.994	23.586
45.181	22.109
45.195	24.227
45.205	25.754
45.973	22.651
46.363	22.110
46.582	25.361
46.728	17.578
46.968	24.081
48.304	17.530
51.113	25.217
52.500	26.351];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(34.8);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'KoehBarc2000';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
0.160	3.943
0.924	3.895
1.222	4.339
2.995	4.291
3.194	4.587
3.984	4.784
4.081	4.587
5.973	7.692
6.058	5.574
6.843	5.181
7.855	9.270
8.232	6.561
8.532	7.300
9.223	7.498
10.132	10.848
10.797	7.154
10.988	6.219
11.005	8.731
11.187	6.514
12.309	12.377
12.476	7.698
12.706	12.821
12.791	10.703
14.378	12.280
14.856	10.113
14.943	8.389
15.143	8.784
15.751	11.444
15.768	13.907
17.811	10.067
17.814	10.461
17.930	13.072
17.944	15.239
18.311	11.151
19.126	15.240
19.726	16.571
20.405	14.995
20.605	15.340
21.480	13.616
21.698	16.868
21.960	11.646
21.963	12.090
22.675	15.489
23.369	16.278
24.838	14.801
24.867	19.235
25.730	15.689
25.845	18.152
26.018	14.458
26.021	14.999
26.326	16.379
27.694	14.656
28.993	17.514
30.361	15.742
30.575	18.304
30.661	16.432
30.664	16.875
31.646	16.334
33.041	18.798
33.914	16.681
33.920	17.666
34.311	17.075
34.815	18.898
35.317	20.327
35.699	18.456
35.890	17.569
36.397	19.737
36.781	18.210
36.982	18.752
37.765	18.014
37.866	18.359
37.968	18.950
37.978	20.477
39.051	18.803
39.352	19.641
40.840	21.169
41.905	18.313
42.011	19.397
43.005	20.777
43.276	16.984
43.585	19.053
44.376	19.596
44.979	21.320
45.169	20.237
46.559	21.913
47.058	22.849
47.516	17.579
48.891	16.989
52.672	22.558];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(34.8);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'KoehBarc2000';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'scaled function response during lactation is assume to be larger than post-weaning';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '8LV5N'; % Cat of Life
metaData.links.id_ITIS = '1157324'; % ITIS
metaData.links.id_EoL = '55635493'; % Ency of Life
metaData.links.id_Wiki = 'Aeorestes_cinereus'; % Wikipedia
metaData.links.id_ADW = 'Lasiurus_cinereus'; % ADW
metaData.links.id_Taxo = '168416'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13801897'; % MSW3
metaData.links.id_AnAge = 'Lasiurus_cinereus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aeorestes_cinereus}}';
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
bibkey = 'KoehBarc2000'; type = 'Article'; bib = [ ... 
'author = {Catherine E. Koehler and Robert M. R. Barclay}, ' ... 
'year = {2000}, ' ...
'title = {Post-Natal Growth and Breeding Biology of the Hoary Bat (\emph{Lasiurus cinereus})}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {81(1)}, ' ...
'pages = {234-244}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Lasiurus_cinereus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

