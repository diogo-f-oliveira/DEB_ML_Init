function [data, auxData, metaData, txtData, weights] = mydata_Equulites_leuciscus

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes '; 
metaData.family     = 'Leiognathidae';
metaData.species    = 'Equulites_leuciscus'; 
metaData.species_en = 'Whipfin ponyfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMc','0iMc'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'Ww-N'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 05];

%% set data
% zero-variate data
data.ab = 4;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'guess';
data.Li = 25;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Leiognathus_equula: pi/6*0.08^3';
data.Wwp = 30;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01259*Lp^3.13, see F1';
data.Wwi = 300; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01259*Li^3.13, see F1';

data.Ri  = 2e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Leiognathus_bindus';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
201.971	6.378
229.164	6.943
262.958	7.869
288.708	7.969
353.407	8.943
397.535	9.350
441.672	9.603
496.842	9.957
567.453	10.516];
data.tL(:,1) = 50 + data.tL(:,1); % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(28.3); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'InglPaul1984';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01259*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6FYMD'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46578693'; % Ency of Life
metaData.links.id_Wiki = 'Equulites'; % Wikipedia
metaData.links.id_ADW = 'Equulites_leuciscus'; % ADW
metaData.links.id_Taxo = '3415322'; % Taxonomicon
metaData.links.id_WoRMS = '398520'; % WoRMS
metaData.links.id_fishbase = 'Equulites-leuciscus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Equulites_leuciscus}}';  
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
bibkey = 'InglPaul1984'; type = 'techreport'; bib = [ ... 
'author = {Ingles, J. and D. Pauly}, ' ... 
'year = {1984}, ' ...
'title = {An atlas of the growth, mortality and recruitment of {P}hilippines fishes}, ' ...
'institution = {ICLARM, International Center for Living Aquatic Resources Management, Manila, Philippines}, ' ...
'volume = {Tech. Rep. 13.}, '...
'pages = {127 p.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Equulites-leuciscus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
