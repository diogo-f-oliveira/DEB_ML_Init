function [data, auxData, metaData, txtData, weights] = mydata_Macrhybopsis_meeki

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Macrhybopsis_meeki'; 
metaData.species_en = 'Sicklefin chub'; 

metaData.ecoCode.climate = {'Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

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

data.tp = 92;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = {'DietRobe2006','StarMill2016'};   
  temp.tp = C2K(21); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 7;    units.Lp = 'cm'; label.Lp = 'total length at puberty';    bibkey.Lp = 'DietRobe2006'; 
  comment.Lp = 'based on tp and tL data';
data.Li = 11;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'DietRobe2006';
  comment.Wwb = 'based on egg diameter of 0.7 mm: pi/6*0.07^3';
data.Wwp = 3.4;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','DietRobe2006'};
  comment.Wwi = 'based on 0.00891*Lp^3.06, see F1';
data.Wwi = 13.7;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.06, see F1';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
15.754	1.851
17.537	1.582
17.834	2.253
17.983	1.743
18.875	2.441
18.875	2.709
19.172	1.743
20.955	2.333
21.104	2.950
21.847	1.824
21.996	1.663
22.144	2.977
23.036	2.709
23.036	3.218
24.225	2.119
24.671	3.138
24.820	3.352
26.157	2.441
26.157	1.958
27.049	3.031
27.197	2.307
29.724	3.057
30.021	2.307
31.062	2.709
31.359	2.923
31.805	3.540
32.102	2.414
32.548	2.548
32.994	3.808
33.142	2.950
33.291	3.245
33.737	3.460
33.885	2.494
34.777	3.165
34.926	2.870
36.115	2.789
36.115	3.192
38.047	3.567
39.830	3.621
40.870	3.728
41.911	3.540
42.803	4.318
42.803	4.130
55.881	5.605
57.962	5.391
62.866	5.686
64.055	5.310
64.352	5.793];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'StarMill2016'; 

% length - fecundity
data.LN = [ ... total length, fecundity (#)
    10.6 1115
     9.0 1055
    11.7 1561
     8.6 1473
    10.4  487
     9.3  641
     9.3  228
    10.2    7
    10.5   27
    10.5  189
    10.7  495
     8.8  444
     9.0  388
    10.7  421
     9.0  411
     9.9  419
    10.4  617
    11.2 1104
     9.2  702];
units.LN = {'cm','#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(21);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'DietRobe2006';

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
metaData.links.id_CoL = '3X2J8'; % Cat of Life
metaData.links.id_ITIS = '163868'; % ITIS
metaData.links.id_EoL = '994829'; % Ency of Life
metaData.links.id_Wiki = 'Macrhybopsis_meeki'; % Wikipedia
metaData.links.id_ADW = 'Macrhybopsis_meeki'; % ADW
metaData.links.id_Taxo = '179435'; % Taxonomicon
metaData.links.id_WoRMS = '1019282'; % WoRMS
metaData.links.id_fishbase = 'Macrhybopsis-meeki'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Macrhybopsis_meeki}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Macrhybopsis-meeki.html}}';  
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

