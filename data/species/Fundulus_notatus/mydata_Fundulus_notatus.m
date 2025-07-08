  function [data, auxData, metaData, txtData, weights] = mydata_Fundulus_kansae
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Fundulidae';
metaData.species    = 'Fundulus_notatus'; 
metaData.species_en = 'Blackstripe topminnow'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 06]; 

%% set data
% zero-variate data
data.am = 2.2*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'NiemWall1974';
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 3.5;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 8;     units.Li = 'cm';     label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 3.1e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'fishesoftexas';   
  comment.Wwb = 'based on egg diameter of 1.8 mm : pi/6*0.18^3';
data.Wwi = 3.64;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00603*Li^3.08, see F1';

data.Ri = 250/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'guess';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'fishesoftexas: 20-30 eggs over a short period';

% uni-variate data
% time - length
data.tL = [ ... % time (d), total length (cm)
 365*0.9 4.07
 365*1.9 5.37];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NiemWall1974';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
               
%% Discussion
D1 = 'mean temperatures are guessed';
D2 = 'tL data reconstructed from length-frequency counts';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00603*(TL in cm)^3.08'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6JRG7'; % Cat of Life
metaData.links.id_ITIS = '165663'; % ITIS
metaData.links.id_EoL = '203798'; % Ency of Life
metaData.links.id_Wiki = 'Fundulus_notatus'; % Wikipedia
metaData.links.id_ADW = 'Fundulus_notatus'; % ADW
metaData.links.id_Taxo = '174578'; % Taxonomicon
metaData.links.id_WoRMS = '1020951'; % WoRMS
metaData.links.id_fishbase = 'Fundulus-notatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fundulus_notatus}}';
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
bibkey = 'NiemWall1974'; type = 'Article'; bib = [ ...
'author = {Roy L. Nieman and Dale C. Wallace}, ' ...
'year = {1974}, ' ...
'title = {The Age and Growth of the Blackstripe Topminnow, \emph{Fundulus notatus} {R}afinesque}, ' ... 
'journal = {The American Midland Naturalist}, ' , ...
'volume = {92(1)}, ' ...
'pages = {203-205}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Fundulus-notatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/fundulus notatus.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


