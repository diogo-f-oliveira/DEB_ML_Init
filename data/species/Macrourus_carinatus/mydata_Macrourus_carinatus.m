function [data, auxData, metaData, txtData, weights] = mydata_Macrourus_carinatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Macrourus_carinatus'; 
metaData.species_en = 'Ridge scaled rattail'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAS', 'MPS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2021 03 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.am = 55*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'LeeCock2019';   
  temp.am = C2K(6.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3.54*21;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'LeeCock2019'; 
data.Lpm  = 15.5;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'LeeCock2019'; 
data.Li  = 3.54*32;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'LeeCock2019';
data.Lim  = 3.54*25;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length';    bibkey.Lim  = 'LeeCock2019';

data.Wwb = 9.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2.6 mm for Coryphaenoides rupestris: pi/6*0.26^3';
data.Wwi = 6.45e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'baseed on 0.00229*Li^3.14 g, see F1';

data.Ri  = 79221/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(6.7);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), pre-anal length (cm)
1.219	4.092
1.357	5.070
1.903	8.063
2.025	6.902
2.811	6.902
3.097	10.201
3.212	8.063
3.350	9.040
3.759	11.117
3.998	8.124
4.136	9.040
4.406	10.140
4.552	12.155
4.806	11.117
4.952	13.133
5.207	12.216
5.321	10.017
6.006	14.049
6.246	11.178
6.667	15.026
6.770	11.178
7.038	12.094
7.046	13.133
7.053	14.049
7.453	15.087
7.461	16.126
7.693	12.094
7.700	13.133
8.100	14.049
8.123	17.164
8.639	16.065
8.655	18.202
8.748	13.255
8.777	17.103
8.893	15.087
9.824	17.103
9.833	18.325
9.947	16.065
10.195	14.110
10.619	18.325
10.894	20.157
11.017	19.058
11.256	16.065
11.418	20.157
11.556	21.134
11.796	18.202
11.910	16.003
12.049	17.042
12.066	19.302
12.334	20.157
12.342	21.195
12.888	24.188
12.980	19.058
13.104	18.141
13.258	21.134
13.774	20.157
13.804	24.188
14.158	19.058
14.182	22.173
14.319	23.089
14.697	21.073
14.712	23.089
14.720	24.188
14.944	19.119
15.127	26.082
15.214	20.157
15.490	22.112
16.036	25.044
16.136	20.951
16.152	23.089
16.160	24.188
16.392	20.157
16.406	22.112
17.082	24.983
17.453	22.051
17.600	24.188
17.998	24.921
18.115	23.089
18.224	20.157
18.791	25.960
18.909	24.188
19.045	24.921
19.446	25.960
20.087	24.188
20.091	24.799
20.624	25.960
21.138	24.738
21.671	25.960
21.905	22.234
22.202	26.937
22.446	24.677
22.718	25.960
23.118	26.998
23.126	28.037
23.624	24.677
23.764	25.899
25.082	26.998
25.197	24.921
25.204	25.899
26.260	26.998
26.774	25.838
27.176	26.998
28.384	30.969
28.753	27.914
29.008	26.937
30.070	28.892
30.079	30.113
30.324	27.914
31.103	27.059
31.242	28.098
31.510	28.953
32.165	29.075
32.171	29.808
32.820	29.075
33.203	27.853
34.150	32.007
35.038	28.159
35.176	29.075
35.182	29.991
36.877	29.014
37.023	31.030
38.177	27.853
38.187	29.136
38.193	30.052
39.255	32.007
39.880	28.098
40.133	26.937
40.935	29.075
42.136	32.129
43.413	27.914
43.560	30.113
44.476	29.991
45.007	31.091
47.232	30.969
48.271	29.930
50.112	31.030
52.460	29.991];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr to d
data.tL_f(:,2) = 3.54*data.tL_f(:,2); % convert pre-anal length to total length
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(6.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LeeCock2019';
comment.tL_f = 'data for females off the Falkland Islands';
% time-length  for males
data.tL_m = [ ... % time since birth (yr), pre-anal length (cm)
2.029	6.002
2.166	6.982
2.170	8.147
2.695	5.878
2.832	6.981
2.837	8.084
2.974	9.065
3.769	7.898
4.040	9.062
4.177	10.042
4.974	9.060
5.111	10.040
5.248	11.143
5.252	12.001
5.777	10.038
6.048	11.141
6.185	11.999
6.189	12.980
6.859	14.020
7.119	12.119
7.255	12.977
7.922	12.975
7.926	14.017
7.929	14.937
8.200	15.917
8.726	14.015
8.867	15.977
8.996	14.934
9.945	19.039
10.067	15.974
10.329	14.931
10.737	16.953
10.874	17.994
10.996	14.991
11.133	15.971
11.804	16.950
11.933	15.969
12.074	17.991
12.078	19.033
12.737	17.009
12.867	15.967
13.141	17.989
13.145	19.031
13.149	20.073
13.945	19.090
13.953	21.052
14.082	20.071
14.090	22.032
14.204	17.128
15.008	18.107
15.149	20.068
15.153	21.049
15.156	22.029
15.949	20.005
15.956	21.966
16.079	19.146
16.228	23.191
16.352	20.984
17.015	19.941
17.023	21.964
17.286	20.982
17.298	24.231
17.412	19.143
18.089	21.961
20.093	22.998
21.293	22.995
23.556	21.825
23.575	26.974
23.964	23.969
24.642	27.094
25.164	23.966
25.964	23.964
26.897	23.901
28.223	21.997
29.031	24.079
30.093	22.912
37.164	23.937
37.289	21.853
39.030	23.932
39.159	22.767
40.493	22.887
41.049	28.892
41.293	22.885
43.293	22.941
44.897	23.857
46.230	23.915
47.160	22.870
48.234	24.768
52.097	23.900
52.233	24.758
53.293	22.917
53.300	24.755];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr to d
data.tL_m(:,2) = 3.54*data.tL_m(:,2); % convert pre-anal length to total length
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(6.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LeeCock2019';
comment.tL_m = 'data for males off the Falkland Islands';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Lpm = 3 * weights.Lpm;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

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
D1 = 'Pre-anal length PL of tL-data has been converted to total length TL = 3.54 * PL based on photo';
D2 = 'males are assumed to differ from females by {p_Am} and E_Hp only';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'preferred temp 6.7 C; bathypelagic; depth range 500 - 800 m';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00229*(TL in cm)^3.14';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3XCV4'; % Cat of Life
metaData.links.id_ITIS = '550628'; % ITIS
metaData.links.id_EoL = '46564612'; % Ency of Life
metaData.links.id_Wiki = 'Macrourus_carinatus'; % Wikipedia
metaData.links.id_ADW = 'Macrourus_carinatus'; % ADW
metaData.links.id_Taxo = '179486'; % Taxonomicon
metaData.links.id_WoRMS = '217773'; % WoRMS
metaData.links.id_fishbase = 'Macrourus-carinatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macrourus_carinatus}}';
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
bibkey = 'LeeCock2019'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.fishres.2019.05.012}, ' ...
'author = {Brendon Lee and Kate Cockroft and Alexander I. Arkhipkin and Stephen R. Wing and Haseeb S. Randhawa}, ' ... 
'year = {2019}, ' ...
'title = {Age, growth and mortality estimates for the ridge-scaled grenadier \emph{Macrourus carinatus} ({G}\"{u}nther, 1878) in the south-western {A}tlantic}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {218}, ' ...
'pages = {174-185}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Macrourus-carinatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

