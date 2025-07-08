function [data, auxData, metaData, txtData, weights] = Gymnapistes_marmoratus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Scorpaenidae';
metaData.species    = 'Gymnapistes_marmoratus'; 
metaData.species_en = 'Soldier'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 13];

%% set data
% zero-variate data

data.ab = 21;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(17.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14 * 365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(17.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 8.1;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Gran1972';
  comment.Lp = 'based on LN data';
data.Li  = 22.5;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Gran1972';

data.Wwb = 1.8e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess of ';
  comment.Wwim = 'based on egg diameter of 1.5 mm of Scorpaena_maderensis: pi/6*0.15^3';
data.Wwi = 144.8;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'fishbase','Gran1972'};
  comment.Wwi = 'based on 0.01122*Li^3.04, see F1';
 
% uni-variate data
% time-length 
data.tL_fm = [ ... %  year class (yr), total length(cm)
    1  5.4  5.4
    2  8.1  7.9
    3 10.3  9.4
    4 11.7 11.6
    5 12.3 12.9
    6 13.9 13.4
    7 13.9 14.3
    8 15.1 15.2
    9 16.5 15.2
   10 16.7 15.8
   11 17.3 16.1
   12 17.6 16.5
   13 18.0 17.1];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.75) * 365; % convert yr to d
units.tL_fm = {'d' 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(17.9); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Gran1972'; treat.tL_fm = {1 {'female','male'}};

% length-fecundity
data.LN = [ % total length (cm), fecundity (#)
12.907	47.301
13.327	82.104
14.017	52.740
14.596	99.147
14.600	42.305
14.695	184.426
14.859	121.293
15.024	29.741
15.177	108.712
15.178	93.975
15.226	161.351
15.969	133.048
16.652	197.366
16.655	153.156
16.663	48.947
17.028	120.583
17.131	163.757
17.132	141.652
17.241	110.091
17.292	130.099
17.496	225.920
17.507	79.606
17.612	99.623
17.712	171.218
17.717	113.324
17.872	159.664
18.029	181.794
18.085	135.487
18.142	81.812
18.291	210.256
18.403	125.011
18.607	237.675
18.874	201.927
18.878	146.139
18.981	178.787
19.032	212.479
19.662	270.473
19.824	231.551
19.867	357.874
20.025	374.741
20.610	335.886
20.722	255.903
21.746	697.118
22.543	656.191];
units.LN = {'cm' '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(17.9); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Gran1972'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Li = 3 * weights.Li;
weights.Wwb = 3 * weights.Wwb;
weights.ab = 0 * weights.ab;

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
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Ww in g = 0.01122*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6L73G'; % Cat of Life
metaData.links.id_ITIS = '166936'; % ITIS
metaData.links.id_EoL = '46568306'; % Ency of Life
metaData.links.id_Wiki = 'Gymnapistes_marmoratus'; % Wikipedia
metaData.links.id_ADW = 'Gymnapistes_marmoratus'; % ADW
metaData.links.id_Taxo = '175503'; % Taxonomicon
metaData.links.id_WoRMS = '280952'; % WoRMS
metaData.links.id_fishbase = 'Gymnapistes-marmoratus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnapistes-marmoratus}}';
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
bibkey = 'Gran1972'; type = 'Article'; bib = [ ... 
'author = {Grant, C.}, ' ... 
'year = {1972}, ' ...
'title = {The biology of the soldier fish, \emph{Gyranapistes marmoratus} ({P}isces, {S}corpaenidae)}, ' ...
'journal = {Austr. J. Mar. Preshw. Res.}, ' ...
'volume = {23(2)}, ' ...
'pages = {151-163}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Gymnapistes-marmoratus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

