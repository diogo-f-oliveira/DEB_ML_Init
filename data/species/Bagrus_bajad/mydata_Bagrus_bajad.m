  function [data, auxData, metaData, txtData, weights] = mydata_Bagrus_bajad
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Bagridae';
metaData.species    = 'Bagrus_bajad'; 
metaData.species_en = 'Bayad'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 28];

%% set data
% zero-variate data
data.ab = 11.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 37.4;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 112;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AnjaDade2009';
  comment.Wwb = 'based on egg diameter of 0.66 mm to 1.50 mm for Bagrus docmac: pi/6*0.125^3';
data.Wwp = 499.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00955*Li^3.00, see F1';
data.Wwi = 13.4e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^3.00, see F1';

data.Ri  = 47920/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm)
    1 26  155.75
    2 35  447.68
    3 43  814.20
    4 50 1390.05
    5 55 1790.95
    6 60 2279.95
    7 64 2947.49
    8 67 3426.85
    9 70 3969.23];
data.tLW(:,1) = (data.tLW(:,1)+0.3)*365; % convert yr to d
units.tLW = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(23);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'ElDrElna2015'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 10;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.5;
%weights.psd.v = 3*weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00955*(TL in cm)^3.00'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'KDZT'; % Cat of Life
metaData.links.id_ITIS = '680903'; % ITIS
metaData.links.id_EoL = '204815'; % Ency of Life
metaData.links.id_Wiki = 'Bagrus_bajad'; % Wikipedia
metaData.links.id_ADW = 'Bagrus_bajad'; % ADW
metaData.links.id_Taxo = '162811'; % Taxonomicon
metaData.links.id_WoRMS = '1023023'; % WoRMS
metaData.links.id_fishbase = 'Bagrus-bajad'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Bagrus_bajad}}';  
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
bibkey = 'ElDrElna2015'; type = 'Article'; bib = [ ...
'doi = {10.4172/2155-9546.1000348}, ' ...
'author = {El-Drawany, M.A. and Elnagar, W.G.}, ' ...
'year = {2015}, ' ...
'title = {Growth, Food and Feeding Habits of \emph{Bagrus bayad} and \emph{Bagrus docmac} Inhibiting {M}uess {C}hannel, {S}harkia {P}rovince, {E}gypt}, ' ... 
'journal = {J. Aquac. Res. Development}, ' ...
'volume = {6}, '...
'pages = {7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnjaDade2009'; type = 'Article'; bib = [ ...
'author = {Hailu Anja and Elias Dadebo and Seyoum Mengistou}, ' ...
'year = {2009}, ' ...
'title = {REPRODUCTIVE BIOLOGY AND CONDITION FACTOR OF THE CATFISH \emph{Bagrus docmak} ({F}ORSSK{\aa}L) ({P}ISCES: {B}AGRIDAE) IN {L}AKE {C}HAMO, {E}THIOPIA}, ' ... 
'journal = {Ethiop. J. Sci.}, ' ...
'volume = {32(1)}, '...
'pages = {29–36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bagrus-bajad.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

