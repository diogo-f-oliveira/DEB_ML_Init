function [data, auxData, metaData, txtData, weights] = mydata_Eleotris_oxycephala

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Eleotridae';
metaData.species    = 'Eleotris_oxycephala'; 
metaData.species_en = 'Sleeper'; 

metaData.ecoCode.climate = {'Cfa','MB'};
metaData.ecoCode.ecozone = {'THp','MPNW'};
metaData.ecoCode.habitat = {'0iFl', '0iFr','0iMc'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 12];

%% set data
% zero-variate data

data.am = 7*365;   units.am = 'd';   label.am = 'life span';                          bibkey.am = 'fishbase';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 7.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty';             bibkey.Lp  = 'guess'; 
data.Li  = 23; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'ZhanJanD1993';

data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.1^3';

data.GSI = 0.11 ; units.GSI = 'g/g';  label.GSI = 'gonado somatic index ';   bibkey.GSI = 'guess'; 
  temp.GSI = C2K(26); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data

% time-length-weight
data.tLW = [ ... % time (yr), total length (cm), weight (g)
    1  9.89  19.0
    2 13.22  40.7
    3 16.49  88.2
    4 19.39 171.0
    5 21.18 226.6];
data.tLW(:,1) = 365 * (0.8+data.tLW(:,1)); % convert yr to d
units.tLW  = {'d', 'cm', 'g'};  label.tLW = {'time', 'total length', 'weight'};  
temp.tLW   = C2K(26);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'ZhanJanD1993'; treat.tLW = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 15 * weights.tLW;
weights.Wwb = 5 * weights.Wwb;
%weights.Li = 5 * weights.Li;
%weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% weights.psd.v = 5 * weights.psd.v;
% weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00741*(TL in cm)^3.11'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '39844'; % Cat of Life
metaData.links.id_ITIS = '637268'; % ITIS
metaData.links.id_EoL = '46576851'; % Ency of Life
metaData.links.id_Wiki = 'Eleotris'; % Wikipedia
metaData.links.id_ADW = 'Eleotris_oxycephala'; % ADW
metaData.links.id_Taxo = '173610'; % Taxonomicon
metaData.links.id_WoRMS = '277802'; % WoRMS
metaData.links.id_fishbase = 'Eleotris-oxycephala'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eleotris}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Eleotris-oxycephala.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZhanJanD1993'; type = 'article'; bib = [ ... 
'author = {Yie Fu-Liang Zhang Jan-Dong }, ' ... 
'year = {1993}, ' ...
'title = {STUDY ON AGE, GROWTE AND LIFE-HISTORY PATTERN OF (\emph{Eleotris oxycephala} {T}EMMINCK ET {S}CHLEGEL)}, ' ...
'journal = {Acta Ecologica Sinica}, ' ...
'volume = {13(1)}, ' ...
'pages = {51-57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


