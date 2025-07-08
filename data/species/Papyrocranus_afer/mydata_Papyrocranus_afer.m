  function [data, auxData, metaData, txtData, weights] = mydata_Papyrocranus_afer

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osteoglossiformes'; 
metaData.family     = 'Notopteridae';
metaData.species    = 'Papyrocranus_afer'; 
metaData.species_en = 'Reticulate knifefish'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  % tags for different types of zero-variate data
metaData.data_1     = {}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 05];

%% set data
% zero-variate data
data.ab = 17;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 30*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp = 40;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'FemiUgwu2019';
  comment.Lp = 'FemiUgwu2019 give 53.4 cm for 50 percent, but LN data shows 40 cm';
data.Li = 80;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Wiki';

data.Wwb = 0.0244;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 3.6 mm: pi/6*0.36^3';
data.Wwp = 162.5;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'FrenPott2014';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 1.3e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Wiki';
  comment.Wwi = ' max published weight; based on 0.00832*Li^2.99, see F1 give 4 kg';
  
% univariate data

% length-change in length
data.LdL = [ ... % std length, chnage in length (cm/yr)
23.872	21.083
41.734	14.031
55.349	12.464];
data.LdL(:,2) = data.LdL(:,2)/365; % convert yr to d
units.LdL   = {'cm', 'cm/d'};  label.LdL = {'standard length','change in std length'};  
temp.LdL    = C2K(27);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Femi2022';

% length-fecundity
data.LN = [ ...  % log10 std length (cm), log10 fecundity (#)
1.600	1.350
1.608	1.277
1.624	1.395
1.625	1.259
1.634	1.440
1.648	1.476
1.655	1.730
1.655	1.404
1.664	1.567
1.673	1.431
1.677	1.531
1.679	1.639
1.688	1.567
1.695	1.748
1.698	1.649
1.706	1.685
1.706	1.830
1.718	1.694
1.722	1.803
1.733	1.721
1.737	1.830
1.750	1.866
1.758	1.993
1.761	1.848
1.773	2.020
1.782	1.902
1.800	2.165
1.801	2.002
1.826	2.228
1.829	2.074
1.867	2.255
1.879	2.283
1.895	2.355];
data.LN = 10.^(data.LN); % remove log transform
units.LN   = {'cm', '#'};  label.LN = {'standard length','fecundity'};  
temp.LN    = C2K(27);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'FemiUgwu2019';

%% set weights for all real data
weights = setweights(data, []);
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
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00832*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CLWQ'; % Cat of Life
metaData.links.id_ITIS = '649808'; % ITIS
metaData.links.id_EoL = '204159'; % Ency of Life
metaData.links.id_Wiki = 'Papyrocranus_afer'; % Wikipedia
metaData.links.id_ADW = 'Papyrocranus_afer'; % ADW
metaData.links.id_Taxo = '42732'; % Taxonomicon
metaData.links.id_WoRMS = '581711'; % WoRMS
metaData.links.id_fishbase = 'Papyrocranus afer'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Papyrocranus_afer}}';  
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
bibkey = 'Femi2022'; type = 'article'; bib = [ ...    
'author = {Oluwale Femi}, ' ...
'year  = {2022}, ' ...
'title = {AGE AND GROWTH OF \emph{Papyrocranus afer} ({G}UNTHER 1868), AN EMERGING ORNAMENTAL FISH IN {N}IGERIA}, ' ...  
'journal = {Uttar Pradesh Journal of Zoology}, ' ...
'volume = {43(2)}, ' ...
'pages = {19-29}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FemiUgwu2019'; type = 'article'; bib = [ ...    
'author = {Oluwale V. Femi and Adiaha A.A. Ugwumba}, ' ...
'year  = {2019}, ' ...
'title = {Reproductive parameters of Reticulate Knife fish, \emph{Papyrocranus afer} ({G}unther, 1868) from {L}ekki {L}agoon, {L}agos {N}igeria}, ' ...  
'journal = {Global Journal of Fisheries and Aquaculture}, ' ...
'volume = {7(2)}, ' ...
'pages = {506-515}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Papyrocranus-afer.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

