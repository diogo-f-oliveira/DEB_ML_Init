function [data, auxData, metaData, txtData, weights] = mydata_Mystacina_tuberculata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Mystacinidae';
metaData.species    = 'Mystacina_tuberculata'; 
metaData.species_en = 'New Zealand lesser short-tailed bat'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 08 03];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 03]; 


%% set data
% zero-variate data

data.tg = 95;  units.tg = 'd';     label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 28;  units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(36.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Wiki 18-25 d';
data.tp = 258;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(36.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7.6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 4.3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Sear2016';
data.Wwi = 14.8;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Sear2016';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
2.000	4.391
3.082	4.264
4.115	4.517
5.443	4.686
6.475	4.728
8.197	4.728
10.164	5.488
10.852	5.404
12.279	6.037
12.967	6.417
14.098	7.008
14.984	7.219
16.213	8.274
18.180	8.654
18.820	9.203
20.344	9.499
22.311	10.596
23.000	11.230
24.180	11.441
25.115	12.201
26.836	12.243
28.066	13.045
30.180	13.805
31.803	14.649
33.082	14.607
34.213	14.860
35.148	14.480
35.885	13.847
36.918	14.818
38.148	14.480
40.066	14.691
41.246	14.607
42.131	14.185
43.852	14.438];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(36.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Sear2016';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'tW data suggests varying food availability, which has been implemented, but changes in body temperature can also contribute';
metaData.discussion = struct('D1', D1);


%% Links
metaData.links.id_CoL = '45FKM'; % Cat of Life
metaData.links.id_ITIS = '632189'; % ITIS
metaData.links.id_EoL = '1038741'; % Ency of Life
metaData.links.id_Wiki = 'Mystacina_tuberculata'; % Wikipedia
metaData.links.id_ADW = 'Mystacina_tuberculata'; % ADW
metaData.links.id_Taxo = '65183'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13801090'; % MSW3
metaData.links.id_AnAge = 'Mystacina_tuberculata'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mystacina_tuberculata}}';
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
bibkey = 'Sear2016'; type = 'Article'; bib = [ ... 
'author = {D. Searchfield}, ' ... 
'year = {2016}, ' ...
'title = {First breeding and hand rearing of the {New Zealand} lesser short-tailed bat \emph{Mystacina tuberculata} at {Auckland Zoo}}, ' ...
'journal = {Int. Zoo Yb}, ' ...
'volume = {50}, ' ...
'pages = {165--173}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Carollia_perspicillata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

