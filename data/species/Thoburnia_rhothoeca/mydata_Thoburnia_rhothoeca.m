  function [data, auxData, metaData, txtData, weights] = mydata_Thoburnia_rhothoeca
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Thoburnia_rhothoeca'; 
metaData.species_en = 'Torrent sucker'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 26];                           
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
data.am = 7*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'RaneLach1946';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'RaneLach1946'; 
  comment.Lp = 'based on tp 3 yr and tL data';
data.Li = 18;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'fishbase';

data.Wwb = 3.1e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.8 mm of Erimyzon oblongus: pi/6*0.18^3';
data.Wwp = 4.5;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty for females';  bibkey.Wwp = {'RaneLach1946','fishbase'}; 
  comment.Wwi = 'based on 0.00490*Lp^3.10, see F1';
data.Wwi = 38.3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00490*Li^3.10';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.029	4.834
2.018	6.907
2.984	11.241
4.052	12.727
5.025	14.653
6.019	15.569
7.041	16.595];
data.tL_f(:,1) = 365 * (-0.3 + data.tL_f(:,1));  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(13);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'RaneLach1946';
comment.tL_f = 'Data for females from James River';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.016	4.852
2.021	7.238
3.003	10.194
3.976	11.992
5.007	14.047];
data.tL_m(:,1) = 365 * (-0.3 + data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(13);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'RaneLach1946';
comment.tL_m = 'Data for males  from James River';

% length - fecundity
data.LN = [ ... % total length (cm), fecundity (#)
    10.8  742
    11.2 1190
    14.4 1749];
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(13);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'RaneLach1946';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: W in g = 0.00490*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7C8GP'; % Cat of Life
metaData.links.id_ITIS = '553276'; % ITIS
metaData.links.id_EoL = '206968'; % Ency of Life
metaData.links.id_Wiki = 'Thoburnia_rhothoeca'; % Wikipedia
metaData.links.id_ADW = 'Thoburnia_rhothoeca'; % ADW
metaData.links.id_Taxo = '612080'; % Taxonomicon
metaData.links.id_WoRMS = '1019280'; % WoRMS
metaData.links.id_fishbase = 'Thoburnia-rhothoeca'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Thoburnia_rhothoeca}}';  
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
bibkey = 'RaneLach1946'; type = 'Article'; bib = [ ... 
'author = {Edward C. Raney and Ernest A. Lachner}, ' ...
'year = {1946}, ' ...
'title = {Age and Growth of the Rustyside Sucker, \emph{Thoburnia rhothoeca} ({T}hoburn)}, ' ... 
'journal = {The American Midland Naturalist}, ' ...
'volume = {36(3)}, '...
'pages = {675-681}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Thoburnia-rhothoeca.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

