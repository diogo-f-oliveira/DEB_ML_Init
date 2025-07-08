function [data, auxData, metaData, txtData, weights] = mydata_Hyaena_hyaena
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Hyaenidae';
metaData.species    = 'Hyaena_hyaena'; 
metaData.species_en = 'Striped hyena'; 

metaData.ecoCode.climate = {'BWh', 'BSh','Cwa','Dfb'};
metaData.ecoCode.ecozone = {'TPa','THp'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiSvm', 'xiHs', 'xiF'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2022 08 07];              

%% set data
% zero-variate data

data.tg = 90;     units.tg = 'd';     label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 279;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 800;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 25*365;    units.am = 'd'; label.am = 'life span';                  bibkey.am = 'AnAge';   
  temp.am = C2K(37); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 700;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'AnAge';
data.Wwi = 55e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'Wiki';

data.Ri  = 2.5/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.5 pups per litter; 0.4 litters per yr';

% univariate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
     7   593
    28  1720
    56  3576
    84  7195
   112 14280];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MohaSahu2019';
%
data.tW1 = [ ... % time (d), weight (g)
     0   815
    28  2300
    56  4370
    77  5750
   122  9960
   152 12370
   183 14250];
data.tW1(:,1) = data.tW1(:,1) + 13; % guess conversion from time to time since birth
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'weight'};  
temp.tW1    = C2K(37);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'MohaSahu2019';


%% set weights for all real data
weights = setweights(data, []);
weights.tp = 5 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data for 2 pups'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6MGT8'; % Cat of Life
metaData.links.id_ITIS = '621908'; % ITIS
metaData.links.id_EoL = '311570'; % Ency of Life
metaData.links.id_Wiki = 'Hyaena_hyaena'; % Wikipedia
metaData.links.id_ADW = 'Hyaena_hyaena'; % ADW
metaData.links.id_Taxo = '67068'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000687'; % MSW3
metaData.links.id_AnAge = 'Hyaena_hyaena'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyaena_hyaena}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hyaena_hyaena}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MohaSahu2019'; type = 'Book'; bib = [ ... 
'author = {Rajesh Kumar Mohapatra and Sarat Kumar Sahu and Jayant Kumar Das and Shashi Paul}, ' ... 
'year = {2019}, ' ...
'title = {Hand rearing of wild mammals in captvity}, ' ...
'publisher = {Nandankanan Biological Park, Odisha, Forest and Environment Department, Government of Odisha}, ' ...
'pages = {1-80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

