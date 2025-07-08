function [data, auxData, metaData, txtData, weights] = mydata_Macrhybopsis_gelida

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Macrhybopsis_gelida'; 
metaData.species_en = 'Sturgeon chub'; 

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

data.tp = 37;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(21); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'based Lp and tL data';
data.am = 7*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'ADW';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 4;    units.Lp = 'cm'; label.Lp = 'total length at puberty';    bibkey.Lp = 'guess'; 
  comment.Lp = 'based on tp and tL data';
data.Li = 8.4;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'DietRobe2006';
  comment.Wwb = 'based on egg diameter of 0.7 mm for E.meeki: pi/6*0.07^3';
data.Wwp = 0.62;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'guess';
  comment.Wwi = 'based on 0.00813*Lp^3.13, see F1';
data.Wwi = 6;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.06, see F1';

data.Ri = 5310/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';


%% univariate data
 
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
14.862	1.633
16.794	1.815
16.794	1.919
17.834	2.359
17.983	1.685
18.280	2.074
19.766	1.789
19.915	2.230
19.915	1.504
20.807	2.826
20.807	2.541
20.955	1.659
22.590	2.022
22.887	2.541
24.076	2.852
24.968	2.956
27.643	2.541
28.832	4.044
28.832	3.241
30.616	2.385
30.616	2.593
30.616	2.981
31.953	4.019
32.102	3.785
32.994	2.644
33.439	5.419
34.480	4.200
35.817	4.330
36.709	5.263
39.830	5.030
42.803	5.730];
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
F1 = 'length-weight: W in g = 0.00891*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '3X2J5'; % Cat of Life
metaData.links.id_ITIS = '163866'; % ITIS
metaData.links.id_EoL = '994826'; % Ency of Life
metaData.links.id_Wiki = 'Macrhybopsis_gelida'; % Wikipedia
metaData.links.id_ADW = 'Macrhybopsis_gelida'; % ADW
metaData.links.id_Taxo = '179434'; % Taxonomicon
metaData.links.id_WoRMS = '1021446'; % WoRMS
metaData.links.id_fishbase = 'Macrhybopsis-gelida'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Macrhybopsis_gelida}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Macrhybopsis-gelida.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Macrhybopsis_gelida/}}';  
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

