function [data, auxData, metaData, txtData, weights] = mydata_Lepus_californicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Lagomorpha'; 
metaData.family     = 'Leporidae';
metaData.species    = 'Lepus_nigricollis'; 
metaData.species_en = 'Indian hare'; 

metaData.ecoCode.climate = {'Cfa', 'Dfb'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTg', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'tWw'}; 

metaData.COMPLETE = 2.5; 

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2022 08 07];              

%% set data
% zero-variate data

data.tg = 44;    units.tg = 'd';     label.tg = 'gestation time';              bibkey.tg = 'ADW';   
  temp.tg = C2K(39.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '41-47 d';
data.tx = 41;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(39.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Based on Leups californicus';
data.tp = 243;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'ADW';
  temp.tp = C2K(39.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7*365;    units.am = 'd'; label.am = 'life span';                 bibkey.am = 'ADW';   
  temp.am = C2K(39.2); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Wwb = 120;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MohaSahu2019';
data.Wwi = 7e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';

data.Ri  = 2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(38.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-8 pups per litter, 1.84 on average; 1 litter per yr';
   
% uni-variate data
% time - weight
data.tWw = [ ... % time since birth (d), wet weight (g)
    0 120
    6 170
   14 280
   21 400
   28 540
   35 700
   42 850];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(39.2);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'MohaSahu2019';

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
metaData.links.id_CoL = '6Q229'; % Cat of Life
metaData.links.id_ITIS = '625349'; % ITIS
metaData.links.id_EoL = '985686'; % Ency of Life
metaData.links.id_Wiki = 'Lepus_nigricollis'; % Wikipedia
metaData.links.id_ADW = 'Lepus_nigricollis'; % ADW
metaData.links.id_Taxo = '61518'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13500188'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepus_nigricollis}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Lepus_nigricollis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MohaSahu2019'; type = 'Book'; bib = [ ... 
'author = {Rajesh Kumar Mohapatra and Sarat Kumar Sahu and Jayant Kumar Das and Shashi Paul}, ' ... 
'year = {2019}, ' ...
'title = {Hand rearing of wild mammals in captvity}, ' ...
'publisher = {Nandankanan Biological Park, Odisha, Forest and Environment Department, Government of Odisha}, ' ...
'pages = {1-80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

