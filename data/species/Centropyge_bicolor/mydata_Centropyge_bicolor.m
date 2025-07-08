function [data, auxData, metaData, txtData, weights] = mydata_Centropyge_bicolor
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Centropyge_bicolor'; 
metaData.species_en = 'Bicolor angelfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi','biHa'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
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

data.ab = 8.5;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 17*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Sapo2005';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 6.8;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'Sapo2005'; 
  comment.Lp = 'FL 66-70 mm';
data.Lpm  = 8.8;   units.Lpm  = 'cm';  label.Lpm  = 'fork length at puberty'; bibkey.Lpm  = 'Sapo2005'; 
  comment.Lpm = 'FL 86-90 mm';
data.Li  = 15;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.9e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 2.5 mm and egg diameter (guessed) 1.5 mm: pi/6*0.25*0.15^2';
data.Wwp = 7.26;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on Wwp = 0.02399*Lp^2.98, see F1';
data.Wwi = 76.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on Wwi = 0.02399*Li^2.98, see F1';

data.Ri  = 444*7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on fecundity of Chromis chromis: 444*7';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time (d), standard length (cm)
0.384	5.898
0.474	6.647
0.542	6.778
0.587	7.835
0.610	7.351
0.790	8.187
0.971	7.350
0.994	8.626
0.995	8.186
1.038	9.243
1.039	7.746
1.040	7.041
1.965	8.624
1.987	7.920
2.100	9.196
2.913	8.534
3.004	9.370
3.005	9.766
3.049	9.106
3.072	8.049
3.997	9.544
4.020	9.764
4.021	9.103
4.022	7.827
4.991	10.290
6.053	9.230
6.054	7.073
6.098	8.262
6.956	9.052
7.972	10.106
8.018	10.590
8.019	9.754
8.085	8.389
9.960	10.410];
data.tL_f(:,1) = 365 * (0.7 + data.tL_f(:,1));
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length', 'females'};  
temp.tL_f    = C2K(28.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Sapo2005';
%
data.tL_m = [ ... % time (d), standard length (cm)
2.146	10.209
5.082	9.761
7.001	10.285
7.002	9.800
7.024	11.429
8.018	10.899
9.011	10.720
9.915	8.781
9.960	11.158
10.954	10.275
10.999	11.243
11.925	10.537
11.992	9.656
12.986	10.710
12.987	10.402
13.980	11.368
14.003	11.720
14.025	10.884
14.951	10.573
14.996	10.970
15.967	10.175
16.013	11.231
16.984	9.204
17.006	11.493];
data.tL_m(:,1) = 365 * (0.7 + data.tL_m(:,1));
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length', 'males'};  
temp.tL_m    = C2K(28.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
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
F1 = 'Length-weight:  (Ww in g) = 0.02399*(TL in cm)^2.98';
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
