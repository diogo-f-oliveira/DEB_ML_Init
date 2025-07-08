function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_ensifer

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_ensifer'; 
metaData.species_en = 'Swordspine rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.2); % K, body temp
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

data.am = 38*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'LoveMcCr2018';   
  temp.am = C2K(9.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on tL data';

data.Lp  = 15;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'LoveMcCr2018';
  comment.Lp = 'based on Sebastes_entomelas';
data.Li  = 30;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 43.8;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','LoveMcCr2018'};
  comment.Wwp = 'based on 0.00912*Lp^3.13, see F1';
data.Wwi = 383;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.13, see F1';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
5.081	12.225
5.177	11.276
5.184	12.742
5.278	11.535
6.091	13.516
6.185	12.308
6.188	12.998
6.991	13.082
6.995	13.944
6.997	14.203
7.914	17.218
7.984	11.183
8.003	14.890
8.012	16.700
8.025	19.373
8.205	15.234
9.014	16.439
9.024	18.595
10.020	17.127
10.223	17.643
10.316	16.091
10.430	18.936
11.024	17.296
11.223	17.037
11.835	19.019
11.927	17.380
12.122	16.259
12.147	21.432
14.134	17.547
14.145	19.703
14.230	16.685
14.231	17.030
15.233	16.855
15.236	17.372
15.247	19.527
15.659	21.768
15.958	21.422
16.044	18.491
16.247	18.922
16.250	19.525
16.337	16.939
16.452	19.869
16.751	19.438
16.937	16.678
16.953	19.868
17.049	18.920
17.146	18.230
18.060	20.469
18.065	21.589
18.251	18.658
18.258	20.124
18.348	18.054
18.354	19.175
18.972	22.363
19.262	20.207
19.263	20.466
19.266	20.983
20.056	18.654
20.063	20.033
20.065	20.464
20.069	21.154
20.070	21.412
20.252	17.705
20.260	19.343
20.272	21.670
21.162	19.168
21.268	20.289
21.271	20.978
21.474	21.495
21.559	18.391
22.074	20.976
22.167	19.683
22.172	20.545
22.279	22.010
22.283	22.786
22.974	20.457
22.977	21.060
22.979	21.491
23.182	22.008
23.269	19.422
24.183	21.574
24.189	22.781
24.281	21.143
24.975	19.590
25.073	19.245
25.386	21.485
26.080	19.932
26.084	20.708
26.094	22.690
27.187	20.705
27.994	21.737
28.290	20.702
35.224	23.616
38.227	22.402];
data.tL_f(:,1) = 365*(0.8+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f   = C2K(9.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LoveMcCr2018';  
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
4.181	11.464
4.278	12.916
4.958	12.837
5.153	12.757
5.250	11.628
5.931	12.033
5.932	13.888
6.028	12.678
6.125	13.162
6.903	13.729
7.000	12.116
7.972	14.618
8.069	15.586
9.139	15.347
10.111	16.317
10.208	16.801
11.083	17.206
11.181	18.416
11.958	18.337
12.250	17.693
13.125	19.550
13.903	14.229
14.097	18.907
14.194	19.633
14.972	17.296
15.264	17.538
16.139	19.315
16.236	17.944
16.333	18.670
17.208	21.011
17.792	17.383
17.986	18.351
18.083	19.803
18.083	20.045
18.764	20.208
18.765	19.966
18.958	21.256
18.958	19.240
19.056	18.273
19.153	18.757
19.250	16.902
19.931	18.275
20.028	18.759
20.028	19.323
20.125	21.340
20.222	19.888
20.903	18.842
21.000	18.358
21.972	20.215
22.069	18.844
22.069	17.635
22.167	19.248
23.139	20.540
23.139	20.218
23.722	22.477
23.722	21.590
23.917	19.816
23.918	18.768
25.181	19.174
25.278	21.513
25.861	18.450
27.028	21.194
27.029	19.985
27.903	21.519
28.097	20.713
28.194	20.068
29.264	19.264
33.833	20.162
36.944	19.121];
data.tL_m(:,1) = 365*(0.8+data.tL_m(:,1)); % convert yr 
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-6;end;end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m   = C2K(9.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LoveMcCr2018';  

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
17.097	12325.948
17.473	12215.189
17.906	10110.759
18.022	11882.910
18.484	11107.594
18.859	15427.214
19.090	12879.746
19.755	14098.100
19.812	12104.429
20.130	18639.240
20.303	13987.341
20.477	16867.088
20.794	20300.632
20.968	21851.265
20.996	19968.353
20.996	16313.290
21.574	22072.784
21.603	21297.467
21.603	20854.429
21.776	26281.645
22.036	29936.708
22.123	26281.645
22.181	37246.834
22.238	34367.088
22.643	31930.379
22.787	34588.607
22.787	31044.303
23.105	39351.265
23.105	34256.328];
units.LN  = {'cm','#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(9.2);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
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
