  function [data, auxData, metaData, txtData, weights] = mydata_Labeo_niloticus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Labeo_niloticus'; 
metaData.species_en = 'Nile carp'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 10];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 10];

%% set data
% zero-variate data
data.ab = 4;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 24;    units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 63;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.236e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1 mm for Cirrhinus cirrhosus: pi/6*0.1^3';
data.Wwp = 114;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00776*Lp^3.02, see F1';
data.Wwi = 2.3e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on LW data; 0.00776*Li^3.02, see F1, gives 2.1 kg';
    
data.Ri = 63e3/365; units.Ri = '#/d'; label.Ri = 'maximum reproduction rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Labeo_calbasu: 238000*2.3/8.7';

% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), totsal length (cm)
    1 19.4 19.6
    2 38.0 37.4
    3 47.7 45.7
    4 54.1 51.0
    5 59.0 NaN
    6 62.4 NaN];
data.tL_fm(:,1) = data.tL_fm(:,1)*365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time', 'total length'};  
temp.tL_fm = C2K(27.3);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Hash1972'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW = [ ... % total length (cm), weight (g)
11.669	22.232
13.234	22.312
14.517	33.201
15.655	36.867
17.080	47.763
18.789	58.674
19.645	73.148
20.784	76.814
21.782	87.688
23.066	105.792
23.638	127.466
24.779	141.955
26.061	152.844
27.915	178.192
28.772	196.273
29.776	243.223
30.918	264.927
32.349	311.898
33.917	330.016
34.634	366.128
35.493	395.032
36.920	420.359
37.354	460.063
38.924	492.612
39.784	528.731
40.640	543.205
41.511	644.260
42.661	712.862
43.811	781.464
44.959	839.243
45.823	897.008
46.692	990.848
47.978	1023.382
49.138	1146.096
50.004	1221.899
51.163	1344.613
52.165	1380.740
52.896	1492.610
53.762	1568.413
57.813	1958.232
63.288	2362.554];
units.LW = {'cm', 'g'}; label.LW = {'totla length', 'weight'};  
bibkey.LW = 'Hash1972'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: weight (in g) = 0.00776*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3RHYF'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '203960'; % Ency of Life
metaData.links.id_Wiki = 'Labeo_niloticus'; % Wikipedia
metaData.links.id_ADW = 'Labeo_niloticus'; % ADW
metaData.links.id_Taxo = '177933'; % Taxonomicon
metaData.links.id_WoRMS = '1021956'; % WoRMS
metaData.links.id_fishbase = 'Labeo-niloticus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Labeo_niloticus}}';  
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
bibkey = 'Hash1972'; type = 'article'; bib = [ ...  
'author = {Hashem, M. T.}, ' ...
'year = {1972}, ' ...
'title = {The age, growth and maturity of \emph{Labeo niloticus} {F}orsk, from the {N}ozha {H}ydrodrome in 1968-1970}, ' ... 
'journal = {Bull. Inst. Ooean. Fish.}, ' ...
'volume = {2}, ' ...
'pages = {84-102}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Labeo-niloticus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

