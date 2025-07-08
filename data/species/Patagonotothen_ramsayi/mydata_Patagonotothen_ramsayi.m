function [data, auxData, metaData, txtData, weights] = mydata_Patagonotothen_ramsayi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Patagonotothen_ramsayi'; 
metaData.species_en = 'Longtail southern cod'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L';'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 04];

%% set data
% zero-variate data

data.tp = 3.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'fishbase';   
  temp.tp = C2K(6);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 14*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'BricLapt2005';   
  temp.am = C2K(6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 24.8; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'BricLapt2005'; 
data.Li  = 44; units.Li  = 'cm';  label.Li  = 'ultimate total length';               bibkey.Li  = 'fishbase';

data.Wwb = 1.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BricLapt2005';
  comment.Wwb = 'based egg diameter of 1.3 mm: pi/6*0.13^3'; 
data.Wwp = 188; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00589*Lp^3.23, see F1';
data.Wwi = 1.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00589*Li^3.23, see F1';

% uni-variate data
% time-length data
data.tL = [ ... % time since birth (yr), total length (cm)
    4 23.4
    5 25.0
    6 26.2
    7 28.2
    8 29.2];
data.tL(:,1) = 365 * (1.2 + data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MasaRigi2016';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
19.930	25909.497
21.000	49697.608
22.042	40133.710
22.070	36426.896
23.000	34807.903
23.028	81395.206
23.028	28454.029
23.845	55427.000
23.930	34247.733
23.986	40069.398
24.042	48008.710
25.028	46387.853
25.056	51681.038
26.014	47943.466
26.915	26737.169
26.972	80205.894
27.000	29381.432
27.000	47910.844
27.000	58499.079
28.042	61641.063
28.887	76966.043
28.972	110845.599
29.056	71136.921
29.901	95991.312
30.014	113987.584
30.944	157898.002
30.944	111309.767
30.972	77955.894
31.930	104394.792
32.014	136156.701
32.944	117596.531
33.958	148798.271];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(6);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'MasaRigi2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lp = 3 * weights.Lp;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00589*(TL in cm)^3.23';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4DZHV'; % Cat of Life
metaData.links.id_ITIS = '642920'; % ITIS
metaData.links.id_EoL = '46572958'; % Ency of Life
metaData.links.id_Wiki = 'Patagonotothen_ramsayi'; % Wikipedia
metaData.links.id_ADW = 'Patagonotothen_ramsayi'; % ADW
metaData.links.id_Taxo = '183323'; % Taxonomicon
metaData.links.id_WoRMS = '234633'; % WoRMS
metaData.links.id_fishbase = 'Patagonotothen-ramsayi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Patagonotothen_ramsayi}}';
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
bibkey = 'MasaRigi2016'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-015-1663-6}, ' ...
'author = {La Mesa, Mario and Riginella, Emilio and Melli, Valentina and Bartolini, Fabrizio and Mazzoldi, Carlotta}, ' ... 
'year = {2016}, ' ...
'title = {Biological traits of a sub-{A}ntarctic nototheniid, \emph{Patagonotothen ramsayi}, from the {B}urdwood {B}ank}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {39(1)}, ' ...
'pages = {103–111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BricLapt2005'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-005-0090-5}, ' ...
'author = {P. Brickle and V. Laptikhovsky and A. Arkhipkin and J. Portela}, ' ... 
'year = {2005}, ' ...
'title = {Reproductive biology of \emph{Patagonotothen ramsayi} ({R}egan, 1913) ({P}isces: {N}ototheniidae) around the {F}alkland {I}slands}, ' ...
'journal = {Polar Biol}, ' ...
'volume = {NA}, ' ...
'pages = {NA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Patagonotothen-ramsayi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
