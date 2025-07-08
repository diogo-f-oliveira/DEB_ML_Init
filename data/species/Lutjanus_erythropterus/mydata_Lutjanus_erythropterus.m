function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_erythropterus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_erythropterus'; 
metaData.species_en = 'Crimson snapper'; 
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

data.am = 32*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'NewmCapp2000';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 48.6; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'McPhSqui1992'; 
data.Li  = 81.6;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: 4/3*pi*0.0425^3'; 
data.Wwi = 4.3e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on length-weight of Lutjanus_malabaricus: (Li/100)^3*7.9e3';

data.GSI  = 0.25;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'McPhSqui1992';   
  temp.GSI = C2K(28);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% t-L data for females
data.tL = [ ... % time since birth (yr), fork length (cm)
0.248	6.376
0.281	8.102
0.465	9.696
0.957	24.307
0.978	14.213
0.982	12.353
1.022	28.824
1.037	21.784
1.831	34.934
1.885	27.362
1.893	41.176
1.898	38.387
1.919	28.824
1.924	26.433
1.947	33.074
1.950	31.879
1.965	24.706
1.968	23.378
1.973	20.987
2.027	30.683
2.921	49.677
2.946	37.856
2.949	36.660
2.964	46.755
2.969	44.497
2.970	26.433
2.973	42.770
2.977	23.245
2.978	40.380
2.989	35.066
3.954	55.655
3.959	53.529
3.962	51.935
3.965	50.607
3.973	46.755
3.985	41.309
4.918	59.507
4.955	41.973
4.962	56.584
4.964	55.522
4.973	51.404
4.975	50.076
5.004	54.061
5.007	52.998
5.894	57.381
5.964	59.507
5.973	55.522
5.975	54.326
5.977	53.529
5.980	52.068
6.931	62.030
6.935	59.772
6.939	58.311
6.941	56.983
7.021	54.858
7.024	53.131
7.947	58.577
7.988	56.983
7.992	55.123
7.996	52.998
8.958	57.780
8.962	55.920
8.966	54.061
9.937	54.194
9.940	52.865
9.966	58.444
9.969	56.717
10.976	57.780
10.979	56.186
10.983	54.459
11.907	59.374
11.954	54.991
11.986	57.116
11.989	56.053
13.031	57.780
13.036	55.655
13.962	59.772
13.970	55.655
14.974	58.046
15.943	59.639
15.949	56.717
15.994	52.998
16.953	58.975
16.961	55.123
17.932	55.655
17.937	53.397
18.937	57.249
18.940	56.053
19.985	56.850
19.987	55.655
20.990	58.710
21.886	59.108
22.935	57.913
22.941	54.858
23.861	61.898
23.864	60.171
24.981	62.429
24.987	59.374
24.993	56.717
25.960	59.108
26.935	57.249
32.013	59.507];
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
metaData.links.id_CoL = '3WG9N'; % Cat of Life
metaData.links.id_ITIS = '550931'; % ITIS
metaData.links.id_EoL = '46580769'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_erythropterus'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_erythropterus'; % ADW
metaData.links.id_Taxo = '179219'; % Taxonomicon
metaData.links.id_WoRMS = '276534'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-erythropterus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_erythropterus}}';
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
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-erythropterus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
