  function [data, auxData, metaData, txtData, weights] = mydata_Archoplites_interruptus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Centrarchidae';
metaData.species    = 'Archoplites_interruptus'; 
metaData.species_en = 'Sacramento perch'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'};  
metaData.data_1     = {'t-L';'L-Ww';'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 22];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 22]; 

%% set data
% zero-variate data
data.am = 9*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'fishbase';
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 22.7;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'ViggKuce1981';
  comment.Lp = 'based on tp of 1 yr and tL data'; 
data.Li = 73;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'ViggKuce1981';   
  comment.Wwb = 'based on egg diameter of 0.88 mm: pi/6*0.088^3';

% uni-variate data
% time - length
data.tL = [ ... % year class (yr), fork length (cm)
    1  9.9
    2 15.8
    3 22.1
    4 26.1
    5 29.9
    6 32.5
    7 34.6
    8 37.1
    9 38.2];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
data.tL(:,2) = data.tL(:,2)/0.98; % convert FL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ViggKuce1981';

% length - weight
data.LWw = [ ... % forl length (cm), wet weight (g)
8.460	0.100
8.761	0.118
13.797	54.133
14.098	47.218
14.474	54.172
15.038	52.471
23.600	193.344
23.600	193.344
25.275	644.042
25.276	326.888
25.322	261.033
25.777	233.330
26.110	280.143
26.112	259.346
26.190	238.553
26.488	262.834
27.050	287.129
27.050	287.129
27.690	283.700
27.985	328.777
27.988	306.247
27.988	306.247
28.590	308.015
28.590	306.282
29.478	425.916
29.707	403.399
29.788	358.343
29.884	496.995
29.884	496.995
30.343	427.699
30.343	427.699
30.390	351.446
30.604	448.511
30.723	401.724
30.723	401.724
30.723	401.724
30.824	497.050
30.926	587.176
30.943	448.530
30.943	448.530
30.943	448.530
31.163	497.069
31.233	540.400
31.244	446.814
31.348	517.877
31.466	476.290
31.652	497.097
31.719	562.958
31.872	540.437
31.901	616.694
32.144	471.129
32.144	471.129
32.318	588.989
32.445	472.880
32.448	452.083
32.448	452.083
32.512	543.940
32.593	495.418
32.665	517.953
32.703	517.955
32.708	474.628
32.773	563.019
32.963	543.966
33.009	476.378
33.032	595.962
33.102	637.560
33.102	637.560
33.143	613.300
33.143	613.300
33.143	611.566
33.154	517.981
33.154	517.981
33.565	540.534
33.710	590.802
33.710	590.802
33.751	564.808
33.904	540.554
33.973	589.084
33.973	589.084
33.973	589.084
34.054	542.296
34.058	514.567
34.312	589.104
34.321	516.315
34.321	516.315
34.321	516.315
34.355	542.313
34.561	708.701
34.561	706.968
34.830	656.724
35.258	547.564
35.318	672.350
35.429	687.954
36.193	592.678
36.321	776.392
36.398	757.333
36.431	800.662
36.659	783.344
36.670	689.758
36.686	870.000
36.922	783.359
37.591	849.255
38.115	873.548];
data.LWw(:,2) = data.LWw(:,2)/0.98; % convert FL to TL
units.LWw = {'cm', 'g'}; label.LWw = {'total length', 'wet weight'};  
bibkey.LWw = 'ViggKuce1981';

% legnth - fecundity
data.LN = [ ... % fork length (cm), fecundity (#)
    29.5  62800
    31.8  93279
    32.7 114049];
data.LN(:,1) = data.LN(:,1)/0.98; % convert FL to TL
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(21);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'ViggKuce1981';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'mean temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01288*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: FL = 0.9 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '67Q8C'; % Cat of Life
metaData.links.id_ITIS = '168175'; % ITIS
metaData.links.id_EoL = '207374'; % Ency of Life
metaData.links.id_Wiki = 'Archoplites_interruptus'; % Wikipedia
metaData.links.id_ADW = 'Archoplites_interruptus'; % ADW
metaData.links.id_Taxo = '45121'; % Taxonomicon
metaData.links.id_WoRMS = '1021622'; % WoRMS
metaData.links.id_fishbase = 'Archoplites-interruptus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Archoplites_interruptus}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Archoplites-interruptus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ViggKuce1981'; type = 'Article'; bib = [ ...  
'author = {Steven Vigg and Paul A. Kucera}, ' ...
'year = {1981}, ' ...
'title  = {CONTRIBUTIONS TO THE LIFE HISTORY OF {S}ACRAMENTO PERCH, \emph{Archoplites interruptus}, IN {P}YRAMID {L}AKE, {N}EVADA}, ' ...
'journal = {The Great Basin Naturalist}, ' ...
'volume = {41(3)}, ' ...
'pages = {278-289}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

