function [data, auxData, metaData, txtData, weights] = mydata_Lepidopsetta_polyxystra
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Lepidopsetta_polyxystra'; 
metaData.species_en = 'Northern rock sole'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 03 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.am = 18*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(4.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 32.9;  units.Lp  = 'cm';  label.Lp  = 'length at puberty for females';  bibkey.Lp  = 'fishbase';
data.Li  = 69;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';
data.Lim  = 65;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'fishbase';
  comment.Lim = 'based on StarSome2002: males stay smaller than females';

data.Wwb = 4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Forr1964';
  comment.Wwb = 'based on egg diameter 0.92 mm: pi/6*0.092^3';
data.Wwp = 383;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00813*Lp^3.08, see F2';
data.Wwi = 3.7e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.08, see F2';
  
data.GSI  = 0.24; units.GSI  = '-'; label.GSI  = 'gonadosomatic index';   bibkey.GSI  = 'StarSome2002';   
  temp.GSI = C2K(4.7);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length data 
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.907	15.062
1.997	16.426
2.176	15.124
2.780	20.271
2.847	15.000
2.869	21.140
2.891	17.109
2.891	16.178
2.959	18.783
2.981	21.140
3.093	14.690
3.160	16.922
3.272	21.140
3.294	19.279
3.809	22.132
3.876	19.093
3.876	20.953
3.876	27.031
3.876	29.946
3.943	25.109
3.943	26.101
3.965	16.922
3.965	19.961
3.988	29.078
4.055	30.008
4.144	23.000
4.799	40.023
4.824	30.884
4.824	30.116
4.874	34.093
4.905	26.101
4.924	26.558
4.927	22.938
5.017	25.109
5.025	33.047
5.025	29.209
5.039	26.845
5.050	27.326
5.084	23.868
5.126	38.140
5.151	28.023
5.176	33.186
5.755	38.140
5.780	36.047
5.805	31.163
5.881	42.116
5.956	44.977
5.956	35.209
5.982	36.047
6.007	37.163
6.057	29.070
6.082	32.349
6.762	25.233
6.888	43.163
6.913	28.163
6.963	38.349
7.089	38.977
7.215	38.349
7.919	41.209
7.970	26.209
7.995	37.163
8.096	33.186
8.121	38.907
8.146	31.930
8.826	34.163
8.826	35.279
8.926	44.279
8.926	28.163
8.926	30.116
8.951	29.140
8.977	51.116
9.027	47.279
9.052	27.116
9.077	31.093
9.102	35.140
9.128	34.163
9.153	37.093
9.807	31.302
9.933	32.140
9.983	40.163
10.008	48.256
10.084	47.140
10.084	36.047
10.134	52.163
10.210	30.116
10.235	29.000
10.940	27.605
11.040	32.140
11.065	38.209
11.091	44.907
11.116	46.023
11.141	31.233
11.166	28.163
11.795	36.535
11.846	40.093
11.871	33.186
12.047	37.233
12.047	33.186
12.072	50.279
12.928	43.163
13.079	44.140
13.104	41.977
13.859	38.279
14.035	43.233
14.035	40.302
14.891	39.116
15.168	41.419
15.797	48.186
16.703	41.070
16.753	52.163
16.779	42.186
16.854	43.093
16.879	49.233
16.955	46.233
17.055	41.279
17.810	45.186
18.087	42.047
18.188	46.233
18.867	51.326
18.918	44.349
20.076	42.116
21.812	39.256];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(4.7); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'StarSome2002';
comment.tL_f = 'Data for females';
% t-L data males 
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.840	14.938
1.885	17.109
2.086	14.938
2.176	16.116
2.220	15.000
2.802	20.891
2.824	22.008
2.869	18.969
2.891	17.977
2.981	20.891
2.981	23.868
3.048	21.822
3.070	18.845
3.070	22.938
3.138	14.876
3.138	18.039
3.138	20.891
3.742	17.171
3.786	24.984
3.898	32.860
3.898	26.101
3.943	27.155
3.965	28.023
3.988	35.031
4.077	17.047
4.144	21.202
4.144	21.884
4.144	21.884
4.793	30.070
4.860	27.093
4.883	24.116
4.927	26.101
5.039	25.295
5.062	29.822
5.062	28.829
5.129	22.628
5.129	22.070
5.129	28.209
5.240	28.953
5.845	34.039
5.934	32.178
6.068	41.295
6.113	31.000
6.762	32.116
6.829	37.202
6.896	35.031
6.896	30.070
6.941	38.070
7.097	34.039
7.813	32.984
7.813	36.023
7.903	34.163
7.947	39.992
8.126	31.124
8.977	33.109
8.977	30.876
8.977	23.000
8.999	37.946
9.178	31.186
9.223	27.093
9.983	35.155
10.073	36.209
10.207	24.116
10.923	38.008
10.923	39.000
11.035	40.364
11.057	33.047
11.169	34.225
11.907	37.078
11.930	35.961
12.019	32.116
12.041	33.853
13.742	40.178
14.032	35.155
14.927	39.186
14.972	47.186
15.956	39.124
17.925	38.380
18.954	37.264
20.162	35.279
20.811	37.264];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); 
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(4.7); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'StarSome2002';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Preferred temperature 4.7 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.08';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6PBSW'; % Cat of Life
metaData.links.id_ITIS = '616392'; % ITIS
metaData.links.id_EoL = '46570162'; % Ency of Life
metaData.links.id_Wiki = 'Lepidopsetta_polyxystra'; % Wikipedia
metaData.links.id_ADW = 'Lepidopsetta_polyxystra'; % ADW
metaData.links.id_Taxo = '178396'; % Taxonomicon
metaData.links.id_WoRMS = '281307'; % WoRMS
metaData.links.id_fishbase = 'Lepidopsetta-polyxystra'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepidopsetta_polyxystra}}';
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
bibkey = 'StarSome2002'; type = 'Article'; bib = [ ... 
'doi = {10.1006/jfbi.2002.2047}, ' ...
'author = {J. W. Stark and D. A. Somerton}, ' ... 
'year = {2002}, ' ...
'title = {Maturation, spawning and growth of rock soles off {K}odiak {I}sland in the {G}ulf of {A}laska}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {61}, ' ...
'pages = {417-431}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Forr1964'; type = 'Article'; bib = [ ... 
'doi = {10.1139/f64-130}, ' ...
'author = {Forrester, C. R.}, ' ... 
'year = {1964}, ' ...
'title = {Rate of Development of Eggs of Rock Sole (\emph{Lepidopsetta bilineata} {A}yres)}, ' ...
'journal = {Journal of the Fisheries Research Board of Canada}, ' ...
'volume = {21}, ' ...
'pages = {1533-1534}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/58882}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

