function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_mentella

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_mentella'; 
metaData.species_en = 'Deepwater redfish'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAN', 'MN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2019 03 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 75*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(3.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 33.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'BakaMeln2008'; 
data.Lpm  = 32.2;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'BakaMeln2008'; 
data.Li  = 77.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 3e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SaboDomi2015';
  comment.Wwb = 'based on egg diameter of 0.833 mm: pi/6*0.0833^3';

data.Ri  = 94e3/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 48.3 cm'; bibkey.Ri  = 'SaboDomi2015';   
temp.Ri = C2K(3.6);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on relative fecundity of 64 oocytes per g, for 1308 g, at TL of 48.3 cm';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
    7 25.3
    8 27.1
    9 28.4
   10 30.0
   11 31.0
   12 32.4
   13 34.0
   14 35.3
   15 36.8
   16 38.5
   17 40.0
   18 41.8
   19 43.2
   20 44.4
   21 45.4
   22 46.4
   23 47.7
   24 48.3];
data.tL_f(:,1) = 365 * (0.5 + data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(3.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BakaMeln2008';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
    7 25.9
    8 27.1
    9 28.4
   10 29.7
   11 31.0
   12 32.4
   13 33.9
   14 35.6
   15 36.8
   16 38.4
   17 40.2
   18 41.9
   19 43.0
   20 44.6
   21 45.5
   22 46.3
   23 47.2
   24 48.5
   25 49.7];
data.tL_m(:,1) = 365 * (0.5 + data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(3.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BakaMeln2008';
comment.tL_m = 'data for males';

% time-weight
data.tW_f = [ ... % time since birth (yr), wet weight (g)
    7  204
    8  232
    9  278
   10  325
   11  367
   12  428
   13  496
   14  567
   15  638
   16  731
   17  846
   18  954
   19 1051
   20 1115
   21 1170
   22 1216
   23 1251
   24 1308];
data.tW_f(:,1) = 365 * (0.5 + data.tW_f(:,1)); % convert yr 
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f   = C2K(3.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'BakaMeln2008';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (yr), wet weight (g)
    7  216
    8  249
    9  280
   10  317
   11  365
   12  420
   13  485
   14  585
   15  646
   16  731
   17  837
   18  957
   19 1052
   20 1156
   21 1218
   22 1292
   23 1322
   24 1382
   25 1474];
data.tW_m(:,1) = 365 * (0.5 + data.tW_m(:,1)); % convert yr 
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(3.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'BakaMeln2008';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.01';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4W7NG'; % Cat of Life
metaData.links.id_ITIS = '166756'; % ITIS
metaData.links.id_EoL = '46568111'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_mentella'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_mentella'; % ADW
metaData.links.id_Taxo = '187298'; % Taxonomicon
metaData.links.id_WoRMS = '127254'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-mentella'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_mentella}}';
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
bibkey = 'BakaMeln2008'; type = 'Article'; bib = [ ... 
'author = {Yu. I. Bakay and S. P. Mel''nikov}, ' ... 
'year = {2008}, ' ...
'title = {Biological and Ecological Characteristics of Deepwater Redfish \emph{Sebastes mentella} ({S}corpaenidae) at Different Depths in the Pelagial of the {I}rminger {S}ea}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {48}, ' ...
'pages = {68-80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SaboDomi2015'; type = 'Article'; bib = [ ... 
'doi = {10.7773/cm.v41i2.2500}, ' ...
'author = {Fran Saborido-Rey and Rosario Dom\''{i}nguez-Petit and Dolores Garabana and Porsteinn Sigurosson}, ' ... 
'year = {2015}, ' ...
'title = {Fecundity of \emph{Sebastes mentella} and \emph{Sebastes norvegicus} in the {I}rminger Sea and {I}celandic waters}, ' ...
'journal = {Ciencias Marinas}, ' ...
'volume = {41}, ' ...
'pages = {107-124}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-mentella.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
