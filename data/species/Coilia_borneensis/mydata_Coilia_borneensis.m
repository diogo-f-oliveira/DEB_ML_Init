  function [data, auxData, metaData, txtData, weights] = mydata_Coilia_borneensis
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Coilia_borneensis'; 
metaData.species_en = 'Bornean grenadier anchovy'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','TPi'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 05 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 06];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 2*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9.1;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Varg1961';
data.Li = 12.4;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.1e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Varg1961';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwp = 2.65;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','Varg1961'};
  comment.Wwp = 'based on 0.00282*Li^3.10, see F1';
data.Wwi = 6.91;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00282*Li^3.10, see F1';

% uni-variate data
data.tL = [ ... % time since hatch (mnth), total length (cm)
    3 3.8
    4 4.3
    5 4.8
    6 4.8
    7 5.8
    8 6.8
    9 7.8];
data.tL(:,1) = data.tL(:,1) * 30.5; % convert mnth to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = {'Varg1961'};
comment.tL = 'based on length frequency';

% length-weight-fecundity
LWN = [ ... % total length (cm), weight (g), fecundity (#) 
10.2 11.7 9.4 10.5 12.2 10.6 9.8 10.8 10.8 9.1 9.9 10.0 10.7 9.4 10.3  12.0 11.0 9.8 10.2 11.0 10.4 11.3 11.2 11.7 9.4;
4.3 5.8 3.2 4.8 6.4 3.6 3.5 3.7 3.4 2.5 3.0 2.6 3.4 2.6 2.8 6.0 4.0 2.5 2.8 4.0 3.0 4.9 4.8 7.6 2.5;
1495 2558 810 1947 1942 1506 651 1183 1842 578 1056 1131 1504 880 1176 1623 1603 961 941 1176 850 1931 1450 1635 692]'; 
data.LW = LWN(:,1:2);
units.LW = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'Varg1961';
%
data.LN = LWN(:,[1 3]);
units.LN = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN = C2K(28);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = 'Varg1961';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00282*(TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.84*TL';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'WWFV'; % Cat of Life
metaData.links.id_ITIS = '551432'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Coilia_borneensis'; % Wikipedia
metaData.links.id_ADW = 'Coilia_borneensis'; % ADW
metaData.links.id_Taxo = '171561'; % Taxonomicon
metaData.links.id_WoRMS = '279076'; % WoRMS
metaData.links.id_fishbase = 'Coilia-borneensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Coilia_borneensis}}';  
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
bibkey = 'Varg1961'; type = 'Article'; bib = [ ... 
'author = {T. J. Varghese}, ' ...
'year = {1961}, ' ...
'title = {SOME OBSERVATIONS ON THE BIOLOGY OF \emph{Coilia borneensis} (BLKR)}, ' ... 
'journal = {Indian Journal of Fisheries}, ' ...
'volume = {8(2)}, '...
'pages = {312-325}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Coilia-borneensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  