function [data, auxData, metaData, txtData, weights] = mydata_Odorrana_swinhoana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Odorrana_swinhoana'; 
metaData.species_en = 'Taiwan odorous frog'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'GSI'}; 
metaData.data_1     = {'t-L_Tf'; 'L-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 29];

%% set data
% zero-variate data

data.ab = 45;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'LaiLee2005';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 2.3;    units.Lj  = 'cm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'KamChen1998';
data.Lp  = 7.06;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'KamChen1998';
data.Lpm  = 5.06;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';   bibkey.Lpm  = 'KamChen1998';
data.Li  = 9;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'KamChen1998';
data.Lim  = 7.5;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'KamChen1998';

data.Wwb = 0.0141;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KamChen1998';
  comment.Wwb = 'based on egg diameter of 3 mm: pi/6*0.3^3';
data.Wwp = 40.6;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';  bibkey.Wwp = 'KamChen1998';
data.Wwpm = 14.8;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males'; bibkey.Wwpm = 'KamChen1998';

data.GSI  = 0.15; units.GSI  = '-'; label.GSI  = 'Gonado Somatic Index';  bibkey.GSI  = 'KamChen1998';   
  temp.GSI = C2K(10);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data
% time-length data
data.tL_Hfm = [ ... % time since puberty (yr), growth index (-)
 1	0.342 0.365
 2	0.482 0.505
 3	0.675 0.694
 4	0.869 0.841
 5	0.957 0.918
 6	1.027 0.969
 7	1.076 0.984
 8	1.145 NaN
 9	1.197 NaN
10	1.234 NaN
11	1.210 NaN];
data.tL_Hfm(:,2:3) = data.tL_Hfm(:,2:3) * 8.46/1.23; % convert growth index to SVL (cm)
data.tL_Hfm(:,1) = data.tL_Hfm(:,1) * 365; % convert yr since birth to d since puberty
units.tL_Hfm  = {'d', 'cm'};  label.tL_Hfm = {'time since metam', 'SVL'};  
temp.tL_Hfm   = C2K(16.7);  units.temp.tL_Hfm = 'K'; label.temp.tL_Hfm = 'temperature';
bibkey.tL_Hfm = 'LaiLee2005'; treat.tL_Hfm = {1, {'females','males'}}; 
comment.tL_Hfm = 'Data for females, 1600 m alt at lishing, temp from 1 to 17 C';
%
data.tL_Lfm = [ ... % time since puberty (yr), growth index (-)
1	0.330 0.328
2	0.460 0.466
3	0.627 0.567
4	0.736 0.605
5	0.788 0.596
6	0.788 0.611
7	0.864 NaN];
data.tL_Lfm(:,2:3) = data.tL_Lfm(:,2:3) * 7.26/0.864; % convert growth index to SVL (cm)
data.tL_Lfm(:,1) = data.tL_Lfm(:,1) * 365; % convert yr since birth to d since puberty
units.tL_Lfm  = {'d', 'cm'};  label.tL_Lfm = {'time since metam', 'SVL'};  
temp.tL_Lfm   = C2K(19.7);  units.temp.tL_Lfm = 'K'; label.temp.tL_Lfm = 'temperature';
bibkey.tL_Lfm = 'LaiLee2005'; treat.tL_Lfm = {1, {'females','males'}}; 
comment.tL_Lfm = 'Data for females, 200 m alt at Wulal, temp from 1 to 17 C';

% length-weight
data.LW_f = [ ... % SVL (cm), weight (g)
6.686	30.173
6.903	34.087
6.938	32.429
7.037	41.082
7.071	41.201
7.085	38.475
7.117	42.861
7.156	34.210
7.208	43.929
7.212	37.885
7.232	42.389
7.260	34.685
7.303	38.834
7.308	30.538
7.371	42.272
7.395	39.547
7.398	34.095
7.429	40.851
7.464	39.311
7.466	36.229
7.468	33.622
7.486	41.563
7.490	34.452
7.534	38.956
7.536	54.482
7.575	47.727
7.582	35.638
7.603	39.194
7.648	40.617
7.654	30.069
7.662	36.825
7.670	41.921
7.671	41.328
7.679	46.425
7.688	51.877
7.716	43.581
7.719	38.011
7.751	42.515
7.764	39.315
7.774	41.923
7.791	53.538
7.795	46.545
7.803	52.234
7.810	40.382
7.819	44.886
7.823	37.183
7.852	46.072
7.855	41.687
7.916	35.051
7.943	48.444
7.945	46.073
7.996	37.541
8.005	41.096
8.041	38.490
8.052	39.912
8.060	46.549
8.062	42.282
8.086	40.742
8.094	46.787
8.095	45.483
8.104	49.157
8.175	47.025
8.195	51.647
8.213	60.774
8.216	54.848
8.371	66.465
8.393	47.621
8.395	64.213
8.431	62.792
8.449	50.821
8.491	58.289
8.540	53.193
8.541	71.090
8.617	58.883
8.714	70.499
8.738	50.233
8.990	72.281
9.085	67.068
9.127	55.335
9.157	62.091];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'weight', 'females'};  
bibkey.LW_f = 'KamChen1998'; 
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % SVL (cm), weight (g)
2.265	0.952
2.299	1.190
2.495	1.430
3.611	4.291
3.923	4.532
4.634	9.402
5.058	15.097
5.106	11.542
5.125	17.706
5.159	19.484
5.188	9.647
5.227	20.552
5.333	17.709
5.376	22.094
5.378	19.961
5.382	12.850
5.462	14.274
5.472	16.170
5.472	15.933
5.482	18.303
5.530	15.697
5.564	15.816
5.565	14.038
5.598	18.305
5.630	21.387
5.666	19.728
5.668	17.002
5.701	18.544
5.723	21.270
5.748	18.070
5.791	22.338
5.792	20.441
5.793	19.849
5.794	17.123
5.802	22.812
5.805	18.545
5.814	22.101
5.815	21.034
5.851	18.902
5.852	17.598
5.852	16.413
5.859	23.998
5.885	20.206
5.886	17.480
5.907	21.865
5.919	21.273
5.929	23.288
5.932	18.429
5.943	19.495
5.944	17.244
5.976	22.340
5.978	18.548
6.011	20.800
6.012	19.971
6.020	25.067
6.021	23.408
6.025	16.652
6.033	22.104
6.042	27.082
6.048	17.008
6.069	20.683
6.070	18.549
6.091	22.816
6.104	19.498
6.115	21.394
6.124	24.950
6.128	18.076
6.157	27.795
6.162	19.025
6.172	21.869
6.175	17.129
6.183	23.410
6.184	20.447
6.194	22.699
6.198	17.129
6.207	21.159
6.208	19.973
6.228	23.766
6.251	24.833
6.254	19.263
6.254	18.789
6.255	18.078
6.264	22.108
6.276	21.160
6.287	22.819
6.296	25.782
6.319	26.968
6.320	25.545
6.320	24.242
6.334	20.331
6.334	20.094
6.344	23.413
6.345	20.924
6.346	19.027
6.364	28.509
6.388	27.680
6.389	25.191
6.389	24.835
6.403	21.280
6.434	27.325
6.436	23.888
6.436	23.177
6.479	28.866
6.481	24.718
6.490	29.104
6.492	26.615
6.515	26.971
6.516	25.311
6.527	26.615
6.528	23.771
6.529	22.112
6.531	18.200
6.542	20.571
6.562	25.431
6.597	24.127
6.631	25.195
6.643	23.772
6.656	22.706
6.669	18.795
6.701	23.062
6.710	28.277
6.710	27.803
6.711	26.736
6.714	21.877
6.769	25.197
6.778	29.463
6.803	26.145
6.804	24.486
6.805	23.775
6.814	27.094
6.882	29.228
6.896	26.265
6.952	28.399
6.977	25.200
6.996	31.363
7.005	35.748
7.103	25.913
7.214	33.499
7.271	34.211
7.282	36.108
7.438	45.710
8.001	48.919];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'weight', 'males'};  
bibkey.LW_m = 'KamChen1998'; 
comment.LW_m = 'Data for males';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_Hfm = 5 * weights.tL_Hfm;
weights.tL_Lfm = 5 * weights.tL_Lfm;
weights.ab = 0 * weights.ab;
weights.GSI = 3 * weights.GSI;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '48SGT'; % Cat of Life
metaData.links.id_ITIS = '775168'; % ITIS
metaData.links.id_EoL = '331417'; % Ency of Life
metaData.links.id_Wiki = 'Odorrana_swinhoana'; % Wikipedia
metaData.links.id_ADW = 'Odorrana_swinhoana'; % ADW
metaData.links.id_Taxo = '1396925'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Odorrana+swinhoana'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Odorrana_swinhoana}}';
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
bibkey = 'LaiLee2005'; type = 'Article'; bib = [ ... 
'author = {Yung-Chih Lai and Tsung-Han Lee and Yeong-Choy Kam}, ' ... 
'year = {2005}, ' ...
'title = {A Skeletochronological Study on a Subtropical, Riparian Ranid (\emph{Rana swinhoana}) from Different Elevations in {T}aiwan}, ' ...
'journal = {Zoological Science}, ' ...
'volume = {22}, ' ...
'pages = {653–658}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KamChen1998'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1565464}, ' ...
'author = {Yeong-Choy Kam and Te-Chin Chen and Jeng-Tze Yang and Fan-Chieh and Kuo-Ming Yu}, ' ... 
'year = {1998}, ' ...
'title = {Seasonal Activity, Reproduction, and Diet of a Riparian Frog (\emph{Rana swinhoana}) from a Subtropical Forest in {T}aiwan}, ' ...
'journal = {Journal of herpetology }, ' ...
'volume = {32(3}, ' ...
'pages = {447-452}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Odorrana+swinhoana}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

