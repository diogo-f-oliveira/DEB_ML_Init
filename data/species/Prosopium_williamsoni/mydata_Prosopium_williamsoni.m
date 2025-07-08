function [data, auxData, metaData, txtData, weights] = mydata_Prosopium_williamsoni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Prosopium_williamsoni'; 
metaData.species_en = 'Mountain whitefish'; 

metaData.ecoCode.climate = {'BSk', 'Csb', 'Dsa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2020 09 10];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 10];


%% set data
% zero-variate data

data.am = 17*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 30;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess'; 
data.Li  = 70;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 4.8e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Shes2017';
  comment.Wwb = 'based on egg diameter of 2.1 mm (1.9 to 2.4 mm) for Prosopium cylindraceum: pi/6*0.21^3';
data.Wwp  = 249.5; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase'; 
  comment.Wwp = 'based on 0.00501*Lp^3.18, see F1';
data.Wwi  = 3.69e3; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00501*Li^3.18, see F1';

data.Ri  = 24143/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [... %  time since birth (yr), fork length (cm)
    1  8.78
    2 19.83 
    3 25.48
    4 28.84
    5 32.84
    6 35.89
    7 38.18
    8 40.01
    9 42.07
   10 43.82];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.92; % convert FL to TL
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BenjWetz2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

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
D2 = 'Mean temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: W in g = 0.00501 *(TL in cm)^3.18';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: FL = 0.92 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '789K7'; % Cat of Life
metaData.links.id_ITIS = '162009'; % ITIS
metaData.links.id_EoL = '215645'; % Ency of Life
metaData.links.id_Wiki = 'Prosopium_williamsoni'; % Wikipedia
metaData.links.id_ADW = 'Prosopium_williamsoni'; % ADW
metaData.links.id_Taxo = '184833'; % Taxonomicon
metaData.links.id_WoRMS = '567546'; % WoRMS
metaData.links.id_fishbase = 'Prosopium-williamsoni'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Prosopium_williamsoni}}';
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
bibkey = 'BenjWetz2014'; type = 'Article'; bib = [ ... 
'doi = {10.1139/cjfas-2013-0279}, ' ...
'author = {Joseph R. Benjamin and Lisa A. Wetzel and Kyle D. Martens and Kimberly Larsen and Patrick J. Connolly}, ' ... 
'year = {2014}, ' ...
'title = {Spatio-temporal variability in movement, age, and growth of mountain whitefish (\emph{Prosopium williamsoni}) in a river network based upon {P}{I}{T} tagging and otolith chemistry}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {71}, ' ...
'pages = {131-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shes2017'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945217020175}, ' ...
'author = {A. V. Shestakov}, ' ... 
'year = {2017}, ' ...
'title = {Biology of Round Whitefish \emph{Prosopium cylindraceum} ({C}oregonidae) of the {A}nadyr {R}iver}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {57}, ' ...
'pages = {257-264}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Prosopium-williamsoni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

