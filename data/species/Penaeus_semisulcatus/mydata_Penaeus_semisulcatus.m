function [data, auxData, metaData, txtData, weights] = mydata_Penaeus_semisulcatus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Penaeidae';
metaData.species    = 'Penaeus_semisulcatus'; 
metaData.species_en = 'Green tiger prawn'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPE', 'MI', 'MAm'};
metaData.ecoCode.habitat = {'0bMb', 'bjMpe', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 21]; 

%% set data
% zero-variate data

data.am = 1.7*365;  units.am = 'd';     label.am = 'life span';                bibkey.am = 'RabaLin2017';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 3.22;   units.Lp  = 'cm'; label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'RabaLin2017';
  comment.Lp = 'sealifebase gives total length 17 cm at puberty';
data.Li  = 5.5;   units.Li  = 'cm'; label.Li  = 'ultimate abdominal length for female';   bibkey.Li  = 'RabaLin2017';
  comment.Li = 'sealifebase gives max total length 23 cm';

data.Wwb = 2.74e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on value for Palaemonetes varians';
data.Wwp = 26; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'sealifebase','RabaLin2017'};
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 130;     units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'sealifebase';

data.GSI  = 0.14; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(28); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Haliporoides sibogae';
  
% uni-variate data
% time-length data
data.tL = [ ... % time since birth (d), carapace length (cm)
152.388	2.268
182.419	2.227
182.622	3.566
211.672	3.059
212.463	2.270
243.388	2.125
243.519	2.987
273.459	2.344
273.528	2.801
305.464	3.310
334.544	3.000
363.980	5.035
364.568	2.918
364.677	3.634
394.886	4.766
395.639	3.728
425.784	4.435
455.832	4.508
485.985	5.267
515.929	4.655
546.880	4.677
546.943	5.092
577.970	5.612];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RabaLin2017';

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

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '95644'; % ITIS
metaData.links.id_EoL = '46502055'; % Ency of Life
metaData.links.id_Wiki = 'Penaeus_semisulcatus'; % Wikipedia
metaData.links.id_ADW = 'Penaeus_semisulcatus'; % ADW
metaData.links.id_Taxo = '514366'; % Taxonomicon
metaData.links.id_WoRMS = '107112'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Penaeus_semisulcatus}}';
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
bibkey = 'RabaLin2017'; type = 'Article'; bib = [ ...
'author = {Lotfi Rabaoui and Yu-Jia Lin and Rommel H. Maneja and Mohammad A. Qurban and Pulikkodan Abdurahiman and Panickan Premlal and Khaled Al-Abdulkader and Rub\''{e}n H. Roa-Ureta}, ' ...
'year = {2017}, ' ...
'title = {Nursery habitats and life history traits of the green tiger shrimp \emph{Penaeus semisulcatus} ({D}e {H}aan, 1844) in the {S}audi waters of the {A}rabian {G}ulf}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {195}, ' ...
'pages = {1-11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Penaeus-semisulcatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
