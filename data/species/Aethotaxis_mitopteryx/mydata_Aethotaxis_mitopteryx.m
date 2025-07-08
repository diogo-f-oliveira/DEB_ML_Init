  function [data, auxData, metaData, txtData, weights] = mydata_Aethotaxis_mitopteryx
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Aethotaxis_mitopteryx'; 
metaData.species_en = 'Longfin icedevil'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 27];

%% set data
% zero-variate data
data.ab = 95;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'guess';   
  temp.ab = C2K(0); units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'based on Trematomus_bernacchii';
data.am = 36*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Ekau1988';   
  temp.am = C2K(0.9); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';
  
data.Lp = 18.3;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'guess'; 
  comment.Lp = 'based on Trematomus_bernacchii: 18*33.6/33 cm';
data.Li = 33.6;    units.Li = 'cm'; label.Li = 'ultimate total length for females';  bibkey.Li = 'fishbase';
data.Lim = 44.3;    units.Lim = 'cm'; label.Lim = 'ultimate total length for males';  bibkey.Lim = 'fishbase';

data.Wwb = 0.014;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 3 mm of based on Trematomus: pi/6*0.3^3';
data.Wwp = 43;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00525*Li^3.10, see F1';
data.Wwi = 283; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00525*Li^3.10, see F1';
data.Wwim = 666.8; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';   bibkey.Wwim = 'fishbase';
  comment.Wwi = 'based on 0.00525*Lim^3.10, see F1';

data.Ri = 3000/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(0.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL = [ ... % time(yr), std length (cm)
0.774	2.062
1.894	4.947
2.883	7.834
3.830	10.224
4.951	12.697
5.943	14.344
6.806	15.661
7.798	17.059
8.835	18.210
9.828	19.196
10.735	20.430
11.815	21.167
12.809	21.987
13.847	22.642
14.667	23.463
15.965	23.868
16.917	24.193
17.652	24.519
18.692	24.265
19.729	25.085
20.595	25.079
21.849	25.815
22.713	26.554
23.707	27.126
24.832	27.450
25.826	28.353
26.777	28.760
27.772	29.084
28.724	29.574
29.762	29.981
30.754	31.380
31.705	31.953
32.827	33.846
33.779	34.088
34.730	34.413
35.725	34.820];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
data.tL(:,2) = 1.13 * data.tL(:,2);  % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(0.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Ekau1988';
comment.tL = 'Probably female';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'LW_f', 'LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00525*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'from photo: TL = 1.13*SL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '65CCV'; % Cat of Life
metaData.links.id_ITIS = '642616'; % ITIS
metaData.links.id_EoL = '217712'; % Ency of Life
metaData.links.id_Wiki = 'Aethotaxis_mitopteryx'; % Wikipedia
metaData.links.id_ADW = 'Aethotaxis_mitopteryx'; % ADW
metaData.links.id_Taxo = '160203'; % Taxonomicon
metaData.links.id_WoRMS = '234660'; % WoRMS
metaData.links.id_fishbase = 'Aethotaxis-mitopteryx'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Aethotaxis_mitopteryx}}';  
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
bibkey = 'Ekau1988'; type = 'Article'; bib = [ ... 
'author = {Ekau, W.}, ' ...
'year = {1988}, ' ...
'title = {Okomorphologie nototheniider {F}ische aus dem {W}eddellmeer, {A}ntarktis}, ' ... 
'journal = {Ber. Polar Meeresforsch}, ' ...
'volume = {51}, ' ...
'pages = {1-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Aethotaxis-mitopteryx.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
