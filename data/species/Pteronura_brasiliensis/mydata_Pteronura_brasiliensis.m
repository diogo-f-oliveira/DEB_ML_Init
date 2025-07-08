function [data, auxData, metaData, txtData, weights] = mydata_Pteronura_brasiliensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Mustelidae';
metaData.species    = 'Pteronura_brasiliensis'; 
metaData.species_en = 'Giant otter'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm', '0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 08 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 05]; 

%% set data
% zero-variate data

data.tg = 68;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 122;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 730;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17.3*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 350;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LondMuno2006';
data.Wwi = 24e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'Wiki';
  comment.Wwi = '22 till 26 kg';
data.Wwim = 29e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'Wiki';
  comment.Wwim = '26 till 32 kg';

data.Ri  = 1.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
% univariate data
% t-W data
data.tW = [ ... % time since birth (d), weight (g)
7.584	501.651
8.433	501.508
9.439	559.817
10.441	524.559
11.599	547.755
15.693	617.236
16.475	886.110
21.491	861.867
28.606	1246.626
35.646	1666.486
39.517	1981.619
42.530	2062.979
45.552	2366.561
49.570	2482.839
52.516	2833.217
53.668	2669.279
69.603	3613.946];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(38.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LondMuno2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4PZZS'; % Cat of Life
metaData.links.id_ITIS = '621920'; % ITIS
metaData.links.id_EoL = '328029'; % Ency of Life
metaData.links.id_Wiki = 'Pteronura_brasiliensis'; % Wikipedia
metaData.links.id_ADW = 'Pteronura_brasiliensis'; % ADW
metaData.links.id_Taxo = '66829'; % Taxonomicon
metaData.links.id_WoRMS = '1494883'; % WoRMS
metaData.links.id_MSW3 = '14001131'; % MSW3
metaData.links.id_AnAge = 'Pteronura_brasiliensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pteronura_brasiliensis}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pteronura_brasiliensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Pteronura_brasiliensis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LondMuno2006'; type = 'Article'; bib = [ ... 
'author = {G. Corredor Londono and N. Tigreros Munoz}, ' ... 
'year = {2006}, ' ...
'title = {Reproduction, behaviour and biology of the Giant river otter \emph{Pteronura brasiliensis} at {Cali Zoo}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {40}, ' ...
'pages = {360-371}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
