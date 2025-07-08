function [data, auxData, metaData, txtData, weights] = mydata_Dionda_argentosa
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Dionda_argentosa'; 
metaData.species_en = 'Manantial roundnose minnow';

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc', '0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.5); % K, body temp
metaData.data_0     = {'am';'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 10 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 06]; 

%% set data
% zero-variate data

data.am = 2.5 * 365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'RobeBonn2016';   
  temp.am = C2K(22.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 4.5;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'RobeBonn2016'; 
data.Li = 9.14;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishesOfTexas';
   comment.Li = 'based on SL 7.59, see F2';

data.Wwb = 2.1e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'GibsFrie2005';
   comment.Wwb = 'based on egg diameter of 1.6 mm of Dionda diaboli: pi/6*0.16^3';
data.Wwi = 6.45;   units.Wwi = 'g';  label.Wwi = 'wet weight at birth';          bibkey.Wwi = {'fishbase', 'fishesOfTexas'};
   comment.Wwi = 'based on 0.00708*Li^3.08, see F1';
    
data.Ri = 166/365; units.Ri = '#/d';  label.Ri = 'reprod rate for TL 7 cm';  bibkey.Ri = 'RobeBonn2016';
  temp.Ri = C2K(22.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % time, total length (cm)
243.277	1.914
273.419	2.418
303.145	3.224
334.425	3.970
364.133	4.957
365+28.607	4.373
365+59.515	4.957
365+90.075	5.139
365+120.647	5.199
365+151.243	5.018
365+181.000	5.501
365+212.385	5.159
365+242.486	6.086
365+273.438	6.227
365+304.008	6.307
365+333.775	6.690
365+363.561	6.872
730+29.252	5.703
730+59.427	5.864
730+90.390	5.884
730+120.896	6.630
730+151.853	6.710
730+181.251	6.912
730+212.990	6.912
730+241.589	7.355
730+273.219	8.484
730+303.441	8.161
730+333.267	7.940
730+363.802	8.383];
data.tL(:,1) = data.tL(:,1) - 150; % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length'};  
temp.tL = C2K(22.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RobeBonn2016';
comment.tL = 'Data from Devils river';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.83 * TL';
metaData.bibkey.F2 = 'fishesOfTexas';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '36B7Q'; % Cat of Life
metaData.links.id_ITIS = '689011'; % ITIS
metaData.links.id_EoL = '219482'; % Ency of Life
metaData.links.id_Wiki = 'Dionda_argentosa'; % Wikipedia
metaData.links.id_ADW = 'Dionda_argentosa'; % ADW
metaData.links.id_Taxo = '690788'; % Taxonomicon
metaData.links.id_WoRMS = '1021382'; % WoRMS
metaData.links.id_fishbase = 'Dionda-argentosa'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Dionda_argentosa}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Dionda-argentosa.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishesOfTexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/dionda argentosa.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'RobeBonn2016'; type = 'article'; bib = [ ...  
'author = {Sarah M. Robertson and Timothy H. Bonner and Joe N. Fries}, ' ...
'year = {2016}, ' ...
'title  = {Effects of Habitat Utilization on the Life Histories of Two Imperiled, Sympatric \emph{Dionda} ({C}yprinidae) in the {R}io {G}rande {B}asin, {T}exas}, ' ...
'journal = {The Southwestern Naturalist}, ' ...
'volume = {175(2)}, ' ...
'pages = {222-232}'];
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
bibkey = 'GibsFrie2005'; type = 'article'; bib = [ ... 
'author = {J. R. Gibson and J. N. Fries}, ' ...
'year = {2005}, ' ...
'title  = {Culture Studies of the Devils River Minnow}, ' ...
'journal = {North American Journal of Aquaculture}, ' ...
'pages = {294--303}, ' ...
'volume = {67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
