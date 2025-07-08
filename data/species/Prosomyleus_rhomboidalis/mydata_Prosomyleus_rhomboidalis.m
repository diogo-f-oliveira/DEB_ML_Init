  function [data, auxData, metaData, txtData, weights] = mydata_Prosomyleus_rhomboidalis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Serrasalmidae';
metaData.species    = 'Prosomyleus_rhomboidalis'; 
metaData.species_en = 'Pacu'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 26];

%% set data
% zero-variate data
data.ab = 9.5;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'fishbase';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'LecoBouj1993';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15;    units.Lp = 'cm';   label.Lp = 'std length at puberty';  bibkey.Lp = 'guess';
data.Li = 40.7;    units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.1e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.6 mm: pi/6*.16^3';
data.Wwi = 1.3e3;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02089*Li^2.96, see F1; max published weight 5 kg';
 
data.GSI = 0.20; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';   bibkey.GSI = 'guess';
  temp.GSI = C2K(25);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), standard length (cm)
    0.5  8.52
    1.0 13.07
    1.5 16.32
    2.0 20.15
    2.5 23.54
    3.0 29.28
    3.5 29.62
    4.0 34.27
    4.5 37.00
    5.0 37.33];
data.tL(:,1) = (0 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LecoBouj1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

% %% Group plots
% set1 = {'tL_Mf','tL_Mm'}; subtitle1 = {'Females, males from Mamore basin'};
% set2 = {'tL_If','tL_Im'}; subtitle2 = {'Females, males from Itenez basin'};
% set3 = {'WwN_M','WwN_I'}; subtitle3 = {'Mamore, Itenez basin'};
% metaData.grp.sets = {set1, set2, set3};
% metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3};

%% Facts
F1 = 'Weight (g) = 0.02089*(TL in cm)^2.96';
metaData.bibkey.F1    = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4547P'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '611899'; % Ency of Life
metaData.links.id_Wiki = 'Myloplus_rhomboidalis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1333054'; % Taxonomicon
metaData.links.id_WoRMS = '1021230'; % WoRMS
metaData.links.id_fishbase = 'Prosomyleus-rhomboidalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Myloplus_rhomboidalis}}';  
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
bibkey = 'LecoBouj1993'; type = 'Article'; bib = [ ...  
'author = {Fr\''{e}d\''{e}rique Lecomte and Thierry Boujard and Fran\c{c}ois Jean Meunier and Jean-François Renno and Ricardo Rojas Beltran}, ' ...
'year  = {1993}, ' ...
'title = {The growth of \emph{Myleus rhomboidalis} ({C}uvier, 1817) ({C}haraciforme, {Serrasalmidae) in two rivers of {F}rench {G}uiana}, ' ...  
'doi = {1111/j.1095-8649.2007.01583.x}, ' ...
'journal = {Revue d''\''{E}cologie}, ' ...
'volume = {48(4)}, ' ...
'pages = {421-435}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Prosomyleus-rhomboidalis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

