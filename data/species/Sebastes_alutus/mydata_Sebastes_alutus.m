function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_alutus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_alutus'; 
metaData.species_en = 'Pacific ocean perch'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 20];

%% set data
% zero-variate data

data.am = 103*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(3.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 33.2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 53;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';

% univariate data
% time-length
data.tL = [ ...
1.291	6.487
2.051	10.166
3.114	13.166
4.063	16.747
5.127	20.425
5.962	24.201
7.063	24.487
8.051	26.905
9.114	29.905
9.911	31.161
10.861	33.483
11.848	34.448
12.873	35.607
13.899	36.475
15.152	38.020
15.987	39.373
16.975	40.726
17.924	40.334
19.139	40.814
19.937	42.264
21.000	41.582
21.987	42.353];
data.tL(:,1) = 365*data.tL(:,1); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(3.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MajoShip1970';
comment.tL = 'Data from Bering Sea';

% length - weight
data.LW_f = [ ... % total length (cm), wet weight (g)
33.088	527.884
33.958	611.619
35.146	567.877
36.013	673.811
37.181	746.610
37.953	830.291
39.523	853.363
40.196	942.538
41.264	1026.383
42.151	1015.775
42.807	1199.293
44.747	1361.323];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'fork length','wet weight','females'};  
bibkey.LW_f = 'MajoShip1970';
%
data.LW_m = [ ... % total length (cm), wet weight (g)
29.913	430.156
31.278	452.392
32.349	485.566
33.416	546.222
33.998	584.803
34.870	639.926
36.231	695.139
37.296	766.788
38.168	827.407
39.037	910.012
40.396	976.217];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'fork length','wet weight','males'};  
bibkey.LW_m = 'MajoShip1970';

% length-fecundity
data.LN = [ ... % fork length (cm), fecundity in 1e3 (#)
32.250	29.365
32.870	33.934
34.623	71.470
34.717	64.733
37.339	131.159
37.367	94.722
39.959	142.250
41.114	204.463
41.431	197.750
42.106	246.412
42.178	152.397
43.574	307.310
45.714	247.268];
data.LN(:,2)= data.LN(:,2)*1e3; 
units.LN  = {'cm', '#'};  label.LN = {'fork length', 'fecundity'};  
temp.LN   = C2K(3.8);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'MajoShip1970';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: W in g = 0.00933*(TL in cm)^3.09'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XZRS'; % Cat of Life
metaData.links.id_ITIS = '166707'; % ITIS
metaData.links.id_EoL = '46568116'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_alutus'; % ADW
metaData.links.id_Taxo = '187249'; % Taxonomicon
metaData.links.id_WoRMS = '254573'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-alutus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes}}';
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
bibkey = 'MajoShip1970'; type = 'techreport'; bib = [ ... 
'author = {Richard L. Major and Herbert H. Shippen}, ' ... 
'year = {1970}, ' ...
'title = {Synopsis of Biological Data on Ocean Perch, \emph{Sebastodes alutus}}, ' ...
'institution = {FAO Species Synopsis}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-alutus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
