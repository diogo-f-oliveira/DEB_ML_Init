function [data, auxData, metaData, txtData, weights] = mydata_Microtus_montanus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Microtus_montanus'; 
metaData.species_en = 'Montane vole'; 

metaData.ecoCode.climate = {'BWk','BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 16];              

%% set data
% zero-variate data

data.tg = 21;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'ADW';   
  temp.tg = C2K(38.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '26-29 d';
data.tx = 14.5;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '13-16 d';
data.tp = 70;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(38.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '4-30 wk';
data.am = 18*30.5;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(38.1); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'more than 1-2 yr';
  
data.Wwb = 2.7;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'RaboWebs2002';
data.Wwi = 85;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'ADW';
  comment.Wwi = '37.5-85.0 g';

data.Ri  = 6*4/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(38.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-9 pups per litter; 4 litters per yr';
   
% univariate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
    0 2.76
    2 3.41
    4 5.04
    6 5.41
    8 6.37
   10 7.73
   12 8.76];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(38.1);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'RaboWebs2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

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

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '7VV87'; % Cat of Life
metaData.links.id_ITIS = '180310'; % ITIS
metaData.links.id_EoL = '310274'; % Ency of Life
metaData.links.id_Wiki = 'Microtus_montanus'; % Wikipedia
metaData.links.id_ADW = 'Microtus_montanus'; % ADW
metaData.links.id_Taxo = '62704'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000281'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microtus_montanus}}';
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
'howpublished = {\url{https://animaldiversity.org/accounts/Microtus_montanus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RaboWebs2002'; type = 'Article'; bib = [ ... 
'author = {David R. Rabon and W. M. David Webster and D. Kim Sawrey}, ' ... 
'year = {2002}, ' ...
'title = {EARLY POSTNATAL MASS IN MONTANE AND PRAIRIE VOLES (\emph{Microtus})}, ' ...
'journal = {Journal of the North Carolina Academy of Science}, ' ...
'volume = {118(1)}, ' ...
'pages = {57-60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
