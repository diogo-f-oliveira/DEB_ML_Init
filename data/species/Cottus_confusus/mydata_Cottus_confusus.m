function [data, auxData, metaData, txtData, weights] = mydata_Cottus_confusus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Cottus_confusus'; 
metaData.species_en = 'Shorthead sculpin'; 

metaData.ecoCode.climate = {'Csb','Dsb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 25];              
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

data.am = 6 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'HughPede1984';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 5.8;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Patt1971'; 
data.Lim  = 15;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
data.Wwp = 1.74;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = {'fishbase','Patt1971'};
  comment.Wwp = 'based on 0.00708*Lp^3.13, see F1';
data.Wwim = 34;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00708*Lim^3.13, see F1';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years), total length (cm) 
    1 3.70
    2 4.86
    3 7.14];
data.tL_f(:,1) = 365 * (1 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HughPede1984';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % age (years), total length (cm) 
    1  3.70
    2  6.44];
data.tL_m(:,1) = 365 * (1 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HughPede1984';
comment.tL_m = 'data for males';

% length - fecundity
data.LN = [ ... % total length (cm), fecundity (#)
6.063	44.652
6.222	50.458
6.265	55.495
6.294	63.393
6.453	48.411
6.566	135.200
6.582	76.426
6.712	76.484
6.755	87.256
6.855	105.939
6.900	83.736
7.072	101.018
7.172	126.869
7.201	125.449
7.274	112.578
7.544	221.660
7.662	159.347
7.663	129.240
7.707	122.091
7.792	152.954
7.923	125.772
8.081	163.835
8.196	175.357
8.197	151.701
8.209	214.789
8.485	169.034
8.573	127.497
8.628	214.977
10.247	164.806];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Patt1971';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.Lp = weights.Lp * 5;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6B8DR'; % Cat of Life
metaData.links.id_ITIS = '167240'; % ITIS
metaData.links.id_EoL = '210360'; % Ency of Life
metaData.links.id_Wiki = 'Cottus_confusus'; % Wikipedia
metaData.links.id_ADW = 'Cottus_confusus'; % ADW
metaData.links.id_Taxo = '172057'; % Taxonomicon
metaData.links.id_WoRMS = '592852'; % WoRMS
metaData.links.id_fishbase = 'Cottus-confusus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cottus_confusus}}';
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
bibkey = 'HughPede1984'; type = 'Article'; bib = [ ... 
'doi = {10.1139/z84-047}, ' ...
'author = {Grant W. Hughes and Alex E. Peden}, ' ... 
'year = {1984}, ' ...
'title = {Life history and status of the shorthead sculpin (\emph{Cottus confusus}: {P}isces, {C}ottidae) in {C}anada and the sympatric relationship to the slimy sculpin (\emph{Cottus cognatus})}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {62(2)}, ' ...
'pages = {306-311}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Patt1971'; type = 'Article'; bib = [ ... 
'author = {Benjamin G. Patten}, ' ... 
'year = {1971}, ' ...
'title = {Spawning and Fecundity of Seven Species of {N}orthwest {A}merican Cottus}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {85(2)}, ' ...
'pages = {493-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cottus-confusus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

