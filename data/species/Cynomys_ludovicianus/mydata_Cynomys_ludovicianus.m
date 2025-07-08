function [data, auxData, metaData, txtData, weights] = mydata_Cynomys_ludovicianus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Cynomys_ludovicianus'; 
metaData.species_en = 'Black-tailed prairie dog'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 26]; 

%% set data
% zero-variate data

data.tg = 30;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 63;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 15.75;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwx = 141; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning for female';      bibkey.Wwx = 'ADW';
data.Wwxm = 147; units.Wwxm = 'g';   label.Wwxm = 'wet weight at weaning for male';      bibkey.Wwxm = 'ADW';
data.Wwi = 1050; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';  bibkey.Wwi = 'ADW';
data.Wwim = 1675; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'ADW';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(36.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 till 8 pups per litter; 1 litter per yr';
  
% uni-variate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
7.355	12.800
13.034	24.865
19.600	38.033
32.200	57.832
38.766	78.615
44.977	89.601
57.755	128.440
70.710	176.530
83.665	221.900
96.265	266.177];
units.tWw = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(36.5);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'AnthFore1951';

  
%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;
weights.Wwim = 5 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7SWLN'; % Cat of Life
metaData.links.id_ITIS = '180186'; % ITIS
metaData.links.id_EoL = '311548'; % Ency of Life
metaData.links.id_Wiki = 'Cynomys_ludovicianus'; % Wikipedia
metaData.links.id_ADW = 'Cynomys_ludovicianus'; % ADW
metaData.links.id_Taxo = '61869'; % Taxonomicon
metaData.links.id_MSW3 = '12400916'; % Mammal Spec World
metaData.links.id_AnAge = 'Cynomys_ludovicianus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynomys_ludovicianus}}';
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
bibkey = 'AnthFore1951'; type = 'Article'; bib = [ ...  
'doi = {10.1086/physzool.24.3.30152118}, ' ...
'author = {Anthony, A. and Foreman, D.}, ' ...
'year = {1951}, ' ...
'title  = {Observations on the Reproductive Cycle of the Black-Tailed Prairie Dog (\emph{Cynomys Ludovicianus})}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {24(3)}, ' ...
'pages = {242–248}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cynomys_ludovicianus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Cynomys_ludovicianus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

