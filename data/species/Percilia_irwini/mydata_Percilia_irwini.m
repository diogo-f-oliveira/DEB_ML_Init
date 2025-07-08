  function [data, auxData, metaData, txtData, weights] = mydata_Percilia_irwini
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Perciliidae';
metaData.species    = 'Percilia_irwini'; 
metaData.species_en = 'Chilian darter'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 26];

%% set data
% zero-variate data
data.ab = 11; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.5;     units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'guess';
data.Li = 9.6;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 1.13;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.01202*Li^3.02, see F1';
data.Wwi = 11.1;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^3.02, see F1';
 
data.Ri = 2220/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate ';   bibkey.Ri = 'guess';
  temp.Ri = C2K(24.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Etheostoma_asprigene yearly fecundity: 340*11.1/1.7';

% uni-variate data

% time-length
data.tL = [ ... % time since hatch (yr), total length (cm), femles, males
    1 4.05
    2 5.51
    3 6.34
    4 6.52];
data.tL(:,1) = (.5 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(24.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
  treat.tL = {1, {'females','males'}};
bibkey.tL = 'CazoSido2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;

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
F1 = 'length-weight: Ww in g = 0.01202*(TL in cm)^3.02'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Endemic in Andalien and Biobio river basins'; 
metaData.bibkey.F1 = 'AedoBelk2009'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '773SG'; % Cat of Life
metaData.links.id_ITIS = '641910'; % ITIS
metaData.links.id_EoL = '219031'; % Ency of Life
metaData.links.id_Wiki = 'Percilia_irwini'; % Wikipedia
metaData.links.id_ADW = 'Percilia_irwini'; % ADW
metaData.links.id_Taxo = '183459'; % Taxonomicon
metaData.links.id_WoRMS = '1026863'; % WoRMS
metaData.links.id_fishbase = 'Percilia_irwini'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Percilia_irwini}}';  
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
bibkey = 'AedoBelk2009'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1095-8649.2008.02113.x}, ' ...
'author = {J.R. Aedo and M.C.Belk and E.M.Habit}, ' ...
'year = {2009}, ' ...
'title = {Geographic variation in age, growth and size structure of \emph{Percilia irwini} from south-central {C}hile}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {74}, '...
'pages = {278-284}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Percilia-irwini.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

