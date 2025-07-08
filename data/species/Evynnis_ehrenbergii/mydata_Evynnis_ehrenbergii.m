function [data, auxData, metaData, txtData, weights] = mydata_Evynnis_ehrenbergii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Evynnis_ehrenbergii'; 
metaData.species_en = 'Bluespotted seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCim', 'biCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 't-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 04 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 04 11];

%% set data
% zero-variate data

data.ab = 10;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(18.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 15*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(18.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 19.6;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';  
data.Li  = 43;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwi = 1.2e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01862*Li^2.94, see F1';

data.Ri = 1e5/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(18.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on fecundity of Evynnis_tumifrons: 80531*1.2e3/902';
 
% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
0	 0.254   0.001
1	16.549  83.583
2	26.843  308.106
3	33.750  579.930
4	37.533  780.653
5	40.216  943.515
6	41.794 1037.585
9	43.127 1098.555];
data.tLW(:,1) = (0 + data.tLW(:,1)) * 365; % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(18.2);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'Riva1973'; treat.tLW = {1 {'length','weight'}};
  
% length-weight
data.LW = [ ... % total length (cm), weight (g)
8.012	13.448
9.378	19.087
10.653	24.749
11.379	26.057
12.473	31.768
13.390	42.025
14.396	50.758
15.499	65.467
16.322	72.749
17.243	86.005
18.163	99.262
19.450	116.921
20.285	136.200
21.392	155.407
22.409	174.637
23.430	198.367
24.542	222.073
25.474	247.326
26.870	282.957
27.710	306.734
28.472	342.533
29.410	373.784
30.354	411.034
31.570	448.212
32.523	494.460
33.919	530.091
34.430	586.955
35.472	631.680
36.800	689.828
37.679	752.595
38.812	797.295
38.828	812.291
39.873	860.015];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'Riva1973';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01862*(TL in cm)^2.94'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3DJ97'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Evynnis_ehrenbergii'; % Wikipedia
metaData.links.id_ADW = 'Evynnis_ehrenbergii'; % ADW
metaData.links.id_Taxo = '381092'; % Taxonomicon
metaData.links.id_WoRMS = '314374'; % WoRMS
metaData.links.id_fishbase = 'Evynnis-ehrenbergii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Evynnis_ehrenbergii}}';
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
bibkey = 'Riva1973'; type = 'Article'; bib = [ ... 
'author = {Rivajec, L.}, ' ... 
'year = {1973}, ' ...
'title = {Biology and Dynamics of \emph{Pagellus coupei} ({D}ieuz. 1960), \emph{Pagrus ehrenbergi} ({V}al. 1830) and \emph{Dentex canariensis} ({P}oll. 1954) in {G}hana Waters}, ' ...
'journal = {Doc. Sci. Centr. Reoh, Ocean. Agidjan O.R.S.T.O.M.}, ' ...
'volume = {14}, '...
'pages = {42-97}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Evynnis-ehrenbergii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
