function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_malabaricus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_malabaricus'; 
metaData.species_en = 'Malabar blood snapper'; 

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

data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'NewmCapp2000';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 57.6; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'McPhSqui1992'; 
data.Li  = 100;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: 4/3*pi*0.0425^3'; 
data.Wwi = 7.9e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0239 * Li^2.906, see F1';

data.GSI  = 0.2;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'McPhSqui1992';   
  temp.GSI = C2K(28);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% t-L data for females
data.tL = [ ... % time since birth (yr), fork length (cm)
0.257	5.111
0.386	7.065
0.579	9.018
0.752	10.220
0.839	6.911
0.946	7.512
0.966	13.075
0.967	10.519
1.009	15.481
1.972	40.887
1.972	38.331
1.974	33.519
1.975	28.406
1.991	51.113
2.962	45.692
2.963	42.835
2.963	41.481
2.964	39.075
2.965	33.963
2.982	49.752
3.933	40.271
3.970	64.030
3.970	62.527
3.971	59.369
3.974	50.346
3.996	45.684
3.997	42.827
4.012	65.985
4.032	72.150
4.940	62.970
4.941	58.309
5.002	71.842
5.004	65.075
5.952	64.767
5.953	61.609
5.971	75.293
5.972	71.835
5.997	59.203
5.999	51.383
6.967	60.098
6.985	72.128
6.986	69.271
6.986	67.767
6.987	65.511
6.988	62.353
7.935	66.557
7.955	72.421
7.975	74.978
8.000	64.602
8.000	63.098
8.001	59.038
8.927	61.888
8.946	73.767
8.947	69.707
8.947	67.903
9.961	63.083
9.980	75.865
9.982	66.090
10.950	72.850
10.951	69.993
10.953	62.925
11.988	61.113
12.006	72.842
12.007	69.985
12.998	70.278
14.011	69.669
17.914	63.625
19.981	70.226];
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
metaData.links.id_CoL = '3WGB2'; % Cat of Life
metaData.links.id_ITIS = '168870'; % ITIS
metaData.links.id_EoL = '46580738'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_malabaricus'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_malabaricus'; % ADW
metaData.links.id_Taxo = '106184'; % Taxonomicon
metaData.links.id_WoRMS = '218481'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-malabaricus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_malabaricus}}';
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
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-malabaricus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
