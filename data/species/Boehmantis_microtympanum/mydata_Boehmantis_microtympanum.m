function [data, auxData, metaData, txtData, weights] = mydata_Boehmantis_microtympanum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Mantellidae';
metaData.species    = 'Boehmantis_microtympanum'; 
metaData.species_en = 'Angel''s Madagascar Frog'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0jFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl', 'bjCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 05];

%% set data
% zero-variate data

data.tj = 140; units.tj = 'd';    label.tj = 'time birth at metam';        bibkey.tj = 'guess';   
  temp.tj = C2K(27);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.am = 8*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'GuarAndr1998';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.6;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam'; bibkey.Lj  = 'amphibiaweb';
data.Lp  = 6.0;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for males'; bibkey.Lp  = 'guess';
data.Li  = 10.0;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'GuarAndr1998';
data.Lim  = 8.5; units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';   bibkey.Lim  = 'GuarAndr1998';

data.Wwb = 6e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2-2.5 mm: pi/6*0.225^3';
data.Wwi = 107;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess'; 
  comment.Wwi = 'based on Pelophylax_esculentus: 55*(10/8)^3';
data.Wwim = 66;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'guess'; 
  comment.Wwim = 'based on Pelophylax_esculentus: 55*(8.5/8)^3';

data.Ri  = 7.8e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri  = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Pelophylax_esculentus: 4000*(10/8)^3 eggs per clutch';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since metam (d), SVL (cm)
2	5.015 5.182
2	7.418 5.404
2	5.793 6.599
2	5.238 NaN
3  10.018 7.782
3	8.921 7.698
3	8.712 6.518
3   NaN   5.615
4	9.437 8.409
4	9.507 6.993
4	9.299 7.299
4	9.632 8.410
4   NaN   7.521
4   NaN   7.687
4   NaN   7.799
4   NaN   7.910
4   NaN   8.521
4   NaN   8.410
5	9.398 7.260
5	9.343 8.801
5	9.426 8.899
5	7.398 9.010
5	9.801 7.885
5	9.982 8.857
5	9.204 NaN
5	9.537 NaN
5	9.635 NaN
5	9.690 NaN
5	9.316 NaN
5	8.996 NaN
5.  9.607 NaN
5	9.510 NaN
5	8.913 NaN
5	9.427 NaN
5	9.413 NaN
6	9.332 9.790
6	8.804 7.804
6	9.582 NaN
6	9.762 NaN
6	9.915 NaN
6	9.305 NaN
7	9.835 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0.5) * 365; % convert yrs to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm   = C2K(27);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm  = 'GuarAndr1998'; treat.tL_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm; 

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
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Live is noisy torrents; tympanum is small';
metaData.bibkey.F1 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '68LGT'; % Cat of Life
metaData.links.id_ITIS = '774751'; % ITIS
metaData.links.id_EoL = '333423'; % Ency of Life
metaData.links.id_Wiki = 'Boehmantis_microtympanum'; % Wikipedia
metaData.links.id_ADW = 'Boehmantis_microtympanum'; % ADW
metaData.links.id_Taxo = '994952'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Boehmantis+microtympanum'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Boehmantis_microtympanum}}';
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
bibkey = 'GuarAndr1998'; type = 'Article'; bib = [ ...  
'author = {Fabio M. Guarino and Franco Andreone and Francesco Angelini}, ' ...
'year = {1998}, ' ...
'title  = {Growth and Longevity by Skeletochronological Analysis in \emph{Mantidactylus microtympanum}, a Rain-Forest Anuran from Southern {M}adagascar}, ' ...
'journal = {Copeia}, ' ...
'volme = {1998(1)}, ' ...
'pages = {194-198}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Boehmantis+microtympanum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

