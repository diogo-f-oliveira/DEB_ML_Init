  function [data, auxData, metaData, txtData, weights] = mydata_Brycinus_macrolepidotus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Alestidae';
metaData.species    = 'Brycinus_macrolepidotus'; 
metaData.species_en = 'True big-scale tetra'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 05]; 

%% set data
% zero-variate data
data.ab = 4.5; units.ab = 'd';    label.ab = 'age at birth';    bibkey.ab = 'guess'; 
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 18.5;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 53;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 6.9e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.1 mm of Hydrocynus_forskahlii: pi/6*0.11^3';
data.Wwi = 2e3;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight; based on 0.01072*Li^2.97, see F1, gives 1.4 kg';
  
data.Ri = 2.1e4/365; units.Ri = '#/d'; label.Ri = 'reprod rate at Ww = 1.7 kg'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Hepsetus_odoe: Hepsetus_odoe: 8262*2e3/777';

% univariate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
234.129	15.273
266.198	17.212
365+113.640	19.394
365+144.648	21.576
365+160.644	21.091
365+209.828	24.485
365+236.568	26.667
365+268.572	26.182
730+114.920	27.394
730+206.807	31.273
730+236.723	32.485
1095+162.048	33.697];
data.tL(:,1) = 60 + data.tL(:,1); % set origin at birth
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TahJoan2010'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
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
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01072*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase';
F2 = 'builds free-floating bubble nest';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'NH5Y'; % Cat of Life
metaData.links.id_ITIS = '639852'; % ITIS
metaData.links.id_EoL = '211790'; % Ency of Life
metaData.links.id_Wiki = 'Brycinus'; % Wikipedia
metaData.links.id_ADW = 'Brycinus_macrolepidotus'; % ADW
metaData.links.id_Taxo = '164696'; % Taxonomicon
metaData.links.id_WoRMS = '280003'; % WoRMS
metaData.links.id_fishbase = 'Brycinus_macrolepidotus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Brycinus-macrolepidotus}}';  
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
bibkey = 'TahJoan2010'; type = 'Article'; bib = [ ...    
'author = {Tah, L. and T.G. Joanny and V. N''Douby and J.N. Kouassi and J. Moreau}, ' ...
'year  = {2010}, ' ...
'title = {Preliminary estimates of the population parameters of major fish species in {L}ake {A}yam\''{e} {I} ({B}ia basin; C\^{o}te d''{I}voire)}, ' ...  
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {26(1)}, ' ...
'pages = {57-63}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Brycinus_macrolepidotus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

