  function [data, auxData, metaData, txtData, weights] = mydata_Lophius_budegassa

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lophiiformes'; 
metaData.family     = 'Lophiidae';
metaData.species    = 'Lophius_budegassa'; 
metaData.species_en = 'Blackbellied angler'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};        
metaData.date_subm   = [2018 12 22];                           
metaData.email       = {'bas.kooijman@vu.nl'};                 
metaData.address     = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data
data.am = 21*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(8.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 54;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 100;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Lophius piscatorius, egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 13474;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  
data.Ri = 399e3/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(8.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data

% time-length
data.tL_f = [ ... % age (yr), total length (cm) 
1.997	19.079
3.045	22.807
4.017	27.412
4.989	33.114
5.987	39.254
7.035	40.351
7.957	50.877
8.980	56.360
10.028	59.649
10.999	60.746
12.020	60.307
12.968	69.737
12.994	72.807
14.016	73.904
14.962	78.070
16.010	77.412
17.057	78.070
18.056	89.474];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'}; 
temp.tL_f = C2K(8.5); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LandPere2001';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % age (yr), total length (cm)
1.997	18.202
2.892	21.272
3.966	27.412
4.964	33.114
6.012	38.596
6.958	41.447
7.955	44.737
9.029	49.123
10.000	50.219
10.972	55.482
11.969	58.333
13.016	56.140]; 
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'}; 
temp.tL_m = C2K(8.5); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LandPere2001';
comment.tL_m = 'data for males';

% time-weight
data.tW_f = [ ... % age (yr), wet weight (g) 
2.011	162.528
2.925	216.704
3.892	325.056
4.990	623.025
5.957	893.905
7.002	975.169
7.998	2031.603
8.969	2979.684
9.963	3494.357
11.008	3575.621
12.025	3277.652
12.974	5363.431
12.975	5688.488
14.015	4740.406
15.052	9020.316
16.034	6582.393
17.082	7503.386
18.007	10076.749];
data.tW_f(:,1) = 365 * data.tW_f(:,1); % convert yr to d
units.tW_f = {'d', 'g'}; label.tW_f = {'time since birth', 'wet weight', 'female'}; 
temp.tW_f = C2K(8.5); units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'LandPere2001';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % age (yr), wet weight (g)
2.011	54.176
2.899	108.352
3.944	216.704
4.936	379.233
5.982	758.465
7.081	1110.609
7.969	1191.874
8.989	1733.634
10.034	1733.634
11.003	2573.363
12.049	2790.068
12.961	2437.923]; 
data.tW_m(:,1) = 365 * data.tW_m(:,1); % convert yr to d
units.tW_m = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'}; 
temp.tW_m = C2K(8.5); units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'LandPere2001';
comment.tW_m = 'data for males';

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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only ';
D2 = 'temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  
                                 
%% Facts
F1 = 'Marine; bathydemersal; depth range 70 - 1013 m, usually 100 - 500 m.   Deep-water;';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3W2LK'; % Cat of Life
metaData.links.id_ITIS = '164502'; % ITIS
metaData.links.id_EoL = '46566105'; % Ency of Life
metaData.links.id_Wiki = 'Lophius_budegassa'; % Wikipedia
metaData.links.id_ADW = 'Lophius_budegassa'; % ADW
metaData.links.id_Taxo = '125346'; % Taxonomicon
metaData.links.id_WoRMS = '126554'; % WoRMS
metaData.links.id_fishbase = 'Lophius-budegassa'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lophius_budegassa}}';  
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
bibkey = 'LandPere2001'; type = 'Article'; bib = [ ...  
'author = {J. Landa and P. Pereda and R. Duarte and M. Azevedo}, ' ...
'year = {2001}, ' ...
'title = {Growth of anglerfish (\emph{Lophius piscatorius} and \emph{L. budegassa}) in {A}tlantic {I}berian waters}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = {51}, '...
'pages = {363-376}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lophius-budegassa.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
