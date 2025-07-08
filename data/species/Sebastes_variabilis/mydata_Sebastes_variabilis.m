function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_variabilis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_variabilis'; 
metaData.species_en = 'Light dusky rockfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNE','MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 24];

%% set data
% zero-variate data

data.am = 50*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(3.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Chil2010'; 
  comment.Lp = '0.5 maturity at 36.5 cm, but 0.4 maturity is at 30 cm';
data.Li  = 43.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 346;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','Chil2010'};
  comment.Wwp = 'based on 0.00977*Lp^3.08, see F1';
data.Wwi = 1.1e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.08, see F1';

data.Ri  = 2e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(3.2);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on Sebastes_polyspinis';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
3.305	9.403
7.844	33.000
10.190	37.968
11.231	39.210
12.445	40.629
13.573	42.048
15.045	42.403
16.431	42.935
17.298	43.645
18.339	44.532
19.205	45.242
20.155	43.290
21.195	43.823
22.148	44.355
23.879	44.000
25.007	45.419
26.390	44.000
28.036	45.065
28.989	45.242
30.976	42.581
32.193	45.419
33.235	47.548
34.268	43.823
35.051	45.952
40.241	42.935
41.371	46.129
43.189	45.597
49.079	47.548
59.119	45.065];
data.tL_f(:,1) = 365*(0+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f   = C2K(3.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MaleHans2007';  comment.tL_f = 'females from Gulf of Alaska';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
3.049	11.710
4.094	15.613
4.966	19.339
6.101	25.726
7.147	30.339
8.103	32.468
9.320	35.661
10.189	37.613
11.231	39.210
12.011	40.097
13.224	40.806
14.439	42.226
15.216	40.806
16.343	41.694
17.297	42.758
18.161	42.048
19.114	41.871
20.068	43.113
21.107	43.290
22.143	41.339
23.185	43.290
24.221	41.694
25.264	43.645
26.123	39.919
26.993	42.403
28.295	44.355
29.241	40.629
30.110	42.226
31.233	40.984
32.099	41.161
33.143	44.000
34.174	39.210
36.173	44.000
38.165	44.000
42.072	51.452
43.096	42.048
46.134	46.306
48.298	46.484
49.163	45.952
50.199	44.000
51.155	46.129];
data.tL_m(:,1) = 365*(0+data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m   = C2K(3.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MaleHans2007'; comment.tL_m = 'males from Gulf of Alaska';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
%weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;

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
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.00977*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7QJ'; % Cat of Life
metaData.links.id_ITIS = '644604'; % ITIS
metaData.links.id_EoL = '46568214'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_variabilis'; % ADW
metaData.links.id_Taxo = '937892'; % Taxonomicon
metaData.links.id_WoRMS = '398442'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-variabilis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_variabilis}}';
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
bibkey = 'MaleHans2007'; type = 'techreport'; bib = [ ... 
'author = {Malecha, P.W. and D. H. Hanselman and J. Heifetz},' ...
'year = {2007}, ' ...
'title = {Growth and mortality of rockfish ({S}corpaenidae) from {A}laska waters}, ' ...
'institution = {NOAA}, ' ...
'volume = {Tech. Memo. NMFS F/AFSC-172}, ' ...
'pages = {1-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Chil2010'; type = 'article'; bib = [ ... 
'author = {Chilton, E.A.},' ...
'year = {2010}, ' ...
'title = {Maturity and growth of female dusky rockfish (\emph{Sebastes variabilis}) in the central {G}ulf of {A}lalska}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {108(1)}, ' ...
'pages = {70-78}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-variabilis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
