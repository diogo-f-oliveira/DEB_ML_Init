  function [data, auxData, metaData, txtData, weights] = mydata_Paracrossochilus_acerus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Paracrossochilus_acerus'; 
metaData.species_en = 'Algae eater'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L', 't-Ww'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 30];

%% set data
% zero-variate data
data.am = 6.5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Danio rerio';
  
data.Lp = 5;    units.Lp = 'cm'; label.Lp = ' total length at puberty'; bibkey.Lp = 'guess';
data.Li = 9.5;    units.Li = 'cm'; label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 1;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.00724*Lp^3.06, see F1';
data.Wwi = 7.1; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00724*Li^3.06, see F1';

% univariate data
data.Ri = 2248/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.9';

% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
    0   3.5  1.61
    1   6.5  5.81];
data.tLW(:,1) = (data.tLW(:,1) + 0.9) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(24);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
treat.tLW = {1 {'length','weight'}}; 
bibkey.tLW = 'WatsBalc1985'; comment.tLW = 'data from Kaha River, Borneo';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 50 * weights.tLW;
%weights.Wwp = 0 * weights.Wwp;
%weights.Wwi = 0 * weights.Wwi;
%weights.Li = 3 * weights.Li;
%weights.Lp = 3 * weights.Lp;
weights.Ri = 0 * weights.Ri;
%weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.2; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.01047*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CRMT'; % Cat of Life
metaData.links.id_ITIS = '689616'; % ITIS
metaData.links.id_EoL = '211933'; % Ency of Life
metaData.links.id_Wiki = 'Paracrossochilus_acerus'; % Wikipedia
metaData.links.id_ADW = 'Paracrossochilus_acerus'; % ADW
metaData.links.id_Taxo = '182733'; % Taxonomicon
metaData.links.id_WoRMS = '1013678'; % WoRMS
metaData.links.id_fishbase = 'Paracrossochilus-acerus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Paracrossochilus_acerus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%73167
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WatsBalc1985'; type = 'Article'; bib = [ ...  
'doi = {10.1007/bf00004856}, ' ...
'author = {Watson, D. J. and Balon, E. K.}, ' ...
'year = {1985}, ' ...
'title = {Determination of age and growth in stream fishes of northern {B}orneo}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {13(1)}, '...
'pages = {59–70}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Paracrossochilus-acerus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

