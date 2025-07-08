  function [data, auxData, metaData, txtData, weights] = mydata_Pangio_muraeniformis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cobitidae';
metaData.species    = 'Pangio_muraeniformis'; 
metaData.species_en = 'Spotted coolie loach'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFc', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L', 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 29];

%% set data
% zero-variate data
data.am = 10*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2;    units.Lp = 'cm'; label.Lp = ' total length at puberty'; bibkey.Lp = 'guess';
data.Li = 3.6;    units.Li = 'cm'; label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 0.0085;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.00102*Lp^3.06, see F1';
data.Wwi = 0.0514; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00102*Li^3.06, see F1';

% univariate data
data.Ri = 100/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
    0 1.9 0.036
    1 2.6 0.088
    2 3.1 0.151];
data.tLW(:,1) = (data.tLW(:,1) + 0.8) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(27);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
treat.tLW = {1 {'length','weight'}}; 
bibkey.tLW = 'WatsBalc1985'; comment.tLW = 'data from Kejin River, Borneo';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;
% weights.Lp = 3 * weights.Lp;

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
D2 = 'Wwp and Wwi ignored due to inconsistency with tLW data';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00102*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CCFQ'; % Cat of Life
metaData.links.id_ITIS = '640111'; % ITIS
metaData.links.id_EoL = '2781430'; % Ency of Life
metaData.links.id_Wiki = 'Pangio'; % Wikipedia
metaData.links.id_ADW = 'Pangio_muraeniformis'; % ADW
metaData.links.id_Taxo = '506709'; % Taxonomicon
metaData.links.id_WoRMS = '1460153'; % WoRMS
metaData.links.id_fishbase = 'Pangio-muraeniformis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pangio}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Pangio-muraeniformis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

