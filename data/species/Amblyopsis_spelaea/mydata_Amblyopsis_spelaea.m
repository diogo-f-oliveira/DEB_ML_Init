  function [data, auxData, metaData, txtData, weights] = mydata_Amblyopsis_spelaea

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Percopsiformes'; 
metaData.family     = 'Amblyopsidae';
metaData.species    = 'Amblyopsis_spelaea'; 
metaData.species_en = 'Northern cavefish'; 

metaData.ecoCode.climate = {'Dfa'};
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
data.ab = 5.5*30.5; units.ab = 'd'; label.ab = 'age at birth';                    bibkey.ab = 'Poul1963'; 
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '5 to 6 months';
data.tp = 42*30.5;  units.tp = 'd';   label.tp = 'time since birth at puberty';   bibkey.tp = 'Poul1963';
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'tab 5, 36-48 months at first reproduction';
data.am = 10*365;  units.am = 'd';   label.am = 'life span';                      bibkey.am = 'fishbase';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 5;    units.Lp = 'cm';  label.Lp = 'standard length at puberty';      bibkey.Lp = 'Poul1963'; 
  comment.Lp = 'table 5, 45-56 mm standard length';
data.Li = 8.8;  units.Li = 'cm';  label.Li = 'ultimate standard length';       bibkey.Li = {'Wiki', 'Poul1963'};
  comment.Li = 'based on TL = 11 cm and SL = 0.8 * TL, see F3';
 
data.Wwb = 5.2e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Poul1963';
  comment.Wwb = 'based on egg diameter of 2.15 mm: pi/6*0.215^3';
data.Wwp = 1.7; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'Poul1963';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 6.9; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';   bibkey.Wwi = {'Poul1963','fishbase'};
  comment.Wwi = 'based on 0.00389*11^3.12';
  
data.Ri = 70/365; units.Ri = '#/d'; label.Ri = 'ultimate reprod rate';            bibkey.Ri = 'Poul1963';   
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
     
% uni-variate data
data.tL = [ ... % time (yr), standard length (cm)
0.392	0.579
0.522	0.751
0.549	0.875
0.664	0.788
1.572	1.539
2.178	1.661
2.743	2.833
2.767	2.709
2.820	2.833
2.882	2.622
3.171	3.203
3.221	3.128
3.239	3.598
3.572	3.448
3.848	4.029
3.851	4.375
3.867	4.634
4.192	5.017
4.287	4.225
4.489	5.176
4.507	5.634
4.628	6.165
4.909	6.003
4.911	6.238
4.926	6.448
4.929	5.397
4.938	5.014
5.523	5.630
5.627	7.039
5.634	6.421
5.707	6.050
5.732	5.914
5.748	6.272
5.758	7.286
5.770	7.162
5.890	7.669
5.975	5.814
5.981	6.408
6.586	7.704
6.814	7.418
6.916	7.282
6.984	7.678
7.008	7.504];
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
F3 = 'From photo: SL = 0.8 * TL';
metaData.bibkey.F3 = 'Wiki'; 
F4 = 'Incubates eggs in gill chamber of females';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'CMRC'; % Cat of Life
metaData.links.id_ITIS = '164395'; % ITIS
metaData.links.id_EoL = '206894'; % Ency of Life
metaData.links.id_Wiki = 'Amblyopsis_spelaea'; % Wikipedia
metaData.links.id_ADW = 'Amblyopsis_spelaea'; % ADW
metaData.links.id_Taxo = '107486'; % Taxonomicon
metaData.links.id_WoRMS = '1022190'; % WoRMS
metaData.links.id_fishbase = 'Amblyopsis-spelaea'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Amblyopsis_spelaea}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Amblyopsis-spelaea.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

