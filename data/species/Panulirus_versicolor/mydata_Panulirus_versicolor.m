function [data, auxData, metaData, txtData, weights] = mydata_Panulirus_versicolor

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Palinuridae';
metaData.species    = 'Panulirus_versicolor'; 
metaData.species_en = 'Painted rock lobster'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW', 'MI'};
metaData.ecoCode.habitat = {'0bMb', 'bjMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiCi', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am', 'Lp', 'Li', 'Wwb', 'Wwj', 'Wwi', 'Ri'}; 
metaData.data_1     = {'L-dL', 'L-Ww', 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 03]; 

%% set data
% zero-variate data

data.am = 30*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(16);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 8.2;  units.Lp  = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'Fris2007';
data.Li  = 14.5;  units.Li  = 'cm';  label.Li  = 'ultimate carapace length'; bibkey.Li  = 'Fris2007';

data.Wwb = 5.24e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwj = 1.0e-2;  units.Wwj = 'g';   label.Wwj = 'wet weight at metam';       bibkey.Wwj = 'guess';
data.Wwi = 1.45e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'Fris2007','sealifebase'};
  comment.Wwi = 'based on 0.3470*Li^3.118, see F1';

data.Ri  = 470e3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'sealifebase';   
  temp.Ri = C2K(16);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% length-growth data (capture recapture)
data.LdL = [ ... % carapace length (cm), change in carapace length (cm/yr)
0.955	3.194
1.159	3.117
1.773	3.175
2.011	4.291
2.216	2.772
2.489	4.349
10.593	0.836
10.644	0.943
10.748	1.166
10.808	0.588
10.825	1.274
10.954	1.390
11.026	0.762
11.065	0.853
11.089	0.646
11.208	1.225
11.308	0.886
11.344	0.498
11.383	0.613
11.433	0.473
11.510	0.605
11.549	0.696
11.682	1.498
11.790	0.399
11.793	0.887
11.871	1.110
11.945	0.647
12.187	0.606
12.252	0.796
12.291	0.929
12.394	1.053
12.493	0.574
12.634	0.632
12.684	0.500
12.826	0.756
12.863	0.541
13.000	0.021
13.116	0.244
13.157	0.632
13.217	0.013
13.282	0.186
13.319	0.000
13.410	0.178
13.511	0.030
13.591	0.600
13.614	0.187
13.626	0.013
13.792	0.013
13.807	0.410
13.819	0.237
13.834	0.642
13.844	0.303
13.855	0.014
13.945	0.005
14.036	0.287
14.187	0.006
14.239	0.171
14.672	0.006
14.774	0.002
14.814	0.230
14.889	0.000
15.298	0.007];
data.LdL(:,2) = data.LdL(:,2)/ 365; % convert yr to d
units.LdL   = {'cm', 'cm/d'};  label.LdL = {'carapace length', 'change in carapace length'};  
temp.LdL    = C2K(16);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Fris2007';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 5 * weights.LdL;

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
D1 = 'Temperatures are guessed, based on preferred temperature as reported in sealifebase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.3470*(carapace length in cm)^3.118';
metaData.bibkey.F1 = 'sealifebase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '853Y8'; % Cat of Life
metaData.links.id_ITIS = '552982'; % ITIS
metaData.links.id_EoL = '46516747'; % Ency of Life
metaData.links.id_Wiki = 'Panulirus_versicolor'; % Wikipedia
metaData.links.id_ADW = 'Panulirus_versicolor'; % ADW
metaData.links.id_Taxo = '507331'; % Taxonomicon
metaData.links.id_WoRMS = '210359'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Panulirus_versicolor}}';
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
bibkey = 'Fris2007'; type = 'Article'; bib = [ ... 
'author = {Ashley J. Frisch}, ' ... 
'year = {2007}, ' ...
'title = {Growth and reproduction of the painted spiny lobster (\emph{Panulirus versicolor}) on the {G}reat {B}arrier {R}eef ({A}ustralia)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {85}, ' ...
'pages = {61-67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/panulirus-versicolor.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

