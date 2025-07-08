  function [data, auxData, metaData, txtData, weights] = mydata_Pomoxis_nigromaculatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Centrarchidae';
metaData.species    = 'Pomoxis_nigromaculatus'; 
metaData.species_en = 'Black crappie'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 06]; 

%% set data
% zero-variate data
data.ab = 2.5;        units.ab = 'd';  label.ab = 'age at birth'; bibkey.ab = 'ADW';
  temp.ab = C2K(21); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'fishbase';
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 19;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'Wiki'; 
   comment.Lp = 'based on tp = 2-4 yr and tL data';
data.Li = 49;     units.Li = 'cm';     label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'PopeGera1996';   
  comment.Wwb = 'based on egg diameter of 0.7 mm : pi/6*0.07^3';
data.Wwi = 1.6e3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.01122*Li^3.05, see F1';

data.Ri = 334396/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL = [ ... % year class (yr), total length (cm)
    1  8.7
    2 16.1
    3 19.2
    4 21.3
    5 22.8
    6 24.1
    7 25.0
    8 28.0];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PopeWill1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
F1 = 'length-weight: Ww in g = 0.01122*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LR4Q'; % Cat of Life
metaData.links.id_ITIS = '168167'; % ITIS
metaData.links.id_EoL = '225242'; % Ency of Life
metaData.links.id_Wiki = 'Pomoxis_nigromaculatus'; % Wikipedia
metaData.links.id_ADW = 'Pomoxis_nigromaculatus'; % ADW
metaData.links.id_Taxo = '45145'; % Taxonomicon
metaData.links.id_WoRMS = '592856'; % WoRMS
metaData.links.id_fishbase = 'Pomoxis-nigromaculatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomoxis_nigromaculatus}}';
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
bibkey = 'PopeWill1998'; type = 'Article'; bib = [ ...
'author = {Pope, K. L. and Willis, D. W.}, ' ...
'year = {1998}, ' ...
'title = {Early life history and recruitment of black crappie (\emph{Pomoxis nigromaculatus}) in two {S}outh {D}akota waters}, ' ... 
'journal = {Ecology of Freshwater Fish}, ' , ...
'volume = {7}, ' ...
'pages = {56-68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'PopeGera1996'; type = 'Article'; bib = [ ...
'doi = {10.1080/02705060.1996.9664473}, ' ...
'author = {Kevin L. Pope and Wade T. Geraets and David W. Willis}, ' ...
'year = {1996}, ' ...
'title = {Egg Development in a High-Density Black Crappie (\emph{Pomoxis nigromaculatus}) Population}, ' ... 
'journal = {Journal of Freshwater Ecology}, ' , ...
'volume = {11(4)}, ' ...
'pages = {451-458}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pomoxis-nigromaculatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Pomoxis_nigromaculatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

