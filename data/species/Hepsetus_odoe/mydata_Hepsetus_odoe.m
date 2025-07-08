  function [data, auxData, metaData, txtData, weights] = mydata_Hepsetus_odoe

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Hepsetidae';
metaData.species    = 'Hepsetus_odoe'; 
metaData.species_en = 'African pike characin'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 04]; 

%% set data
% zero-variate data
data.ab = 4.5; units.ab = 'd';    label.ab = 'age at birth';    bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 44.2;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 6.9e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.1 mm of Hydrocynus_forskahlii: pi/6*0.11^3';
data.Wwi = 777;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00550*Li^3.13, see F1';
  
data.Ri = 8262/365; units.Ri = '#/d'; label.Ri = 'reprod rate at Ww = 1.7 kg'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
218.149	11.249
233.047	12.170
266.035	14.707
365+204.315	19.862
365+237.303	21.004
365+250.073	22.391
365+264.971	21.452
365+299.023	22.593
730+131.953	22.699
730+203.251	25.212
730+236.239	26.354
730+250.073	27.973
730+269.227	28.891
730+299.023	28.174
1095+129.825	27.584
1095+300.087	32.592
1460+129.825	32.468];
data.tL(:,1) = 60 + data.tL(:,1); % set origin at birth
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
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
F1 = 'length-weight: Ww in g = 0.00550*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
F2 = 'builds free-floating bubble nest';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3KWM8'; % Cat of Life
metaData.links.id_ITIS = '163071'; % ITIS
metaData.links.id_EoL = '218280'; % Ency of Life
metaData.links.id_Wiki = 'Hepsetus_odoe'; % Wikipedia
metaData.links.id_ADW = 'Hepsetus_odoe'; % ADW
metaData.links.id_Taxo = '43311'; % Taxonomicon
metaData.links.id_WoRMS = '581702'; % WoRMS
metaData.links.id_fishbase = 'Hepsetus-odoe'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Hepsetus_odoe}}';  
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
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Hepsetus-odoe.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

