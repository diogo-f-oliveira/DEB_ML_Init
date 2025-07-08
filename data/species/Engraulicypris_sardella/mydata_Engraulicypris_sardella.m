function [data, auxData, metaData, txtData, weights] = mydata_Engraulicypris_sardella
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Engraulicypris_sardella'; 
metaData.species_en = 'Lake Malawi sardine'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpH','biC'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 12];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 12];

%% set data
% zero-variate data
data.ab = 6;      units.ab = 'd';  label.ab = 'age at birth';              bibkey.ab = 'guess';
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 7.5;    units.Lp = 'cm'; label.Lp = 'std length at puberty';    bibkey.Lp = 'GabaSkor2020';
data.Li = 13;    units.Li = 'cm'; label.Li = 'ultimate std length';        bibkey.Li = 'fishbase';

data.Wwb = 9e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwp = 2;  units.Wwp = 'g';  label.Wwp = 'weight at puberty';     bibkey.Wwp = {'GabaSkor2020','fishbase'};
  comment.Wwp = 'based on 0.0044*Lp^3.02, see F1';
data.Wwi = 10.3;  units.Wwi = 'g';  label.Wwi = 'ultimate weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*Li^3.02, see F1';
 
data.Ri = 2e4/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'GabaSkor2020'; 
  temp.Ri = C2K(13.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % time since birth (mnth), total length (cm)
    1  1.2
    2  3.3
    3  4.7
    4  6.6
    5  8.1
    6  9.3
    7 10.3
    8 11.0
    9 11.6
   10 12.1
   11 12.4
   12 12.7
   18 13.5
   24 13.7];
data.tL(:,1) = data.tL(:,1)*30.5; % convert mnth to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length', 'summer-born'};  
temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RuflLiss1981';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 3 * weights.Ri;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_S','tL_W'}; subtitle1 = {'Data for summer, winter born group'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00447*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '39TK2'; % Cat of Life
metaData.links.id_ITIS = '639587'; % ITIS
metaData.links.id_EoL = '211928'; % Ency of Life
metaData.links.id_Wiki = 'Engraulicypris_sardella'; % Wikipedia
metaData.links.id_ADW = 'Engraulicypris_sardella'; % ADW
metaData.links.id_Taxo = '173700'; % Taxonomicon
metaData.links.id_WoRMS = '1026366'; % WoRMS
metaData.links.id_fishbase = 'Engraulicypris-sardella'; % fishbase

%% References
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
bibkey = 'RuflLiss1981'; type = 'techreport'; bib = [ ... 
'author = {Rufli, H. and J. van Lissa}, ' ...
'year = {1981}, ' ...
'title = {Age and growth of \emph{Engraulicypris sardella} in {L}ake {M}alawi}, ' ... 
'institution = {FAO Fisheries Department}, ' ...
'volume = {DP/MLW/75/019, Working Paper 15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GabaSkor2020'; type = 'article'; bib = [ ... 
'doi = {10.1002/ece3.6917}, ' ...
'author = {Nestory Peter Gabagambi and  Arne Skorping and   Mwita Chacha and Kwendwa Jonathan Kihedu and Adele Mennerat}, ' ... 
'year = {2020}, ' ...
'title = {Life history shifts in an exploited {A}frican fish following invasion by a castrating parasite}, ' ...
'journal = {Ecology and Evolution}, ' ...
'volume = {10}, ' ...
'pages = {13225–13235}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Engraulicypris-sardella}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
