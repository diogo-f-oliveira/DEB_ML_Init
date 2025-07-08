function [data, auxData, metaData, txtData, weights] = mydata_Scomberomorus_niphonius
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Scomberomorus_niphonius'; 
metaData.species_en = 'Japanese Spanish mackerel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 13];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 13];

%% set data
% zero-variate data

data.ab = 10;   units.ab = 'd';   label.ab = 'age at birth';                 bibkey.ab = 'guess';   
  temp.ab = C2K(19.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 7*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'BeggSell1998';   
  temp.am = C2K(19.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 61;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for female';  bibkey.Lp  = 'fishbase'; 
data.Li  = 104; units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1 mm of Scomberomorus maculatus: pi/6*0.1^3';
data.Wwp = 2.1e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00832*Lp^3.03, see F1';
data.Wwi = 10758;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^3.03, see F1; max published weight 12.2 kg';

data.Ri = 1.5e6/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(19.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on fecundity of Scomberomorus_brasiliensis: 4e5*(104/65)^3';

% uni-variate data

% time-length
data.tL_fm = [ ... % yr class (yr), fork length (cm)
    1 51.8 50.0
    2 73.7 66.2
    3 83.8 73.1
    4 90.3 NaN
    5 94.2 NaN]; 
data.tL_fm(:,1) = (0.3 + data.tL_fm(:,1)) * 365;   % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm    = C2K(19.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'KishUeda1985'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
43.392	688.530
45.154	772.999
46.791	857.535
47.412	714.854
47.791	757.356
47.798	913.936
48.423	842.428
48.924	827.925
49.044	699.748
49.180	927.433
49.934	927.031
50.431	812.886
51.819	968.729
52.576	1039.499
52.956	1096.236
54.345	1252.078
62.786	1831.202
64.034	1659.717
64.919	1773.124
65.051	1915.402
66.061	2028.742
66.575	2270.461
66.842	2611.955
67.565	1971.000
68.086	2355.064
68.327	2141.411
68.572	2013.167
69.200	2012.832
69.206	2140.942
69.212	2269.053
69.596	2425.432
69.975	2467.934
69.987	2724.155
70.983	2538.570
71.340	2125.568
71.355	2438.727
71.749	2808.624
71.852	2324.583
71.863	2552.335
72.755	2836.557
72.996	2622.905
73.009	2893.361
73.251	2708.178
73.386	2907.394
73.760	2850.255
73.768	3006.835
73.867	2451.621
74.110	2266.438
74.648	3020.600
74.768	2920.891
74.789	3347.927
75.398	2949.025
76.189	3759.990
77.273	2777.205
78.699	3715.946
79.020	2534.280
80.183	3216.933
82.639	4710.284
82.948	3258.162
84.669	5150.482
85.665	4964.896
86.787	4779.244
88.336	5675.214
90.431	4820.004];
units.LW   = {'cm', 'g'};  label.LW = {'fork length','weight'};  
bibkey.LW = 'KishUeda1985'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.ab = 0 * weights.ab;

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

%% Discussion
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VTXK'; % Cat of Life
metaData.links.id_ITIS = '172446'; % ITIS
metaData.links.id_EoL = '46577326'; % Ency of Life
metaData.links.id_Wiki = 'Scomberomorus_niphonius'; % Wikipedia
metaData.links.id_ADW = 'Scomberomorus_niphonius'; % ADW
metaData.links.id_Taxo = '187074'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Scomberomorus-niphonius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scomberomorus_niphonius}}';
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
bibkey = 'KishUeda1985'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF97057}, ' ...
'author = {Kishida, T. and K. Ueda and K. Takao}, ' ... 
'year = {1985}, ' ...
'title = {Age and growth of {J}apanese {S}panish mackerel in the central and western waters of the {S}eto {I}nland {S}ea. Bull.}, ' ...
'journal = {Japan. Soc. Sci. Fish.}, ' ...
'volume = {51}, ' ...
'pages = {529-537}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scomberomorus-niphonius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
