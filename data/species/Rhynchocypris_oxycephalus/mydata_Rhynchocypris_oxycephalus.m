  function [data, auxData, metaData, txtData, weights] = mydata_Rhynchocypris_oxycephalus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Rhynchocypris_oxycephalus'; 
metaData.species_en = 'Chinese minnow';

metaData.ecoCode.climate = {'Cfa','Dfa','Dwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp

metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'R_L'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 09 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.am = 3*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'LingJuan2015';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5.6;  units.Lp = 'cm'; label.Lp = 'standard length at puberty for females';  bibkey.Lp = 'LingJuan2015'; 
  comment.Lp = 'based on SL 4.9 cm and F2';
data.Li = 17.2;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'LingJuan2015';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwi = 57.2; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00776*Li^3.13, see F1';

data.R5 = 174/365; units.R5 = '#/d'; label.R5 = 'reproduction rate at SL 4.9 cm, TL 5.8 cm';  bibkey.R5 = 'LingJuan2015';
  temp.R5 = C2K(16);  units.temp.R5 = 'K'; label.temp.R5 = 'temperature';
data.R14 = 2151/365; units.R14 = '#/d'; label.R14 = 'reproduction rate at SL 12.14 cm, TL 14.3 cm';  bibkey.R14 = 'LingJuan2015';
  temp.R14 = C2K(16);  units.temp.R14 = 'K'; label.temp.R14 = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since May 1 (d), std length (cm)
30.417	4.361
60.833	4.833
127.098	5.292
153.170	5.204
185.759	6.489
218.348	6.691
246.592	6.929
277.009	6.607
309.598	9.446
340.015	9.142
365+1.086	8.910
365+32.589	8.353
365+61.920	7.146
365+94.509	7.673
365+124.926	7.892
365+155.342	9.069
365+181.414	10.391
365+215.089	11.333
365+277.009	10.635
365+307.426	11.414
365+340.015	11.544
730+4.345	11.890
730+31.503	11.622
730+64.092	10.885
730+97.768	10.888
730+122.753	11.830
730+154.256	12.555
730+187.932	13.480];
data.tL_f(:,1) = 90 + data.tL_f(:,1);  % set origin to birth
data.tL_f(:,2) = data.tL_f(:,2)/ 0.85;  % convert SL to TL
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(16);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LingJuan2015';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since May 1 (d), std length (cm)
-1.077	4.933
29.071	3.957
61.372	4.698
121.667	5.077
149.661	5.511
184.115	6.667
215.339	6.034
242.257	5.782
273.481	5.312
305.782	8.581
335.929	7.805
365+2.153	7.516
365+31.224	7.768
365+64.602	7.136
365+90.442	7.498
365+122.743	7.841
365+150.737	7.985
365+185.192	9.177];
data.tL_m(:,1) = 90 + data.tL_m(:,1);  % set origin to birth
data.tL_m(:,2) = data.tL_m(:,2)/ 0.85;  % convert SL to TL
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(16);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LingJuan2015';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.p_M = weights.psd.p_M * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Mean temperature estimate is based on variation between 1.3 (December) to 22.6 C (July)';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00776*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.85 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4SRPG'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '222973'; % Ency of Life
metaData.links.id_Wiki = 'Rhynchocypris_oxycephalus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '2736852'; % Taxonomicon
metaData.links.id_WoRMS = '1019045'; % WoRMS
metaData.links.id_fishbase = 'Rhynchocypris-oxycephalus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rhynchocypris_oxycephalus}}';  
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
bibkey = 'LingJuan2015'; type = 'article'; bib = [ ...
'doi = {10.7541/2015.4}, ' ...
'author = {CHU Ling and YE Juan and SI Chun and WANG Wen-Jian and YAN Yun-Zhi and CHEN Yi-Feng}, ' ...
'year = {2015}, ' ...
'title = {AGE, GROWTH AND REPRODUCTION OF THE {C}HINESE MINNOW, \emph{Phoxinus oxycephalus } IN THE {J}IULONGFENG {N}ATURE {R}ESERVE OF THE {H}UANGSHAN {M}OUNTAIN}, ' ... 
'journal = {ACTA HYDROBIOLOGICA SINICA}, ' ...
'volume = {39(1)}, ' ...
'pages = {29-37}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Rhynchocypris-oxycephalus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
