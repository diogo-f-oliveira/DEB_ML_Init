function [data, auxData, metaData, txtData, weights] = mydata_Macrhybopsis_hyostoma

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Macrhybopsis_hyostoma'; 
metaData.species_en = 'Shoal chub'; 

metaData.ecoCode.climate = {'Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 20]; 

%% set data
% zero-variate data

data.tp = 43;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(21); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'based on Lp and tL data';
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 3.9;    units.Lp = 'cm'; label.Lp = 'total length at puberty';    bibkey.Lp = 'guess'; 
  comment.Lp = 'based on tp and tL data';
data.Li = 7.6;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'DietRobe2006';
  comment.Wwb = 'based on egg diameter of 0.7 mm for E.meeki: pi/6*0.07^3';
data.Wwp = 0.47;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','ScopBurg1992'};
  comment.Wwi = 'based on 0.00708*Lp^3.08, see F1';
data.Wwi = 3.6;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.08, see F1';

data.Ri = 2000/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based in M.gelida';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
19.166	1.938
20.221	2.288
20.345	1.696
21.107	2.154
21.582	2.827
22.759	2.558
24.434	3.500
24.529	2.235
24.539	2.477
24.714	3.096
25.489	3.850
26.188	2.800
26.362	3.392
26.922	2.585
27.383	2.935
28.261	2.612
28.329	4.227
29.348	3.715
29.462	2.908
30.102	3.985
31.375	2.450
33.497	3.419
34.441	4.658
34.499	2.531
36.491	3.931
44.754	6.031];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'StarMill2016'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '3X2J6'; % Cat of Life
metaData.links.id_ITIS = '553280'; % ITIS
metaData.links.id_EoL = '220992'; % Ency of Life
metaData.links.id_Wiki = 'Macrhybopsis_hyostoma'; % Wikipedia
metaData.links.id_ADW = 'Macrhybopsis_hyostoma'; % ADW
metaData.links.id_Taxo = '691260'; % Taxonomicon
metaData.links.id_WoRMS = '1019860'; % WoRMS
metaData.links.id_fishbase = 'Macrhybopsis-hyostoma'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Macrhybopsis_hyostoma}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Macrhybopsis-hyostoma.html}}';  
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
bibkey = 'StarMill2016'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.12892}, ' ...
'author = {T. A. Starks and M. L. Miller and J. M. Long}, ' ... 
'year = {2016}, ' ...
'title = {Early life history of three pelagic-spawning minnows \emph{Macrhybopsis} spp. in the lower {M}issouri {R}iver}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {88}, ' ...
'pages = {1335-1349}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DietRobe2006'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.12892}, ' ...
'author = {Douglas J. Dieterman and Eric Roberts and Patrick J. Braaten and David L. Galat}, ' ... 
'year = {2006}, ' ...
'title = {Reproductive Development in the Sicklefin Chub in the {M}issouri and {L}ower {Y}ellowstone {R}ivers}, ' ...
'journal = {The Prairie Naturalist}, ' ...
'volume = {28}, ' ...
'pages = {113-130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

