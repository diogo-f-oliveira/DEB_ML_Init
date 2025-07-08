  function [data, auxData, metaData, txtData, weights] = mydata_Citharinus_citharus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Citharinidae';
metaData.species    = 'Citharinus_citharus'; 
metaData.species_en = 'Moon fish'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 30];

%% set data
% zero-variate data
data.ab = 5;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 18;    units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 58;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.25 mm: pi/6*0.125^3';
data.Wwp = 209;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi: (18/58)^3*7e3';
data.Wwi = 7e3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight; based on 0.01318*Li^2.87, see F1, gives 1.5 kg';

data.Ri = 1.6e6/365; units.Ri = '#/d'; label.Ri = 'reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % age (d), total length (cm)
0.552	11.404
38.070	13.207
61.127	13.966
90.672	14.962
124.001	18.188
152.938	20.465
184.058	23.074
213.689	25.066
246.675	24.307
275.329	23.311
304.849	24.023
337.953	24.639
369.616	25.209
396.973	25.825
430.996	28.767
521.773	31.613
552.134	33.748
582.369	34.412];
data.tL(:,1) = data.tL(:,1)+200; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bene1974';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Li = 5 * weights.Li;
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
D1  = 'males are supposed not to differ from females';
D2 = 'temperature (C) in tL data is supposed to vary as T(t)=25+5*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01318*(TL in cm)^2.87';
metaData.bibkey.F1    = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5YWHB'; % Cat of Life
metaData.links.id_ITIS = '640164'; % ITIS
metaData.links.id_EoL = '212070'; % Ency of Life
metaData.links.id_Wiki = 'Citharinus_citharus'; % Wikipedia
metaData.links.id_ADW = 'Citharinus_citharus'; % ADW
metaData.links.id_Taxo = '192541'; % Taxonomicon
metaData.links.id_WoRMS = '1020007'; % WoRMS
metaData.links.id_fishbase = 'Citharinus_citharus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Citharinus_citharus}}';  
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
bibkey = 'Bene1974'; type = 'Article'; bib = [ ...  
'author = {B\''{e}nech, V.}, ' ...
'year  = {1974}, ' ...
'title = {Donn\''{e}es sur la croissance de \emph{Citharinus citharus} (poissons, {C}haraciformes) dans le bassin {T}chadien}, ' ...  
'journal = {Cah. O.R.S.T.O.M., s\''{e}r. Hydrobiol.}, ' ...
'volume = {8(1)}, ' ...
'pages = {23-33}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Citharinus-citharus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

