function [data, auxData, metaData, txtData, weights] = mydata_Ototylomys_phyllotis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Ototylomys_phyllotis'; 
metaData.species_en = 'Big-eared climbing rat'; 

metaData.ecoCode.climate = {'Aw','Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 13];              

%% set data
% zero-variate data

data.tg = 52.8;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Helm1975';   
  temp.tg = C2K(36.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 30;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Helm1975';   
  temp.tx = C2K(36.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on Proechimys_semispinosus';
data.tp = 38;  units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'Helm1975';
  temp.tp = C2K(36.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Proechimys_semispinosus';
data.am = 5.4*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guss';   
  temp.am = C2K(36.2); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Tylomys_nudicaudus';

data.Wwb = 10;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Helm1975';
data.Wwi = 65;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Helm1975';
  comment.Wwi = 'Wiki: 218–790 g';

data.Ri  = 2.4/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Helm1975';   
  temp.Ri = C2K(36.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.4 pups per litter; 1 litters per yr';

 % uni-variate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
0.095	10.251
8.535	15.218
15.590	25.522
23.011	30.895
31.471	32.164
40.916	39.190
48.351	42.098
56.131	43.979
86.181	60.749
118.004	63.554
149.152	65.945];
units.tWw = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(36.3);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Helm1975';

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

%% Links
metaData.links.id_CoL = '4B84N'; % Cat of Life
metaData.links.id_ITIS = '633250'; % ITIS
metaData.links.id_EoL = '1180028'; % Ency of Life
metaData.links.id_Wiki = 'Ototylomys_phyllotis'; % Wikipedia
metaData.links.id_ADW = 'Ototylomys_phyllotis'; % ADW
metaData.links.id_Taxo = '88619'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000986'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ototylomys_phyllotis}}';
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
bibkey = 'Helm1975'; type = 'Article'; bib = [ ... 
'author = {John D. Helm}, ' ... 
'year = {1975}, ' ...
'title = {Reproductive Biology of {O}totylomys ({C}ricetidae)}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {56(3)}, ' ...
'pages = {575-590}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\urlhttps://genomics.senescence.info/species/entry.php?species=Ototylomys_phyllotis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

