  function [data, auxData, metaData, txtData, weights] = mydata_Nemipterus_mesoprion
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Nemipteridae';
metaData.species    = 'Nemipterus_mesoprion'; 
metaData.species_en = 'Mauvelip threadfin bream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 04];

%% set data

% zero-variate data

data.am = 8*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.3); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Nemipterus_japonicus';

data.Lp = 10.3;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase'; 
  comment.Lp = 'based on Nemipterus_japonicus';
data.Li = 16;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'DwipHari1986';
  comment.Li = 'fishbase gives 14 cm';

data.Wwb = 5.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of  1 mm: pi/6*0.1^3';
data.Wwi = 47.2;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^2.96, see F1';
    
data.Ri  = 1.1e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Nemipterus_japonicus: 139200*47.2/596';

% univariate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
217.161	7.614
249.943	9.820
315.628	11.365
349.316	12.104
480.729	14.195
365+216.801	16.147
365+251.351	16.420];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DwipHari1986';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwi = 3 * weights.Wwi;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight (in g) = 0.01288*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '467ZR'; % Cat of Life
metaData.links.id_ITIS = '550985'; % ITIS
metaData.links.id_EoL = '46581030'; % Ency of Life
metaData.links.id_Wiki = 'Nemipterus'; % Wikipedia
metaData.links.id_ADW = 'Nemipterus_mesoprion'; % ADW
metaData.links.id_Taxo = '180976'; % Taxonomicon46581352
metaData.links.id_WoRMS = '278127'; % WoRMS
metaData.links.id_fishbase = 'Nemipterus-mesoprion'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nemipterus}}';  
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
bibkey = 'DwipHari1986'; type = 'techreport'; bib = [ ... 
'author = {Dwiponggo, A. and Hariati, T. and Banon, S. and Palomares, M L D and Pauly, Daniel}, ' ... 
'year = {1986}, ' ...
'title = {Growth, mortality and recruitment of commercially important fishes and penaed shrimps in {I}ndonesian waters}, ' ...
'institution = {Research Institute for Marine Fisheries, Jacarta, Indonesia}, ' ...
'series = {ICLARM Technical Reports}, ' ...
'volume = {15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Nemipterus-mesoprion.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
