  function [data, auxData, metaData, txtData, weights] = mydata_Leporinus_acutidens
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Anostomidae';
metaData.species    = 'Leporinus_acutidens'; 
metaData.species_en = 'Aracau'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 01];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 01];

%% set data
% zero-variate data
data.am = 10*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'ArayAgos2008';   
  temp.am = C2K(24.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15;    units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'guess';
data.Li = 33;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 35.8;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.00977*Lp^3.03, see F1';
data.Wwi = 390;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.03, see F1';
  
data.Ri = 2e5/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(24.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), std length (cm)
    1 14.8 13.9
    2 14.8 17.0
    3 20.0 18.4
    4 21.2 21.1
    5 23.4 22.4
    6 24.7 24.2
    7 26.0 25.4
    8 26.9 NaN
    9 29.5 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1) +0.8) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'std length'};  
temp.tL_fm    = C2K(24.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'female','male'}};
bibkey.tL_fm = 'ArayAgos2008';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 2 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00977*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6PD4J'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '220660'; % Ency of Life
metaData.links.id_Wiki = 'Leporinus_acutidens'; % Wikipedia
metaData.links.id_ADW = 'Leporinus_acutidens'; % ADW
metaData.links.id_Taxo = '691189'; % Taxonomicon
metaData.links.id_WoRMS = '1418266'; % WoRMS
metaData.links.id_fishbase = 'Leporinus-acutidens'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Leporinus_acutidens}}';  
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
bibkey = 'ArayAgos2008'; type = 'Article'; bib = [ ...  
'author = {Patricia R. Araya and Angelo A. Agostinho and Jos\''{e} A. Bechara}, ' ...
'year  = {2008}, ' ...
'title = {Population structure, growth and fishery yield of \emph{Leporinus acutidens} ({V}alenciennes, 1837) ({T}eleostei: {A}nostomidae) in {Y}acyret\''{a} {R}eservoir ({A}rgentina)}, ' ...  
'journal = {Neotropical Ichthyology}, ' ...
'volume = {6(1)}, ' ...
'pages = {57-66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Leporinus-acutidens.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

