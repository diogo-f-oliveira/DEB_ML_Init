function [data, auxData, metaData, txtData, weights] = mydata_Brachirus_orientalis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Soleidae';
metaData.species    = 'Brachirus_orientalis'; 
metaData.species_en = 'Oriental sole'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'; 'Ww-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 11];

%% set data
% zero-variate data
data.am = 21*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'KeivAlgh2020';  
  temp.am = C2K(28.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 22;   units.Lp = 'cm';   label.Lp = 'total length at puberty';      bibkey.Lp = 'PourKeiv2021';
data.Li = 38;    units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 1.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'PourKeiv2021';
  comment.Wwb = 'based on egg diameter of 0.66  mm: pi/6*0.066^3';
data.Wwp = 99.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'PourKeiv2021','fishbase'};
  comment.Wwp = 'based on 0.00851*Lp^3.03, see F2';
data.Wwi = 520;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00851*Li^3.03, see F2';

% uni-variate data

% time-length
data.tL_fm = [ ... % age (years), total length (cm)
    3 18.55 14.10
    4 NaN   15.85
    5 21.52 17.98
    6 22.98 20.08
    7 24.53 21.88
    8 25.96 24.21
    9 NaN   26.13
   10 27.47 27.96
   11 29.38 29.10
   12 31.42 NaN
   13 32.35 NaN
   14 33.52 NaN
   15 34.52 NaN
   16 36.30 NaN
   17 38.45 NaN];
data.tL_fm(:,1) = (0 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(28.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'KeivAlgh2020'; treat.tL_fm = {1, {'females','males'}};

% time-weight
data.tW_fm = [ ... % age (years), weight (g)
    3 298.61  50.54
    4 NaN     65.09
    5 402.62  94.92
    6 450.99 126.68
    7 313.28 164.46
    8 352.91 217.51
    9 NaN    281.12
   10 332.33 375.63
   11 373.79 375.18
   12 465.64 NaN
   13 338.27 NaN
   14 182.38 NaN
   15 261.06 NaN
   16 280.18 NaN
   17 177.44 NaN];
data.tW_fm(:,1) = (0 + data.tW_fm(:,1)) * 365; % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(28.5);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'KeivAlgh2020'; treat.tW_fm = {1, {'females','males'}};

% length-fecundity
data.LN = [ ... % age (years), total length (cm)
22.585	66379.310
22.598	25000.000
24.030	32758.621
25.405	19827.586
26.647	37931.034
27.141	52586.207
27.167	168103.448
27.750	96551.724
27.818	79310.345
28.207	31034.483
28.495	108620.690
29.504	69827.586
29.791	150000.000
29.888	37931.034
30.827	27586.207
31.120	87931.034
31.359	118965.517
31.860	112068.966
32.096	156034.483
32.109	115517.241
32.614	94827.586
32.687	60344.828
32.759	27586.207
33.274	175862.069
34.229	113793.103
36.673	71551.724
38.471	105172.414];
units.LN = {'cm', '#'}; label.LN = {'weight','fecundity'};  
temp.LN = C2K(28.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'PourKeiv2021'; 

% weight-fecundity
data.WN = [ ... % age (years), weight (g)
173.913	25698.758
218.926	31898.520
243.478	67585.404
296.675	36276.032
329.412	22846.639
351.918	52285.806
360.102	168348.100
372.379	94227.256
374.425	32617.830
407.161	37938.436
415.345	67393.588
415.345	29893.588
431.714	78089.605
435.806	106656.467
511.509	149429.119
544.246	27964.012
558.568	85983.741
562.660	113657.746
562.660	118122.031
562.660	60979.174
587.212	110058.915
587.212	91308.915
601.535	105578.645
619.949	174308.093
632.225	111794.392
652.685	156414.414
695.652	70652.174];
units.WN = {'g', '#'}; label.WN = {'weight','fecundity'};  
temp.WN = C2K(28.5);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'PourKeiv2021'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 0 * weights.tW_fm;
weights.Li = 3 * weights.Li;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'tW data ignored, due to inconsistency with tL data and data between sexes';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Length-Weight relationship: Ww in g = 0.00851*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'JWMZ'; % Cat of Life
metaData.links.id_ITIS = '173040'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Brachirus_orientalis'; % Wikipedia
metaData.links.id_ADW = 'Brachirus_orientalis'; % ADW
metaData.links.id_Taxo = '162715'; % Taxonomicon
metaData.links.id_WoRMS = '219821'; % WoRMS
metaData.links.id_fishbase = 'Brachirus-orientalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Brachirus_orientalis}}';
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
bibkey = 'KeivAlgh2020'; type = 'article'; bib = [ ...
'doi = {10.1590/s2675-28242020068317}, ' ...
'author = {Yazdan Keivany and Dima Alghada and Fatemeh Paykan-Heyrati}, ' ... 
'year   = {2020}, ' ...
'title  = {Age and growth of oriental sole, \emph{Brachirus orientalis} ({B}loch \& {S}chneider, 1801), in the {P}ersian {G}ulf ({S}oleidae)}, ' ...
'journal = {Ocean and Coastal Research}, ' ...
'page = {e20317}, ' ...
'volume = {68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PourKeiv2021'; type = 'article'; bib = [ ...
'doi = {10.1590/s2675-282420200683110.1016/j.rsma.2021.1019117}, ' ...
'author = {Pourmohammad, M. and Keivany, Y. and Paykan-Heyrati, F.}, ' ... 
'year   = {2021}, ' ...
'title  = {Reproductive biology of oriental sole, \emph{Brachirus orientalis}, in {N}orthern {P}ersian {G}ulf}, ' ...
'journal = {Regional Studies in Marine Science}, ' ...
'page = {101911}, ' ...
'volume = {68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Brachirus-orientalis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
