function [data, auxData, metaData, txtData, weights] = mydata_Sillago_sihama

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sillaginidae';
metaData.species    = 'Sillago_sihama'; 
metaData.species_en = 'Northern whiting';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MI'};
metaData.ecoCode.habitat = {'biMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 14];

%% set data
% zero-variate data

data.ab = 4.5;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 7*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16.7; units.Lp  = 'cm'; label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 31;     units.Li  = 'cm'; label.Li  = 'ultimate fork length';  bibkey.Li  = 'fishbase';

data.Wwb = 1.5e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.66 mm: pi/6*0.066^3';
data.Wwi = 215.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.00589*Li^3.06, see F1';
 
data.Ri  = 166e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Fecundity 166e3';

% uni-variate data
% time-length
data.tL = [ ... % time since hatch (d), fork length (cm)
    0  8.8
    1 13.09
    2 16.83
    3 19.98];
data.tL(:,1) = (data.tL(:,1) + 1.3) * 365;
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL  = C2K(28.5); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ShamAnsa2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ for females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00589*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4XDQL'; % Cat of Life
metaData.links.id_ITIS = '168536'; % ITIS
metaData.links.id_EoL = '65475521'; % Ency of Life
metaData.links.id_Wiki = 'Sillago_sihama'; % Wikipedia
metaData.links.id_ADW = 'Sillago_sihama'; % ADW
metaData.links.id_Taxo = '187660'; % Taxonomicon
metaData.links.id_WoRMS = '127046'; % WoRMS
metaData.links.id_fishbase = 'Sillago-sihama'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sillago_sihama}}';
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
bibkey = 'ShamAnsa2010'; type = 'Article'; bib = [ ... 
'author = {E. F. Shamsan and Z. A. Ansari}, ' ... 
'year = {2010}, ' ...
'title = {Study of age and growth of {I}ndian sand whiting, \emph{Sillago sihama} ({F}orsskal) from {Z}uari estuary, {G}oa }, ' ...
'journal = {Indian Journal of Marine Sciences}, ' ...
'volume = {39 (1)}, ' ...
'pages = {68-73}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Sillago_sihama.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
