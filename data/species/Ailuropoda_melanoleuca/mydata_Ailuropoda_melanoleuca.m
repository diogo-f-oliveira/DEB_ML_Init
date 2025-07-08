function [data, auxData, metaData, txtData, weights] = mydata_Ailuropoda_melanoleuca

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Ursidae';
metaData.species    = 'Ailuropoda_melanoleuca'; 
metaData.species_en = 'Giant panda'; 

metaData.ecoCode.climate = {'Dwa', 'Dwb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 01 25]; 

%% set data
% zero-variate data

data.tg = 48;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from chinad';
data.tx = 182;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2192;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 36.8*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(37.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 151.5;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'CheWang2015';
data.Wwx = 22000; units.Wwx = 'g';  label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Ww1 = 40000; units.Ww1 = 'g';  label.Ww1 = 'wet weight at 1yr since brith';   bibkey.Ww1 = 'china';
data.Wwi = 117500; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 0.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.0);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% t-W data 
data.tW = [ ... % time since birth (d), wet weight (g)
  0  151.5
 10  280.7
 20  644.6
 30 1205.3
 40 1868.9
 50 2530.7
 60 3282.5
 70 3957.4
 80 4705.7
 90 5284.5
100 6145.9
110 6878.0
120 7581.7]; 
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'CheWang2015';

%% set weights for all real data
weights = setweights(data, []);
%weights.tp = 5 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '6673Q'; % Cat of Life
metaData.links.id_ITIS = '621845'; % ITIS
metaData.links.id_EoL = '328070'; % Ency of Life
metaData.links.id_Wiki = 'Ailuropoda_melanoleuca'; % Wikipedia
metaData.links.id_ADW = 'Ailuropoda_melanoleuca'; % ADW
metaData.links.id_Taxo = '66575'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000941'; % MSW3
metaData.links.id_AnAge = 'Ailuropoda_melanoleuca'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ailuropoda_melanoleuca}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ailuropoda_melanoleuca}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CheWang2015'; type = 'Article'; bib = [ ...  
'title = {Estimation of the growth curve and heritability of the growth rate for giant panda (\emph{Ailuropoda melanoleuca}) cubs}, ' ...
'journal = {Genetics and Molecular Research}, ' ...
'year = {2015}, ' ...
'author = {T. D. Che and C. D. Wang and L. Jin and M. Wei and K. Wu and Y. H. Zhang and H. M. Zhang and D. S. Li}, ' ...
'volume = {14}, ' ...
'number = {1}, ' ...
'pages = {2322--2330}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'china'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.chinahighlights.com/giant-panda/baby-panda.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'chinad'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.chinadaily.com.cn/regional/2012-09/21/content_15774766.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

