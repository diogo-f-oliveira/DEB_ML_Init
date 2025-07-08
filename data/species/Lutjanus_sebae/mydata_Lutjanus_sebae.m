function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_sebae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_sebae'; 
metaData.species_en = 'Emperor red snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2018 12 20]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 20]; 

%% set data
% zero-variate data

data.am = 22*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'NewmCapp2000';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 54.2; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 116;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: 4/3*pi*0.0425^3'; 
data.Wwi = 32.7e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.GSI  = 0.14;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'McPhSqui1992';   
  temp.GSI = C2K(28);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% t-L data for females
data.tL = [ ... % time since birth (yr), fork length (cm)
0.204	6.783
0.280	8.568
0.407	13.387
0.939	19.628
0.968	34.628
0.990	21.592
1.016	23.377
1.017	26.770
1.951	28.898
1.978	34.969
1.998	18.718
2.024	21.754
2.025	23.004
2.025	24.968
2.026	26.575
2.984	26.024
2.987	35.845
3.060	27.451
3.061	29.594
3.062	31.558
3.969	28.865
3.995	30.293
3.995	31.900
3.996	34.579
4.023	40.828
4.024	43.150
4.051	49.578
4.051	52.256
5.009	49.741
5.010	51.705
5.030	34.562
5.031	38.133
5.032	41.705
5.038	60.990
5.059	46.169
5.086	53.311
5.998	66.153
6.018	46.332
6.019	50.082
6.019	51.510
6.020	53.832
6.041	40.260
6.042	43.831
6.042	43.831
6.047	60.438
6.047	62.224
7.027	47.387
7.028	52.208
7.029	54.351
7.030	57.744
7.031	62.744
7.032	66.315
7.084	70.064
8.016	66.121
8.017	70.228
8.038	55.227
8.039	57.370
8.971	53.069
8.997	55.748
8.998	57.355
8.999	61.640
9.051	65.925
9.052	69.497
10.007	58.231
10.011	72.874
10.060	65.195
10.968	67.323
10.969	68.751
10.995	73.394
11.022	79.108
11.978	68.735
11.978	70.521
12.986	65.861
12.987	68.004
12.988	70.861
12.990	79.790
13.008	53.004
13.011	63.004
13.017	86.575
13.994	61.916
15.005	67.257
15.054	63.328
16.998	65.796
22.019	67.858];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NewmCapp2000';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W = 0.0239 * FL^2.906';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 3 - 35 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6QPQS'; % Cat of Life
metaData.links.id_ITIS = '168894'; % ITIS
metaData.links.id_EoL = '46580753'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_sebae'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_sebae'; % ADW
metaData.links.id_Taxo = '106182'; % Taxonomicon
metaData.links.id_WoRMS = '218499'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-sebae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_sebae}}';
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
bibkey = 'NewmCapp2000'; type = 'Article'; bib = [ ... 
'author = {Stephen J. Newman and Michael Cappo and  David Williams}, ' ... 
'year = {2000}, ' ...
'title = {Age, growth, mortality rates and corresponding yield estimates using otoliths of the tropical red snappers, \emph{Lutjanus erythropterus}, \emph{L. malabaricus} and \emph{L. sebae}, from the central {G}reat {B}arrier {R}eef}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {48}, ' ...
'pages = {1-14}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McPhSqui1992'; type = 'Article'; bib = [ ... 
'author = {McPherson, G.R. and Squire, L. and O''Brien, J.}, ' ... 
'year = {1992}, ' ...
'title = {Reproduction of three dominant \emph{Lutjanus} species of the {G}reat {B}arrier Reef interreef fishery}, ' ...
'journal = {Asian Fish. Sci.}, ' ...
'volume = {5}, ' ...
'pages = {15-24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-sebae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
