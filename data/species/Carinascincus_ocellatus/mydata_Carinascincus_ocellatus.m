function [data, auxData, metaData, txtData, weights] = mydata_Carinascincus_ocellatus

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Scincidae';
metaData.species    = 'Carinascincus_ocellatus';
metaData.species_en = 'spotted skink';

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAt'};
metaData.ecoCode.habitat = {'0iTd', '0iTa', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_fT'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data;
data.ab = 87;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'JoneWaps1997';
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '12-13 wk';
data.am = 12*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'WapsSwai2001';
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 3;     units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'WapsSwai2001';
data.Lp  = 5.1;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'WapsSwai2001';
data.Li  = 8.1; units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'WapsSwai2001';
data.Lim  = 7.9; units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'WapsSwai2001';

data.Wwi = 12; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'WapsSwai2001';

data.Ri  = 2.6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'JoneWaps1997';
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-4 young per litter, 1 litter per yr';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (d), SVL (cm)
33.189	2.936
44.252	3.642
44.252	3.307
44.252	3.095
55.315	3.413
287.637	4.934
309.763	4.193
309.763	4.070
320.826	4.635
354.015	4.194
354.015	4.017
398.267	4.689
398.267	4.495
730.156	5.312
752.282	5.118
774.408	5.630
929.290	6.197
1017.793	5.722
1073.108	6.182
1139.486	6.236
1150.549	5.724
1404.997	6.117
1427.123	5.694
1770.076	6.458
1814.327	7.023
1825.390	7.023
1880.705	6.618
2234.720	6.201
2234.720	6.289
2256.846	6.501
2599.798	6.471
2599.798	6.595
2953.813	6.830
2964.877	6.636];
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'females'};  
temp.tL_f   = C2K(17);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WapsSwai2001'; comment.tL_f = 'Warm site, east coast Tasmania';
%
data.tL_m = [ ... % time since birth (d), SVL (cm)
1039.919	5.917
1062.045	5.741
1062.045	6.552
1261.179	5.903
1416.060	6.417
1416.060	6.523
1449.249	6.294
1460.312	6.435
1648.383	5.856
1781.139	5.999
1792.201	6.564
2168.342	6.535];
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'males'};  
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
temp.tL_m   = C2K(17);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WapsSwai2001'; comment.tL_m = 'Warm site, east coast Tasmania';

data.tL1_f = [ ... % time since birth (d), SVL (cm)
20.344	3.013
20.590	2.856
347.709	4.310
347.846	4.222
369.340	4.519
632.388	4.820
762.885	5.625
764.008	4.910
972.130	5.227
1004.494	5.594
1005.398	5.018
1016.213	5.123
1037.105	5.804
1047.373	6.258
1047.674	6.066
1047.893	5.927
1145.670	6.592
1288.215	6.716
1288.379	6.611
1288.653	6.437
1288.763	6.367
1376.847	6.211
1376.984	6.124
1398.642	6.316
1430.760	6.841
1431.745	6.212
1474.706	6.824
1474.925	6.684
1475.117	6.562
1628.833	6.564
1726.363	7.386
1737.645	7.195
1770.748	7.090
1770.885	7.003
1825.154	7.405
1837.995	6.219
2100.167	7.078
2121.141	7.707
2121.716	7.340
2154.409	7.498
2231.568	7.307
2231.924	7.080
2560.029	7.906
2560.220	7.784
2561.316	7.085
2933.312	7.929
3295.670	7.918
3295.862	7.795
3558.965	8.061
3591.575	8.271
3591.794	8.132
3603.651	7.573
4041.827	8.226];
units.tL1_f  = {'d', 'cm'};  label.tL1_f = {'time since birth', 'SVL', 'females'};  
temp.tL1_f   = C2K(10);  units.temp.tL1_f = 'K'; label.temp.tL1_f = 'temperature';
bibkey.tL1_f = 'WapsSwai2001'; comment.tL1_f = 'Cold site, central plateau Tasmania';
%
data.tL1_m = [ ... % time since birth (d), SVL (cm)
992.173	6.450
1013.859	6.624
1046.606	6.747
1068.976	6.486
1111.581	7.324
1376.244	6.595
1441.411	7.050
1738.192	6.845
1825.975	6.882
2121.770	7.305
2122.400	6.904
2461.019	8.026
2472.711	7.573
2484.458	7.084
2484.649	6.962
2516.904	7.399
2868.063	7.527
2868.337	7.352
2878.715	7.736
2878.769	7.701
2879.509	7.230
3163.695	8.055
3163.968	7.881
3252.190	7.638
3570.848	7.486
3899.912	7.700
4317.004	7.794];
units.tL1_m  = {'d', 'cm'};  label.tL1_m = {'time since birth', 'SVL', 'males'};  
temp.tL1_m   = C2K(10);  units.temp.tL1_m = 'K'; label.temp.tL1_m = 'temperature';
bibkey.tL1_m = 'WapsSwai2001'; comment.tL1_m = 'Cold site, central plateau Tasmania';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.tL1_f = 3 * weights.tL1_f;
weights.tL1_m = 3 * weights.tL1_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males at warm site'};
set2 = {'tL1_f','tL1_m'}; subtitle2 = {'Data for females, males at colde site'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'The T_A is estimated outside of this fitting procedure in a general study of Egernia-group lizards';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '886FB'; % Cat of Life
metaData.links.id_ITIS = '1183284'; % ITIS
metaData.links.id_EoL = '458746'; % Ency of Life
metaData.links.id_Wiki = 'Carinascincus_ocellatus'; % Wikipedia
metaData.links.id_ADW = 'Niveoscincus_ocellatus'; % ADW
metaData.links.id_Taxo = '5888834'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Carinascincus&species=ocellatus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
    'howpublished = {\url{http://en.wikipedia.org/wiki/Egernia_striolata}}';   % replace my_pet by latin species name
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
bibkey = 'WapsSwai2001'; type = 'Article'; bib = [ ... 
    'author = {Erik Wapstra and Roy Swain and Julianne M. O''Reilly}, ' ...
    'title = {Geographic Variation in Age and Size at Maturity in a Small {A}ustralian Viviparous Skink}, ' ...
    'journal = {Copeia}, ' ...
    'volume = {2001(3)}, ' ...
    'pages = {646-655}, ' ...
    'year = {2001}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoneWaps1997'; type = 'Article'; bib = [ ... 
    'doi = {10.1006/gcen.1997.6971}, ' ...
    'author = {Jones, S. M., Wapstra, E., & Swain, R.}, ' ...
    'title = {Asynchronous Male and Female Gonadal Cycles and Plasma Steroid Concentrations in a Viviparous Lizard, \emph{Niveoscincus ocellatus} ({S}cincidae), from {T}asmania}, ' ...
    'journal = {General and Comparative Endocrinology}, ' ...
    'volume = {108(2)}, ' ...
    'pages = {271–281}, ' ...
    'year = {1997}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

