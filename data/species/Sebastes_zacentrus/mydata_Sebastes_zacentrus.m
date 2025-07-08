function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_zacentrus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_zacentrus'; 
metaData.species_en = 'Sharpchin rockfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNE','MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.2); % K, body temp
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

data.am = 58*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(5.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 25;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 39;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 1234;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 4.6e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 3.4e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(5.2);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Sebastes_brevispinis: 1.9e6*825/4600';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
3.241	16.973
6.131	20.430
8.058	22.735
9.109	24.750
9.898	26.190
10.949	26.911
12.088	28.352
12.788	28.210
14.102	29.507
14.978	31.090
16.117	29.224
17.168	32.390
18.044	31.385
19.095	31.675
20.058	30.240
21.109	31.536
22.861	29.240
23.650	33.412
25.664	34.566
26.891	36.870
27.942	33.134
30.920	33.573
33.810	31.423
35.737	35.166
38.978	32.154
40.993	36.041
42.131	35.756
46.073	36.197
52.993	39.376
55.007	34.349
58.073	37.088];
data.tL_f(:,1) = 365*(0.3+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f   = C2K(5.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MaleHans2007';  comment.tL_f = 'females from Gulf of Alaska';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
1.927	12.369
2.978	11.796
4.029	14.243
4.905	17.408
6.044	19.136
7.270	20.433
7.971	22.160
9.460	24.176
10.073	23.459
10.949	24.180
12.088	24.614
12.964	25.766
14.015	27.063
14.978	27.209
15.854	26.348
16.818	26.350
16.905	20.169
17.956	27.647
19.007	26.068
19.971	26.358
20.934	26.648
21.898	28.088
24.964	27.951
26.190	32.555
27.066	27.813
27.854	27.096
28.993	29.111
31.971	29.118
33.022	29.265
33.810	29.410
35.124	28.120
38.102	30.283
51.153	28.158];
data.tL_m(:,1) = 365*(0.3+data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m   = C2K(5.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
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
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7QT'; % Cat of Life
metaData.links.id_ITIS = '166744'; % ITIS
metaData.links.id_EoL = '46568212'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_zacentrus'; % ADW
metaData.links.id_Taxo = '187351'; % Taxonomicon
metaData.links.id_WoRMS = '274869'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-zacentrus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-zacentrus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
