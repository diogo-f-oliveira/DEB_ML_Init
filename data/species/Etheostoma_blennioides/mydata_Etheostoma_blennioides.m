  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_blennioides
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_blennioides'; 
metaData.species_en = 'Greenside darter'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 03]; 

%% set data
% zero-variate data
data.tp = 1.5*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';     bibkey.tp = 'Fahy1954';   
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on spawning in 2 yr';
data.am = 4.5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Fahy1954';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.12;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';  bibkey.Lp = 'Fahy1954'; 
data.Li = 13.2;    units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'Wiki';

data.Wwb = 7.75e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Fahy1954';
  comment.Wwb = 'based on egg diameter of 1.1 mm: pi/6*0.11^3';
data.Wwi = 27.7;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = {'Wiki','fishbase'};
  comment.Wwi = 'based on 0.00513*(1.17*Li)^3.14, see F1, F2';

data.Ri = 1832/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'Fahy1954';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), standard length (cm)
    1 4.30
    2 5.30
    3 6.35
    4 7.25];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1));  % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Fahy1954';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males were somewhat bigger than females, but data concern combined sexes';
D2 = 'mean temperatures are guessed, but fluctuate considarably';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-length: TL = 1.17 * SL';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14 ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);


%% Links
metaData.links.id_CoL = '3BL2H'; % Cat of Life
metaData.links.id_ITIS = '168375'; % ITIS
metaData.links.id_EoL = '223654'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_blennioides'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_blennioides'; % ADW
metaData.links.id_Taxo = '174072'; % Taxonomicon
metaData.links.id_WoRMS = '954589'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-blennioides'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_blennioides}}';  
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
bibkey = 'Fahy1954'; type = 'article'; bib = [ ... 
'author = {William E. Fahy}, ' ...
'year = {1954}, ' ...
'title = {THE LIFE HISTORY OF THE NORTHERN GREENSIDE DARTER, \emph{Etheostoma blennioides blennioides} {R}AFINESQUE}, ' ... 
'journal = {Journal of the Elisha Mitchell Scientific Society}, ' ...
'volume = {70}, '...
'pages = {139-205}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-blennioides.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
