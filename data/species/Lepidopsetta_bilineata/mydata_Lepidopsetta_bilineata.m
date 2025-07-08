function [data, auxData, metaData, txtData, weights] = mydata_Lepidopsetta_bilineata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Lepidopsetta_bilineata'; 
metaData.species_en = 'Rock sole'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.1); % K, body temp
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

data.am = 26*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(5.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 34.7;  units.Lp  = 'cm';  label.Lp  = 'length at puberty for females';  bibkey.Lp  = 'fishbase';
data.Li  = 60;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';
data.Lim  = 58;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'fishbase';

data.Wwb = 4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Forr1964';
  comment.Wwb = 'based on egg diameter 0.92 mm: pi/6*0.092^3';
data.Wwp = 488;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00912*Lp^3.07, see F2';
data.Wwi = 2.6e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.07, see F2';
  
data.GSI  = 0.18; units.GSI  = '-'; label.GSI  = 'gonadosomatic index';   bibkey.GSI  = 'StarSome2002';   
  temp.GSI = C2K(4.7);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.876	20.000
2.066	14.846
2.681	16.923
2.763	27.231
3.042	25.923
3.116	14.923
3.145	16.692
3.169	23.077
3.815	24.923
3.818	22.000
3.882	19.923
3.971	23.154
4.096	22.000
4.100	17.923
4.217	24.692
4.736	29.846
4.740	26.000
4.799	28.923
4.827	31.231
4.864	25.154
4.897	23.077
4.962	20.231
5.011	32.077
5.015	28.231
5.018	26.077
5.145	22.077
5.146	20.923
5.179	19.077
5.199	29.846
5.936	33.231
6.000	31.077
6.003	28.308
6.007	24.000
6.097	26.923
6.126	28.923
6.136	19.000
6.259	19.923
6.741	30.923
6.775	28.308
6.781	21.846
6.866	29.077
6.930	26.846
7.011	38.385
7.015	35.077
7.020	30.154
7.078	33.308
7.103	39.154
7.117	25.846
7.175	29.077
7.232	34.154
7.788	33.000
8.059	40.154
8.065	34.154
8.101	29.000
8.128	32.923
8.191	31.231
8.223	30.077
8.228	25.231
8.742	36.077
8.771	37.923
8.934	29.077
9.023	33.154
9.042	44.154
9.053	33.923
9.143	36.000
9.158	52.000
9.173	37.077
9.206	35.077
9.207	34.231
9.916	35.000
9.944	38.077
10.006	36.923
10.065	40.308
10.805	41.000
10.926	43.077
10.930	39.154
10.989	42.154
11.083	40.154
11.785	48.385
11.796	37.077
11.852	43.077
11.949	39.154
12.007	42.077
12.034	46.154
12.068	43.231
12.782	39.231
12.843	40.231
12.907	38.000
13.022	46.000
13.025	43.308
13.026	42.000
13.060	39.385
13.112	48.308
13.806	34.154
13.822	48.077
13.860	41.077
13.949	45.154
14.133	46.154
14.710	55.308
14.844	45.231
14.876	44.154
15.062	43.231
15.086	49.231
15.177	51.231
15.178	50.154
15.734	49.308
15.823	53.538
15.852	55.308
15.863	44.615
15.867	40.462
15.917	52.000
15.927	42.154
15.985	46.231
16.014	47.308
16.147	38.154
16.906	50.231
16.939	48.231
16.998	51.154
17.092	50.154
17.095	47.231
17.714	45.231
17.777	44.154
17.797	54.231
17.804	48.154
17.824	58.154
17.930	45.231
17.965	41.231
18.032	36.308
18.148	43.077
18.698	49.231
18.773	36.077
18.823	47.385
18.829	41.077
18.973	51.385
19.082	35.385
19.101	47.308
19.140	39.231
19.681	53.385
19.801	56.308
19.836	52.231
19.989	54.154
20.003	40.231
20.057	47.462
20.923	46.231
21.788	45.308
22.029	51.385
22.837	45.308
22.873	41.077
24.821	37.385];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(5.1); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'StarSome2002';
comment.tL_f = 'Data for females';
% t-L data males 
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.909	17.923
2.773	18.077
2.802	19.308
2.867	16.077
2.927	17.846
2.956	20.000
3.022	16.000
3.050	19.077
3.071	28.000
3.198	24.923
3.539	23.077
3.723	24.000
3.751	27.000
3.756	22.000
3.784	25.000
3.821	18.846
3.881	20.923
4.032	24.000
4.035	20.923
4.037	18.923
4.284	18.846
4.649	24.308
4.713	22.154
4.799	28.923
4.799	28.308
4.892	28.308
5.039	35.077
5.144	23.077
5.145	21.923
5.169	28.923
5.178	19.923
5.259	31.077
5.755	29.769
5.758	26.154
5.885	23.154
6.006	25.308
6.129	25.385
6.248	30.154
6.896	30.077
6.960	28.308
6.987	32.231
6.988	31.000
7.176	28.308
7.791	30.462
7.849	34.154
7.978	28.923
8.961	33.308
8.993	32.154
9.209	32.231
10.100	36.077
10.809	37.000
10.810	36.154
11.214	33.000
11.738	34.154
13.126	35.154
13.772	37.000
13.869	32.077
14.884	36.231
14.912	39.231
15.005	38.077
15.007	36.077
15.222	37.077
16.769	34.154
16.984	35.077
17.815	37.000
18.058	40.385
19.696	38.308
19.945	36.308
20.067	38.154
20.070	35.077
20.742	42.385
20.906	32.923
27.838	44.308];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); 
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(5.1); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'StarSome2002';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;

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
F2 = 'length-weight: Ww in g = 0.00912*(TL in cm)^3.07';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6PC4Z'; % Cat of Life
metaData.links.id_ITIS = '172917'; % ITIS
metaData.links.id_EoL = '46570160'; % Ency of Life
metaData.links.id_Wiki = 'Lepidopsetta_bilineata'; % Wikipedia
metaData.links.id_ADW = 'Lepidopsetta_bilineata'; % ADW
metaData.links.id_Taxo = '178394'; % Taxonomicon
metaData.links.id_WoRMS = '281305'; % WoRMS
metaData.links.id_fishbase = 'Lepidopsetta-bilineata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepidopsetta_bilineata}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/24237}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

