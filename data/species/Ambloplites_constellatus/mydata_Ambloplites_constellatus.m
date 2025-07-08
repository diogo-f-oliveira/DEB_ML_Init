  function [data, auxData, metaData, txtData, weights] = mydata_Ambloplites_constellatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Centrarchidae';
metaData.species    = 'Ambloplites_constellatus'; 
metaData.species_en = 'Ozark bass'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 08];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 08];

%% set data
% zero-variate data
data.am = 18*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'guess';
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Ambloplites rupestris';
 
data.Lp = 10;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 27.9;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.5e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';   
  comment.Wwb = 'based on egg diameter of 2.05 mm of Ambloplites rupestris: pi/6*0.205^3';
data.Wwp = 14.5;  units.Wwp = 'g'; label.Wwp = 'wet weight at piberty'; bibkey.Wwp = {'guess','fishbase'}; 
  comment.Wwp = 'based on 0.01230*Lp^3.07, see F1';
data.Wwi = 337.2;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.01230*Li^3.07, see F1';

data.Ri = 11e3/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'guess';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Ambloplites rupestris';

% uni-variate data
% time-length
data.tL_BC = [ ... % time since birth (yr), total length (cm)
    1   7.63  8.36
    2  13.0  12.8
    3  18.3  17.3
    4  20.7  19.5
    5  21.6  20.5
    6  21.4  20.6
    7  20.8  23.0
    8  NaN   23.8
    9  25.8  25.3];
data.tL_BC(:,1) = 365 * data.tL_BC(:,1);
units.tL_BC = {'d', 'cm'}; label.tL_BC = {'time since birth', 'total length'};  
temp.tL_BC = C2K(15);  units.temp.tL_BC = 'K'; label.temp.tL_BC = 'temperature';
bibkey.tL_BC = 'RodmRye2014'; treat.tL_BC = {1 {'Buffalo River','Crooked Creek'}};
title.tL_BC = 'Buffalo River & Crooked Creek';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_BC = 5 * weights.tL_BC;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.title = title;
               
%% Discussion
D1 = 'mean temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5TZX2'; % Cat of Life
metaData.links.id_ITIS = '168100'; % ITIS
metaData.links.id_EoL = '206892'; % Ency of Life
metaData.links.id_Wiki = 'Ambloplites_constellatus'; % Wikipedia
metaData.links.id_ADW = 'Ambloplites_constellatus'; % ADW
metaData.links.id_Taxo = '160525'; % Taxonomicon
metaData.links.id_WoRMS = '1012694'; % WoRMS
metaData.links.id_fishbase = 'Ambloplites-constellatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ambloplites_constellatus}}';
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
bibkey = 'RodmRye2014'; type = 'Article'; bib = [ ...
'author = {Rodman, A.R. and K.R. Rye}, ' ...
'year = {2014}, ' ...
'title = {Growth and mortality of {O}zark bass (\emph{Ambloplites constellatus}) in streams of the {O}zark highlands}, ' ... 
'journal = {Discovery}, ' , ...
'volume = {15(1)}, ' ...
'pages = {56-66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ambloplites-constellatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

