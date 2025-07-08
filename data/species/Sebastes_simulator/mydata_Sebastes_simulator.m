function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_simulator

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_simulator'; 
metaData.species_en = 'Pinkrose rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 26];

%% set data
% zero-variate data

data.am = 39*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'LoveMcCr2018';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on tL data';

data.Lp  = 16;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'LoveMcCr2018';
  comment.Lp = 'based on Sebastes_entomelas';
data.Li  = 30;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 53.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','LoveMcCr2018'};
  comment.Wwp = 'based on 0.00912*Lp^3.13, see F1';
data.Wwi = 383;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.13, see F1';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
5.167	10.303
6.083	14.449
6.333	13.942
6.333	13.234
6.333	11.513
6.417	10.703
7.000	10.296
7.167	14.344
8.083	13.430
8.167	15.454
9.000	16.666
10.083	16.561
11.167	16.456
12.000	18.275
12.083	17.870
12.083	17.465
12.833	21.208
13.167	18.373
14.000	18.370
14.083	19.382
16.083	22.007
16.250	22.512
16.750	21.296
16.917	22.712
16.917	19.271
17.167	23.015
18.000	24.126
18.000	23.215
18.833	25.236
18.833	24.730
18.917	26.957
19.000	24.021
19.167	22.199
19.917	23.208
20.000	20.374
20.250	26.750
20.917	24.419
21.000	21.180
21.000	19.358
21.167	25.431
21.167	22.495
22.000	27.452
22.000	26.946
23.000	23.603
23.083	22.590
23.083	24.210
23.917	26.231
23.917	25.118
24.000	22.688
24.917	23.697
25.000	25.721
25.083	24.304
25.667	23.999
25.917	23.188
26.083	25.819
26.167	26.628
27.083	24.905
27.167	28.042
28.000	24.902
28.000	23.991
28.000	23.383
28.083	27.735
29.167	24.493
29.833	23.377
30.667	26.006
32.083	26.102];
data.tL_f(:,1) = 365*(0.8+data.tL_f(:,1)); % convert yr 
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-6;end;end
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f   = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LoveMcCr2018';  
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
4.957	10.300
5.266	10.800
5.889	13.100
5.891	13.500
6.200	14.100
6.494	10.800
7.114	12.500
7.117	13.100
7.213	11.500
7.737	14.700
7.844	15.800
9.074	16.300
9.165	13.700
9.892	16.200
11.405	11.100
11.943	17.400
11.946	18.300
12.866	18.100
14.407	19.700
14.826	21.900
15.941	19.600
16.336	15.900
17.185	23.400
17.276	20.800
17.281	22.000
17.399	25.700
19.020	21.800
19.437	23.800
20.339	19.300
20.360	24.400
20.456	22.900
21.085	26.600
22.095	23.300
22.196	23.000
22.199	23.900
22.304	24.400
23.119	23.600
23.122	24.300
23.123	24.600
23.230	25.700
23.233	26.500
23.949	26.500
24.146	24.700
24.262	27.900
24.449	23.700
25.171	25.000
25.264	22.900
25.383	26.800
25.990	25.100
25.997	26.900
26.087	23.900
26.096	26.000
27.111	24.100
27.119	26.200
27.317	24.500
27.319	24.900
27.328	27.200
28.034	24.700
28.043	26.800
28.243	25.800
29.041	20.700
29.151	22.700
29.164	25.900
30.187	25.900
30.190	26.500
30.276	22.700
30.288	25.500
30.296	27.500
31.000	24.600
31.198	22.900
32.029	26.100
32.034	27.100
33.153	25.700
34.170	24.200
34.276	25.000
35.201	26.200
35.913	25.100
36.124	26.800
37.447	25.000
38.167	25.900
39.091	26.700];
data.tL_m(:,1) = 365*(0.8+data.tL_m(:,1)); % convert yr 
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-6;end;end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m   = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LoveMcCr2018';  

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
17.921	12509.359
18.409	10058.144
19.068	18826.762
20.129	21034.249
20.789	18025.089
20.846	25802.071
21.763	27344.882
22.022	21007.965
22.050	29340.900
22.710	32998.407
23.427	41099.562
23.599	33763.839];
units.LN  = {'cm','#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(10);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LoveMcCr2018';  

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.00912*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7KZ'; % Cat of Life
metaData.links.id_ITIS = '166710'; % ITIS
metaData.links.id_EoL = '46568121'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_babcocki'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_babcocki'; % ADW
metaData.links.id_Taxo = '187253'; % Taxonomicon
metaData.links.id_WoRMS = '274775'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-babcocki'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_babcocki}}';
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
bibkey = 'LoveMcCr2018'; type = 'article'; bib = [ ... 
'howpublished = {\url{https://publications.gc.ca/collections/collection_2013/mpo-dfo/Fs97-13-289-eng.pdf}}, ' ...
'author = {Milton S. Love and Merit McCrea and Li Kui},' ...
'year = {2018}, ' ...
'title = {Aspects of the Life Histories of Pinkrose Rockfish (\emph{Sebastes simulator}) and Swordspine Rockfish (\emph{Sebastes ensifer}) with Notes on the Subgenus {S}ebastomus}, ' ...
'journal = {Bull. Southern California Acad. Sci.}, ' ...
'volume = {117(1)}, ' ...
'pages = {64–76}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-babcocki.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
