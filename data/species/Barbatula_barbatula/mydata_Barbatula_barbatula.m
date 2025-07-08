  function [data, auxData, metaData, txtData, weights] = mydata_Barbatula_barbatula
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Nemacheilidae';
metaData.species    = 'Barbatula_barbatula'; 
metaData.species_en = 'Stone loach'; 

metaData.ecoCode.climate = {'Cfb', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L_T'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 08 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 02];

%% set data
% zero-variate data
data.am = 7*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'VinySost2010: till 8 yrs in Siberia';

data.Lp = 5.8;    units.Lp = 'cm'; label.Lp = ' total length at puberty'; bibkey.Lp = 'VinySost2010';
  comment.Lp = 'based on minimum length in LN data';
data.Li = 21;    units.Li = 'cm'; label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';
data.Lim = 21;    units.Lim = 'cm'; label.Lim = 'ultimate total length for males'; bibkey.Lim = 'fishbase';

data.Wwb = 1.1e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'VinySost2010';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwp = 2.13;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'VinySost2010','fishbase'};
  comment.Wwp = 'Based on 0.01*Lp^3.05, see F1';
data.Wwi = 108; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Based on 0.01*Li^3.05, see F1; fishbase also gives 200 g';

% univariate data

% time-length
data.tL_fm = [ ... % time since March 1 (d), total length (cm) for femlae, male
 88	3.436 3.436 
119	3.676 3.676
155	4.297 4.041
185	4.927 4.521
215	5.333 5.540
247	6.178 6.468
277	6.294 6.733
308	6.410 6.575
337	6.434 6.758
369	6.708 7.031
400	6.426 6.940
430	6.559 6.592
460	6.426 6.675];
data.tL_fm(:,1) = data.tL_fm(:,1) - data.tL_fm(1,1); % set origin at first measurement
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(22);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1 {'female','male'}}; label.treat.tL_fm = 'Matarranya River';
bibkey.tL_fm = 'VinySost2010'; 
comment.tL_fm = 'Data for females, males, 1984 cohort, from the Matarranya River, Ebro River basin (north-east Spain)';

% length-fecundity
data.LN = [ ... % ln total length (mm), ln fecundity (#)
4.078	8.432
4.094	8.804
4.095	8.383
4.096	7.709
4.176	7.664
4.190	8.705
4.206	8.863
4.235	9.076
4.249	8.992
4.249	9.205
4.292	9.210];
data.LN = exp(data.LN); % remove log transform
data.LN(:,1) = data.LN(:,1)/ 10; % convert mm to cm
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(22);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'VinySost2010'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Seasonal cycle in temperature in tL data was assumed: T(t) = 15+15*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.01*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'KMC9'; % Cat of Life
metaData.links.id_ITIS = '687911'; % ITIS
metaData.links.id_EoL = '215190'; % Ency of Life
metaData.links.id_Wiki = 'Barbatula_barbatula'; % Wikipedia
metaData.links.id_ADW = 'Barbatula_barbatula'; % ADW
metaData.links.id_Taxo = '73167'; % Taxonomicon
metaData.links.id_WoRMS = '1013379'; % WoRMS
metaData.links.id_fishbase = 'Barbatula-barbatula'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Barbatula_barbatula}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%73167
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VinySost2010'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.2010.02653.}, ' ...
'author = {D. Vinyoles and A. de Sostoa and C. Franch and A. Maceda-Veiga and F. Casals and N. Caiola}, ' ...
'year = {2010}, ' ...
'title = {Life-history traits of the stone loach \emph{Barbatula barbatula}}, ' ... 
'journal = {Journal of Fish Biology () , }, ' ...
'volume = {77}, '...
'pages = {20–32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Barbatula-barbatula}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

