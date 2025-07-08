function [data, auxData, metaData, txtData, weights] = mydata_Urechis_caupo

%% set metaData
metaData.phylum     = 'Annelida'; 
metaData.class      = 'Polychaeta'; 
metaData.order      = 'Echiuroidea'; 
metaData.family     = 'Urechidae';
metaData.species    = 'Urechis_caupo'; 
metaData.species_en = 'Spoon Worm'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'bjD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'V-V'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 20]; 

%% set data
% zero-variate data

data.ab = 40/24;    units.ab = 'd';    label.ab = 'age at emergence';            bibkey.ab = 'Goul1969';   
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 60 - 40/24; units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'Goul1969';   
  temp.tj = C2K(17);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.tp = 1.5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Suer1984';   
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 10*365;    units.am = 'd';    label.am = 'life span';                  bibkey.am = 'Suer1984';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on large size of 158 ml in 6 yr';
 
data.Wwb = 8.2e-6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwj = 'guess based on guessed egg diameter of 100 mum: pi/6*0.01^3';
data.Wwj = 2e-4;   units.Wwj = 'g';   label.Wwj = 'wet weight at settle';        bibkey.Wwj = 'Suer1984';
data.Wwp = 56;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';         bibkey.Wwp = 'Suer1984';
  comment.Wwp = 'corresponds with 2 g dry weight, see pars_init';
data.Wwi = 160;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'Suer1984';

data.Ri = 4e7/365;       units.Ri = '#/d';  label.Ri = 'reprod rate';            bibkey.Ri = 'guess';
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.6 as high-fertility species';

% uni-variate data

% period-change in volume: release after branding and recaptured
tV0V1_A = [ ... % period (mnth), initial volume (ml), end volume (ml)
24.0 110 110
24.0  15  85
 5.5  85 100
 5.5  70 120
 5.5  50  80
14.5 100  90
11.5 115 115
10.0 130  85
10.0  10  35
10.0 110 150
10.0  95  80
10.0 170 120
10.0 115  95
10.0 140 110
24.5 105 165
24.5  80 115
24.5 130 255
24.5 120 155
24.5 110 125
24.5 115 150
24.5 125 165
24.5 155 150
 9.0  65  95
11.5  85 105
 8.25 95  85
 8.25 45  65
14.5  35 115
14.5  30 135
14.5  30  75
14.5  75 165
14.5  50  65
14.5 105 180
13.0  15  40
13.0   8  45
13.0   1  65
13.0 135 140
13.0 110 170
13.0 145 170
12.0 110 140
 8.0  17  85
 8.0  30  85
 8.0  90  55
 8.0 130 155
 8.0  85 185
 8.0 100 145];
data.V0V1_A = tV0V1_A(:,[2 3]);
units.V0V1_A   = {'ml', 'ml'};  label.V0V1_A = {'initial volume', 'final volume', 'long exposure time'};  
temp.V0V1_A    = C2K(17);  units.temp.V0V1_A = 'K'; label.temp.V0V1_A = 'temperature';
treat.V0V1_A = {0}; units.treat.V0V1_A = '-'; label.treat.V0V1_A = '';
bibkey.V0V1_A = 'Suer1984';
comment.V0V1_A = 'data for long exposure times';
%
times.V0V1_A = 30.5 * tV0V1_A(:,1); % convert month to d
units.times.V0V1_A   = 'd';  label.times.V0V1_A = 'exposure time';  
%
tV0V1_S = [ ... % period (mnth), initial volume (ml), end volume (ml)
 0.50 135 135
 0.25 110 100
 2.25  55  75
 2.25 110 100
 2.00  45  75
 2.00  15  80
 2.00  85  75
 2.00  40  90
 1.00 155 110
 1.00  65  90];
data.V0V1_S = tV0V1_S(:,[2 3]);
units.V0V1_S   = {'ml', 'ml'};  label.V0V1_S = {'initial volume', 'final volume', 'short exposure time'};  
temp.V0V1_S    = C2K(25);  units.temp.V0V1_S = 'K'; label.temp.V0V1_S = 'temperature';
bibkey.V0V1_S = 'Suer1984';
comment.V0V1_S = 'data for short exposure times in summer, so higher temp';
%
times.V0V1_S = 30.5 * tV0V1_S(:,1); % convert month to d
units.times.V0V1_S   = 'd';  label.times.V0V1_S = 'exposure time';  
treat.V0V1_S = {0}; units.treat.V0V1_S = '-'; label.treat.V0V1_S = '';

%% set weights for all real data
weights = setweights(data, []);
weights.tj = 0 * weights.tj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.times = times;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'V0V1_A','V0V1_S'}; subtitle1 = {'Data at long, short exposure times'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Adjusted d_V and d_E of 0.04 g/cm^3 is used';
D2 = 'In absence of reprod data, kap = 0.5 is fixed for this high-fertility species';
D3 = 'Under-estimation of t_j might be linked to assimilation by trochophora larvae; t_j was ignored';
D4 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1,'D2',D2,'D3',D3,'D4',D4);

%% Facts
F1 = 'Suspension feeder, contrary to e.g. Echiurus, which is a deposit feeder';
metaData.bibkey.F1 = 'Suer1984'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DPY3'; % Cat of Life
metaData.links.id_ITIS = '155145'; % ITIS
metaData.links.id_EoL = '46495455'; % Ency of Life
metaData.links.id_Wiki = 'Urechis_caupo'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '15653'; % Taxonomicon
metaData.links.id_WoRMS = '266874'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urechis_unicinctus}}';
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
bibkey = 'Suer1984'; type = 'Article'; bib = [ ... 
'author = {Suer, A. L.}, ' ... 
'year = {1984}, ' ...
'title = {Growth and spawning of \emph{Urechis caupo} ({E}chiura) in {B}odega {H}arbor, {C}alifornia}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {78}, ' ...
'pages = {275--284}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Goul1969'; type = 'Article'; bib = [ ... 
'author = {M. C. Gould}, ' ... 
'year = {1969}, ' ...
'title = {A Comparison of {R}{N}{A} and Protein Synthesis in Fertilized and Unfertilized Eggs of \emph{Urechis caupo}}, ' ...
'journal = {Developmental Biology}, ' ...
'volume = {19}, ' ...
'pages = {482--497}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];