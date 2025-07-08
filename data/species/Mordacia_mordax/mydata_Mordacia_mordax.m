function [data, auxData, metaData, txtData, weights] = mydata_Mordacia_mordax

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Cephalaspidomorphi'; 
metaData.order      = 'Petromyzontiformes'; 
metaData.family     = 'Mordaciidae';
metaData.species    = 'Mordacia_mordax'; 
metaData.species_en = 'Short-headed lamprey'; 

metaData.ecoCode.climate = {'MC','BWh','Cfb'};
metaData.ecoCode.ecozone = {'MISE','TA'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'bpD','piTvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(19); % K, body temperature
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2020 07 15];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 07 15]; 

%% set data
% zero-variate data;
data.am = 9*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temp is guessed';

data.Lp  = 11.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase';
data.Li  = 50;     units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on diameter 1 mm: pi/6*0.1^3';
data.Wwp = 1.73;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00120*Lp^3, see F2';
data.Wwi = 150;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00120*Li^3, see F2';

data.NR  = 13372;   units.NR  = '#';   label.NR  = 'eggs at the end of life';bibkey.NR  = 'fishbase';   
  temp.NR = C2K(19); units.temp.NR = 'K'; label.temp.NR = 'temperature';

% univariate data
% time - length
data.tL = [ ... % time (d), total length (cm)
0	    3.199
47.932	3.580
92.035	4.244
141.264	4.511
185.008	4.153
230.674	4.268
276.332	4.364
320.336	4.744
367.829	5.068
410.131	5.600
461.254	6.265
505.584	7.573
549.654	8.143
595.538	8.883
639.502	9.149
686.929	9.284
732.561	9.304
778.180	9.287
822.157	9.591
869.624	9.839
913.575	10.068
1052.658	11.361
1096.522	11.343
1143.903	11.345
1187.860	11.593
1235.174	11.405
1284.402	11.672
1324.783	11.730
1375.666	11.713
1561.672	11.700];
units.tL = {'d', 'cm'};     label.tL = {'time', 'total length'};  
bibkey.tL = 'Pott1970';
temp.tL = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
comment.tL = 'Data from Moruya River';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'assumption: Ww_i excludes eggs';
D2 = 'temperature T (in C) in tL data is varying as T(t) = 17+11*cos(t*pi*2/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'spawns once at end of life; no feeding as adult, parasitic stage present';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 0.00120*(TL in cm)^3';
metaData.bibkey.F2 = 'fishbase';
F3 = 'Ammocoetes stay in freshwater upt 7 yrs, then migrate to sea, returning to spawn and die';
metaData.bibkey.F3 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '44CSL'; % Cat of Life
metaData.links.id_ITIS = '159747'; % ITIS
metaData.links.id_EoL = '46582348'; % Ency of Life
metaData.links.id_Wiki = 'Mordacia_mordax'; % Wikipedia
metaData.links.id_ADW = 'Mordacia_mordax'; % ADW
metaData.links.id_Taxo = '180344'; % Taxonomicon
metaData.links.id_WoRMS = '281595'; % WoRMS
metaData.links.id_fishbase = 'Mordacia-mordax'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mordacia_mordax}}';  
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
bibkey = 'Pott1970'; type = 'article'; bib = [ ...  
'author = {C. Potter}, ' ...
'year = {1970}, ' ...
'title  = {The life cycles and ecology of {A}ustralian lampreys of the genus \emph{Mordacia}}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {161}, ' ...
'page = {487-511}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mordacia-mordax.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
