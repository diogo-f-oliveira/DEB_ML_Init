function [data, auxData, metaData, txtData, weights] = mydata_Arius_maculatus
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ariidae';
metaData.species    = 'Arius_maculatus'; 
metaData.species_en = 'Spotted catfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSE','MI'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 04];

%% set data
% zero-variate data;

data.am = 10*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'JumaMeti2020';
  temp.am = C2K(26.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 38;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 98.95;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'JumaMeti2020'; 

data.Wwb = 2.145; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 16 mm for Ariopsis_felis: pi/6*1.6^3';
data.Wwp  = 614; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase'; 
  comment.Wwp = 'based on 0.00933*Lp^3.05, see F1';
data.Wwi  =  8750; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'JumaMeti2020'; 

data.Ri  = 18/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Ariopsis_felis';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
88.324	9.197
119.518	9.608
149.160	8.881
179.778	17.247
209.407	18.414
274.357	24.542
365-1.250	29.938
365+90.761	32.685
365+118.803	37.638
365+151.547	39.566
365+179.626	39.216
365+213.926	41.524
365+272.637	47.646
365+304.346	48.815
365+334.505	48.468
730+0.173	49.636
730+58.349	58.030
730+90.595	56.548
730+119.704	57.715
730+148.837	55.472
730+180.017	57.777
730+207.049	58.563
730+241.864	61.629
730+272.545	60.903
730+306.307	65.863
730+333.334	67.406
1095-0.465	66.681
1095+28.129	67.089
1095+88.413	71.318
1095+118.060	69.834
1095+179.915	72.550
1095+212.146	73.341
1095+242.833	71.857
1095+271.432	71.508
1095+302.090	74.192
1095+332.228	76.874
1460+0.008	73.499
1460+31.732	72.396
1460+57.700	76.590
1460+90.968	77.760
1460+118.000	78.546
1460+150.234	78.958
1460+179.342	80.125
1460+210.021	79.778
1460+241.199	82.462
1460+270.836	82.493
1460+304.117	81.770
1460+332.711	82.178];
data.tL(:,1) = data.tL(:,1) + 0;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(26.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JumaMeti2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'I had to subtract 1 yr from age-estimates in tL data to arrive at a reasonable fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00933*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = 'GQWN'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46582010'; % Ency of Life
metaData.links.id_Wiki = 'Arius_maculatus'; % Wikipedia
metaData.links.id_ADW = 'Arius_maculatus'; % ADW
metaData.links.id_Taxo = '161728'; % Taxonomicon
metaData.links.id_WoRMS = '275578'; % WoRMS
metaData.links.id_fishbase = 'Arius-maculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Arius_maculatus}}';
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
bibkey = 'JumaMeti2020'; type = 'Article'; bib = [ ... 
'doi = {10.31398/tpjf/27.1.2019A0013}, ' ...
'author = {Celestina Q. Jumawan and Ephrime B. Metillo and Maria Theresa M. Mutia},'...
'title = {Stock Assessment of \emph{Arius maculatus} ({T}hurnberg, 1792) ({A}riidae, {S}iluriformes) in {P}anguil {B}ay, {N}orthwestern {M}indanao},'...
'journal = {The Philippine Journal of Fisheries}, '...
'volume = {27(1)}, '...
'year = {2020}, '...
'pages = {40-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Arius-maculatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

