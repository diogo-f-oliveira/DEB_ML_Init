  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_proeliare
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_proeliare'; 
metaData.species_en = 'Cypress darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 09 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data
data.am = 1.5*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'BartPowe2010';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2;  units.Lp = 'cm'; label.Lp = 'std length at puberty';      bibkey.Lp = 'BurrPage1978'; 
  comment.Lp = 'based on first spawning at  1 yr and tL data';
data.Li = 4;    units.Li = 'cm'; label.Li = 'ultimate std length';      bibkey.Li = 'fishesoftexas';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 0.69; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = {'fishbase','fishesoftexas'};
   comment.Wwi = 'based on 0.00513*(Li/0.84)^3.14 (see F1,F2)';

data.Ri = 138/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate at SL 3.33 cm'; bibkey.Ri = 'fishesoftexas';
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (d), std length (cm)
57.009	1.607
90.935	1.883
123.015	2.050
155.857	2.654
180.438	2.664
217.341	2.605
246.627	2.670
272.959	3.016
303.302	2.815
335.428	2.873
361.792	3.141
396.752	3.206
427.135	2.912
456.362	3.117
484.774	3.010
515.774	3.497
547.063	3.297];
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BurrPage1978';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), std length (cm)
58.031	1.427
89.090	1.773
120.132	2.159
153.916	2.771
182.270	2.805
214.455	2.722
241.857	2.771
273.001	2.914
302.311	2.924
337.260	3.013
362.807	2.977
392.933	3.292
424.249	3.029
453.571	3.008];
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BurrPage1978';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  5 * weights.tL_f;
weights.tL_m =  5 * weights.tL_m;
weights.Wwb =  5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v =  2 * weights.psd.v;
%weights.psd.p_M =  3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00513 * (TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: SL = 0.84 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3BL64'; % Cat of Life
metaData.links.id_ITIS = '168424'; % ITIS
metaData.links.id_EoL = '206418'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_proeliare'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_proeliare'; % ADW
metaData.links.id_Taxo = '174137'; % Taxonomicon
metaData.links.id_WoRMS = '1466593'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-proeliare'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_proeliare}}';  
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
bibkey = 'BurrPage1978'; type = 'techreport'; bib = [ ... 
'author = {Brooks M. Burr and Lawrence M. Page}, ' ...
'year = {1978}, ' ...
'title = {Life-History Aspects of the cypress Darter, \emph{Etheostoma proeliare} in Max Creek, Illinois}, ' ... 
'institution = {Illinois Natural history survey, Urbana, Illinois}, ' ...
'volume = {106}, '...
'series= {Biological Notes}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-proeliare.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/etheostoma proeliare.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
