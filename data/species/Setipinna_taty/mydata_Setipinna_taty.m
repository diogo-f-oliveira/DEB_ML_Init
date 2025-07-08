function [data, auxData, metaData, txtData, weights] = mydata_Setipinna_taty

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Setipinna_taty'; 
metaData.species_en = 'Scaly hairfin anchovy'; 

metaData.ecoCode.climate = {'MA','Am'};
metaData.ecoCode.ecozone = {'MIN','TPi', 'MPW'};
metaData.ecoCode.habitat = {'piMpe','biFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCik'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 31];

%% set data
% zero-variate data
data.ab = 6; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*365; units.am = 'd';    label.am = 'life span';          bibkey.am = 'guess';   
  temp.am = C2K(28.6);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Setipinna_phasa';

data.Lp = 8.0;     units.Lp = 'cm';   label.Lp = 'std length at puberty';bibkey.Lp = 'DeMitr1981';
data.Li = 22.1;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
data.Lim = 15.3;     units.Lim = 'cm';   label.Lim = 'ultimate total length for males';  bibkey.Lim = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm of Setipinna_phasa: pi/6*0.1^3';
data.Wwp = 4.2;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00851*Lp^2.98, see F1';
data.Wwi = 86.3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00851*Li^2.98, see F1';

data.Ri  = 3668/365;   units.Ri  = '#/d';  label.Ri  = 'max reprod rate'; bibkey.Ri  = 'DeMitr1981';  
  temp.Ri = C2K(28.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.tL = [ ... % time since birth (yr), total length (cm)
    1 10.81
    2 12.93
    3 15.11];
data.tL(:,1) = (0.3 + data.tL(:,1)) * 365;
units.tL = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
  temp.tL = C2K(28.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'DeDatt1974';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;
weights.Li = weights.Li * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00851*(TL in cm)^2.98'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4X2WS'; % Cat of Life
metaData.links.id_ITIS = '551429'; % ITIS
metaData.links.id_EoL = '46562705'; % Ency of Life
metaData.links.id_Wiki = 'Setipinna_taty'; % Wikipedia
metaData.links.id_ADW = 'Setipinna_taty'; % ADW
metaData.links.id_Taxo = '187522'; % Taxonomicon
metaData.links.id_WoRMS = '282768'; % WoRMS
metaData.links.id_fishbase = 'Setipinna-taty'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Setipinna_taty}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...Photopectoralis-bindus
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeDatt1974'; type = 'Article'; bib = [ ... 
'author = {De, K. and P. Datta}, ' ...
'year = {1974}, ' ...
'title = {A note on the analysis of size frequencies of \emph{Setipinna taty} ({V}alenciennes) of the lower {S}underbans region ({H}oogly-{M}attah Estuary)}, ' ... 
'journal = {Indian J. Fish.}, ' ...
'volume = {21(1)}, '...
'pages = {285-289}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeDatt1974'; type = 'Article'; bib = [ ... 
'author = {De, K. and P. Datta}, ' ...
'year = {1974}, ' ...
'title = {A note on the analysis of size frequencies of \emph{Setipinna taty} ({V}alenciennes) of the lower {S}underbans region ({H}oogly-{M}attah Estuary)}, ' ... 
'journal = {Indian J. Fish.}, ' ...
'volume = {21(1)}, '...
'pages = {285-289}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeMitr1981'; type = 'Article'; bib = [ ... 
'author = {D.K. DE and P.M. Mitra}, ' ...
'year = {1981}, ' ...
'title = {STUDIES  ON  THE  FECUNDITY  OF  \emph{Setipinna taty} ({V}alenciennes)  AND  \emph{Trichiurus pantului} {G}UPTA  OF  THE  {H}OOGHLY  {E}STUAR1NE  SYSTEM}, ' ... 
'journal = {Indian J. Fish.}, ' ...
'volume = {28}, '...
'pages = {272-276}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Setipinna-taty.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  