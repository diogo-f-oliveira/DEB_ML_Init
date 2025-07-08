function [data, auxData, metaData, txtData, weights] = mydata_Syacium_gunteri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Paralichthyidae';
metaData.species    = 'Syacium_gunteri'; 
metaData.species_en = 'Shoal flounder'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 04 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 27]; 

%% set data
% zero-variate data

data.am = 30*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.17; units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'SancFlore2006';  
data.Lp  = 9.6;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 20;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwi = 74;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight at 152 cm';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00646*Li^3.12, see F1';

data.Ri  = 6e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.98 as found for Paralichthys californicus';
 
% uni-variate data
% time-length
data.tL = [... % time since birth (d), standard length (cm)
3.738	0.144
3.738	0.175
5.140	0.195
7.944	0.219
8.178	0.195
8.645	0.239
8.645	0.255
9.813	0.255
10.981	0.239
11.916	0.299
14.486	0.319
15.187	0.283
15.888	0.395
15.888	0.415
16.121	0.359
17.991	0.351
17.991	0.494
18.925	0.411
19.860	0.415
21.262	0.447
23.832	0.562
24.065	0.494
25.935	0.522
27.336	0.570
27.336	0.586
28.037	0.670
28.738	0.590
29.206	0.558
30.140	0.602
32.009	0.594
32.944	0.710
32.944	0.734
33.178	0.610
33.645	0.757
34.579	0.706
39.953	0.765
43.925	0.949
46.262	0.941
46.963	1.176]; 
comment.tL(:,2) = data.tL(:,2) * 1.18; % convert SL to TL based on photo
units.tL = {'d', 'cm'}; label.tL = {'age', 'total length'};  
temp.tL = C2K(19); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SancFlore2006';
comment.tL = 'Data for southern Gulf of Mexico, spring 1992';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g =  0.00646*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '53K8L'; % Cat of Life
metaData.links.id_ITIS = '172791'; % ITIS
metaData.links.id_EoL = '46570531'; % Ency of Life
metaData.links.id_Wiki = 'Syacium'; % Wikipedia
metaData.links.id_ADW = 'Syacium_gunteri'; % ADW
metaData.links.id_Taxo = '188418'; % Taxonomicon
metaData.links.id_WoRMS = '275839'; % WoRMS
metaData.links.id_fishbase = 'Syacium-gunteri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Syacium}}';
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
bibkey = 'SancFlore2006'; type = 'Article'; bib = [ ... 
'author = {A. S\''{a}nchez-Iturbe and C. Flores-Coto and F. Zavala-Garc\''{i}a}, ' ... 
'year = {2006}, ' ...
'title = {Seasonal variation in growth and mortality of larval \emph{Syacium gunteri} ({P}iscis: {P}aralichthyidae) in the southern {G}ulf of {M}exico (1992 and 1993)}, ' ...
'journal = {Ciencias Marinas}, ' ...
'volume = {32(1B)}, ' ...
'pages = {83-95}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Syacium-gunteri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

