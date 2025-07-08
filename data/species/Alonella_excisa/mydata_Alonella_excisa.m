function [data, auxData, metaData, txtData, weights] = mydata_Alonella_excisa
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Chydoridae';
metaData.species    = 'Alonella_excisa'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN','TP'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-R'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 11]; 

%% set data
% zero-variate data

data.ab = 1.8;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'SharShar1998';   
  temp.ab = C2K(21);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 3.17;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'SharShar1998';   
  temp.tp = C2K(21);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 73.4;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'SharShar1998';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0234; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'SharShar1998';
data.Lp  = 0.0307; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SharShar1998';
data.Li  = 0.0543;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SharShar1998';

data.Wwi  = 1.48e-5;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on length 0.054 cm, height 0.035 cm, width 0.0100 cm ; pi/4*0.054*0.035*0.01'; 
  
% uni-variate data
% time-length
data.tLR = [ ... % time since birth (h), length (mum), cumulative eggs (#)
    36.0 234  0
    76.2 307  0
   136.2 368  2
   198.2 403  4
   258.2 427  6
   318.5 446  8
   380.5 461 10
   442.5 472 12
   502.5 483 14
   566.5 492 16
   630.5 499 18
   692.5 506 20
   754.5 511 22
   816.5 516 24
   880.5 521 26
   944.5 524 28
  1008.5 527 30
  1072.5 530 32
  1138.5 533 34
  1202.5 535 36
  1270.5 537 38
  1338.5 539 40
  1402.5 540 42
  1470.5 541 44
  1540.5 542 45.6
  1610.0 543 46
  1682.5 543 46
  1762.5 543 46];
data.tLR(:,1) = data.tLR(:,1)/24; % convert h to d
data.tLR(:,2) = data.tLR(:,2)/1e4; % convert mum to cm
units.tLR   = {'d', 'cm', '#'};  label.tLR = {'time since birth', 'length', 'cumulative egg production'};  
temp.tLR    = C2K(21);  units.temp.tLR = 'K'; label.temp.tLR = 'temperature';
bibkey.tLR = 'SharShar1998'; treat.tLR = {1, {'cm','cum eggs'}};
comment.tLR = 'age and length for each instar (1:28)';

%% set weights for all real data
weights = setweights(data, []);
weights.tLR = 10 * weights.tLR; weights.tLR(end-4:end,2)=0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = 'C4QS'; % Cat of Life
metaData.links.id_ITIS = '84039'; % ITIS
metaData.links.id_EoL = '338521'; % Ency of Life
metaData.links.id_Wiki = 'Alonella'; % Wikipedia
metaData.links.id_ADW = 'Alonella_excisa'; % ADW
metaData.links.id_Taxo = '156218'; % Taxonomicon
metaData.links.id_WoRMS = '1302980'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SharShar1998'; type = 'Article'; bib = [ ... 
'author = {Sumit A. Sharma and B. K. Sharma}, ' ... 
'year = {1998}, ' ...
'title = {Observations on the longevity, instar durations, fecundity and growth in \emph{Alonella excisa} ({F}ischer) ({C}ladocera: {C}hydoridae)}, ' ...
'journal = {Indian Journal of Animal Sciences}, ' ...
'volume = {68}, ' ...
'pages = {101-104}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
