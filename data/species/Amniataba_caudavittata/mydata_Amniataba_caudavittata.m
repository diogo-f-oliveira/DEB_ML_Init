function [data, auxData, metaData, txtData, weights] = mydata_Amniataba_caudavittata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Terapontidae';
metaData.species    = 'Amniataba_caudavittata'; 
metaData.species_en = 'Yellowtail trumpeter'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMm', '0iFr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 03 19];              
metaData.email    = {'bas.kooijan@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 19]; 

%% set data
% zero-variate data

data.am = 9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'WiseNeir1994';
  comment.Lp = 'based on end of 1st yr, early 2nd yr';
data.Li  = 30;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'WiseNeir1994';
  comment.Wwb = 'based on egg diameter of 560 mum: pi/6*0.056^3';
data.Wwp = 25;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'WiseNeir1994';
  comment.Wwp = 'based on 0.01380*Lp^3.02, see F1';
data.Wwi = 399;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01380*Li^3.02, see F1';

% uni-variate data
% time-length
data.tL_f = [ ... % time since 1 Jan (d), total length (cm)
12.359	2.458
44.188	4.687
76.062	6.125
105.818	7.324
137.027	7.971
166.833	8.300
194.527	8.312
225.771	8.326
257.002	8.577
287.500	9.223
318.686	10.265
349.868	11.386
365+13.186	12.901
365+43.640	14.339
365+74.826	15.381
365+106.735	16.186
365+134.402	16.672
365+165.642	16.765
365+194.046	16.777
365+225.290	16.791
365+256.526	16.963
365+287.747	17.372
365+316.826	18.017
365+347.315	18.822
730+13.505	19.784
730+43.276	20.747
730+74.484	21.393
730+106.407	21.961
730+134.802	22.131
730+166.747	22.303
730+195.156	22.237
730+227.816	22.330
730+256.215	22.421
730+287.451	22.593
730+317.253	23.002
730+348.465	23.569];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'total length', 'female'};  
temp.tL_f    = C2K(27.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WisePott1994';
comment.tL_f = 'Data for females; temperature osillating between 13 and 30 C';
%
data.tL_m = [ ... % time since 1 Jan (d), total length (cm)
12.523	2.162
43.645	4.332
74.089	5.943
105.260	7.235
134.343	7.806
164.854	8.219
196.108	8.073
226.633	8.246
256.448	8.419
286.946	9.071
316.005	10.043
347.887	11.334
365+11.933	12.545
365+43.110	13.757
365+73.594	14.649
365+104.797	15.381
365+135.314	15.714
365+165.129	15.887
365+195.663	15.900
365+227.613	15.994
365+258.138	16.167
365+287.238	16.420
365+317.741	16.992
365+348.949	17.645
730+13.728	18.457
730+42.806	19.108
730+75.447	19.522
730+105.249	19.934
730+135.779	20.028
730+167.005	20.361
730+195.418	20.213
730+226.667	20.147
730+257.907	20.241
730+285.587	20.492
730+317.532	20.666
730+348.745	21.239];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'total length', 'male'};  
temp.tL_m    = C2K(27.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WisePott1994';
comment.tL_m = 'Data for males; temperature osillating between 13 and 30 C';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (1e3 eggs)
14.518	134.690
15.151	52.296
15.226	90.469
16.356	114.983
19.315	209.865
21.960	324.571
22.812	405.552
22.822	304.790
22.829	629.981
23.019	289.537
23.202	411.689
23.204	391.842
23.205	376.575
23.406	318.575
24.193	259.093
24.673	550.732
24.801	442.345
25.399	714.147
25.620	451.568
26.000	555.414
26.754	434.861
28.572	619.732];
data.LN(:,2) = 1e3 * data.LN(:,2);
units.LN   = {'cm', '#'};  label.LN = {'total length','feundity'};  
temp.LN    = C2K(27.6);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'WiseNeir1994';

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperature in tL data is assumed to vary as 21.5+8*sin((t+100)/365*2*pi)';
D2 = 'Males are assumed to differ from females by {p_Am} only';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01380*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'CVTV'; % Cat of Life
metaData.links.id_ITIS = '650206'; % ITIS
metaData.links.id_EoL = '46580106'; % Ency of Life
metaData.links.id_Wiki = 'Amniataba_caudavittata'; % Wikipedia
metaData.links.id_ADW = 'Amniataba_caudavittata'; % ADW
metaData.links.id_Taxo = '160683'; % Taxonomicon
metaData.links.id_WoRMS = '279585'; % WoRMS
metaData.links.id_fishbase = 'Amniataba-caudavittata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amniataba_caudavittata}}';
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
bibkey = 'WisePott1994'; type = 'Article'; bib = [ ... 
'author = {B. S. Wise and I. C. Potter and J. H. Wallace}, ' ... 
'year = {1994}, ' ...
'title = {Growth, movements and diet of the terapontid \emph{Amniataba caudavittata} in an {A}ustralian estuary}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {45}, ' ...
'pages = {917-931}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WiseNeir1994'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1994.tb01286.x}, ' ...
'author = {Potter, I. C. and Neira, F. J. and Wise, B. S. and Wallace, J. H.}, ' ... 
'year = {1994}, ' ...
'title = {Reproductive biology and larval development of the terapontid \emph{Amniataba caudavittata}, including comparisons with the reproductive strategies of other estuarine teleosts in temperate {W}estern {A}ustralia}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {45}, ' ...
'pages = {57-74}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {https://www.fishbase.de/summary/Amniataba-caudavittata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

