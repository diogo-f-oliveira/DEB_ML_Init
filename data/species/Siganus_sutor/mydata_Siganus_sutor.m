function [data, auxData, metaData, txtData, weights] = mydata_Siganus_sutor
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siganiformes'; 
metaData.family     = 'Siganidae';
metaData.species    = 'Siganus_sutor'; 
metaData.species_en = 'Shoemaker spinefoot'; 
metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 14]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 14]; 

%% set data
% zero-variate data

data.am = 3*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 29.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'MarzJaya2011'; 
  comment.Lp = 'Based on same relative length, compared to S. canaliculatus: 23/37.5 * Li';
data.Li  = 48;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fao';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = {'NelsLock1992','MarzJaya2011'};
  comment.Wwb = 'based on assumed egg diameter of 0.7 mm of S. canaliculatus: 4/3*pi*0.035^3, motivated by 1.4 mm larvae of S. randalli'; 
data.Wwp = 322; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'MarzJaya2011';
  comment.Wwp = 'based on 0.03280 * Lp^2.716, see F1';
data.Wwi = 1208; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fao';
  comment.Wwi = 'based on 0.03280 * Li^2.716, see F1';

% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (yr), total length (cm)
0.135  3.5
0.136  3.1
0.142  3.8
0.150  3.1
0.240  5.4
0.253  5.4
0.255  6.4
0.312  5.4
0.690 18.0
0.733 14.5
0.800 16.8
0.966 24.8
1.014 24.0
1.127 24.3
1.127 25.0
1.160 25.3
1.171 26.8
1.173 22.4
1.177 28.8
1.333 30.1
1.582 33.2
1.718 33.0
1.730 34.0
1.973 44.1
2.034 38.8
2.037 33.0
2.041 34.9
2.079 34.2
2.147 32.6];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(29);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fao';

% weight-fecundity
LWRN = [ ... % total length (cm), total weight (g), ovary weight (g), fecundity (#)
26.5 294 13.2 242042
27.9 350 13.41 272807
29.1 388 14.66 322159
29.5 388 15.50 384965
30.0 360 15.60 348086
30.7 416 18.24 414276
32.6 497 15.66 412950
33.8 695 16.72 407562
34.8 796 17.80 434397
35.4 612 21.20 484809
36.0 929 24.43 495489
36.2 1002 21.39 470803
37.2 903 18.33 476792
37.3 1113 26.14 589955
37.5 1025 35.28 607615];
data.WN = [LWRN(:,2) - LWRN(:,3), LWRN(:,4)];
units.WN  = {'g', '#'};  label.WN = {'wet weight', 'fecundity'};  
temp.WN   = C2K(29);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'MarzJaya2011';
comment.WN = 'data for S. canaliculatus';

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
F1 = 'weight-length relationship: W = 0.03280 * TL^2.716';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 1 - 50 m, usually 1 - 12 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6YMTV'; % Cat of Life
metaData.links.id_ITIS = '172349'; % ITIS
metaData.links.id_EoL = '46577147'; % Ency of Life
metaData.links.id_Wiki = 'Siganus_sutor'; % Wikipedia
metaData.links.id_ADW = 'Siganus_sutor'; % ADW
metaData.links.id_Taxo = '187610'; % Taxonomicon
metaData.links.id_WoRMS = '219688'; % WoRMS
metaData.links.id_fishbase = 'Siganus-sutor'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Siganus_sutor}}';
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
bibkey = 'MarzJaya2011'; type = 'Article'; bib = [ ... 
'author = {A.Al-Marzouqi and N. Jayabalan and A. Al-Nahdi and I. Al-Anbory}, ' ... 
'year = {2011}, ' ...
'title = {Reproductive Biology of the White-spotted Rabbitfish, \emph{Siganus canaliculatus} ({P}ark, 1797) in the {A}rabian {S}ea coast of {O}man}, ' ...
'journal = {Western Indian Ocean J. Mar. Sci.}, ' ...
'volume = {10}, ' ...
'pages = {73--82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NelsLock1992'; type = 'Techreport'; bib = [ ... 
'author = {S. G. Nelson and S. A. Lock and L. A. Collins}, ' ... 
'year = {1992}, ' ...
'title = {Growth of the rabbitfish \emph{Siganus randalli} {W}oodland in relation to the feasibility of its culture on {G}uam}, ' ...
'institution = {Univ Guam Marine Lab}, ' ...
'volume = {98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Summary/SpeciesSummary.php?ID=4615&genusname=Siganus&speciesname=sutor&AT=Siganus+sutor&lang=English}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fao'; type = 'Misc'; bib = [ ...
'howpublished = {\url{http://www.fao.org/3/a-303859e/3038590k.htm}}, ' ...
'author = {M. I. Jehangeer}, ' ...
'institute = {Albion Fisheries Research Centre, Albion, Petite Riviere, Mauritius}, ' ...
'journal = {Proceedings of the workshop on the assessment of the Fishery Resources in the Sothwest Indian Ocean}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];