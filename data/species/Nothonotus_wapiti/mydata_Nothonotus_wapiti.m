  function [data, auxData, metaData, txtData, weights] = mydata_Nothonotus_wapiti
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Nothonotus_wapiti'; 
metaData.species_en = 'Boulder darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 'dLb'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 04]; 

%% set data
% zero-variate data
data.am = 3.5*365;   units.am = 'd';  label.am = 'life span';          bibkey.am = 'guess';   
  temp.am = C2K(19.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 0.95;  units.Lb = 'cm'; label.Lb = 'total length at birth';  bibkey.Lb = 'RublRake2016'; 
data.Lp = 4.5;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'guess'; 
data.Li = 8.5;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'PageBurr1991';

data.Wwb = 8.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'RublRake2016';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwi = 4.24;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*(8.5)^3.14, see F1, F2';

data.Ri = 163/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'RublRake2016';   
  temp.Ri = C2K(19.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
data.dLb = (1.45-0.95)/15;  units.dLb = 'cm/d';  label.dLb = 'change in TL at birth'; bibkey.dLb = 'RublRake2016';   
  temp.dLb = C2K(19.5); units.temp.dLb = 'K'; label.temp.dLb = 'temperature';
  comment.dLb = 'based on TL 9.5 mm at yolk resorption, TL 14.5 mm at first fin develop, 14 d time since birth at first fin dev';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to not differ from females (no data)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-length from photo: SL = 0.85 * TL';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14 ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL82'; % Cat of Life
metaData.links.id_ITIS = '168466'; % ITIS
metaData.links.id_EoL = '212528'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_wapiti'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_wapiti'; % ADW
metaData.links.id_Taxo = '6104387'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-wapiti'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_wapiti}}';  
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
bibkey = 'RublRake2016'; type = 'Article'; bib = [ ... 
'author = {Crystal L. Ruble and Patrick L. Rakes and John R. Shute and Stuart A. Welsh}, ' ...
'year = {2016}, ' ...
'title = {Captive Propagation, Reproductive Biology, and Early Life History of \emph{Etheostoma wapiti} (Boulder Darter), \emph{E. vulneratum} (Wounded Darter), and \emph{E. maculatum} (Spotted Darter)}, ' ... 
'journal = {SOUTHEASTERN NATURALIST}, ' ...
'volume = {15}, ' ...
'pages = {115-126}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-wapiti.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PageBurr1991'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Page, L. M. and Burr, B. M.}, ' ...
'year = {1991}, ' ...
'title  = {Freshwater fishes}, ' ...
'publisher = {Houghton Mifflin Company, Boston}, ' ...
'series = {Peterson Field Guides}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

