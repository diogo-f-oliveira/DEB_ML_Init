function [data, auxData, metaData, txtData, weights] = mydata_Aethomys_chrysophilus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Aethomys_chrysophilus'; 
metaData.species_en = 'Red rock rat'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf','0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 17];              

%% set data
% zero-variate data

data.tg = 26;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Broo1972';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 25;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Broo1972';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 82;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'Broo1972';
  temp.tp = C2K(36); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 4.1;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Broo1972';
data.Wwi = 140;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 8*3.1/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Broo1972';   
  temp.Ri = C2K(36); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.1 pups per litter; 8 litters per yr assumed';
  
% univariate data
% time-weight
data.tWw = [ ... % time since birth (wk), weight (g)
    0  4.1
    1  7.9
    2 12.8
    3 19.6
    4 26.7
    5 34.0
    6 40.0
    7 44.0
    8 48.0
    9 52.0
   10 54.0
   11 57.0
   12 63.0
   13 62.0
   14 68.0
   15 69.0
   16 71.0
   20 79.0];
data.tWw(:,1) = 7 * data.tWw(:,1); % convert wk to d
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(36);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'Broo1972';

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

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '65CLM'; % Cat of Life
metaData.links.id_ITIS = '585114'; % ITIS
metaData.links.id_EoL = '1178641'; % Ency of Life
metaData.links.id_Wiki = 'Aethomys_chrysophilus'; % Wikipedia
metaData.links.id_ADW = 'Aethomys_chrysophilus'; % ADW
metaData.links.id_Taxo = '62906'; % Taxonomicon
metaData.links.id_MSW3 = '13001191'; % Mammal Spec World
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aethomys_chrysophilus}}';
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
bibkey = 'Broo1972'; type = 'Article'; bib = [ ... 
'author = {Brooks, P. M.}, ' ... 
'year = {1972}, ' ...
'title = {Post-nataldevelopment of the {A}frican bush rat, \emph{Aethomys chrysophilus}}, ' ...
'journal = {Zool. Africana}, ' ...
'volume = {7}, ' ...
'pages = {85-102}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

