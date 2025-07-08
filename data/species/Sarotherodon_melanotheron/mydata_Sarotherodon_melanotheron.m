function [data, auxData, metaData, txtData, weights] = mydata_Sarotherodon_melanotheron
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Sarotherodon_melanotheron'; 
metaData.species_en = 'Blackchin tilapia'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr','0iMm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biD'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 13];

%% set data
% zero-variate data

data.am = 6*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 12.1;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 28.0;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.1e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8-1.53 mm of Hemichromis_fasciatus: pi/6*0.128^3';
data.Wwp = 24.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01413*Lp^2.99, see F1';
data.Wwi = 300;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01413*Li^2.99, see F1';

data.Ri  = 8*300/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on relative fecundity of 6-10 eggs/g';
  
% uni-variate data

% time-weight
data.tW_f = [ ... % time (d), weight (g)
-3.859	0.262
28.712	11.836
44.612	18.728
57.314	22.309
74.821	31.683
104.243	45.191
134.375	49.867
163.722	55.371
191.535	66.120
224.885	76.314
253.525	90.926
298.850	111.601
336.889	115.169
359.087	118.194
386.098	127.839
421.770	132.236
445.680	149.058
477.488	163.669];
data.tW_f(:,1) = data.tW_f(:,1) + 80; % set origin at birth
units.tW_f   = {'d', 'g'};  label.tW_f = {'time', 'weight','female'};  
temp.tW_f    = C2K(25);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Lege1983';
%
data.tW_m = [ ... % time (d), weight (g)
-1.763	11.010
33.840	20.898
48.491	26.369
63.921	31.578
77.916	39.403
105.609	50.086
139.231	53.440
165.489	53.406
199.064	55.977
227.818	57.769
257.540	62.436
421.265	85.751
452.344	86.495
483.641	90.899
515.875	97.654
547.047	99.966
572.666	102.547
603.276	108.781
635.167	109.786
662.485	114.194
692.597	112.063
724.643	115.682
753.616	121.134];
data.tW_m(:,1) = data.tW_m(:,1) + 80; % set origin at birth
units.tW_m   = {'d', 'g'};  label.tW_m = {'time', 'weight','male'};  
temp.tW_m    = C2K(25);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Lege1983';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01413*(TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'KWN2'; % Cat of Life
metaData.links.id_ITIS = '553311'; % ITIS
metaData.links.id_EoL = '46572805'; % Ency of Life
metaData.links.id_Wiki = 'Sarotherodon_melanotheron'; % Wikipedia
metaData.links.id_ADW = 'Sarotherodon_melanotheron'; % ADW
metaData.links.id_Taxo = '125235'; % Taxonomicon
metaData.links.id_WoRMS = '293732'; % WoRMS
metaData.links.id_fishbase = 'Sarotherodon-melanotheron'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sarotherodon_melanotheron}}';
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
bibkey = 'Lege1983'; type = 'Article'; bib = [ ... 
'author = {Legendre, M}, ' ...
'year  = {1983}, ' ...
'title = {Observations pr\''{e}liminaires sur la croissance et le comportement en \''{e}levage de \emph{Sarotherodon melanotheron} ({R}uppel, 1852) et de \emph{Tilapia guineensis} en {L}agune \''{E}bri\''{e} (C\^{o}te d''{I}voire)}, ' ...  
'journal = {Doc. Sci. Cent. Rech. Oc\''{E}anogr. Abidjan}, ' ...
'volume = {14(2)}, ' ...
'pages = {1-36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sarotherodon-melanotheron.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

