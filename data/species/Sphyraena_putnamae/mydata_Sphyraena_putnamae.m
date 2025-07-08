function [data, auxData, metaData, txtData, weights] = mydata_Sphyraena_putnamae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sphyraeniformes'; 
metaData.family     = 'Sphyraenidae';
metaData.species    = 'Sphyraena_putnamae'; 
metaData.species_en = 'Yellowsripe barracuda'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI','MPW','MAm'};
metaData.ecoCode.habitat = {'0jMm', 'jiMr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 22];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 22];

%% set data
% zero-variate data

data.am = 14*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 24.9; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'Wiki'; 
  comment.Lp = 'based on Sphyraena_barracuda: 84.7*125/200';
data.Li  = 90;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.6e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 1.45 mm: pi/6*0.145^3'; 
data.Wwp = 93.6; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on W = 0.00759*Lp^2.93, see F1';
data.Wwi = 4038; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on W = 0.00759*Li^2.93, see F1';

data.Ri  = 9e5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length-weight
data.tL = [ ... % time since birth (yr), fork length (cm)
104.477	16.537
255.507	24.031
287.443	27.390
319.036	27.907
365+14.291	32.558
365+46.614	32.558
365+72.741	35.659
365+195.096	40.827
365+225.950	43.152
365+318.167	47.545
365+347.954	46.770
730+15.260	49.096
730+196.079	55.556
730+257.798	58.656
730+287.571	59.690
730+318.083	59.173
730+347.849	61.240
1095+165.854	66.667
1095+256.987	70.284
1095+286.405	70.284
1460+165.420	76.486
1460+257.653	78.553
1460+348.079	79.587];
data.tL(:,1) = 120 + data.tL(:,1);  % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GhosSata2021'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00759*(TL in cm)^2.93';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4Z2MZ'; % Cat of Life
metaData.links.id_ITIS = '646744'; % ITIS
metaData.links.id_EoL = '46577223'; % Ency of Life
metaData.links.id_Wiki = 'Sphyraena_putnamae'; % Wikipedia
metaData.links.id_ADW = 'Sphyraena_putnamae'; % ADW
metaData.links.id_Taxo = '187945'; % Taxonomicon
metaData.links.id_WoRMS = '212050'; % WoRMS
metaData.links.id_fishbase = 'Sphyraena-putnamae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sphyraena_putnamae}}';
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
bibkey = 'GhosSata2021'; type = 'Article'; bib = [ ... 
'doi = {10.21077/ijf.2021.68.3.110058-01}, ' ...
'author = {Shubhadeep Ghosh and M. Satishkumar and H. M. Manas and Prathibha Rohit and E. M. Abdussamad and A. Gopalakrishnan}, ' ... 
'year = {2021}, ' ...
'title = {Population parameters of sawtooth barracuda \emph{Sphyraena putnamae} ({J}ordan and {S}eale, 1905) exploited along western {B}ay of {B}engal}, ' ...
'journal = {Indian J. Fish.}, ' ...
'volume = {68(3)}, ' ...
'pages = {1-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Sphyraena-putnamae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

