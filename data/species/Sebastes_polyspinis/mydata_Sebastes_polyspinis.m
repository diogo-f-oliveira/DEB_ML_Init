function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_polyspinis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_polyspinis'; 
metaData.species_en = 'Northern rockfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNE','MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 24];

%% set data
% zero-variate data

data.am = 57*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(3.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 27.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 41;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 286.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 963;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 203503/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(3.9);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_GoAf = [ ... % time since birth (yr), total length (cm) 
1.825	12.744
3.108	16.445
4.493	21.938
4.812	23.370
5.774	26.116
6.846	28.265
7.920	29.935
8.885	31.606
10.070	32.321
11.359	33.871
12.111	34.826
13.078	36.138
13.618	35.779
15.127	36.254
15.773	36.492
16.959	36.609
18.035	37.443
19.005	37.681
19.757	38.635
21.051	38.872
21.914	38.870
23.099	39.346
23.744	39.942
24.605	40.538
26.011	39.461
26.980	39.937
28.170	38.740
29.031	39.336
29.885	42.201
30.863	39.691
31.835	39.570
33.126	40.643
33.884	39.686
34.740	41.835
36.258	39.085
36.688	39.681
39.052	42.664
39.917	41.826
41.106	41.107
42.075	41.583
42.947	38.476];
data.tL_GoAf(:,1) = 365*(0.9+data.tL_GoAf(:,1)); % convert yr 
units.tL_GoAf  = {'d', 'cm'};  label.tL_GoAf = {'time since birth', 'total length', 'females'};  
temp.tL_GoAf   = C2K(3.9);  units.temp.tL_GoAf = 'K'; label.temp.tL_1f = 'temperature';
bibkey.tL_GoAf = 'MaleHans2007';  comment.tL_GoAf = 'females from Gulf of Alaska';
%
data.tL_GoAm = [ ... % time since birth (yr), total length (cm) 
1.687	12.297
3.116	17.162
3.821	21.216
5.267	23.378
5.980	25.946
6.941	27.973
8.019	30.676
9.230	31.351
9.831	32.568
11.649	33.514
12.858	34.595
14.072	34.865
15.164	35.270
16.253	36.081
16.741	35.811
17.709	36.622
19.289	36.622
19.897	36.622
20.260	36.892
20.867	37.027
21.833	38.243
23.295	37.703
24.387	38.108
24.877	37.432
25.732	36.892
26.827	36.622
28.400	37.973
28.884	38.378
29.125	38.649
30.103	37.838
30.956	37.432
32.150	41.081
32.896	38.378
34.109	38.784
35.092	37.027
35.809	39.189
37.016	40.676
38.621	36.622
39.453	39.730
40.525	43.378
42.971	41.081
43.586	39.865];
data.tL_GoAm(:,1) = 365*(0.9+data.tL_GoAm(:,1)); % convert yr 
units.tL_GoAm  = {'d', 'cm'};  label.tL_GoAm = {'time since birth', 'total length', 'males'};  
temp.tL_GoAm   = C2K(3.9);  units.temp.tL_GoAm = 'K'; label.temp.tL_GoAm = 'temperature';
bibkey.tL_GoAm = 'MaleHans2007'; comment.tL_GoAm = 'males from Gulf of Alaska';
%
data.tL_AIf = [ ... % time since birth (yr), total length (cm) 
1.824	12.983
2.675	16.924
3.749	18.475
5.253	20.383
6.110	22.174
6.856	25.039
8.255	26.112
8.892	29.456
9.970	29.573
10.830	30.527
11.909	30.287
12.878	31.002
13.850	30.522
14.928	30.879
15.676	33.028
17.405	31.950
18.156	33.382
18.801	33.859
20.098	33.020
21.066	33.855
21.612	31.704
22.575	34.330
23.660	32.058
24.841	34.087
25.814	33.369
26.999	33.845
28.074	34.918
28.929	37.425
30.128	33.361
31.208	33.001
32.074	31.925
32.819	35.149
34.331	34.549
34.870	34.428
36.378	35.381
37.025	35.380
38.082	42.307
39.179	36.213
40.264	34.061
41.017	35.015
41.878	35.611
42.960	34.415
44.040	33.815
44.901	34.411
46.080	37.037
46.955	33.094
48.130	36.556
48.684	31.896
51.899	38.700
54.278	36.665
55.479	32.004
57.075	38.930
57.297	37.138
57.953	34.031
66.043	34.017];
data.tL_AIf(:,1) = 365*(0.9+data.tL_AIf(:,1)); % convert yr 
units.tL_AIf  = {'d', 'cm'};  label.tL_AIf = {'time since birth', 'total length', 'females'};  
temp.tL_AIf   = C2K(3.9);  units.temp.tL_AIf = 'K'; label.temp.tL_2f = 'temperature';
bibkey.tL_AIf = 'MaleHans2007';  comment.tL_AIf = 'females from Aleutian Islands';
%
data.tL_AIm = [ ... % time since birth (yr), total length (cm) 
1.819	10.541
3.002	15.946
4.084	17.973
5.285	20.405
5.875	23.243
6.837	25.000
7.557	26.622
8.891	27.162
9.974	29.054
10.940	30.135
11.800	28.649
13.005	30.405
13.850	31.351
14.945	31.216
15.794	31.622
16.777	29.865
17.846	34.054
19.186	33.649
20.297	30.946
21.154	29.865
21.884	29.865
22.971	31.081
23.693	32.162
25.155	31.757
25.638	32.297
27.219	32.162
28.195	31.622
28.805	31.351
29.773	32.027
31.116	31.081
32.176	36.757
32.932	32.432
33.652	33.919
34.747	33.919
35.456	37.297
36.573	33.514
37.909	33.649
38.999	34.324
39.882	29.189
40.721	31.081
41.906	36.216
42.750	37.432
44.127	30.811
44.581	36.081
46.187	31.892
46.915	32.162
48.116	34.595
48.845	34.730
49.837	31.622
50.918	33.649
53.956	33.919
54.948	30.811
55.894	35.135
56.850	37.973
71.572	36.081];
data.tL_AIm(:,1) = 365*(0.9+data.tL_AIm(:,1)); % convert yr 
units.tL_AIm  = {'d', 'cm'};  label.tL_AIm = {'time since birth', 'total length', 'males'};  
temp.tL_AIm   = C2K(3.9);  units.temp.tL_AIm = 'K'; label.temp.tL_AIm = 'temperature';
bibkey.tL_AIm = 'MaleHans2007';  comment.tL_AIm = 'males from Aleutian Islands';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_GoAf = 3 * weights.tL_GoAf;
weights.tL_GoAm = 3 * weights.tL_GoAm;
weights.tL_AIf = 3 * weights.tL_AIf;
weights.tL_AIm = 3 * weights.tL_AIm;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
%weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_GoAf','tL_GoAm'}; subtitle1 = {'Data for females, males from GoA'};
set2 = {'tL_AIf','tL_AIm'}; subtitle2 = {'Data for females, males from AI'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7PG'; % Cat of Life
metaData.links.id_ITIS = '166735'; % ITIS
metaData.links.id_EoL = '46568181'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_polyspinis'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_polyspinis'; % ADW
metaData.links.id_Taxo = '187319'; % Taxonomicon
metaData.links.id_WoRMS = '274837'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-polyspinis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_polyspinis}}';
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
bibkey = 'MaleHans2007'; type = 'techreport'; bib = [ ... 
'author = {Malecha, P.W. and D. H. Hanselman and J. Heifetz},' ...
'year = {2007}, ' ...
'title = {Growth and mortality of rockfish ({S}corpaenidae) from {A}laska waters}, ' ...
'institution = {NOAA}, ' ...
'volume = {Tech. Memo. NMFS F/AFSC-172}, ' ...
'pages = {1-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-polyspinis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
