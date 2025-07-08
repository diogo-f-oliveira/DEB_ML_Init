  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_olmstedi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_olmstedi'; 
metaData.species_en = 'Tessellated darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 09 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.6;  units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'Tsai1972'; 
  comment.Lp = 'based on LN data';
data.Li = 11;    units.Li = 'cm'; label.Li = 'ultimate total length';      bibkey.Li = 'fishbase';

data.Wwb = 1e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Tsai1972';
  comment.Wwb = 'based on egg diameter of 1.25 mm: pi/6*0.125^3';
data.Wwi = 9.55; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
   comment.Wwi = 'based on 0.00513*Li^3.14 (see F1)';

% univariate data

% time-length
data.tL_f = [ ... % time (mnth), std length (cm)
-7.665	2.361
-5.653	3.134
0.105	3.339 % Apr 1
1.160	3.389
1.776	3.530
2.356	3.568
2.901	3.738
3.235	4.011
4.413	4.149
5.591	4.239
7.473	4.718];
data.tL_f(:,1) = 30.5 * (16 + data.tL_f(:,1));  % convert mnth to d
data.tL_f(:,2) = data.tL_f(:,2)/ 0.858; % convert SL to TL 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(13);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Tsai1972';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time (mnth), std length (cm)
-7.647	2.389
-5.601	3.354
0.141	3.614 % Apr 1
2.321	3.857
2.919	4.157
4.431	4.775
5.714	4.823
6.505	5.053
7.473	5.103];
data.tL_m(:,1) = 30.5 * (16 + data.tL_m(:,1));  % convert mnth to d
data.tL_m(:,2) = data.tL_m(:,2)/ 0.858; % convert SL to TL 
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(13);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Tsai1972';
comment.tL_m = 'Data for males';

% length - fecundity
data.LN = [ ... % std length (cm), frecundity (#)
  3.46  120.3
  4.65  224.2
  5.47  455.0];
data.LN(:,1) = data.LN(:,1)/ 0.858; % convert SL to TL
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(13);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Tsai1972';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  5 * weights.tL_f;
weights.tL_m =  5 * weights.tL_m;
weights.Li =  5 * weights.Li;
weights.Wwi =  5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  2 * weights.psd.v;
weights.psd.p_M =  3 * weights.psd.p_M;

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
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00513 * (TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.858 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL5K'; % Cat of Life
metaData.links.id_ITIS = '168360'; % ITIS
metaData.links.id_EoL = '207262'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_olmstedi'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_olmstedi'; % ADW
metaData.links.id_Taxo = '174128'; % Taxonomicon
metaData.links.id_WoRMS = '723264'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-olmstedi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_olmstedi}}';  
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
bibkey = 'Tsai1972'; type = 'article'; bib = [ ...  
'doi = {10.1577/1548-8659(1972)101<80:LHOTEJ>2.0.CO;2}, ' ...
'author = {Chu-Fa Tsai}, ' ...
'year = {1972}, ' ...
'title = {Life History of the Eastern {J}ohnny Darter, \emph{Etheostoma olmstedi} {S}torer, in Cold Tailwater and Sewage-polluted Water}, ' ... 
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {101(1)}, '...
'pages = {80-88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-olmstedi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
