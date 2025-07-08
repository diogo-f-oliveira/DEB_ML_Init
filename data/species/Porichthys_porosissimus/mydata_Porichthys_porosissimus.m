  function [data, auxData, metaData, txtData, weights] = mydata_Porichthys_porosissimus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Batrachoidiformes'; 
metaData.family     = 'Batrachoididae';
metaData.species    = 'Porichthys_porosissimus'; 
metaData.species_en = 'Atlantic midshipman'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMr', '0iMcd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L_T'; 'L-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 17];

%% set data
% zero-variate data
data.am = 9*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(24.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15;     units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'guess'; 
data.Li = 34;   units.Li = 'cm';  label.Li = 'ultimate total length for females';  bibkey.Li = 'fishbase';

data.Wwb = 5.44e-2;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';    bibkey.Wwb = 'DeMa1990';
  comment.Wwb = ' based on egg diameter of 0.47 cm of P. notatus: pi/6*0.47^3'; 
data.Wwp = 30.2;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwi = 'based on 0.00550*Lp^3.18, see F1';
data.Wwi = 408;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00550*Li^3.18, see F1';
  
data.Ri = 110/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'DeMa1990';   
  temp.Ri = C2K(24.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri  = 'based on fecundity of P. notatus';
  
% uni-variate data
% time-length
data.tL = [... % time since 1 aug (d), length (cm)
306.633	6.277
366.330	8.054
365+64.749	9.570
365+122.923	10.071
365+185.967	11.502
365+307.203	14.202
365+366.875	14.95
730+2.260	15.467
730+64.550	16.559
730+125.331	16.971
730+185.380	17.895
730+305.839	19.318
730+366.262	20.327
1095+125.077	21.744
1095+186.238	22.411
1095+307.438	23.662
1095+367.853	24.330
1460+64.766	25.252
1460+186.322	25.820
1460+308.199	24.257
1460+366.743	24.673];
data.tL(:,1) = data.tL(:,1) - 100; % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'length'};
temp.tL = C2K(24.1); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'VianToma2000'};
 
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

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00550*(TL in cm)^3.18';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6W89N'; % Cat of Life
metaData.links.id_ITIS = '164419'; % ITIS
metaData.links.id_EoL = '46565867'; % Ency of Life
metaData.links.id_Wiki = 'Porichthys_porosissimus'; % Wikipedia
metaData.links.id_ADW = 'Porichthys_porosissimus'; % ADW
metaData.links.id_Taxo = '44215'; % Taxonomicon
metaData.links.id_WoRMS = '275662'; % WoRMS
metaData.links.id_fishbase = 'Porichthys-porosissimus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Porichthys_porosissimus}}';  
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
bibkey = 'VianToma2000'; type = 'Article'; bib = [ ...  
'author = {Marcelo Vianna and Ac\''{a}cio R. G. Tomas and Jos\''{e} R. Verani}, ' ...
'year = {2000}, ' ...
'title = {Aspects of the biology of the {A}tlantic Midshipman, \emph{Porichthys porosissimus} ({T}eleostei, {B}atrachoididae): an important by-catch species of shrimp trawling off southern {B}razil}, ' ... 
'journal = {Rev. bras. oceanogr.}, ' ...
'volume = {48(2)}, '...
'pages = {131-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeMa1990'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1446452}, ' ...
'author = {Edward E. DeMartini}, ' ...
'year = {1990}, ' ...
'title = {Annual Variations in Fecundity, Egg Size and Condition of the Plainfin Midshipman (\emph{Porichthys notatus})}, ' ... 
'journal = {Copeia}, ' ...
'volume = {1990(3)}, '...
'pages = {850–855}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Porichthys-porosissimus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

