function [data, auxData, metaData, txtData, weights] = mydata_Mantidactylus_grandidieri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Mantellidae';
metaData.species    = 'Mantidactylus_grandidieri'; 
metaData.species_en = 'Frog'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl', 'bjCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 06 20];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 20]; 

%% set data
% zero-variate data

data.tj = 0.3*365; units.tj = 'd';    label.tj = 'time birth at metam';        bibkey.tj = 'GuarCrot2019';   
  temp.tj = C2K(27);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj = '20 to 32 d';
data.am = 6*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'GuarCrot2019';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.6;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam'; bibkey.Lj  = 'GuarCrot2019';
data.Lp  = 6;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'GuarCrot2019';
data.Li  = 8;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'GuarCrot2019';

data.Wwb = 4.2e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 52.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Pelophylax_esculentus: (8/9.5)^3*87.5';

data.Ri  = 8000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri  = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Pelophylax_esculentus';

% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (d), SVL (cm)
0.007	1.621
1.943	5.380
1.955	4.942
1.956	5.774
2.951	5.869
3.959	7.650
3.959	7.759
3.960	7.912
3.960	8.131
3.972	7.431
4.961	8.073
4.961	8.095
4.967	7.986
4.973	7.460
4.973	8.292
4.980	8.489
4.986	8.752
5.962	8.015
5.962	8.409
5.962	8.825];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yrs to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f    = C2K(27);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'GuarCrot2019';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % age (d), SVL (cm)
3.001	6.460
3.002	6.723
3.008	6.942
3.032	6.022
4.028	6.687
4.034	7.081
4.034	7.168
4.034	7.344
4.034	7.431
4.034	7.606
4.041	7.979];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % set origin at birth
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m    = C2K(27);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'GuarCrot2019';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

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
D1 = 'males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Males live for 4 yrs, femles for 6';
metaData.bibkey.F1 = 'GuarCrot2019'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3XWDV'; % Cat of Life
metaData.links.id_ITIS = '664077'; % ITIS
metaData.links.id_EoL = '331205'; % Ency of Life
metaData.links.id_Wiki = 'Mantidactylus_grandidieri'; % Wikipedia
metaData.links.id_ADW = 'Mantidactylus_grandidieri'; % ADW
metaData.links.id_Taxo = '141253'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Mantidactylus+grandidieri'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mantidactylus_grandidieri}}';
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
bibkey = 'GuarCrot2019'; type = 'Article'; bib = [ ...  
'doi = {10.3897/herpetozoa.32.e35576}, ' ...
'author = {Fabio M. Guarino and Angelica Crottini and Marcello Mezzasalma and Jasmin E. Randrianirina and Franco Andreone}, ' ...
'year = {2019}, ' ...
'title  = {A skeletochronological estimate of age and growth in a large riparian frog from {M}adagascar ({A}nura, {M}antellidae, {M}antidactylus)}, ' ...
'journal = {Herpetozoa}, ' ...
'volme = {32}, ' ...
'pages = {39-44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?where-genus=Mantidactylus&where-species=grandidieri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/331205}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

