  function [data, auxData, metaData, txtData, weights] = mydata_Achondrostoma_arcasii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Achondrostoma_arcasii'; 
metaData.species_en = 'Red roach'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiHl', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_i'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 08];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 08];

%% set data
% zero-variate data
data.ab = 17;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 4 d';
data.am = 14*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Rutilus rutilus';

data.Lp = 4.4;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
data.Li = 25;   units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 9e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1.2 mm of Rutilus rutilus: pi/6*0.12^3';
data.Wwp = 0.76;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00776*Li^3.09, see F1';
data.Wwi = 162; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00776*Li^3.09, see F1';

data.Ri = 4325/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'guess';
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_UM = [ ... % time since birth (yr), total length (cm)
    1  3.0 2.7
    2  5.2 4.7
    3  7.4 6.0
    4  8.4 7.2
    5  9.7 8.3
    6 10.3 9.6];
data.tL_UM(:,1) = 365 * data.tL_UM(:,1);
units.tL_UM = {'d', 'cm'}; label.tL_UM = {'time since birth', 'total length'};  
temp.tL_UM = C2K(15);  units.temp.tL_UM = 'K'; label.temp.tL_UM = 'temperature';
bibkey.tL_UM = 'RincLobo1989'; treat.tL_UM = {1 {'River Ucero','River Moros'}};
comment.tL_UM = 'data from River Ucero and Moros'; title.tL_UM = 'River Ucero & R. Moros';

% time-weight
data.tW_UM = [ ... % time since birth (yr), weight (g)
    1  0.49  0.46
    2  2.58  2.11
    3  6.58  4.56
    4 10.65  8.49
    5 16.60 14.84
    6 19.17 NaN];
data.tW_UM(:,1) = 365 * data.tW_UM(:,1);
units.tW_UM = {'d', 'g'}; label.tW_UM = {'time since birth', 'weight'};  
temp.tW_UM = C2K(15);  units.temp.tW_UM = 'K'; label.temp.tW_UM = 'temperature';
bibkey.tW_UM = 'RincLobo1989'; treat.tW_UM = {1 {'River Ucero','River Moros'}};
comment.tW_UM = 'data from River Ucero and Moros'; title.tW_UM = 'River Ucero & R. Moros';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_UM =  5 * weights.tL_UM;
weights.ab =  0 * weights.ab;
weights.Li =  3 * weights.Li;
weights.Wwb =  3 * weights.Wwb;
weights.Wwp =  0 * weights.Wwp;
weights.Wwi =  0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.title = title;

% %% Group plots
% set1 = {'tL1', 'tL2', 'tL3'}; subtitle1 = {'Data for Sierakowo, Blotno, Wickie Lake'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Wwi and Wwp data ignored due to inconsistency with tLW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00776*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '98C8'; % Cat of Life
metaData.links.id_ITIS = '913999'; % ITIS
metaData.links.id_EoL = '212690'; % Ency of Life
metaData.links.id_Wiki = 'Achondrostoma_arcasii'; % Wikipedia
metaData.links.id_ADW = 'Achondrostoma_arcasii'; % ADW
metaData.links.id_Taxo = '1008275'; % Taxonomicon
metaData.links.id_WoRMS = '1020903'; % WoRMS
metaData.links.id_fishbase = 'Achondrostoma-arcasii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Achondrostoma_arcasii}}';  
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
bibkey = 'RincLobo1989'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.1989.tb03350.x}, ' ...
'author = {Rincon, P. A. and Lobon-Cervia, J.}, ' ...
'year = {1989}, ' ...
'title = {Reproductive and growth strategies of the red roach, \emph{Rutilus arcasii} ({S}teindachner, 1866), in two contrasting tributaries of the {R}iver {D}uero, {S}pain}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {34(5)}, '...
'pages = {687–705}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Achondrostoma-arcasii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

