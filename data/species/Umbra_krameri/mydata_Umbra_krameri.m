  function [data, auxData, metaData, txtData, weights] = mydata_Umbra_krameri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Esociformes'; 
metaData.family     = 'Umbridae';
metaData.species    = 'Umbra_krameri'; 
metaData.species_en = 'European mudminnow'; 

metaData.ecoCode.climate = {'Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl','0iFp','0iFm'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 07 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 09]; 

%% set data
% zero-variate data
data.ab = 23;     units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'Kova1995'; 
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 1.7*365;  units.tp = 'd';   label.tp = 'time since birth at puberty';  bibkey.tp = 'fishbase';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 5*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.6;   units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'guess'; 
  comment.Lp =  'based on same relative length, compared to U. pygmaea: 3.7*17/13.7';
data.Li = 17;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Kova1995';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwi = 26.9; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389 *Li^3.12, see F1';
      
data.Ri = 1500/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is guessed';
  
% uni-variate data
% time - length
data.tL = [ ... ; % time since birth (yr) total length (cm)
8.04	0.41
8.04	0.39
9.09	0.50
9.09	0.48
9.09	0.46
9.95	0.52
10.04	0.55
10.05	0.48
10.15	0.45
10.91	0.57
11.97	0.52
12.06	0.54
12.17	0.47
13.12	0.53
13.21	0.58
14.08	0.56
14.27	0.58
14.38	0.47
14.94	0.63
14.94	0.58
15.22	0.67
15.23	0.65
16.00	0.61
16.00	0.58
16.00	0.57
16.10	0.52
17.90	0.79
17.91	0.77
18.00	0.80
18.00	0.75
18.20	0.72
18.30	0.70
18.40	0.69
19.36	0.69
20.03	0.70
23.39	0.71
27.33	0.81
31.08	0.81
31.08	0.78
35.97	0.89
40.97	0.91
41.15	1.03
49.33	1.01
53.93	1.09
53.95	0.87
64.81	0.94
80.09	1.05
80.10	0.99
86.24	1.13
86.24	1.06];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(17); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'Kova1995'};
    
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
D1 = 'No clear difference between males and females';
D2 = 'mean temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts 
F1 = 'length-weight: Ww in g = 0.00389 *(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DGKR'; % Cat of Life
metaData.links.id_ITIS = '162157'; % ITIS
metaData.links.id_EoL = '211216'; % Ency of Life
metaData.links.id_Wiki = 'Umbra_krameri'; % Wikipedia
metaData.links.id_ADW = 'Umbra_krameri'; % ADW
metaData.links.id_Taxo = '42902'; % Taxonomicon
metaData.links.id_WoRMS = '154237'; % WoRMS
metaData.links.id_fishbase = 'Umbra-krameri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Umbra_krameri}}';  
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
bibkey = 'Kova1995'; type = 'Article'; bib = [ ...  
'author = {Kov\''{a}\v{c}, V.}, ' ...
'year = {1995}, ' ...
'title = {Reproductive behaviour and early development of the {E}uropean mudminnow \emph{Umbra krameri}}, ' ... 
'journal = {Folia Zoologica}, ' ...
'volume = {44}, '...
'pages = {57-80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Umbra-krameri.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

