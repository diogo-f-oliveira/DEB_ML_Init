function [data, auxData, metaData, txtData, weights] = mydata_Hemilepidotus_jordani
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Hemilepidotus_jordani'; 
metaData.species_en = 'Yellow Irish lord'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 13];

%% set data
% zero-variate data

data.am = 30 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'TenBBuck2013';   
  temp.am = C2K(3.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 36;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 65;     units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'baed on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
data.Wwp  = 580;  units.Wwp  = 'g';  label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase';
  comment.Wwp = 'based on 0.00676*Lp^3.17, see F1';
data.Wwi  = 3.8e3;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00676*Li^3.17, see F1';
 
data.Ri = 224508/365;   units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'TenBBuck2013';   
  temp.Ri = C2K(3.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on rel fecundity of 266 #/g';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years), total length (cm) 
1.747	16.125
1.887	15.302
1.923	26.596
1.925	23.890
1.929	19.772
1.931	17.184
1.982	12.714
2.023	18.949
2.804	26.599
2.806	24.482
2.851	25.776
2.853	23.423
2.892	30.953
2.939	30.247
2.941	28.835
2.947	22.482
2.949	19.541
3.771	33.780
3.779	24.839
3.818	32.839
3.823	27.192
3.824	26.250
3.825	25.309
3.862	35.074
3.865	32.015
3.907	36.486
3.908	36.016
3.912	30.957
3.913	30.368
3.914	29.192
3.915	28.957
3.916	28.604
3.919	23.780
3.962	27.898
4.006	29.898
4.747	30.842
4.748	29.784
4.789	35.784
4.791	33.431
4.793	31.901
4.883	34.490
4.927	36.725
4.931	32.608
4.972	38.843
4.981	27.784
4.982	27.314
4.985	24.255
5.763	34.964
5.766	32.023
5.812	32.611
5.855	35.905
5.856	34.376
5.857	34.376
5.858	33.553
5.899	38.729
5.900	37.788
5.906	31.082
5.909	28.023
5.944	39.788
5.953	30.259
5.994	36.730
6.000	30.024
6.001	28.847
6.876	35.204
6.918	39.674
6.922	36.027
6.923	34.145
6.966	38.733
7.013	37.204
7.059	37.910
7.845	40.502
7.938	39.914
7.939	38.972
7.986	37.796
7.987	36.973
8.036	33.914
8.038	32.502
8.957	40.741
8.960	38.388
8.961	37.212
9.886	39.804
9.933	38.274
9.983	34.863
10.067	44.040
10.859	40.160
10.902	43.925
10.903	43.102
10.904	41.219
11.000	38.043
11.835	38.047
11.922	43.812
11.927	38.988
11.928	36.988
11.967	45.929
11.970	42.635
12.850	43.109
12.852	41.580
12.945	40.874
12.946	40.051
12.949	36.874
12.987	46.051
13.034	45.110
13.040	38.875
13.921	38.055
13.925	34.055
13.964	41.820
13.966	40.173
14.009	43.937
14.011	41.232
14.845	41.705
14.893	40.647
14.940	40.059
14.942	37.941
14.989	36.882
15.915	37.945
15.958	41.827
16.001	45.239
16.007	39.475
16.049	43.710
16.050	43.004
16.886	41.361
17.953	40.188
18.922	45.133
19.897	43.961
19.945	42.902
20.918	43.259
20.963	45.259
21.013	41.024
21.054	46.671
21.058	42.083
21.983	45.263
21.985	42.439
24.162	45.271
28.152	43.169];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(3.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TenBBuck2013';
comment.tL_f = 'data for females from eastern Bering Sea';
%
data.tL_m = [ ... % age (years), total length (cm) 
1.864	13.690
1.865	21.071
1.909	26.310
2.000	10.119
2.001	15.714
2.091	19.405
2.908	36.905
2.909	28.810
2.910	22.143
2.955	34.405
2.956	29.524
2.957	27.738
2.958	24.405
3.000	26.786
3.001	25.357
3.045	23.929
3.091	31.786
3.092	22.857
3.093	20.952
4.045	28.452
4.090	25.595
4.091	30.238
4.092	33.690
4.093	35.476
4.136	27.262
4.137	29.405
4.182	31.548
4.183	32.857
4.864	32.381
4.865	29.524
4.866	28.095
4.906	41.786
4.907	37.619
4.908	35.714
4.909	35.119
4.955	38.929
4.956	33.214
5.000	36.667
5.001	28.810
5.045	30.476
5.046	22.619
5.955	39.881
5.956	42.976
6.000	35.714
6.042	32.857
6.043	33.214
6.044	34.643
6.045	36.905
6.046	37.381
6.091	31.905
6.909	42.976
6.955	43.571
7.045	38.571
7.046	40.952
7.091	34.881
7.092	36.310
7.093	37.262
7.955	41.905
9.000	42.619
9.001	45.119
9.136	43.929
10.045	41.905
10.091	44.881
10.909	44.881
10.955	44.286
10.956	42.976
11.091	41.667
11.136	40.833
11.864	43.095
12.000	40.000
12.001	45.000
12.864	41.190
13.045	43.929
14.091	45.595
14.136	47.262
14.907	47.738
14.908	44.524
15.909	48.690
19.136	48.095
24.136	49.048];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(3.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TenBBuck2013';
comment.tL_m = 'data for males from eastern Bering Sea';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;

%% set pseudodata and respective weights
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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00676*(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6L6V2'; % Cat of Life
metaData.links.id_ITIS = '643998'; % ITIS
metaData.links.id_EoL = '46568960'; % Ency of Life
metaData.links.id_Wiki = 'Hemilepidotus_jordani'; % Wikipedia
metaData.links.id_ADW = 'Hemilepidotus_jordani'; % ADW
metaData.links.id_Taxo = '175538'; % Taxonomicon
metaData.links.id_WoRMS = '274374'; % WoRMS
metaData.links.id_fishbase = 'Hemilepidotus-jordani'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hemilepidotus_jordani}}';
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
bibkey = 'TenBBuck2013'; type = 'Article'; bib = [ ... 
'author = {Todd T. TenBrink and Troy W. Buckley}, ' ... 
'year = {2013}, ' ...
'title = {LIFE-HISTORY ASPECTS OF THE YELLOW IRISH LORD (\emph{Hemilepidotus jordani}) IN THE EASTERN {B}ERING {S}EA AND {A}LEUTIAN {I}SLANDS}, ' ...
'journal = {Northwestern Naturalist}, ' ...
'volume = {94}, ' ...
'pages = {126–136}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hemilepidotus-jordani.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

