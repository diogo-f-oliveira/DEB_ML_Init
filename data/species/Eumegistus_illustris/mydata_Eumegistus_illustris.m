function [data, auxData, metaData, txtData, weights] = mydata_Eumegistus_illustris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Bramidae';
metaData.species    = 'Eumegistus_illustris'; 
metaData.species_en = 'Billiant pomfret'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MP'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb';  'Ri'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 23];

%% set data
% zero-variate data

data.am = 12*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'MaheRabh2016';   
  temp.am = C2K(20.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based in tL data';
  
data.Lp  = 23;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'guess'; 
data.Li  = 91;     units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'MaheRabh2016';
  comment.Li = 'based on LW data';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Robe2014';
  comment.Wwb = 'based on guessed egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi = 996;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'MaheRabh2016';
  comment.Wwi = 'based on LW data';

data.Ri  = 3e4/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'Robe2014';   
  temp.Ri = C2K(20.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on rel fecundity: 3e4/kg';
 
% uni-variate data

% time-time
data.tL_f = [ ... % time since birth (d), fork length (cm)
6.979	47.487
10.990	62.228];
data.tL_f(:,1) = 365*(0+data.tL_f(:,1)); % set origin at birth
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(20.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MaheRabh2016';
%
data.tL_m = [ ... % time since birth (d), fork length (cm)
8.009	54.631
8.030	51.697
8.924	57.162
8.943	58.420
9.001	59.888
9.003	55.277
9.958	58.228
10.017	56.972
12.023	63.713];
data.tL_m(:,1) = 365*(0+data.tL_m(:,1)); % set origin at birth
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(20.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MaheRabh2016';

% length-weight
data.LW_f = [ ... % total length (cm), wet weight (g)
46.227	139.928
52.079	183.539
65.161	352.358
67.217	433.991
76.234	653.559
79.482	595.126
81.258	635.981
82.100	758.317
84.839	850.176
84.839	850.176
85.551	995.435
87.156	883.415
87.547	809.550
90.116	756.177];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'fork length', 'wet weight', 'females'};  
bibkey.LW_f = 'MaheRabh2016';
%
data.LW_m = [ ... % total length (cm), wet weight (g)
48.265	142.580
49.358	168.113
50.446	170.716
51.670	175.874
53.168	191.237
54.121	201.477
54.536	232.071
55.077	221.908
56.164	221.963
56.848	244.928
56.988	260.222
58.613	237.375
59.028	270.517
59.435	265.442
60.121	298.598
60.797	280.798
63.381	291.121
64.473	314.106
70.608	408.687
70.737	378.120
71.714	492.819
73.764	543.879
76.898	582.255
77.040	612.836
77.442	587.379
77.726	638.349
78.806	610.378
79.370	702.127
79.764	638.452
80.857	666.534
81.415	732.804
81.840	806.711
82.367	735.400
85.380	842.560
85.639	783.975
86.721	763.648];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'fork length', 'wet weight', 'males'};  
bibkey.LW_m = 'MaheRabh2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tL_f','tL_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01413*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6GWQF'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46577932'; % Ency of Life
metaData.links.id_Wiki = 'Eumegistus'; % Wikipedia
metaData.links.id_ADW = 'Eumegistus_illustris'; % ADW
metaData.links.id_Taxo = '174245'; % Taxonomicon
metaData.links.id_WoRMS = '280749'; % WoRMS
metaData.links.id_fishbase = 'Eumegistus-illustris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eumegistus}}';
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
bibkey = 'MaheRabh2016'; type = 'Article'; bib = [ ... 
'author = {Mah\''{e}, K. and Rabhi, K. and Bellamy, E. and Elleboode, R. and Aumond, Y. and Huet, J. and Roos, D.}, ' ... 
'year = {2016}, ' ...
'title = {Comparison between the opercular bones, the scales and the otoliths to investigate the growth of the brilliant pomfret (\emph{Eumegistus illustris}) off the coast of {R}eunion {I}sland ({S}{W} {I}ndian {O}cean) }, ' ...
'journal = {International Journal of Fisheries and Aquatic Studies}, ' ...
'volume = {4(1)}, ' ...
'pages = {176-179}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Robe2014'; type = 'phdthesis'; bib = [ ... 
'author = {Chase R. R. Roberts}, ' ... 
'year = {2014}, ' ...
'title = {Estimating the fecundity of monchong, \emph{Eumegistus illustris}, at Cross Seamont}, ' ...
'school = {University of Hawaii}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Eumegistus-illustris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
