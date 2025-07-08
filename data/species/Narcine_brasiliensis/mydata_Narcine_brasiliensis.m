function [data, auxData, metaData, txtData, weights] = mydata_Narcine_brasiliensis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Torpediniformes'; 
metaData.family     = 'Narcinidae';
metaData.species    = 'Narcine_brasiliensis'; 
metaData.species_en = 'Brazilian electric ray'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.6);  % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};
metaData.data_1     = {'L-Ww'; 't-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};         
metaData.date_subm = [2020 11 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 03]; 

%% set data
% zero-variate data;
data.ab = 9*30.5;       units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'guess';    
  temp.ab = C2K(25.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14 * 365;  units.am = 'd';    label.am = 'life span';                       bibkey.am = 'RoliSide2020';   
  temp.am = C2K(25.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 11;        units.Lb = 'cm';   label.Lb = 'total length at birth';           bibkey.Lb = 'fishbase';
data.Lp = 28.5;      units.Lp = 'cm';   label.Lp = 'total length at puberty';   bibkey.Lp = 'fishbase'; 
data.Li = 45;        units.Li = 'cm';   label.Li = 'total length';             bibkey.Li = 'Wiki';  

data.Ri = 15/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';             bibkey.Ri = 'fishbase';  
  temp.Ri = C2K(25.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-15 pups per per litter, assumed 1 litter per yr'; 
 
% uni-variate data

% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
2.937	21.294
2.939	23.020
3.938	24.902
4.007	23.490
4.937	27.255
5.919	34.471
5.939	31.020
5.942	33.529
5.961	30.078
6.912	31.333
6.913	32.431
6.915	34.157
6.958	30.235
6.981	29.451
7.859	29.294
7.889	34.314
7.908	30.235
7.911	33.373
7.921	41.529
7.933	31.804
7.938	35.882
7.941	37.922
7.990	39.490
8.862	34.000
8.868	39.176
8.911	35.412
8.917	40.902
8.946	44.824
8.966	42.157
8.968	43.725
9.884	35.255
9.884	36.039
9.892	42.627
9.905	33.686
9.910	37.922
9.935	39.020
9.937	40.275
9.962	41.373
9.965	44.039
9.968	46.706
10.936	41.843
10.940	45.294
10.952	35.412
10.955	38.078
10.955	38.392
11.008	42.941
11.009	43.882
11.925	35.882
11.960	44.980
11.961	45.765
11.975	37.922
12.924	37.294
13.956	46.706
14.930	47.333];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(25.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'RoliSide2020';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
3.177	23.961
5.172	25.059
5.173	26.157
6.077	27.255
6.125	28.196
6.174	29.294
6.175	29.922
7.147	29.294
7.149	30.549
7.150	31.490
8.121	29.608
8.151	34.941
8.170	31.333
8.195	32.431
9.145	33.216
9.167	31.490
9.168	32.275
9.218	34.784
9.221	37.137
10.217	35.882
10.239	35.098
10.243	38.078];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(25.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'RoliSide2020';
comment.tL_m = 'Data for males';

%  length-weight
data.LW = [ ... % total length (cm), wet weight (g)
21.524	89.286
21.697	123.153
23.531	184.113
23.813	89.286
23.990	197.660
24.785	89.286
24.848	197.660
25.301	109.606
25.935	211.207
27.077	150.246
27.367	231.527
27.483	278.941
28.051	177.340
28.051	190.887
28.058	319.581
28.111	251.847
28.742	278.941
29.143	292.488
29.146	346.675
29.944	292.488
29.948	373.769
30.113	238.300
30.344	272.167
30.400	258.621
30.460	319.581
30.861	326.355
30.862	346.675
30.976	326.355
31.035	366.995
31.201	258.621
31.724	427.956
31.724	427.956
31.777	333.128
31.897	441.503
32.003	278.941
32.523	380.542
32.527	461.823
32.529	502.463
32.693	346.675
32.914	184.113
33.043	488.916
33.101	509.236
33.392	597.291
33.496	387.315
33.557	468.596
33.617	522.783
33.784	421.182
33.904	543.103
34.135	590.517
34.245	502.463
34.413	421.182
34.647	536.330
34.877	556.650
34.983	380.542
35.156	407.636
35.168	644.705
35.331	482.143
35.622	570.197
35.740	658.251
35.844	441.503
35.967	604.064
36.144	719.212
36.426	631.158
36.477	509.236
36.657	678.571
36.998	644.705
37.453	576.970
37.849	495.690
37.861	725.985
37.974	712.438
38.428	637.931
38.543	631.158
38.958	942.734
39.005	732.759
39.172	624.384
39.233	719.212
39.690	698.892
39.974	665.025
40.037	780.172
40.042	868.227
40.485	583.744
40.723	773.399
41.120	698.892
41.147	1240.764
41.182	793.719
41.536	1017.241
41.705	963.054
41.987	868.227
42.109	1030.788
42.335	963.054
42.506	949.507
43.250	956.281
43.474	868.227
44.052	983.374
44.101	807.266
44.750	1227.217
44.857	1064.655
45.322	1213.670
45.486	1057.882
45.726	1288.177];
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'RoliSide2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
% (pseudo data are in data.psd and weights are in weight.psd)
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
D1 = 'Males are assumed to differ from females by {p_Am} anf E_Hp only';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Ovoviviparous, feeds young with uterine milk';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1); 
  
%% Links
metaData.links.id_CoL = '73SNP'; % Cat of Life
metaData.links.id_ITIS = '160844'; % ITIS
metaData.links.id_EoL = '46560399'; % Ency of Life
metaData.links.id_Wiki = 'Narcine_brasiliensis'; % Wikipedia
metaData.links.id_ADW = 'Narcine_brasiliensis'; % ADW
metaData.links.id_Taxo = '152906'; % Taxonomicon
metaData.links.id_WoRMS = '157866'; % WoRMS
metaData.links.id_fishbase = 'Narcine-brasiliensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ... 
'howpublished = {\url{http://en.wikipedia.org/wiki/Narcine_brasiliensis}}'; 
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
bibkey = 'RoliSide2020'; type = 'Article'; bib = [... 
'doi = {10.1111/jfb.14378}, ' ...
'author = {Fernanda A. Rolim and Zachary A. Siders and Fabio P. Caltabellotta and Matheus M. Rotundo and Teodoro Vaske-J\''{u}nior}, ' ...
'year = {2020}, ' ...
'title = {Growth and derived life history characteristics of the {B}razilian electric ray \emph{Narcine brasiliensis}}, ' ...
'journal = {J Fish Biol.}, ' ...
'page = {396-408}, ' ...
'volume = {97}, ' ...
'howpublished = {\url{http://www.icm.csic.es/scimar/index.php/secId/6/IdArt/3509/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ... 
'howpublished = {\url{https://www.fishbase.se/summary/Narcine-brasiliensis.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  