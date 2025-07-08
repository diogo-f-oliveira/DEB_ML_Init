function [data, auxData, metaData, txtData, weights] = mydata_Gorilla_gorilla

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Hominidae';
metaData.species    = 'Gorilla_gorilla'; 
metaData.species_en = 'Western gorilla'; 

metaData.ecoCode.climate = {'Am', 'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 10 21];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2018 08 31];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   


metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 31]; 

%% set data
% zero-variate data

data.tg = 256;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 834;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2829;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'female; 4015 d for male';
data.am = 55.4*365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 155;   units.Li  = 'cm';  label.Li  = 'ultimate hight length';    bibkey.Li  = 'Wiki';

data.Wwb = 2061;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 12595; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 80e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Wiki';
data.Wwim = 157e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'Wiki';

data.Ri  = 1/1397; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
  
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (mnth), wet weight (g)
 0  2239
 1  2920
 2  3799
 3  4394
 4  4946
 5  5840
 6  6548
 7  7484
 8  8249
 9  8916
10  9249
11  9780
12 10248 
18 13267];
data.tW(:,1) = 30.5 * data.tW(:,1);
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(35.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Keit1981';
comment.tW = 'data for male';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 1e-8;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_3: incudes tW data, but head-reared and growth less than expected after 1 yr';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3H3C9'; % Cat of Life
metaData.links.id_ITIS = '573080'; % ITIS
metaData.links.id_EoL = '326447'; % Ency of Life
metaData.links.id_Wiki = 'Gorilla_gorilla'; % Wikipedia
metaData.links.id_ADW = 'Gorilla_gorilla'; % ADW
metaData.links.id_Taxo = '1008456'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100791'; % MSW3
metaData.links.id_AnAge = 'Gorilla_gorilla'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gorilla_gorilla}}';
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
bibkey = 'Keit1981'; type = 'Article'; bib = [ ... 
'author = {Keiter, M. D.}, ' ... 
'doi = {10.1111/j.1748-1090.1981.tb01992.x}, ' ...
'year = {1981}, ' ...
'title = {Hand-rearing and development of a Lowland gorilla at {W}oodland {P}ark {Z}oo, {S}eattle}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {21}, ' ...
'pages = {229-235}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Gorilla_gorilla}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Gorilla_gorilla/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

