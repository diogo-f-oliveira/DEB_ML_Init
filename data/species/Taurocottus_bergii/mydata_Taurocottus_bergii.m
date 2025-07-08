function [data, auxData, metaData, txtData, weights] = mydata_Taurocottus_bergii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Taurocottus_bergii'; 
metaData.species_en = 'Berg''s longhorn sculpin'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(1.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 4 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 10 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'PancPush2015';   
  temp.am = C2K(1.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 12;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'PancPush2015'; 
  comment.Lp = 'based on tL data for tp =  3 to 4 yr';
data.Lpm  = 11;     units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'PancPush2015'; 
  comment.Lpm = 'based on tL data for tp =  3 to 4 yr';
data.Li  = 29;     units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'PancPush2015';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'baed on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
 
data.Ri = 3e3/365;   units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'guess';   
  temp.Ri = C2K(1.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.94 as found for Cottis volki';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years), total length (cm) 
    2  8.8
    3 11.1
    4 13.3
    5 14.9
    6 16.0
    7 17.9
    8 19.4
    9 20.0
   10 21.0];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(1.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PancPush2015';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % age (years), total length (cm) 
    2  8.5
    3 10.2
    4 12.7
    5 14.9
    6 14.8
    7 17.0
    8 16.7
    9 17.3];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(1.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PancPush2015';
comment.tL_m = 'data for males';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
7.008	3.182
7.039	2.563
7.260	2.566
7.260	4.423
7.544	4.426
7.734	3.191
7.765	4.738
7.891	3.192
8.018	6.908
8.049	4.432
8.239	6.910
8.428	5.675
8.617	6.606
8.712	8.464
8.712	10.321
8.933	9.704
9.154	10.017
9.249	9.089
9.564	10.022
9.848	9.406
9.848	14.358
9.943	12.812
10.006	11.265
10.196	14.362
10.354	10.650
10.417	14.984
10.417	16.222
10.480	24.269
10.574	11.272
10.669	18.082
10.701	16.225
10.953	17.157
11.080	17.158
11.080	14.992
11.585	17.474
11.742	19.333
11.963	23.978
12.121	23.980
12.500	25.532
12.532	22.747
12.595	22.748
12.721	26.773
12.942	23.371
13.131	28.635
13.352	31.732
13.731	31.118
13.826	32.976
13.920	28.335
14.047	43.810
14.205	48.454
14.489	28.342
14.646	43.818
14.646	45.984
14.741	41.653
14.773	38.249
14.804	28.655
14.899	41.345
14.962	37.942
15.025	44.132
15.025	48.774
15.120	49.085
15.183	54.656
15.246	28.661
15.246	58.371
15.278	43.516
15.404	43.827
15.404	54.349
15.436	58.063
15.499	49.089
15.625	69.516
15.688	58.376
16.004	58.380
16.256	59.002
16.256	69.524
16.319	63.026
16.477	53.744
16.604	38.890
16.667	48.794
16.667	53.436
16.761	48.796
17.014	59.011
17.014	68.605
17.014	79.437
17.203	68.608
17.235	79.440
17.298	79.440
17.330	59.015
17.393	68.610
17.582	79.444
17.582	79.444
17.677	68.613
17.803	119.679
17.961	73.259
18.024	68.927
18.024	79.140
18.277	79.143
18.308	109.472
18.655	109.477
18.750	99.265
18.845	89.672
18.845	139.498
18.908	120.002
19.034	79.771
19.413	120.008
19.508	79.468
19.665	99.586
19.792	109.800
19.792	104.848
20.013	89.377
20.013	135.490
20.044	109.803
20.234	119.709
20.234	99.283
20.644	102.074
20.676	108.883
20.802	139.832
21.212	129.934
21.812	129.632];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'PancPush2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.Ri = weights.Ri * 0;

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
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '7BNLY'; % Cat of Life
metaData.links.id_ITIS = '644628'; % ITIS
metaData.links.id_EoL = '46569170'; % Ency of Life
metaData.links.id_Wiki = 'Taurocottus_bergii'; % Wikipedia
metaData.links.id_ADW = 'Taurocottus_bergii'; % ADW
metaData.links.id_Taxo = '605506'; % Taxonomicon
metaData.links.id_WoRMS = '282937'; % WoRMS
metaData.links.id_fishbase = 'Taurocottus-bergii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Taurocottus_bergii}}';
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
bibkey = 'PancPush2015'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945215030091}, ' ...
'author = {V. V. Panchenko and O. I. Pushina and P. G. Milovankin and V. A. Nuzhdin}, ' ... 
'year = {2015}, ' ...
'title = {Distribution and Some Features of Biology of {B}erg''s Longhorn Sculpin \emph{Taurocottus bergii} ({C}ottidae) in the Northwestern Part of the {S}ea of {J}apan}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {55}, ' ...
'pages = {388-396}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Taurocottus-bergii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

