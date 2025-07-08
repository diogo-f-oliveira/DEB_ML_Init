function [data, auxData, metaData, txtData, weights] = mydata_Ochotona_princeps

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Lagomorpha'; 
metaData.family     = 'Ochotonidae';
metaData.species    = 'Ochotona_princeps'; 
metaData.species_en = 'American pika'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1    = {'Bas Kooijman'};    
metaData.date_mod_1      = [2020 04 05];              
metaData.email_mod_1     = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2020 04 05];              

%% set data
% zero-variate data

data.tg = 30;    units.tg = 'd';     label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(40.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 28;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(40.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 347;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(40.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7*365;    units.am = 'd'; label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(40.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 9;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 81.1;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 100;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'AnAge';

data.Ri  = 3*2.2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 pups per litter; 2.2 litters per yr';
   
% univariate data
% t-W data
data.tW = [ ... % time since birth (d), weight (g)
0.281	11.737
7.094	22.288
15.354	37.240
22.881	62.177
27.952	73.320
30.850	79.772
31.426	84.762
37.077	96.784
38.960	100.890
41.426	103.525
44.760	108.801
51.719	117.883
53.171	116.411
59.549	127.257
60.421	125.199
66.074	135.166
68.396	134.572
73.038	138.082
80.285	150.100
85.079	144.800
87.107	149.786
97.554	152.692];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(40.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GoliWhit1985';


%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: t-Ww data added';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7W4C4'; % Cat of Life
metaData.links.id_ITIS = '180109'; % ITIS
metaData.links.id_EoL = '133021'; % Ency of Life
metaData.links.id_Wiki = 'Ochotona_princeps'; % Wikipedia
metaData.links.id_ADW = 'Ochotona_princeps'; % ADW
metaData.links.id_Taxo = '61458'; % Taxonomicon
metaData.links.id_MSW3 = '13500064'; % Mammal Spec World
metaData.links.id_AnAge = 'Ochotona_princeps'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ochotona_princeps}}';
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
bibkey = 'GoliWhit1985'; type = 'Article'; bib = [ ... 
'author = {S.C. Golian and M. R. Whitworth}, ' ...
'year = {2016}, ' ...
'title  = {Growth of pikas (\emph{Ochotona princeps} in {C}olorado))}, ' ...
'journal = {J. Mamm,}, ' ...
'pages = {367-371}, ' ...
'volume = {66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ochotona_princeps}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

