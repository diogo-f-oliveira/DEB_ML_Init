  function [data, auxData, metaData, txtData, weights] = mydata_Cyprinodon_elegans
  %% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Cyprinodontidae';
metaData.species    = 'Cyprinodon_elegans'; 
metaData.species_en = 'Comanche springs pupfish'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab';  'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine','Bas Kooijman'};                             
metaData.date_subm = [2020 07 26];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromsoe, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 07 27]; 

%% set data
% zero-variate data
data.ab = 5;         units.ab = 'd';  label.ab = 'age at birth';          bibkey.ab = 'fishesoftexas';
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 5*30;        units.tp = 'd';  label.tp = 'time since birth at puberty';        bibkey.tp = 'fishesoftexas';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature'; comment.tp = 'temp is guessed';
data.am = 3.5*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'LeisItzk2003';
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 3;     units.Lp = 'cm';     label.Lp = 'ultimate total length';  bibkey.Lp = 'LeisItzk2003';
data.Li = 6.2;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishesoftexas';

data.Wwb = 5.2e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';   
  comment.Wwb = 'based on egg diameter of 1 mm for C. diabolis: pi/6*0.1^3';
data.Wwi = 3.82; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
   comment.Wwi = 'based on 0.01072*Li^3.22, see discussion';
   
data.Ri = 900/365; units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'fishesoftexas';   
  temp.Ri = C2K(26.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 30 per d in aquarium study; assumed for 30 d';


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
                  
%% Discussion points
D1 = 'weight length relationship: Ww in g = 0.01072 * (TL in cm)^3.22'; 
  metaData.bibkey.D1 = 'fishbase';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '33HM6'; % Cat of Life
metaData.links.id_ITIS = '165634'; % ITIS
metaData.links.id_EoL = '1012075'; % Ency of Life
metaData.links.id_Wiki = 'Cyprinodon_elegans'; % Wikipedia
metaData.links.id_ADW = 'Cyprinodon_elegans'; % ADW
metaData.links.id_Taxo = '172742'; % Taxonomicon
metaData.links.id_WoRMS = '1021647'; % WoRMS
metaData.links.id_fishbase = 'Cyprinodon-elegans'; % fishbase


%% References
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/cyprinodon elegans.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cyprinodon-elegans.html}}';
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
bibkey = 'Garr1982'; type = 'Article'; bib = [ ...
'author = {Gary P. Garrett}, ' ...
'year = {1982}, ' ...
'title = {Variation in the Reproductive Traits of the {P}ecos {P}upfish, \emph{Cyprinodon pecosensis}}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {108}, '...
'pages = {355--368}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LeisItzk2003'; type = 'Article'; bib = [ ...
'author = {Leiser, John K. and Itzkowitz, Murray}, ' ...
'year = {2003}, ' ...
'title = {The breeding system of an endangered pupfish (\emph{Cyprinodon elegans})}, ' ...
'journal = {Western North American Naturalist}, ' ...
'volume = {63(1)}, '...
'pages = {article 16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

