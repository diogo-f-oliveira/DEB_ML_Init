function [data, auxData, metaData, txtData, weights] = mydata_Diaphus_watasei
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Diaphus_watasei'; 
metaData.species_en = 'Watases lanternfish'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MI','MP'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.9); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 06 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 01];

%% set data
% zero-variate data
data.am = 5*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'SebaBine2013';  
  temp.am = C2K(7.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10.1;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'SebaBine2013';
  comment.Lp = 'based in Diaphus_dumerilii: 2.5*7.3/6.5';
data.Li = 17;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm of Diaphus_dumerilii: pi/6*0.05^3';
data.Wwp = 8.2; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'SebaBine2013','fishbase'};  
  comment.Wwp = 'based on 0.00759*Lp^3.02, see F1';
data.Wwi = 39.5;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00759*Li^3.02, see F1';

data.Ri = 39.5*850/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';   bibkey.Ri = 'SebaBine2013';
  temp.Ri = C2K(7.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on relative fecundity of 850 eggs/g';
  
% uni-variate data
% tL data
data.tL = [ ... % time since birth (d), standard length (cm) 
    1  9
    2 12
    3 13.5
    4 14.5];
data.tL(:,1) = (0.8+data.tL(:,1))*365;
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(7.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SebaBine2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Length-Weight relationship: W in g =  0.00759*(SL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '35CKZ'; % Cat of Life
metaData.links.id_ITIS = '623801'; % ITIS
metaData.links.id_EoL = '46564121'; % Ency of Life
metaData.links.id_Wiki = 'Diaphus_watasei'; % Wikipedia
metaData.links.id_ADW = 'Diaphus_watasei'; % ADW
metaData.links.id_Taxo = '173094'; % Taxonomicon
metaData.links.id_WoRMS = '272693'; % WoRMS
metaData.links.id_fishbase = 'Diaphus-watasei'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diaphus}}';
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
bibkey = 'SebaBine2013'; type = 'article'; bib = [ ...
'doi = {10.2331/suisan.43.913}, ' ...
'author = {Manju Sebastine and K. K. Bineesh and E. M. Abdussamad and N. G. K. Pillai}, ' ... 
'year   = {2013}, ' ...
'title  = {Myctophid fishery along the Kerala coast with emphasis on population characteristics and biology of the headlight fish, \emph{Diaphus watasei} {J}ordan \& {S}tarks, 1904}, ' ...
'journal = {Indian J. Fish.}, ' ...
'page = {7-11}, ' ...
'volume = {60(4)'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Diaphus-dumerilii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

