function [data, auxData, metaData, txtData, weights] = mydata_Paralichthys_olivaceus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Paralichthyidae';
metaData.species    = 'Paralichthys_olivaceus'; 
metaData.species_en = 'Bastard halibut'; 

metaData.ecoCode.climate = {'MB','Cfa'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd','0iFe','0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 04];

%% set data
% zero-variate data

data.am = 20*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'AtsuMasu2004';   
  temp.am = C2K(18.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 40;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';     bibkey.Lp  = 'fishbase'; 
data.Li  = 103;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ADW';
  comment.Wwb = 'based on egg diameter of 0.7 to 0.8 mm of Paralichthys_californicus: pi/6*0.075^3';
data.Wwp = 658;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00794*Lp^3.07, see F1';
data.Wwi = 12e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max publoished weight 9.1 kg; based on 0.00794*Li^3.07, see F1, give 12 kg';

data.Ri  = 19e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(18.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [... % time since birth (yr), total length (cm)
0.449	24.565
0.473	23.478
0.497	33.913
0.497	26.957
0.497	21.304
0.520	29.783
0.544	31.739
0.568	25.217
0.709	30.217
0.709	24.348
0.733	34.783
0.733	28.043
0.780	35.000
0.828	32.609
0.828	28.913
0.851	40.870
0.899	33.261
0.899	30.435
0.922	31.304
0.970	36.304
0.970	35.870
0.970	26.739
0.993	41.739
1.017	34.348
1.064	38.043
1.088	39.130
1.111	42.826
1.135	40.435
1.182	38.913
1.182	45.000
1.206	37.174
1.230	34.565
1.277	21.957
1.301	47.826
1.324	33.913
1.324	52.826
1.348	33.913
1.348	39.130
1.348	42.609
1.348	44.565
1.372	46.957
1.443	32.174
1.443	35.870
1.443	48.478
1.584	40.870
1.655	30.435
1.703	39.348
1.726	33.913
1.774	46.304
1.797	56.304
1.797	53.696
1.797	35.000
1.821	50.870
1.821	37.609
1.845	51.739
1.845	48.696
1.845	47.174
1.845	44.130
1.845	42.174
1.845	33.043
1.939	48.478
1.963	53.261
1.963	42.609
1.963	39.565
1.986	57.609
1.986	36.739
2.034	45.217
2.057	51.957
2.081	50.870
2.081	50.435
2.105	48.261
2.128	50.870
2.128	41.087
2.176	58.478
2.199	55.000
2.199	56.304
2.223	42.609
2.223	53.478
2.223	46.304
2.318	43.478
2.341	47.391
2.341	51.957
2.389	49.130
2.412	45.870
2.436	42.174
2.696	49.130
2.791	53.478
2.838	46.522
2.861	55.217
2.885	52.391
2.909	49.130
2.909	46.522
2.932	63.696
2.932	51.304
2.932	42.826
2.956	61.087
2.956	57.391
2.956	50.000
2.980	65.435
2.980	59.130
2.980	44.783
3.027	53.696
3.074	62.826
3.074	61.957
3.074	51.087
3.074	46.739
3.122	56.739
3.122	55.000
3.145	60.000
3.193	54.783
3.216	57.391
3.264	52.174
3.287	56.739
3.311	50.000
3.807	67.391
3.855	75.870
3.855	63.913
3.855	61.087
3.902	69.348
3.926	55.435
3.973	68.478
3.973	65.217
3.973	61.957
3.973	59.783
3.997	57.826
4.044	53.478
4.091	70.652
4.115	63.261
4.139	70.000
4.162	65.652
4.162	56.739
4.162	53.696
4.186	67.174
4.186	61.957
4.233	58.913
4.351	66.087
4.375	63.261
4.872	55.652
4.872	80.000
4.943	66.304
4.990	65.000
5.014	57.174
5.037	60.435
5.037	68.913
5.037	70.870
5.037	71.739
5.037	75.000
5.061	73.696
5.084	56.522
5.108	76.304
5.155	73.478
5.203	76.957
5.841	66.522
5.959	75.217
5.983	79.783
5.983	67.609
6.007	76.304
6.007	56.957
6.030	79.130
6.054	83.043
6.101	63.913
6.220	77.826
6.267	74.348
6.764	79.130
6.834	82.609
6.858	74.783
6.929	81.739
6.953	70.870
6.976	73.261
7.024	79.783
7.024	83.696
7.047	69.348
7.047	75.652
7.071	63.261
7.071	77.391
7.166	72.174
7.166	78.913
7.213	76.957
7.733	70.217
7.993	83.261
7.993	76.522
8.064	79.130
8.088	89.348
8.230	81.957
8.916	61.304
8.939	77.174
8.939	85.217
8.986	79.130
9.010	69.348
9.128	84.783
9.152	76.304
9.199	80.000
10.027	67.174
10.051	78.478
11.020	75.870
11.068	78.261
11.919	79.565
12.014	77.826
12.155	85.652
13.007	91.522
13.030	78.478]; 
data.tL_f(:,1) = (0.9+data.tL_f(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_f,1);if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'age', 'total length', 'females'};  
temp.tL_f = C2K(18.8); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AtsuMasu2004';
%
data.tL_m = [... % time since birth (yr), total length (cm)
0.445	25.518
0.504	23.530
0.567	26.891
0.624	22.764
0.625	24.139
0.656	25.667
0.683	21.540
0.689	28.723
0.751	30.556
0.808	26.887
0.839	27.498
0.843	31.625
0.930	28.108
0.992	29.788
0.993	30.705
1.082	28.411
1.087	34.677
1.114	31.467
1.150	37.733
1.179	36.051
1.203	29.173
1.238	34.675
1.239	35.439
1.242	39.566
1.266	31.770
1.324	29.018
1.360	36.660
1.400	47.358
1.424	39.715
1.428	44.453
1.448	33.143
1.451	36.200
1.486	42.160
1.509	33.448
1.513	38.644
1.515	41.242
1.570	34.364
1.627	30.847
1.639	44.450
1.693	36.960
1.696	40.628
1.756	39.710
1.780	32.984
1.790	44.294
1.814	37.416
1.822	46.128
1.841	32.983
1.873	35.428
1.934	36.191
1.938	40.471
2.003	45.972
2.027	39.094
2.034	47.347
2.035	48.570
2.059	41.691
2.061	43.067
2.062	44.443
2.062	44.595
2.067	50.862
2.120	41.385
2.127	49.944
2.155	47.651
2.177	38.480
2.239	39.549
2.242	43.675
2.246	47.649
2.274	45.662
2.298	37.866
2.309	50.705
2.358	38.171
2.396	47.188
2.426	46.270
2.451	40.768
2.454	43.366
2.482	41.379
2.515	44.588
2.547	47.033
2.789	46.876
2.821	49.015
2.846	43.359
2.879	45.957
2.914	52.070
2.937	43.816
2.968	44.580
3.003	50.540
3.007	54.667
3.054	39.535
3.061	47.329
3.066	52.984
3.086	41.368
3.087	42.285
3.090	45.801
3.097	53.901
3.123	49.162
3.129	56.040
3.129	56.651
3.178	42.589
3.185	50.995
3.209	43.659
3.211	45.799
3.333	47.631
3.423	46.712
3.429	54.048
3.455	48.851
3.902	41.813
3.907	47.468
3.936	46.550
3.963	42.576
4.029	49.453
4.055	44.561
4.061	51.592
4.096	56.635
4.116	45.172
4.120	49.298
4.121	50.980
4.139	36.765
4.144	42.726
4.210	48.533
4.240	48.532
4.245	54.187
4.278	57.702
4.299	47.461
4.332	49.906
4.387	43.639
4.971	55.856
5.022	45.004
5.026	49.436
5.028	51.576
5.059	52.951
5.069	64.260
5.080	42.710
5.116	48.823
5.175	47.294
5.208	50.808
5.909	58.133
6.056	52.934
6.061	59.200
6.088	54.767
6.146	52.321
6.184	62.102
6.329	54.152
6.960	50.320
6.965	56.586
6.992	52.612
7.029	61.018
7.053	53.681
7.209	59.945
7.965	60.543
8.030	65.433
8.173	56.566
9.901	64.178
10.011	51.185
10.046	56.687
10.926	61.563
11.009	53.155
18.083	61.594]; 
data.tL_m(:,1) = (0.9+data.tL_m(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_m,1);if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'age', 'total length', 'males'};  
temp.tL_m = C2K(18.8); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AtsuMasu2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 5 * weights.Wwb;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.2;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'I had to add 1 yr for tL data to arrive at a natural fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length - weight: Ww in g = 0.00794*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CYVS'; % Cat of Life
metaData.links.id_ITIS = '172744'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Paralichthys_olivaceus'; % Wikipedia
metaData.links.id_ADW = 'Paralichthys_olivaceus'; % ADW
metaData.links.id_Taxo = '46922'; % Taxonomicon
metaData.links.id_WoRMS = '275816'; % WoRMS
metaData.links.id_fishbase = 'Paralichthys-olivaceus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paralichthys_olivaceus}}';
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
bibkey = 'AtsuMasu2004'; type = 'Article'; bib = [ ... 
'author = {Shin Atsuchi and Yasuji Masuda and Hiroshi Akamo and Katsuo Iori}, ' ...
'year = {2004}, ' ...
'title = {Age and growth of Japanese flounder \emph{Paralichthys olivaceus} from the coastal waters around {K}agoshima {P}refecture, {J}apan, using transverse sections of otoliths}, ' ... 
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {70(5)}, '...
'pages = {714-721}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Paralichthys-olivaceus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

