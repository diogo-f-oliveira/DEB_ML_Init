function [data, auxData, metaData, txtData, weights] = mydata_Lepus_californicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Lagomorpha'; 
metaData.family     = 'Leporidae';
metaData.species    = 'Lepus_californicus'; 
metaData.species_en = 'Black-tailed jackrabbit'; 

metaData.ecoCode.climate = {'BSk', 'BW'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'tWw'}; 

metaData.COMPLETE = 2.5; 

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2020 10 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2020 10 09];              

%% set data
% zero-variate data

data.tg = 44;    units.tg = 'd';     label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(39.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 41;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 243;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11.8*365;    units.am = 'd'; label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(39.2); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Wwb = 84.34;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 1300;   units.Wwx = 'g';  label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 4175;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3.7/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(38.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-6, usually 3-4, pups per litter; 3.7 litters per yr';
   
% uni-variate data
% time - weight
data.tWw = [ ... % time since birth (wk), wet weight (g)
    0  110
    1  210
    2  330
    3  450
    4  580
    5  700
    6  825
    7  940
    8 1050
    9 1160
   10 1260
   11 1370
   12 1460
   13 1550
   14 1640
   15 1720
   16 1800
   17 1870
   18 1900
   19 1975
   20 2015
   21 2060 
   22 2100 
   23 2150
   24 2160
   25 2190
   26 2210
   27 2230
   28 2250
   29 2260
   30 2275
   31 2290
   32 2300
   33 2300];
data.tWw(:,1) = data.tWw(:,1) * 7; % convert wk to d
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(39.2);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'HaskReyn1947';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 10 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '6PPZ6'; % Cat of Life
metaData.links.id_ITIS = '180115'; % ITIS
metaData.links.id_EoL = '327965'; % Ency of Life
metaData.links.id_Wiki = 'Lepus_californicus'; % Wikipedia
metaData.links.id_ADW = 'Lepus_californicus'; % ADW
metaData.links.id_Taxo = '61501'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13500129'; % MSW3
metaData.links.id_AnAge = 'Lepus_californicus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepus_californicus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lepus_californicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Lepus_californicus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaskReyn1947'; type = 'Article'; bib = [ ... 
'author = {Horace S. Haskell and Hudson G. Reynolds}, ' ... 
'year = {1947}, ' ...
'title = {Growth, Developmental Food Requirements, and Breeding Activity of the {C}alifornia Jack Rabbit}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {28(2)}, ' ...
'pages = {129-136}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

