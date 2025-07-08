  function [data, auxData, metaData, txtData, weights] = mydata_Anguilla_nebulosa

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anguilliformes'; 
metaData.family     = 'Anguillidae';
metaData.species    = 'Anguilla_nebulosa'; 
metaData.species_en = 'Mottled eel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMpe', 'jpFl', 'jpFp', 'jpFr', 'piMd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 09 24];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 24];

%% set data
% zero-variate data
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 121;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.3e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm for Anguila anguilla: pi/6*0.1^3';
data.Wwi = 7e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Wiki';
  
data.Ri = 1.4e6/(6*365);  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(28.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Anguila anguilla';

% uni-variate data
data.tL = [ ... % age (yr), length (cm)
    1  5.11
    2 13.00
    3 21.45
    4 26.88
    5 32.63
    6 36.35
    7 43.45];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'};   label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28.6); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'PantSing1962'};
comment.tL = 'Data for males';

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
D1 = 'Temperatures were guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00076*(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6736L'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46561261'; % Ency of Life
metaData.links.id_Wiki = 'Anguilla_nebulosa'; % Wikipedia
metaData.links.id_ADW = 'Anguilla_nebulosa'; % ADW
metaData.links.id_Taxo = '160968'; % Taxonomicon
metaData.links.id_WoRMS = '271708'; % WoRMS
metaData.links.id_fishbase = 'Anguilla-nebulosa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anguilla_nebulosa}}';  
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
bibkey = 'PantSing1962'; type = 'Article'; bib = [ ...  
'doi = {10.1007/BF03052315}, ' ...
'author = {V. Rayappa Pantulu and Vijai Dev Singh}, ' ...
'year = {1962}, ' ...
'title = {On the use of otoliths for the determination of age and growth of \emph{Anguilla nebulasa nebulosa} {M}c{C}lelland}}, ' ... 
'journal = {Proc. Indian Acad. Sci.}, ' ...
'volume = {55}, '...
'pages = {263–275}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
 bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Anguilla-nebulosa.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


