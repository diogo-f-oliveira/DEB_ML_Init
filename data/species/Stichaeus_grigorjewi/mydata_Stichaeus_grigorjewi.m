function [data, auxData, metaData, txtData, weights] = mydata_Stichaeus_grigorjewi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Stichaeidae';
metaData.species    = 'Stichaeus_grigorjewi'; 
metaData.species_en = 'Shanny'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mnf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(1.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 16];

%% set data
% zero-variate data

data.am = 17*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(1.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Stichaeus punctatus';
  
data.Lp  = 30;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'guess'; 
data.Li  = 60;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';
  
data.Wwb = 2.6e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7 mm of Stichaeus_punctatus: pi/6*0.17^3';
data.Wwp = 145.7;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = {'fishbase','BouaBoud2018'};  
  comment.Wwp = 'based on 0.00324*Lp^3.15, see F1';
data.Wwi = 1.3e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';  
  comment.Wwi = 'based on 0.00324*Li^3.15, see F1';

data.Ri  = 93270/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 11 cm';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(1.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    2 24.2 21.9
    3 26.3 25.3
    4 31.6 NaN
    5 33.3 NaN
    6 38.5 37.5
    7 40.6 40.7
    8 42.4 41.2
    9 43.3 45.3
   10 46.0 45.3
   11 45.1 47.5
   12 49.1 48.3];
data.tL_fm(:,1) = 365 * (0.3 + data.tL_fm(:,1)); % convert yr 
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm   = C2K(1.8);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'KalcPush2006'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
21.728	67.713
23.073	53.005
24.129	72.083
25.329	78.494
27.058	133.527
28.834	85.043
29.842	123.132
30.658	125.294
31.715	150.710
33.491	207.859
35.075	203.730
35.988	224.912
36.132	256.610
36.660	241.854
37.380	282.038
38.724	239.865
38.772	299.023
39.300	292.717
40.069	237.834
40.501	356.170
40.549	324.483
40.837	318.162
40.885	351.968
40.885	373.094
41.221	322.411
41.269	345.653
41.269	278.047
41.413	413.267
41.413	392.140
42.133	447.114
42.517	417.559
44.150	419.770
45.158	498.000
45.446	538.158
45.446	514.919
45.446	449.426
46.214	525.529
46.838	690.355
47.318	603.764
47.702	591.112
47.846	627.036
47.894	658.729
48.615	542.575
48.711	580.609
48.999	713.725
49.959	656.741
51.591	868.107];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'KalcPush2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL','tL1'}; subtitle1 = {'DunbGree2017, KeatStee1993'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00324*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '52HSW'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46574607'; % Ency of Life
metaData.links.id_Wiki = 'Stichaeus'; % Wikipedia
metaData.links.id_ADW = 'Stichaeus_grigorjewi'; % ADW
metaData.links.id_Taxo = '188240'; % Taxonomicon
metaData.links.id_WoRMS = '276557'; % WoRMS
metaData.links.id_fishbase = 'Stichaeus-grigorjewi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stichaeus}}';
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
bibkey = 'KalcPush2006'; type = 'Article'; bib = [ ... 
'author = {Kalchugin, P.V. and O.I. Pushchina and V.V. Panchenko and S.F. Solomatov}, ' ... 
'year = {2006}, ' ...
'title = {Distribution and some biological traits of \emph{Stichaeus grigorjewi} in waters of the northern {P}rimorie ({S}ea of {J}apan)}, ' ...
'journal = {Vopr. Ikhtiol.}, ' ...
'volume = {46(4)}, ' ...
'pages = {512-518}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Stichaeus-grigorjewi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
