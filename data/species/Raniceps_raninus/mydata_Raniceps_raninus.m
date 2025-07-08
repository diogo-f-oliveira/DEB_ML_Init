function [data, auxData, metaData, txtData, weights] = mydata_Gadiculus_argenteus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Ranicipitidae';
metaData.species    = 'Raniceps_raninus'; 
metaData.species_en = 'Tadpole fish'; 
metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCie', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(14); % in K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 03 20]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 20]; 

%% set data
% zero-variate data
data.am = 17*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'Deni1985';  
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.3;   units.Lb = 'cm';   label.Lb = 'total length at birth';          bibkey.Lb = 'MunkNiel2005';
  comment.Lb = 'length when yolk is absorbed';
data.Lp = 15;   units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'guess';
data.Li = 30;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'MunkNiel2005';
  comment.Wwb = 'based on egg diameter of 0.8 mm: 4/3*pi*0.04^3';
data.Wwi = 390; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00163 * Li^3.643, see F4';

data.Ri = 1e6/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% tL data
data.tL = [ ... % age (years) ~ Length (cm) 
1.794	8.480
2.731	12.785
2.792	11.549
2.851	13.697
3.808	17.417
3.832	12.406
3.851	13.383
4.829	16.387
5.806	21.343
5.828	18.155
6.807	19.337
6.808	18.425
6.846	20.248
7.823	25.530
7.846	21.365
7.846	20.389
7.849	16.550
8.822	27.623
8.825	22.417
8.844	24.369
8.844	23.523
8.889	16.366
9.800	29.391
9.804	23.404
9.824	24.510
9.846	21.387
10.761	28.490
10.822	26.473
11.802	26.484
11.804	23.425];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Deni1985';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
 21 110
 23 140
 29 280
 27 260
 23 180
 28 250];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Deni1985';

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

%% Facts
F1 = 'Preferred temperature ?';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'demersal';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'Length-Weight relationship: W in g = 0.00163 * (L in cm)^3.643';
metaData.bibkey.F4 = 'Deni1985'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '4RF7G'; % Cat of Life
metaData.links.id_ITIS = '164777'; % ITIS
metaData.links.id_EoL = '46564430'; % Ency of Life
metaData.links.id_Wiki = 'Raniceps_raninus'; % Wikipedia
metaData.links.id_ADW = 'Raniceps_raninus'; % ADW
metaData.links.id_Taxo = '44353'; % Taxonomicon
metaData.links.id_WoRMS = '126442'; % WoRMS
metaData.links.id_fishbase = 'Raniceps-raninus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Raniceps_raninus}}';
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
bibkey = 'MunkNiel2005'; type = 'Book'; bib = [ ...  
'author = {Munk, P. and Nielsen, J. G.}, ' ...
'year = {2005}, ' ...
'title  = {Eggs and larvae of {N}orth {S}ea fishes}, ' ...
'publisher = {biofolia}, ' ...
'address = {Frederiksberg, DK}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Deni1985'; type = 'article'; bib = [ ...
'author = {Deniel, C.}, ' ... 
'year   = {1985}, ' ...
'title  = {Le trident \emph{Raniceps raninus} ({L}innaeus, 1758) ({T}eleosteen, {G}adidae) de la {C}ote {N}ord du {F}inistere: croissance en longueur et relation longueur-masse}, ' ...
'journal = {Cybium}, ' ...
'page = {89--92}, ' ...
'volume = {9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1349}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
