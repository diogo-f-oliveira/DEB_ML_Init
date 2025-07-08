function [data, auxData, metaData, txtData, weights] = mydata_Scarus_ferrugineus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Scaridae';
metaData.species    = 'Scarus_ferrugineus'; 
metaData.species_en = 'Rusty parrotfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 11];

%% set data
% zero-variate data

data.am = 14*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'MallGabr2020';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 20; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Lim  = 48.5;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length'; bibkey.Lim  = 'MallGabr2020';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.75 mm of Chaetodon: 4/3*pi*0.038^3'; 
data.Wwp = 526; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01413*Lp^3.01, see F1';
data.Wwi = 2255; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'fishbase','MallGabr2020'};
  comment.Wwi = 'based on LW data';

data.GSI = 3*0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Hipposcarus_longiceps, assumed: 3 spawnings per year';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1 14.81 14.54
    2 21.37 20.97
    3 25.29 26.10
    4 29.16 29.27
    5 32.80 32.18
    6 36.42 35.11
    7 38.65 37.90
    8 40.30 39.11
    9 41.73 41.00
   10 NaN   42.80
   11 NaN   44.30
   12 NaN   45.59
   13 NaN   46.70
   14 NaN   47.60];
data.tL_fm(:,1) = 365*(0.1+data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(27.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MallGabr2020'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW = [ ... % total length (cm), weight (g)
12.899	42.698
13.478	59.655
14.565	76.718
15.000	76.810
15.072	76.825
15.362	93.721
15.652	60.112
16.159	102.306
16.377	93.935
16.812	110.861
17.101	136.175
17.101	102.505
17.536	127.849
17.536	102.596
17.899	111.090
18.261	153.254
18.478	144.882
18.986	144.988
19.348	136.647
19.710	136.724
19.928	162.022
20.290	195.768
20.580	153.742
20.652	195.844
20.870	179.055
21.087	170.683
21.449	204.429
21.594	229.712
22.029	196.134
22.174	213.000
22.391	221.463
22.391	238.298
22.681	213.106
22.971	255.255
23.043	213.183
23.333	255.331
23.333	204.826
23.551	221.707
23.696	280.660
23.913	305.958
24.058	238.649
24.420	272.395
24.638	322.946
24.855	331.409
24.928	289.336
25.145	255.712
25.435	348.366
25.435	289.443
25.580	297.892
26.014	331.653
26.087	365.338
26.377	356.982
26.449	331.744
26.812	382.326
27.174	399.237
27.174	357.150
27.246	432.922
27.536	407.731
27.754	390.942
27.826	441.462
28.333	492.073
28.333	374.228
28.623	382.707
28.986	416.453
29.058	559.566
29.058	433.303
29.203	458.586
29.493	475.483
29.493	542.823
29.855	483.976
29.855	551.316
30.000	399.832
30.290	542.990
30.290	484.068
30.725	559.917
30.870	635.705
30.942	585.215
31.087	618.916
31.304	534.786
31.304	526.369
31.377	635.812
31.667	551.697
31.667	686.378
32.101	585.459
32.319	703.350
32.609	711.828
32.609	636.071
32.609	644.489
32.681	593.999
32.971	711.905
32.971	753.992
33.043	661.415
33.551	678.357
33.841	644.748
34.058	796.309
34.420	653.287
35.000	737.584
35.580	805.046
35.725	863.999
36.159	838.838
36.594	822.095
37.029	864.274
37.826	1007.539
38.623	1150.805
39.130	1226.669
39.928	1252.089
39.928	1142.662
41.087	1471.188
41.522	1336.599
42.174	1479.834
43.986	1749.576
44.420	1833.843
45.290	1791.938
48.478	2255.572];
units.LW   = {'d', 'cm'};  label.LW = {'time since birth', 'total length'};  
bibkey.LW = 'MallGabr2020'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01413*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4V3J8'; % Cat of Life
metaData.links.id_ITIS = '615700'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scarus_ferrugineus'; % Wikipedia
metaData.links.id_ADW = 'Scarus_ferrugineus'; % ADW
metaData.links.id_Taxo = '186681'; % Taxonomicon
metaData.links.id_WoRMS = '219121'; % WoRMS
metaData.links.id_fishbase = 'Scarus-ferrugineus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scarus_ferrugineus}}';
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
bibkey = 'MallGabr2020'; type = 'Article'; bib = [ ... 
'doi = {10.17582/journal.pjz/20170729030714}, ' ...
'author = {Ahmad Osman Mal1 and Mohamed Hosny Gabr}, ' ... 
'year = {2020}, ' ...
'title = {Stock Assessment of Two Parrotfish, \emph{Hipposcarus harid} and \emph{Scarus ferrugineus} in Jeddah, Saudi Arabia}, ' ...
'journal = {Pakistan J. Zool}, ' ...
'pages = {1-14}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scarus-ferrugineus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

