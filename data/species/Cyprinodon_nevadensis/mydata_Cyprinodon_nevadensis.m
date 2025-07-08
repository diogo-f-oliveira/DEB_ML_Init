  function [data, auxData, metaData, txtData, weights] = mydata_Cyprinodon_nevadensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Cyprinodontidae';
metaData.species    = 'Cyprinodon_nevadensis'; 
metaData.species_en = 'Amargosa pupfish'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biB'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine','Bas Kooijman'};                             
metaData.date_subm = [2020 07 26];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromsoe, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 07 28]; 


%% set data
% zero-variate data
data.ab = 10;         units.ab = 'd';  label.ab = 'age at birth';          bibkey.ab = 'LemaNevi2006';
  temp.ab = C2K(31); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'taken from C. nevadensis amargosae';
data.tp = 2.5*30.5;        units.tp = 'd';  label.tp = 'age at puberty';        bibkey.tp = 'fsw';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'temp is guessed, value from fsw for the related Cyprinodon nevadensis pectoralis';
data.am = 1*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'fsw';
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li = 6.44;     units.Li = 'cm';     label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';
  comment.Li = 'based on TL 7.8 cm and F2';

data.Wwb = 5.2e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';   
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 8; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
   comment.Wwi = 'based on 0.01072*7.8^3.22, see F1';
   
data.Ri = 800/365;       units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'guess';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  
% % uni-variate data
data.tL_f1 = [... % time since fertilization (d), standard length (mm)
15	4
36	8
57	12
78	14
99	17
119	20
140	22
];
data.tL_f1(:,2) = data.tL_f1(:,2)/ 10; % mm to cm
units.tL_f1  = {'d', 'cm'};  label.tL_f1 = {'time since fertilization', 'standard length', 'high food'};  
temp.tL_f1   = C2K(31.5);  units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'LemaNevi2006';
comment.tL_f1 = 'C. nevadensis amargosae; high food level, fig. 1. Temp is 31 deg C from 0 till 10 dpf, then 32 from 10 dfp onwards';
% 
data.tL_f2 = [... % time since fertilization (d), standard length (mm)
15	4
36	7
57	10
78	12
99	14
120	16
140	19
];
data.tL_f2(:,2) = data.tL_f2(:,2)/ 10; % mm to cm
units.tL_f2  = {'d', 'cm'};  label.tL_f2 = {'time since fertilization', 'standard length', 'medium food'};  
temp.tL_f2   = C2K(31.5);  units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'LemaNevi2006';
comment.tL_f2 = 'C. nevadensis amargosae; medium food level, fig. 1. Temp is 31 deg C from 0 till 10 dpf, then 32 from 10 dfp onwards';
%  
data.tL_f3 = [... % time since fertilization (d), standard length (mm)
15	4
36	5
57	8
78	9
99	10
120	11
141	13
];
data.tL_f3(:,2) = data.tL_f3(:,2)/ 10; % mm to cm
units.tL_f3  = {'d', 'cm'};  label.tL_f3 = {'time since fertilization', 'standard length', 'low food'};  
temp.tL_f3   = C2K(31.5);  units.temp.tL_f3 = 'K'; label.temp.tL_f3 = 'temperature';
bibkey.tL_f3 = 'LemaNevi2006';
comment.tL_f3 = 'C. nevadensis amargosae; low food level, fig. 1. Temp is 31 deg C from 0 till 10 dpf, then 32 from 10 dfp onwards';

%% grouped plots
set1 = {'tL_f1', 'tL_f2', 'tL_f3'}; subtitle1 = {'Food level high, medium, low'};
metaData.grp.sets = {set1}; metaData.grp.subtitle = {subtitle1};

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
                  
%% Discussion points
D1 = 'Among the various C. nevadensis subspecies there are minor differences in generation times, with pupfish in habitats with widely fluctuating environmental conditions exhibiting shorter generation times';
    metaData.bibkey.D1 = 'MoylYoshi1995';
D2 = 'The data are compiled for different subspecies, while subscpecies can vary considerably in traits';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'weight length relationship: Ww in g = 0.01072 * (TL in cm)^3.22';
  metaData.bibkey.F1 = 'fishbase';
F2 = 'TL = 1.212 * SL ';
    metaData.bibkey.F2 = 'fishbase';
F3 = 'Pupfishes feed primarily on blue-green cyanobacteria. They feed seasonally on small invertebrates, mostly chironomid larvae, ostracods, and copepods';
metaData.bibkey.F3 = 'MoylYoshi1995';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '33HNC'; % Cat of Life
metaData.links.id_ITIS = '165638'; % ITIS
metaData.links.id_EoL = '1157173'; % Ency of Life
metaData.links.id_Wiki = 'Cyprinodon_nevadensis'; % Wikipedia
metaData.links.id_ADW = 'Cyprinodon_nevadensis'; % ADW
metaData.links.id_Taxo = '44508'; % Taxonomicon
metaData.links.id_WoRMS = '1019442'; % WoRMS
metaData.links.id_fishbase = 'Cyprinodon-nevadensis'; % fishbase


%% References
bibkey = 'fsw'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fws.gov/nevada/protected_species/fish/species/ws_pupfish.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cyprinodon-nevadensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cyprinodon}}';
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
bibkey = 'LemaNevi2006'; type = 'Article'; bib = [ ...  
'author = {Sean C. Lema and Gabrielle A. Nevitt}, ' ...
'year = {2006}, ' ...
'title = {Testing an ecophysiological mechanism of morphological plasticity in pupfish and its relevance to conservation efforts for endangered {D}evils {H}ole pupfish}, ' ... 
'journal = {The Journal of Experimental Biology}, ' ...
'volume = {209}, '...
'pages = {3499--3509}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoylYoshi1995'; type = 'Techreport'; bib = [ ...  
'author = {PETER B. MOYLE and RONALD M. YOSHIYAMA and JACK E. WILLIAMS and ERIC D. WIKRAMANAYAKE}, ' ...
'year = {1995}, ' ...
'url = {https://dfgsecure.dfg.ca.gov/wildlife/nongame/publications/docs/fish_ssc.pdf}, ' ...
'title = {FISH SPECIES OF SPECIAL CONCERN IN CALIFORNIA, second edition}, ' ... 
'institution = {Department of Wildlife & Fisheries Biology, University of California, Davis}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 

