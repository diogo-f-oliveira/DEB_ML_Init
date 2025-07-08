function [data, auxData, metaData, txtData, weights] = mydata_Amphiprion_ocellaris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Amphiprion_ocellaris'; 
metaData.species_en = 'Clown anemonefish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 03];

%% set data
% zero-variate data

data.ab = 7.5;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'KhooDasa2018';   
  temp.ab = C2K(28.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 7-8 d, yolksac resorbed at 7 h';
data.am = 12*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 11;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.7e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'KhooDasa2018';
  comment.Wwb = 'based on egg length of 3.0-3.3 mm and width 1.1-1.9 mm: pi/6*0.315*0.15^2'; 
data.Wwp = 1.8;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwi = 'based on 0.01479*Lp^3.00, see F1';
data.Wwi = 19.7;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^3.00, see F1';

data.Ri  = 4*1516/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1516 eggs/clutch, assumes 5 clutches per yr ';
  
% uni-variate data
% time-length
data.tL = [ ... % time (d), standard length (mm)
    4.7 5.00
    5   7.26
   10   9.71
   15  10.75
   20  12.42
   25  14.18
   30  16.17
   35  17.45
   40  18.87
   50  20.82
   60  23.69
   70  26.22
   80  28.32
   90  31.84
  100  34.50];
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(28.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KhooDasa2018';

% length-fecundity
data.LN = [ ... % length (cm), fecundity (#)
6.415	190.566
6.497	67.253
6.713	485.399
7.006	671.026
7.116	637.965
7.404	1279.371
7.488	40.335
7.593	64.239
7.598	106.978
7.600	510.541
7.605	444.081
7.704	467.976
7.800	1042.608
7.802	83.561
7.893	1071.243
7.903	648.707
7.903	672.446
7.905	1104.495
7.994	26.893
7.995	316.509
8.105	69.797
8.122	235.996
8.196	1062.227
8.201	853.332
8.306	995.932
8.395	1309.426
8.698	1376.374
8.791	1148.628
8.897	1533.365];    
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(28.7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'KhooDasa2018';
comment.LN = 'assumes clutch-interval 365/8';

% length (cm), weight (g)
data.LW = [ ... % total length (cm), weight (g)
2.924	0.368
3.437	0.965
3.699	0.919
4.121	1.241
4.246	1.241
4.565	1.608
4.725	1.792
4.805	2.482
4.941	2.206
5.261	3.033
5.386	2.803
5.432	3.493
5.512	4.688
5.557	3.033
5.626	4.320
5.660	3.033
5.671	3.447
5.786	4.871
5.865	3.952
5.876	3.631
5.957	4.871
5.991	6.342
6.093	5.055
6.104	3.768
6.196	4.458
6.199	12.730
6.230	4.963
6.230	5.561
6.310	5.147
6.345	6.204
6.402	6.710
6.492	4.871
6.504	6.112
6.505	7.491
6.527	5.653
6.686	5.744
6.721	7.215
6.812	6.296
6.824	8.088
6.960	7.904
7.051	6.618
7.143	8.778
7.154	7.215
7.234	7.858
7.314	8.272
7.315	9.881
7.371	9.007
7.416	8.548
7.428	9.789
7.439	7.675
7.519	9.237
7.600	11.259
7.611	10.248
7.655	7.950
7.725	10.064
7.782	11.167
7.827	10.110
7.851	11.903
7.884	10.478
7.930	10.892
7.942	12.362
7.965	11.719
7.975	9.926
7.977	12.868
8.125	13.235
8.181	11.397
8.240	14.798
8.262	12.960
8.284	11.351
8.295	10.708
8.341	12.362
8.455	12.638
8.456	14.200
8.490	13.465
8.512	12.914
8.548	15.625
8.695	14.752
8.706	13.603
8.719	15.855
8.787	16.406
8.913	18.061
8.924	17.004
10.009	23.070];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'KhooDasa2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01479*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'D55Y'; % Cat of Life
metaData.links.id_ITIS = '615174'; % ITIS
metaData.links.id_EoL = '46572519'; % Ency of Life
metaData.links.id_Wiki = 'Amphiprion_ocellaris'; % Wikipedia
metaData.links.id_ADW = 'Amphiprion_ocellaris'; % ADW
metaData.links.id_Taxo = '46257'; % Taxonomicon
metaData.links.id_WoRMS = '278400'; % WoRMS
metaData.links.id_fishbase = 'Amphiprion-ocellaris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthochromis_polyacanthus}}';
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
bibkey = 'KhooDasa2018'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00338-017-1559-8}, ' ...
'author = {Mei Ling Khooa and Simon Kumar Dasa and Mazlan Abd Ghaffar}, ' ... 
'year = {2018}, ' ...
'title = {Growth pattern, diet and reproductive biology of the clownfish \emph{Amphiprion ocellaris} in waters of {P}ulau {T}ioman, {M}alaysia}, ' ...
'journal = {Egyptian Journal of Aquatic Research}, ' ...
'volume = {44(3)}, ' ...
'pages = {233-239}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RaheKris2021'; type = 'Article'; bib = [ ... 
'doi = {10.21077/ijf.2021.68.2.102354 -08}, ' ...
'author = {P. K. Raheem and M. V. Rohini Krishna and S. Surya and P. Gomaithi and Ambarish and P. Gop and B. Santhosh and B. Raju and M. K. Anil}, ' ... 
'year = {2021}, ' ...
'title = {Breeding, larval rearing and growth of black \emph{Amphiprion ocellaris} ({C}uvier, 1830) under captivity}, ' ...
'journal = {Indian J. Fish.}, ' ...
'volume = {68(2)}, ' ...
'pages = {60-69}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Amphiprion-ocellaris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
