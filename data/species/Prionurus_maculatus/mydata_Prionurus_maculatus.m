function [data, auxData, metaData, txtData, weights] = mydata_Prionurus_maculatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Acanthuridae';
metaData.species    = 'Prionurus_maculatus'; 
metaData.species_en = 'Yellowspotted sawtail'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 10]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 10]; 

%% set data
% zero-variate data

data.am = 70*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ChoaAxe1996';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'all temperatures are guessed';
  
data.Lp  = 14.8; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on same relative length, compared to Zebrasoma_scopas';
data.Li  = 45;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Leis1989';
  comment.Wwb = 'based egg diameter of 0.75 mm for Chaetodon: 4/3*pi*0.038^3'; 
data.Wwp = 168; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'based on g = 6.2e-4 * (10*Lp)^2.504, see F1';
data.Wwi = 2729; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 6.2e-4 * (10*Li)^2.504, see F1';

data.Ri  = 9e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on Ri for Zebrasoma_scopas as fraction of Wwi';
  
% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (yr), wet weight (g)
1.335	22.271
2.280	20.565
2.316	24.315
5.597	32.378
6.254	34.081
7.553	35.897
7.718	36.351
8.344	34.873
10.107	34.984
11.549	34.982
21.710	42.238
21.853	40.419
24.587	41.551
24.591	42.006
62.102	44.899
65.014	47.849
70.451	46.931];
data.tL(:,1) = 365 * (.5 + data.tL(:,1));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChoaAxe1996';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10*weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: W in g = 6.2e-4 * (SL in mm)^2.504';
metaData.bibkey.F1 = 'ChoaAxe1996'; 
F2 = 'Marine; reef-associated; depth range 0 - 15 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4MGJC'; % Cat of Life
metaData.links.id_ITIS = '623258'; % ITIS
metaData.links.id_EoL = '46577134'; % Ency of Life
metaData.links.id_Wiki = 'Prionurus_maculatus'; % Wikipedia
metaData.links.id_ADW = 'Prionurus_maculatus'; % ADW
metaData.links.id_Taxo = '184744'; % Taxonomicon
metaData.links.id_WoRMS = '282347'; % WoRMS
metaData.links.id_fishbase = 'Prionurus-maculatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Prionurus_maculatus}}';
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
bibkey = 'ChoaAxe1996'; type = 'Article'; bib = [ ... 
'author = {J. H. Choat and L. M. Axe}, ' ... 
'year = {1996}, ' ...
'title = {Growth and longevity in acanthurid fishes; an analysis of otolith increments}, ' ...
'journal = {Mar Ecol Prog Ser}, ' ...
'volume = {134}, ' ...
'pages = {15--26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/12625}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Leis1989'; type = 'Article'; bib = [ ... 
'author = {Leis, J. M.}, ' ... 
'year = {1989}, ' ...
'title = {Larval biology of butterflyfishes ({P}isces, {C}haetodontidae): {W}hat do we really know?}, ' ...
'journal = {Envir. Biology of Fishes}, ' ...
'volume = {25}, ' ...
'pages = {87--100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
