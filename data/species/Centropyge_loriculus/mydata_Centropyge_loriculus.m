function [data, auxData, metaData, txtData, weights] = mydata_Centropyge_loriculus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Centropyge_loriculus'; 
metaData.species_en = 'Flame angel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi','biHa'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 23];

%% set data
% zero-variate data

data.ab = 8;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(26.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Sapo2005';   
  temp.am = C2K(26.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5.1;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Sapo2005'; 
data.Lpm  = 6.6;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty'; bibkey.Lpm  = 'Sapo2005'; 
data.Li  = 15;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.9e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 2.5 mm and egg diameter (guessed) 1.5 mm: pi/6*0.25*0.15^2';
data.Wwp = 3.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on Wwp = 0.03090*Lp^2.89, see F1';
data.Wwi = 77.4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on Wwi = 0.03090*Li^2.89, see F1';

data.Ri  = 444*7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on fecundity of Chromis chromis: 444*7';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time (d), standard length (cm)
0.464	5.104
1.005	6.338
1.024	6.558
1.053	6.174
1.054	5.790
1.055	5.268
1.063	5.488
1.072	4.912
1.981	5.762
2.010	6.284
2.029	6.613
2.039	6.476
2.058	6.997
2.068	6.009
3.024	6.640
3.043	6.970
3.053	5.570
3.063	6.338
3.064	6.037
4.039	6.476
5.005	6.530
5.006	6.777];
data.tL_f(:,1) = 365 * (0.7 + data.tL_f(:,1));
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length', 'females'};  
temp.tL_f    = C2K(26.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Sapo2005';
%
data.tL_m = [ ... % time (d), standard length (cm)
1.053	6.668
1.063	5.625
1.092	6.037
2.010	7.024
2.039	6.942
3.043	7.655
3.044	7.436
3.053	7.271
4.010	7.546
4.039	6.887
4.995	7.518
5.014	7.683
5.015	7.326
5.024	7.107
5.034	8.040
6.019	7.409
6.028	8.122
6.029	7.765
7.043	7.930
8.048	8.067];
data.tL_m(:,1) = 365 * (0.7 + data.tL_m(:,1));
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length', 'males'};  
temp.tL_m    = C2K(26.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Sapo2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwb = 10 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 5 * weights.Ri;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight:  (Ww in g) = 0.03090*(TL in cm)^2.89';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'SB8F'; % Cat of Life
metaData.links.id_ITIS = '169618'; % ITIS
metaData.links.id_EoL = '46581166'; % Ency of Life
metaData.links.id_Wiki = 'Centropyge_bicolor'; % Wikipedia
metaData.links.id_ADW = 'Centropyge_bicolor'; % ADW
metaData.links.id_Taxo = '166763'; % Taxonomicon
metaData.links.id_WoRMS = '211780'; % WoRMS
metaData.links.id_fishbase = 'Centropyge-bicolor'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Centropyge_bicolor}}';
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
bibkey = 'Sapo2005'; type = 'phdthesis'; bib = [ ... 
'howpublished = {\url{https://eprints.jcu.edu.au/1280/}}, ' ...
'author = {Sapolu, Tebaua}, ' ... 
'year = {2005}, ' ...
'title = {Age-based demography and reproductive ontogeny of angelfishes belonging to the family {P}omacanthidae}, ' ...
'school = {James Cook University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Centropyge-bicolor}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
