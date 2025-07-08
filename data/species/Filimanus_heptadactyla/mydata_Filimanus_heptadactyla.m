function [data, auxData, metaData, txtData, weights] = mydata_Filimanus_heptadactyla
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Polynemiformes'; 
metaData.family     = 'Polynemidae';
metaData.species    = 'Filimanus_heptadactyla'; 
metaData.species_en = 'Seven fingered threadfin'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2018 12 30]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 30]; 

%% set data
% zero-variate data

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 19; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on Li/2';
data.Li  = 38;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.775 mm: pi/6*0.0775^3'; 
data.Wwp = 60.4; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
  comment.Wwi = 'based on 0.00676*Lp^3.09, see F1';
data.Wwi = 515; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00676*Li^3.09, see F1';

data.Ri = 1.35e6/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.7';

% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (mnth), total length (cm)
4 10.8
5 11.3
6 13.8
7 15.5
8 15.7
9 16.2
10 17.4
11 18.6
12 19.6
13 23.8
14 25.6
31 33.0
32 35.5];
data.tL(:,1) = 30.5 * data.tL(:,1);  % convert mnth to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(29);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PrasJais2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: Ww in g  = 0.00676*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; demersal. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'protandrous hermaphrodite (first male, then female) in family member Pacific Threadfin, Polydactylus sexfilis';
metaData.bibkey.F3 = 'ctsa'; 
metaData.facts = struct('F1',F1,'F2',F2, 'F3', F3);

%% Links
metaData.links.id_CoL = '6J2XF'; % Cat of Life
metaData.links.id_ITIS = '645489'; % ITIS
metaData.links.id_EoL = '46578868'; % Ency of Life
metaData.links.id_Wiki = 'Filimanus'; % Wikipedia
metaData.links.id_ADW = 'Filimanus_heptadactyla'; % ADW
metaData.links.id_Taxo = '383108'; % Taxonomicon
metaData.links.id_WoRMS = '280780'; % WoRMS
metaData.links.id_fishbase = 'Filimanus-heptadactyla'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Threadfin}}';
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
bibkey = 'PrasJais2005'; type = 'Article'; bib = [ ... 
'author = {R. Raja Prasad and A. K. Jaiswar and Suneel B. Reddy and S. K. Chakraborty  and R. Palaniswamy and Pranaya Parida}, ' ... 
'year = {2005}, ' ...
'title = {Growth, mortality and yield per recruit of \emph{Polynemus heptadactylus} ({C}uvier) ({T}eleostei: {P}olynemidae) from {M}umbai waters, {I}ndia}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {76}, ' ...
'pages = {155-161}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Filimanus-heptadactyla.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ctsa'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.ctsa.org/files/publications/MoiManual.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

