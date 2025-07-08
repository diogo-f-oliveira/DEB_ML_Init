function [data, auxData, metaData, txtData, weights] = mydata_Pholis_gunnellus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Pholidae';
metaData.species    = 'Pholis_gunnellus'; 
metaData.species_en = 'Rock gunnel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-Ww', 'Ww-WwR'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 01 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 05];

%% set data
% zero-variate data

data.am = 5*365;      units.am = 'd';    label.am = 'life span';        bibkey.am = 'fishbase';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Li  = 25;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';
  
data.Wwb = 4.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Sawy1967';
  comment.Wwb = 'based on egg diameter of 2 mm : pi/6*0.2^3';
data.Wwp = 4;       units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = 'VallMacL2007';
data.Wwi = 71.2;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00430*Li^3.018, see F1';
 
% univariate data
% time-weight
data.tW = [ ... % time since birth (yr), weight (g)
0.001	2.028
0.011	1.055
0.012	1.460
1.002	2.677
1.025	3.164
1.993	6.085
1.994	7.140
2.027	5.598
2.973	6.572
2.973	7.302
2.973	7.951
3.007	9.736
3.007	10.223
3.007	11.278
3.976	15.091
3.988	17.688
3.998	12.495
4.013	25.558
4.020	11.765
4.021	15.659
4.033	19.310
5.011	16.389
5.012	17.769
5.022	13.874
5.022	15.497
5.973	32.860
6.003	20.771
6.005	27.505
6.015	25.558
6.996	32.292
7.009	37.728
7.018	28.641];
data.tW(:,1) = data.tW(:,1) * 365; % convert yr yo d
units.tW = {'d', 'cm'}; label.tW = {'time since birth', 'weight'};  
temp.tW = C2K(10);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'VallMacL2007';
comment.tW = 'data from Mace''s Bay';

% weight-gonadal weight
data.WWR = [ ... % body weight (g), gonad weight (g)
2.499	0.005
3.012	0.007
3.733	0.020
5.367	0.044
5.880	0.021
6.248	0.093
6.617	0.106
6.985	0.062
7.386	0.162
7.626	0.224
8.155	0.220
8.507	0.077
8.668	0.148
9.004	0.170
9.068	0.315
11.007	0.215
11.327	0.350];
units.WWR = {'g', 'g'}; label.WWR = {'body weight', 'gonadal weight'};  
temp.WWR = C2K(10);  units.temp.WWR = 'K'; label.temp.WWR = 'temperature';
bibkey.WWR = 'VallMacL2007';
comment.WWR = 'data from 2002 at Saints Rest Beach';

%% set weights for all real data
weights = setweights(data, []);
weights.tW =  5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature varies seasonally from 3 to 25 C, hatch in Nov till Feb at 5 C';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00430*(TL in cm)^3.018';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4GMHZ'; % Cat of Life
metaData.links.id_ITIS = '171645'; % ITIS
metaData.links.id_EoL = '46574584'; % Ency of Life
metaData.links.id_Wiki = 'Pholis_gunnellus'; % Wikipedia
metaData.links.id_ADW = 'Pholis_gunnellus'; % ADW
metaData.links.id_Taxo = '46516'; % Taxonomicon
metaData.links.id_WoRMS = '126996'; % WoRMS
metaData.links.id_fishbase = 'Pholis-gunnellus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pholis_gunnellus}}';
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
bibkey = 'VallMacL2007'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10661-006-9304-8}, ' ...
'author = {L. Vallis and D. L. MacLatchy and K. R. Munkittrick}, ' ... 
'year = {2007}, ' ...
'title = {Assessment of the potential of the rock gunnel (\emph{Pholis gunnellus}) along the {A}tlantic coast of {C}anada as a species for monitoring the reproductive impacts of contaminant exposures}, ' ...
'journal = {Environ Monit Assess}, ' ...
'volume = {128}, ' ...
'pages = {183-194}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sawy1967'; type = 'Article'; bib = [ ... 
'author = {Philip J. Sawyer}, ' ... 
'year = {1967}, ' ...
'title = {Intertidal Life-History of the Rock Gunnel, \emph{Pholis gunnellus}, in the {W}estern {A}tlantic}, ' ...
'journal = {Copeia}, ' ...
'volume = {1967}, ' ...
'pages = {55-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pholis-gunnellus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

