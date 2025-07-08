  function [data, auxData, metaData, txtData, weights] = mydata_Prochilodus_lineatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Prochilodontidae';
metaData.species    = 'Prochilodus_lineatus'; 
metaData.species_en = 'Streaked prochilod'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L_f'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 24];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 24;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 80;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 194.4;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi = (24/80)^3*7200';
data.Wwi = 7.2e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.GSI = 0.15; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';   bibkey.GSI = 'SilvStew2017';
  temp.GSI = C2K(24.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'value for Prochilodus nigricans';

% uni-variate data
% time-length
data.tL_fm_1990 = [ ... % time since hatch (yr), total length (cm), femles, males
    1 14.4 14.4
    2 19.7 18.8
    3 32.3 29.4
    4 36.7 33.7
    5 40.2 39.2
    6 42.2 40.3
    7 48.1 38.9
    8 47.6 NaN];
data.tL_fm_1990(:,1) = (.8 + data.tL_fm_1990(:,1)) * 365; % convert yr to d
units.tL_fm_1990 = {'d', 'cm'};  label.tL_fm_1990 = {'time since birth', 'total length'};  
  temp.tL_fm_1990 = C2K(24.5);  units.temp.tL_fm_1990 = 'K'; label.temp.tL_fm_1990 = 'temperature';
  treat.tL_fm_1990 = {1, {'females','males'}};
bibkey.tL_fm_1990 = 'AraySver1999';
comment.tL_fm_1990 = 'Data for 1990';
%
data.tL_fm_1993 = [ ... % time since hatch (yr), total length (cm), femles, males
    1 16.8 NaN
    2 27.0 NaN
    3 29.7 27.8
    4 32.2 31.1
    5 36.1 31.3
    6 37.3 35.1
    7 42.0 35.3];
data.tL_fm_1993(:,1) = (.8 + data.tL_fm_1993(:,1)) * 365; % convert yr to d
units.tL_fm_1993 = {'d', 'cm'};  label.tL_fm_1993 = {'time since birth', 'total length'};  
  temp.tL_fm_1993 = C2K(24.5);  units.temp.tL_fm_1993 = 'K'; label.temp.tL_fm_1993 = 'temperature';
  treat.tL_fm_1993 = {1, {'females','males'}};
bibkey.tL_fm_1993 = 'AraySver1999';
comment.tL_fm_1993 = 'Data for 1990';
%
data.tL_fm_1994 = [ ... % time since hatch (yr), total length (cm), femles, males
    2 28.3 NaN
    3 32.6 29.7
    4 34.2 33.6
    5 35.1 35.3
    6 39.1 37.7
    7 41.1 38.7
    8 48.2 49.0
    9 47.2 NaN];
data.tL_fm_1994(:,1) = (.8 + data.tL_fm_1994(:,1)) * 365; % convert yr to d
units.tL_fm_1994 = {'d', 'cm'};  label.tL_fm_1994 = {'time since birth', 'total length'};  
  temp.tL_fm_1994 = C2K(24.5);  units.temp.tL_fm_1994 = 'K'; label.temp.tL_fm_1994 = 'temperature';
  treat.tL_fm_1994 = {1, {'females','males'}};
bibkey.tL_fm_1994 = 'AraySver1999';
comment.tL_fm_1994 = 'Data for 1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm_1990 = weights.tL_fm_1990 * 3;
weights.tL_fm_1993 = weights.tL_fm_1993 * 3;
weights.tL_fm_1994 = weights.tL_fm_1994 * 3;
weights.Wwb = weights.Wwb * 5;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01950*(TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4MN8G'; % Cat of Life
metaData.links.id_ITIS = '641604'; % ITIS
metaData.links.id_EoL = '1012850'; % Ency of Life
metaData.links.id_Wiki = 'Prochilodus_lineatus'; % Wikipedia
metaData.links.id_ADW = 'Prochilodus_lineatus'; % ADW
metaData.links.id_Taxo = '184788'; % Taxonomicon
metaData.links.id_WoRMS = '1016626'; % WoRMS
metaData.links.id_fishbase = 'Prochilodus-lineatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Prochilodus_lineatus}}';  
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
bibkey = 'AraySver1999'; type = 'Article'; bib = [ ...
'author = {Araya, P. R. and Sverlij, S. B. }, ' ...
'year = {1999}, ' ...
'title = {Edad y crecimiento de \emph{Prochilodus scrofa} ({C}haraciformes, {P}rochilodontidade) en el alto r\''{i}o Paran\''{a}, Argentina}, ' ... 
'journal = {Iheringia}, ' ...
'volume = {86}, '...
'pages = {45-54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SilvStew2017'; type = 'Article'; bib = [ ...
'author = {Eddy A. Silva and Donald J. Stewart}, ' ...
'year = {2017}, ' ...
'title = {Reproduction, feeding and migration patterns of \emph{Prochilodus nigricans} ({C}haraciformes: {P}rochilodontidae) in northeastern {E}cuador}, ' ... 
'journal = {Neotropical Ichthyology}, ' ...
'volume = {15(3)}, '...
'pages = {e160171}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Prochilodus-lineatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

