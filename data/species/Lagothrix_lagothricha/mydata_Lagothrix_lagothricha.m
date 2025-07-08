function [data, auxData, metaData, txtData, weights] = mydata_Lagothrix_lagothricha

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Atelidae';
metaData.species    = 'Lagothrix_lagothricha'; % frequently spelled as Lagothrix_lagotricha
metaData.species_en = 'Brown woolly monkey'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(36.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 03]; 

%% set data
% zero-variate data

data.tg = 223;    units.tg = 'd';    label.tg = 'gestation time';            bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 352;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2555;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1520;   units.tpm = 'd';    label.tpm = 'time since birth at puberty'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36.0);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 32*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(36.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 300;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 7650; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 0.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.0);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 young per litter, 0.5 litters per yr';
  
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (wk), wet weight (g)
0.935	308.370
1.065	363.436
1.973	396.476
1.973	286.344
2.232	468.062
3.010	435.022
3.983	401.982
4.113	495.595
4.891	517.621
6.123	600.220
6.188	539.648
6.188	429.515
6.966	550.661
6.966	468.062
6.966	638.767
7.939	495.595
7.939	545.154
8.069	638.767
8.977	539.648
8.977	545.154
9.106	671.806
10.014	578.194
10.014	693.833
10.922	589.207
10.987	589.207
11.182	754.405
12.025	638.767
12.025	638.767
12.025	726.872
13.127	649.780
13.127	649.780
13.127	743.392
14.035	748.899
14.100	649.780
14.100	710.352
14.943	677.313
14.943	715.859
15.202	825.991
16.045	693.833
16.045	765.419
16.045	814.978
17.148	765.419
17.148	803.965
17.213	704.846
17.991	803.965
17.991	848.018
18.121	699.339
18.899	704.846
19.029	825.991
19.093	853.524
20.131	748.899
20.131	848.018
20.131	864.537
20.974	870.044
20.974	870.044
21.104	776.432
22.141	792.952
22.141	870.044
22.141	958.150
23.049	886.564
23.049	947.137
23.244	837.004
24.022	842.511
24.087	892.070
24.087	974.670
24.995	892.070
25.060	936.123
25.060	985.683
26.032	886.564
26.032	936.123
26.032	974.670
26.940	1062.775
27.070	958.150
27.070	980.176
27.978	991.189
27.978	1035.242
27.978	1101.322
28.951	985.683
28.951	1018.722
29.080	1128.855
29.988	985.683
29.988	1057.269
29.988	1112.335
30.961	1095.815
30.961	1156.388
30.961	1156.388
31.869	1161.894
31.934	1161.894
31.999	1266.520
32.971	1156.388
33.036	1288.546
33.036	1288.546
34.009	1205.947
34.139	1305.066
34.139	1332.599
35.112	1305.066
35.112	1332.599
35.176	1222.467
36.019	1227.974
36.084	1299.559
36.084	1475.771
36.927	1200.441
36.927	1470.264
36.992	1607.930
38.030	1222.467
38.030	1464.758
38.030	1618.943
39.067	1486.784
39.067	1552.863
39.067	1607.930
40.040	1486.784
40.105	1552.863
40.105	1618.943
41.078	1481.278
41.078	1552.863
41.078	1618.943
42.115	1497.797
42.115	1558.370
42.115	1624.449
42.958	1569.383
42.958	1618.943
43.153	1685.022
43.931	1613.436
45.099	1541.850
45.099	1613.436
45.099	1662.996
45.942	1563.877
45.942	1618.943
46.201	1839.207
47.044	1629.956
47.109	1547.357
47.174	1850.220
47.952	1563.877
47.952	1618.943
47.952	1839.207
48.860	1574.890
48.860	1624.449
48.925	1839.207
50.027	1552.863
50.027	1624.449
50.092	1943.833
50.935	1563.877
51.000	1618.943
51.065	1949.339
52.038	1883.260
52.038	1971.366
52.038	2114.537];
data.tW(:,1) = 7 * data.tW(:,1); % convert wk to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36.0);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'BarnCron2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6NTWV'; % Cat of Life
metaData.links.id_ITIS = '944187'; % ITIS
metaData.links.id_EoL = '323940'; % Ency of Life
metaData.links.id_Wiki = 'Lagothrix_lagothricha'; % Wikipedia
metaData.links.id_ADW = 'Lagothrix_lagothricha'; % ADW
metaData.links.id_Taxo = '65873'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100415'; % MSW3
metaData.links.id_AnAge = 'Lagothrix_lagothricha'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lagothrix_lagothricha}}';
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
bibkey = 'BarnCron2012'; type = 'Article'; bib = [ ... 
'author = {Barnes, H. A. and Cronin, A.}, ' ... 
'year = {2012}, ' ...
'title = {Hand-rearing and reintroduction of the woolly monek \emph{Lagothrix lagotricha} at {Monkey World - Ape Rescue Centre, UK}}, ' ...
'journal = {Int. Zoo Yb}, ' ...
'volume = {46}, ' ...
'pages = {164--174}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lagothrix_lagothricha}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

