function [data, auxData, metaData, txtData, weights] = mydata_Rana_arvalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Rana_arvalis'; 
metaData.species_en = 'Moor frog'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 28]; 


%% set data
% zero-variate data

data.ab = 35;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for R. temporaria';
data.tj = 1.5*30.5;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'amphibiaweb';
  temp.tj = C2K(18);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'value for R. temporaria';
data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'amphibiaweb';
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '2-5th yr';
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.5;     units.Lj  = 'cm';  label.Lj  = 'body length at metam'; bibkey.Lj  = 'kikkersite'; 
  comment.Lj = 'values for R. temporaria';
data.Li  = 7;    units.Li  = 'cm';  label.Li  = 'ultimate body length';   bibkey.Li  = 'Wiki';

data.Wwb = 0.05;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on Bufo bufo';
data.Wwi = 31;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Gunt1990';
  comment.Wwi = 'weight at 7 cm for Rana lessonae';

data.Ri  = 1000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '500-3000 eggs, usually in 1 clutch';
  
% univariate data
% length-change in length
data.LdL = [... % body length (cm), change in length (cm/76 d)
2.985	1.355
3.003	1.044
3.026	1.202
3.037	0.571
3.139	0.640
3.179	1.294
3.197	1.127
3.219	0.911
3.234	1.155
3.279	0.961
3.299	1.180
3.306	0.670
3.306	0.681
3.322	1.313
3.349	1.017
3.381	0.953
3.399	0.981
3.401	1.255
3.409	1.114
3.410	1.183
3.424	1.316
3.427	1.036
3.454	0.709
3.468	0.884
3.510	0.947
3.559	0.626
3.571	1.116
3.574	0.787
3.622	1.055
3.638	0.704
3.653	0.801
3.661	0.654
3.684	0.560
3.704	0.981
3.712	0.618
3.719	1.069
3.732	0.898
3.736	0.812
3.772	0.715
3.778	0.936
3.784	1.144
3.801	0.986
3.805	0.726
3.840	0.421
3.847	0.784
3.862	1.064
3.889	0.994
3.898	0.934
3.910	0.598
3.920	0.787
3.936	1.061
3.949	1.061
3.952	0.690
3.953	0.870
3.954	0.942
3.963	0.936
3.963	1.022
3.990	0.914
3.995	0.983
3.995	0.997
4.046	0.859
4.134	0.906
4.147	0.742
4.187	0.449
4.228	0.457
4.230	0.726
4.242	0.460
4.248	0.657
4.280	0.701
4.288	0.410
4.340	0.598
4.360	0.839
4.369	0.942
4.399	0.357
4.406	0.803
4.434	0.892
4.451	0.604
4.723	0.457
4.759	0.396
4.842	0.327
5.017	0.249
5.152	0.321];
data.LdL(:,2) = data.LdL(:,2)/ 76; % convert cm/76 d to cm/d
units.LdL  = {'cm', 'cm/d'}; label.LdL = {'body length', 'change in body length'};  
temp.LdL   = C2K(18); units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'LomaLard2009';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Males slightly smaller than females';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4RDHG'; % Cat of Life
metaData.links.id_ITIS = '665263'; % ITIS
metaData.links.id_EoL = '333000'; % Ency of Life
metaData.links.id_Wiki = 'Rana_arvalis'; % Wikipedia
metaData.links.id_ADW = 'Rana_arvalis'; % ADW
metaData.links.id_Taxo = '47623'; % Taxonomicon
metaData.links.id_WoRMS = '1507478'; % WoRMS
metaData.links.id_amphweb = 'Rana+arvalis'; % AmphibiaWeb
metaData.links.id_AnAge = 'Rana_arvalis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rana_arvalis}}';
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
bibkey = 'Gunt1990'; type = 'Book'; bib = [ ...  
'author = {G\"{u}nther, R.}, ' ...
'year = {1990}, ' ...
'title  = {Die Wasserfr\"{o}sche Europas}, ' ...
'publisher = {A. Ziemsen Verlag}, ' ...
'sereis = {Die Neue Brehm Buecherei}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LomaLard2009'; type = 'Article'; bib = [ ... 
'author = {J. Loman and B. Lardner}, ' ... 
'year = {2009}, ' ...
'title = {Density dependent growth in adult brown frogs \emph{Rana arvalis} and \emph{Rana temporaria} - A field experiment}, ' ...
'journal = {Acta Oecologica}, ' ...
'volume = {35}, ' ...
'pages = {824-830}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+arvalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rana_arvalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Rana_temporaria/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'kikkersite'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.kikkersite.nl/bruine.php}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

