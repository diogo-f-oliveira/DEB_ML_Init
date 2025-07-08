function [data, auxData, metaData, txtData, weights] = mydata_Ctenochaetus_strigosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Acanthuridae';
metaData.species    = 'Ctenochaetus_strigosus'; 
metaData.species_en = 'Spotted surgeonfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPh'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 03];

%% set data
% zero-variate data

data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'WinsTayl2017';   
  temp.am = C2K(27.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 5.28; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'fishbase gives TL 14.5 cm; guess based on same relative length, compared to Zebrasoma_scopas: 16*13.2/40';
data.Li  = 16;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.75 mm of Chaetodon: pi/6*0.075^3'; 
data.Wwp = 3.5; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.02291*Lp^3.03, see F1';
data.Wwi = 102; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02291*Li^3.03, see F1';

data.Ri  = 3.4e4/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Zebrasoma_scopas as fraction of Wwi: 1.1e6*102/3329';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.930	8.349
0.964	9.287
0.964	6.662
0.964	5.912
2.013	10.418
2.013	8.637
2.047	8.075
2.081	7.418
2.927	10.423
2.995	12.018
3.063	8.830
3.943	9.210
3.943	10.523
4.010	12.117
6.008	11.941
6.008	10.722
6.076	9.035
7.023	8.010
7.023	9.135
7.057	10.260
7.057	11.478
7.091	12.510
8.073	10.266
8.987	12.240
9.021	11.396
9.969	11.683
11.018	11.970
11.052	9.908
12.068	9.351
12.068	11.976
13.016	10.575
15.047	13.400
15.995	9.749
19.076	9.204
19.990	11.928];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WinsTayl2017';
comment.tL = 'data from Johnston Atoll';

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
F1 = 'weight-length relationship: W in g = 0.02291*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '325C9'; % Cat of Life
metaData.links.id_ITIS = '172307'; % ITIS
metaData.links.id_EoL = '46577095'; % Ency of Life
metaData.links.id_Wiki = 'Ctenochaetus_strigosus'; % Wikipedia
metaData.links.id_ADW = 'Ctenochaetus_strigosus'; % ADW
metaData.links.id_Taxo = '172383'; % Taxonomicon
metaData.links.id_WoRMS = '219658'; % WoRMS
metaData.links.id_fishbase = 'Ctenochaetus-strigosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ctenochaetus_strigosus}}';
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
bibkey = 'WinsTayl2017'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00338-017-1559-8}, ' ...
'author = {M. S. Winston and B. M. Taylor and E. C. Franklin}, ' ... 
'year = {2017}, ' ...
'title = {Intraspecific variability in the life histories of endemic coral-reef fishes between photic and mesophotic depths across the {C}entral {P}acific Ocean}, ' ...
'journal = {Coral Reefs}, ' ...
'volume = {36}, ' ...
'pages = {663–674}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Ctenochaetus-strigosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
