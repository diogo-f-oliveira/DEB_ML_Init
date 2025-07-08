  function [data, auxData, metaData, txtData, weights] = mydata_Dallia_pectoralis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Esociformes'; 
metaData.family     = 'Esocidae';
metaData.species    = 'Dallia_pectoralis'; 
metaData.species_en = 'Alaska blackfish'; 

metaData.ecoCode.climate = {'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L';'L-Ww';'Ww-Ww_R'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_mod_1 = [2023 04 25];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 04 25]; 

%% set data
% zero-variate data
data.tp = 140;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'Blac1962';   
  temp.tp = C2K(21); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                  bibkey.am = 'fishbase';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 8.1;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';    bibkey.Lp = 'Blac1962'; 
data.Li = 33;   units.Li = 'cm'; label.Li = 'ultimate standard length'; bibkey.Li = 'fishbase';

data.Wwb = 3.1e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Blac1962';
  comment.Wwb = 'based on egg diameter of 1.8 mm: pi/6*0.18^3';
data.Wwp = 5;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';        bibkey.Wwp = 'Blac1962';
data.Wwi = 366;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (d), std length (cm), temp (C)
30.5* 9  5.80   % mar
30.5*10  6.50   % apr
30.5*11  8.93   % may
30.5*12 10.70   % jun
30.5*14 11.42]; % aug
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
bibkey.tL = 'Blac1962';
comment.tL = 'age estimate assumes spawning in jun, with data in mar, apr, may, jun, aug';

data.LWw = [ ... % std length (cm), wet weight (g)
5.200	1.332
5.201	1.971
5.344	2.131
5.379	1.705
5.467	1.012
5.540	1.598
5.629	1.279
5.683	1.598
5.755	1.651
5.808	1.332
5.827	2.184
5.828	2.664
5.880	1.492
6.024	1.918
6.040	1.332
6.095	1.918
6.130	1.545
6.202	1.811
6.329	2.823
6.331	3.356
6.436	2.291
6.437	2.823
6.507	2.024
6.510	3.463
6.562	2.877
6.651	2.557
6.904	3.676
6.992	3.409
7.065	3.942
7.408	5.274
7.748	5.594
7.782	4.741
7.998	5.114
8.014	4.528
8.213	5.381
8.373	5.114
8.550	4.262
8.824	7.139
8.932	7.032
9.022	7.458
9.181	6.339
9.422	10.548
9.469	7.511
9.472	8.683
9.506	8.257
9.542	7.991
9.629	7.032
9.666	7.405
9.672	10.388
9.793	8.364
9.793	8.683
9.818	11.933
9.954	8.364
9.954	8.683
9.980	12.306
9.992	9.323
10.004	6.766
10.025	8.151
10.065	10.441
10.099	9.536
10.168	8.364
10.175	11.454
10.196	13.158
10.280	10.548
10.296	9.429
10.406	10.761
10.408	11.667
10.421	9.376
10.461	11.560
10.512	10.388
10.514	11.134
10.568	11.294
10.569	11.720
10.582	9.642
10.607	13.105
10.639	11.081
10.670	8.577
10.762	10.175
10.783	11.454
10.890	11.454
10.894	13.105
10.999	12.412
11.003	14.330
11.047	9.536
11.056	14.011
11.341	13.212
11.445	11.560
11.484	13.212
11.511	17.420
11.523	14.863
11.524	15.396
11.588	11.507
11.682	13.584
11.707	17.420
11.803	11.560
11.804	12.306
12.162	12.412
12.192	18.219
12.248	19.391
12.252	21.309
12.262	17.367
12.301	18.912
12.379	13.478
12.432	13.425
12.447	20.510
12.528	16.568
12.535	20.084
12.544	15.609
12.556	21.309
12.581	16.142
12.583	17.207
12.818	18.219
12.827	22.481
12.934	13.904
13.187	15.183
13.216	20.563
13.428	19.178
13.607	19.285
13.953	31.218
14.106	26.956
14.276	22.641
14.319	17.473
15.575	28.288
16.032	33.242
16.480	33.455];
units.LWw = {'cm', 'g'}; label.LWw = {'standard length', 'wet weight'};  
bibkey.LWw = 'Blac1962';

data.WWR = [ ... % wet weight (g), ovary weight (g)
5.164	0.638
7.235	1.246
7.843	0.825
8.687	0.918
9.451	1.526
10.208	1.234
10.694	1.442
11.227	2.315
11.350	1.827
13.248	1.904
13.276	2.824
15.844	2.210
19.283	2.515];
units.WWR = {'g', 'g'}; label.WWR = {'wet weight', 'ovary weight'};  
temp.WWR = C2K(13); units.temp.WWR = 'K'; label.temp.WWR = 'temperature';
bibkey.WWR = 'Blac1962';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL =  5 * weights.tL;
weights.Li =  3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperature in C of tL data is assumed to follow T(t) = max(0,5+20 * sin((t + t_T) * 2 * pi/ 365))';
D3 = 'mod_1: temp trajectory modified';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-length from photo: SL = 0.81 * TL';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3427L'; % Cat of Life
metaData.links.id_ITIS = '162159'; % ITIS
metaData.links.id_EoL = '1012685'; % Ency of Life
metaData.links.id_Wiki = 'Dallia_pectoralis'; % Wikipedia
metaData.links.id_ADW = 'Dallia_pectoralis'; % ADW
metaData.links.id_Taxo = '42898'; % Taxonomicon
metaData.links.id_WoRMS = '1020019'; % WoRMS
metaData.links.id_fishbase = 'Dallia-pectoralis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Dallia_pectoralis}}';  
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
bibkey = 'Blac1962'; type = 'article'; bib = [ ... 
'author = {Roger F. Blackett}, ' ...
'year = {1962}, ' ...
'title = {Some Phases in the Life History of the {A}laskan Blackfish, \emph{Dallia pectoralis}}, ' ... 
'journal = {Copeia}, ' ...
'volume = {1962}, ' ...
'pages = {124-130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Dallia-pectoralis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
