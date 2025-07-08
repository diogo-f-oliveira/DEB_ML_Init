  function [data, auxData, metaData, txtData, weights] = mydata_Heteropneustes_fossilis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Heteropneustidae';
metaData.species    = 'Heteropneustes_fossilis'; 
metaData.species_en = 'Stinging catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'JX-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 05];

%% set data
% zero-variate data
data.ab = 4; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'PuvaMari2009';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch after 1 d, yolk depletion 3 d later';
data.am = 6.5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 41.2;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'PuvaMari2009';
  comment.Wwb = 'based on egg diameter of 1.3-1.5 mm: pi/6*0.13^3';
data.Wwp = 9.3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.0043*Lp^3.09, see F1';
data.Wwi = 420;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0043*Li^3.09, see F1';
  
data.Ri  = 15750/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% feeding rate-weight at 30 d
data.JXW = [ ... % rel feeding rate (mg/d.g), growth rate (mg/d.g)
    0     4.90
    9.98  5.62
   30.00  6.98
   50.00  9.40
   79.94 10.50
  100.00 14.35
  120.00 16.09
  127.26 14.76
  110.59 10.90];
data.JXW = data.JXW * 1e-3; % convert mg to g
data.JXW(:,1) = data.JXW(:,1)*4.3; % convert spec feeding rate to feeding rate in g/d
data.JXW(:,2) = 4.3+30*data.JXW(:,2) * 4.3; % g, weight at 30 d
units.JXW = {'g/d', 'g'};  label.JXW = {'feeding rate', 'weight at 30 d'};  
temp.JXW = C2K(25);  units.temp.JXW = 'K'; label.temp.JXW = 'temperature';
init.JXW = 4.3;  units.init.JXW = 'g'; label.init.JXW = 'initital weight';
bibkey.JXW = 'ReddKatr1979';
comment.JXW = 'Initial weight 3.933-4.693 g, mean 4.3 g; food was live tubifex; regimes lasted 30 d';

%% set weights for all real data
weights = setweights(data, []);
weights.JXW = weights.JXW * 5;
weights.Wwb = weights.Wwb * 3;
weights.ab = weights.ab * 3;
weights.Wwi = weights.Wwi * 3;
weights.Li = weights.Li * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.init = init;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'growth at zero and very low feeding levels is probably caused by feeding history, which could not be taken into account';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.0043*(TL in cm)^3.09'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: SL = 0.93 * TL from photo'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3LC74'; % Cat of Life
metaData.links.id_ITIS = '164131'; % ITIS
metaData.links.id_EoL = '224408'; % Ency of Life
metaData.links.id_Wiki = 'Heteropneustes_fossilis'; % Wikipedia
metaData.links.id_ADW = 'Heteropneustes_fossilis'; % ADW
metaData.links.id_Taxo = '44073'; % Taxonomicon
metaData.links.id_WoRMS = '281072'; % WoRMS
metaData.links.id_fishbase = 'Heteropneustes-fossilis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Heteropneustes_fossilis}}';  
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
bibkey = 'ReddKatr1979'; type = 'Article'; bib = [ ...
'author = {S. Ravichandra Reddy and Shakuntala Katre}, ' ...
'year = {1979}, ' ...
'title = {GROWTH RATE AND CONVERSION EFFICIENCY OF THE AIR-BREATHING CATFISH, \emph{Heteropneustes fossilis}, IN RELATION TO RATION SIZE}, ' ... 
'journal = {Aquaculture}, ' ...
'volume = {18}, '...
'pages = {35-40}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PuvaMari2009'; type = 'Article'; bib = [ ...
'author = {Subramanian Puvaneswari and Kasi Marimuthu and Ramasamy Karuppasamy and Mohammed Abdulkader Haniffa}, ' ...
'year = {2009}, ' ...
'title = {Early embryonic and larval development of {I}ndian catfish, \emph{Heteropneustes fossilis}}, ' ... 
'journal = {EurAsian Journal of BioSciences, ' ...
'volume = {3}, '...
'pages = {84-96}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Heteropneustes-fossilis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

