  function [data, auxData, metaData, txtData, weights] = mydata_Pangasius_pangasius

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Pangasiidae';
metaData.species    = 'Pangasius_pangasius'; 
metaData.species_en = 'Pangas catfish'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 18];

%% set data
% zero-variate data
data.ab = 23/24;   units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365;  units.am = 'd';  label.am = 'life span';              bibkey.am = 'Pant1962';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 63;   units.Lp = 'cm';  label.Lp = 'total length at pubert';  bibkey.Lp = 'fishbase';
data.Li = 300;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'SahoFero2018';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 2.1e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on 0.00912*Lp^2.98, see F1';
data.Wwi = 219.7e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^2.98, see F1';
  
data.Ri = 8e5*200/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'seafishpool'; 
  temp.Ri = C2K(31); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of 8e5 eggs/kg';
   
% univariate data
% time-length
data.tL = [ ...
1	11.00
2	16.20
3	23.34
4	31.67
5	39.90
6	47.00
7	56.00
8	62.00
9	66.00
10	73.00
11	79.50
12	87.00
13	93.50
14	96.43
15	101.199
16	105.496
18	110.347];
data.tL(:,1) = 365 * (0.5+data.tL(:,1));
units.tL = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
  temp.tL = C2K(28.6); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Pant1962';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight (in g) = 0.00912*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '75KT8'; % Cat of Life
metaData.links.id_ITIS = '681712'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Pangasius_pangasius'; % Wikipedia
metaData.links.id_ADW = 'Pangasius_pangasius'; % ADW
metaData.links.id_Taxo = '182546'; % Taxonomicon
metaData.links.id_WoRMS = '281982'; % WoRMS
metaData.links.id_fishbase = 'Pangasius-pangasius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pangasius_pangasius}}';  
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
bibkey = 'Pant1962'; type = 'Article'; bib = [ ...    
'author = {V. Rayappa Pantulu}, ' ...
'year  = {1962}, ' ...
'title = {On the Use of Pectoral Spines for the Determination of Age and Growth of \emph{Pangasius pangasius} ({H}amilton {B}uch)}, ' ...  
'journal = { J. du Conseil}, ' ...
'volume = {27(1)}, ' ...
'pages = {192-216}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SahoFero2018'; type = 'techreport'; bib = [ ...    
'author = {S. K. Sahoo and S. Ferosekhan}, ' ...
'year  = {2018}, ' ...
'title = {Captive Breeding and Culture of \emph{Pangasius pangasius}}, ' ...  
'note = {Mass Breeding and Culture Technique of Catfishes}, ' ...
'pages = {47-50}, ' ...
'institution = {SAARC Agriculture Centre (SAC); ICAR- Central Institute of Freshwater Aquaculture}, ' ...
'howpublished = {\url{https://www.researchgate.net/publication/352509727}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Pangasius-pangasius}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'seafishpool'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.seafishpool.com/pangasius-fish}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

