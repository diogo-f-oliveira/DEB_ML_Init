  function [data, auxData, metaData, txtData, weights] = mydata_Chrysichthys_walkeri
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Claroteidae';
metaData.species    = 'Chrysichthys_walkeri'; 
metaData.species_en = 'Walker''s catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO','piCi','piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 11];

%% set data
% zero-variate data
data.ab = 7; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6.5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Ampo2022';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 11.5;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 1.3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.02, see F1';
data.Wwi = 16;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.02, see F1';
  
data.Ri  = 222/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Chrysichthys auratus (11.5/57)^3*2.7e4; assumed 2 spawnings per yr';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
156.955	10.558
188.720	11.014
251.003	11.606
279.343	11.788
365+33.010	14.658
365+63.841	15.706
365+94.360	16.617];
data.tL(:,1) = data.tL(:,1)+190; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Ampo2022';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Li = weights.Li * 3;
weights.ab = weights.ab * 0;

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
D2 = 'age estimates had to reduced with 0.5 yr to arrive at a natural fit with tL data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.02'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5YL72'; % Cat of Life
metaData.links.id_ITIS = '680930'; % ITIS
metaData.links.id_EoL = '222837'; % Ency of Life
metaData.links.id_Wiki = 'Chrysichthys_walkeri'; % Wikipedia
metaData.links.id_ADW = 'Chrysichthys_walkeri'; % ADW
metaData.links.id_Taxo = '192538'; % Taxonomicon
metaData.links.id_WoRMS = '1015658'; % WoRMS
metaData.links.id_fishbase = 'Chrysichthys-walkeri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Chrysichthys_walkeri}}';  
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
bibkey = 'Ampo2022'; type = 'Article'; bib = [ ...
'author = {Samuel K. K. Amponsah}, ' ...
'year = {2022}, ' ...
'title = {Stock Assessment Indicators for Sustainable Exploitation of \emph{Chrysichthys walkeri} in {L}ake {V}olta, {G}hana, {W}est {A}frica }, ' ... 
'journal = {LIMNOFISH-Journal of Limnology and Freshwater Fisheries Research}, ' ...
'volume = {8(3)}, '...
'pages = {235-242}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chrysichthys-walkeri.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

