function [data, auxData, metaData, txtData, weights] = mydata_Acanthochaenus_luetkenii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beryciformes'; 
metaData.family     = 'Stephanoberycidae';
metaData.species    = 'Acanthochaenus_luetkenii'; 
metaData.species_en = 'Pricklefish'; 

metaData.ecoCode.climate = {'MA','MB','MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 28];

%% set data
% zero-variate data

data.am = 12*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'KotlAndr1993';   
  temp.am = C2K(2); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'max age can be longer';

data.Lp  = 7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 15.2;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 7e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'KotlAndr1993';
  comment.Wwb = 'based on egg diameter of 0.75 mm: pi/6*0.075^3';
data.Wwi = 43.9;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.04, see F1';

data.Ri = 3.55e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'KotlAndr1993';   
temp.Ri = C2K(2);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = '80.9 eggs/g';  

% univariate data
data.tL = [ ... % yr class (yr), fork length (cm), 
    1 4.5
    2 6.8
    3 8.1
    4 9.2
    5 9.9];
data.tL(:,1) = 365 * (data.tL(:,1) + 0.75); % convert yr class to time since birth (d)
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KotlAndr1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tLA','tLM','tLC'}; subtitle1 = {'Data from Azores, Madeira, Canary Ils'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: W in g = 0.01122*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '64CC5'; % Cat of Life
metaData.links.id_ITIS = '166087'; % ITIS
metaData.links.id_EoL = '46567168'; % Ency of Life
metaData.links.id_Wiki = 'Acanthochaenus_luetkenii'; % Wikipedia
metaData.links.id_ADW = 'Acanthochaenus_luetkenii'; % ADW
metaData.links.id_Taxo = '159873'; % Taxonomicon
metaData.links.id_WoRMS = '127280'; % WoRMS
metaData.links.id_fishbase = 'Acanthochaenus-luetkenii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthochaenus_luetkenii}}';
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
bibkey = 'KotlAndr1993'; type = 'article'; bib = [ ...  
'author = {A.N. Kotlyar and D.P. Andrianov}, ' ...
'year = {1993}, ' ...
'title  = {Systematics and Biology of \emph{Acanthochaenus luetkenii} ({S}tepbanoberycidae)}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {33(6)}, ' ...
'pages = {85-95}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Acanthochaenus-luetkenii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

