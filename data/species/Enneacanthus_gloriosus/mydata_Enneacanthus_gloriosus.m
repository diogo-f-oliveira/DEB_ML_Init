  function [data, auxData, metaData, txtData, weights] = mydata_Enneacanthus_gloriosus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Centrarchidae';
metaData.species    = 'Enneacanthus_gloriosus'; 
metaData.species_en = 'Bluespotted sunfish'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 22];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 22]; 

%% set data
% zero-variate data
data.am = 6*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'SnydPete1999';
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 4.2;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'SnydPete1999';
  comment.Lp = 'there are large geographic differences';
data.Li = 9.5;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.65e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'SnydPete1999';   
  comment.Wwb = 'based on egg diameter of 0.68 mm: pi/6*0.068^3';
data.Wwp = 1.2;  units.Wwp = 'g'; label.Wwp = 'wet weight at piberty'; bibkey.Wwp = {'fishbase','SnydPete1999'}; 
  comment.Wwp = 'based on 0.01479*Lp^3.07, see F1';
data.Wwi = 14.85;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.01479*Li^3.07, see F1';

data.Ri = 3*216/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'SnydPete1999';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '216 eggs per clutch, 3 clutches per yr assumed';

% uni-variate data
% time - length
data.tL_M = [ ... % year class (yr), std length (cm)
    0  1.92
    1  2.20
    2  2.56
    3  2.90
    4  3.35];
data.tL_M(:,1) = 365 * (1 + data.tL_M(:,1)); % convert yr to d
data.tL_M(:,2) = data.tL_M(:,2)/ 0.78; % convert SL to TL
units.tL_M = {'d', 'cm'}; label.tL_M = {'time since birth', 'total length', 'Mississippi'};  
temp.tL_M = C2K(21);  units.temp.tL_M = 'K'; label.temp.tL_M = 'temperature';
bibkey.tL_M = 'SnydPete1999';
comment.tL_M = 'Data from Mississippi';
%
data.tL_F = [ ... % year class (yr), std length (cm)
    0  1.67
    1  2.60
    2  3.57
    3  4.18
    4  5.90];
data.tL_F(:,1) = 365 * (0.8 + data.tL_F(:,1)); % convert yr to d
data.tL_F(:,2) = data.tL_F(:,2)/ 0.78; % convert SL to TL
units.tL_F = {'d', 'cm'}; label.tL_F = {'time since birth', 'total length', 'Florida'};  
temp.tL_F = C2K(21);  units.temp.tL_F = 'K'; label.temp.tL_F = 'temperature';
bibkey.tL_F = 'SnydPete1999';
comment.tL_F = 'Data from Florida';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_M = 5 * weights.tL_M;
weights.tL_F = 5 * weights.tL_F;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_F','tL_M'}; subtitle1 = {'Data from Mississippi, Forida'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'mean temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01479*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.78 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '39VVF'; % Cat of Life
metaData.links.id_ITIS = '168113'; % ITIS
metaData.links.id_EoL = '211916'; % Ency of Life
metaData.links.id_Wiki = 'Enneacanthus_gloriosus'; % Wikipedia
metaData.links.id_ADW = 'Enneacanthus_gloriosus'; % ADW
metaData.links.id_Taxo = '45128'; % Taxonomicon
metaData.links.id_WoRMS = '1165234'; % WoRMS
metaData.links.id_fishbase = 'Enneacanthus-gloriosus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Enneacanthus_gloriosus}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Enneacanthus-gloriosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SnydPete1999'; type = 'Article'; bib = [ ...  
'author = {Douglas J. Snyder and Mark S. Peterson}, ' ...
'year = {1999}, ' ...
'title  = {Life History of a Peripheral Population of Bluespotted Sunfish \emph{Enneacanthus gloriosus} ({H}olbrook), with Comments on Geographic Variation}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {141(2)}, ' ...
'pages = {345-357}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

