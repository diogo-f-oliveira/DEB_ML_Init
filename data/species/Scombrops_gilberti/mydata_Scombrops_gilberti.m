function [data, auxData, metaData, txtData, weights] = mydata_Scombrops_gilberti

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acropomatiformes'; 
metaData.family     = 'Scombropidae';
metaData.species    = 'Scombrops_gilberti'; 
metaData.species_en = 'Gnomefish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.2); % K, body temp
metaData.data_0     = {'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 04];

%% set data
% zero-variate data

data.am = 16*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(16.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 60;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on 15 to 20 cm SL and SL= 0.85*TL, from photo';
data.Li  = 120;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';
  comment.Li = 'based on 45 cm SL, using SL= 0.85*TL, from photo';

data.Wwb = 3.8e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.82 to 1.05 mm: pi/6*0.09^3';
data.Wwp = 2.5e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01072*Lp^3.02, see F1';
data.Wwi = 20e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^3.02, see F1';

data.Ri  = 7.8e6/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(16.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.94e6 eggs per kg per yr for Semicossyphus pulcher: 1.94e6*40/365';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), otolith radius (mm) 
    1 4.64
    2 6.10
    3 7.09
    4 7.87
    5 8.46
    6 9.00
    7 9.41
    8 9.75
    9 10.40
   10 10.83];
data.tL(:,1) = 365 * (.75 + data.tL(:,1)); % convert yr to d
data.tL(:,2) = (-10.36+36.74*data.tL(:,2)+1.02*data.tL(:,2).^2)/10; % convert otolith radius in mm to std length in cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(16.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Moch1979';
  
% length-weight
data.LW = [ ... % std length (cm), weight (g)
5.992	3.832
6.060	4.633
6.129	3.873
6.198	4.630
6.744	6.459
7.256	8.524
7.463	8.613
8.075	11.622
8.737	12.401
9.037	16.754
11.318	27.227
22.741	204.210
23.129	238.690
23.789	220.554
24.058	257.834
24.194	235.742
24.605	233.012
24.744	281.731
25.024	278.513
25.308	321.970
25.308	301.085
25.450	263.251
25.884	263.127
26.030	275.116
26.177	406.771
26.177	384.661
26.324	307.555
26.924	371.686
26.924	274.858
27.382	459.415
28.164	424.507
28.164	453.954
29.295	573.427
29.460	423.977
29.460	463.636
29.962	524.048
30.131	566.610
32.236	691.589
33.156	799.126
33.156	1021.907
33.156	706.671
33.720	1021.428
33.911	798.626
34.295	853.757
34.683	922.952
34.878	834.491
34.878	816.043
35.273	872.375
35.672	943.079
36.076	911.694
36.280	996.819
36.485	1114.531
36.690	891.121
36.897	1178.225
36.897	996.352
37.315	1030.007
37.526	1164.582
37.737	1456.095
37.737	1392.426
37.950	1258.969
38.165	1539.309
38.165	1100.765
38.165	984.353
38.597	1244.391
38.814	1345.456
38.814	1125.122
39.033	1626.769
39.033	1087.849
39.254	1438.335
40.147	1359.304
40.374	1589.315
40.374	1437.211
40.602	1215.170
40.831	1420.792
41.061	2008.852
41.061	1737.165
41.293	1570.666
41.526	1214.411
41.760	1660.428
41.760	1641.972
41.996	1569.930
42.233	1775.049
42.711	1940.482
42.952	1855.343
42.952	1734.994
43.194	2243.265
44.178	2167.933
45.183	1915.915
45.953	2560.862
46.473	2213.827
48.069	2704.674
49.719	3613.442];
units.LW   = {'cm', 'g'};  label.LW = {'std length','weight'};  
bibkey.LW = 'Moch1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Wwp and Wwi are ignorned due to inconsistecy with LW data';
D2 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g =0.01072*(TL in cm)^3.02'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VTYH'; % Cat of Life
metaData.links.id_ITIS = '645496'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scombrops_boops'; % Wikipedia
metaData.links.id_ADW = 'Scombrops_boops'; % ADW
metaData.links.id_Taxo = '187083'; % Taxonomicon
metaData.links.id_WoRMS = '220088'; % WoRMS
metaData.links.id_fishbase = 'Scombrops-boops'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Scombrops_boops}}';
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
bibkey = 'Moch1979'; type = 'Article'; bib = [ ... 
'author = {Kenji Mochizuki}, ' ... 
'year = {1979}, ' ...
'title = {Age and Growth of the Two {J}apanese {S}combropids, \emph{Scombrops boops} and \emph{S. gilberti}}, ' ...
'journal = {Japanese Journal of Ichthyology}, ' ...
'volume = {26}, ' ...
'pages = {62-68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Scombrops-boops.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

