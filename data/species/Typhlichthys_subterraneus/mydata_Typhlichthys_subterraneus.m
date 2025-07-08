  function [data, auxData, metaData, txtData, weights] = mydata_Typhlichthys_subterraneus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Percopsiformes'; 
metaData.family     = 'Amblyopsidae';
metaData.species    = 'Typhlichthys_subterraneus'; 
metaData.species_en = 'Southern cavefish'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFcc'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvae'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2020 06 27];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU University Amsterdam'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 06 27]; 


%% set data
% zero-variate data
data.ab = 2.5*30.5; units.ab = 'd'; label.ab = 'age at birth';                    bibkey.ab = 'Poul1963'; 
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '2 to 3 months';
data.tp = 16*30.5;  units.tp = 'd';   label.tp = 'time since birth at puberty';   bibkey.tp = 'Poul1963';
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'tab 5, 22-24 months at first reproduction';
data.am = 4*365;  units.am = 'd';   label.am = 'life span';                      bibkey.am = 'fishbase';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 3.65;    units.Lp = 'cm';  label.Lp = 'standard length at puberty';      bibkey.Lp = 'Poul1963'; 
  comment.Lp = 'table 5, 33-40 mm standard length';
data.Li = 7.1;  units.Li = 'cm';  label.Li = 'ultimate standard length';       bibkey.Li = {'Wiki', 'Poul1963'};
  comment.Li = 'based on TL = 9 cm and SL = 0.78 * TL, see F3';
 
data.Wwb = 5.2e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Poul1963';
  comment.Wwb = 'based on egg diameter of 2.15 mm: pi/6*0.215^3';
data.Wwp = 0.51; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'Poul1963';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 3.7; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';   bibkey.Wwi = {'Poul1963','fishbase'};
  comment.Wwi = 'based on 0.00389*9^3.12';
  
data.Ri = 50/365; units.Ri = '#/d'; label.Ri = 'ultimate reprod rate';            bibkey.Ri = 'Poul1963';   
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
     
% uni-variate data
data.tL = [ ... % time (yr), standard length (cm)
0.319	1.315
0.417	1.213
0.447	1.324
0.557	1.880
0.558	2.398
0.606	1.787
0.637	2.250
0.656	1.880
0.716	2.361
0.746	2.296
0.776	2.852
0.854	2.241
1.043	2.861
1.102	2.574
1.547	2.861
1.559	3.611
1.657	3.352
1.657	3.407
1.706	3.352
1.716	3.463
1.746	3.648
1.775	3.278
1.874	3.278
1.875	3.630
1.964	3.685
1.983	3.278
2.053	3.676
2.121	3.407
2.141	3.593
2.270	3.593
2.281	3.963
2.281	4.287
2.330	4.083
2.488	3.731
2.578	4.574
2.636	3.963
2.735	3.833
2.737	4.722
2.874	4.435
2.885	4.806
2.894	4.287
2.963	4.361
3.142	4.778
3.240	4.417
3.447	4.250
4.082	5.593
4.320	5.991]; 
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'}; 
temp.tL = C2K(13); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Poul1963';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'lives in caves';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.12';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'From photo: SL = 0.78 * TL';
metaData.bibkey.F3 = 'Wiki'; 
F4 = 'Incubates eggs in gill chamber of females';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7DB8M'; % Cat of Life
metaData.links.id_ITIS = '164399'; % ITIS
metaData.links.id_EoL = '210197'; % Ency of Life
metaData.links.id_Wiki = 'Typhlichthys_subterraneus'; % Wikipedia
metaData.links.id_ADW = 'Typhlichthys_subterraneus'; % ADW
metaData.links.id_Taxo = '189684'; % Taxonomicon
metaData.links.id_WoRMS = '1015002'; % WoRMS
metaData.links.id_fishbase = 'Typhlichthys-subterraneus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Typhlichthys_subterraneus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WhitCulv2012'; type = 'Book'; bib = [ ...  
'author = {William. B. White and David C. Culver}, ' ...
'year = {2012}, ' ...
'title  = {Encyclopedia of caves}, ' ...
'publisher = {Elsevier}'];
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
bibkey = 'Poul1963'; type = 'Article'; bib = [ ...  
'author = {Thomas L. Poulson}, ' ...
'year = {1963}, ' ...
'title = {Cave Adaptation in {A}mblyopsid Fishes}, ' ... 
'journal = {The American Midland Naturalist}, ' ...
'volume = {70}, '...
'number = {2}, '...
'pages = {257--290}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Typhlichthys-subterraneus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

