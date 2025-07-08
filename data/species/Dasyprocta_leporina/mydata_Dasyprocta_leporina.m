function [data, auxData, metaData, txtData, weights] = mydata_Dasyprocta_leporina
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Dasyproctidae';
metaData.species    = 'Dasyprocta_leporina'; 
metaData.species_en = 'Red-rumped agouti'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww','t-Wwe'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 11 19];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 19]; 

%% set data
% zero-variate data

data.tg = 112;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'Wiki';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '104-120 d';
data.tx = 20*7;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'Wiki';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 193;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(38.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '40-50 d';
data.am = 17.8*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 213; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'MohaMoha2019';
data.Wwi = 3265;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'Wiki';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-3 pups per litter; 2 litters per yr assumed';
   
% univariate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
0.000	212.670
30.396	1222.063
59.912	1670.361
89.868	1928.618
119.824	2263.799
149.780	2399.884
180.176	2522.400
209.692	2622.282
240.088	2663.349
269.604	2704.407
300.441	2745.480
330.396	2777.493
360.352	2795.931];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(38.3);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'MohaMoha2019';
%
data.tWwe = [ ... % age (d), wet weight (g)
24.888	0.297
29.659	0.594
34.254	0.891
39.909	2.079
44.504	2.673
44.858	4.752
49.276	9.802
49.629	5.941
74.547	55.248
98.935	129.208
99.642	143.168];
units.tWwe   = {'d', 'g'};  label.tWwe = {'time since copulation', 'embryo wet weight'};  
temp.tWwe    = C2K(38.3);  units.temp.tWwe = 'K'; label.temp.tWwe = 'temperature'; 
bibkey.tWwe = 'FortFerr2013';
comment.tWwe = 'Data for Dasyprocta prymnolopha';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 50 * weights.tWw;
weights.tWwe = 5 * weights.tWwe;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '349R3'; % Cat of Life
metaData.links.id_ITIS = '584731'; % ITIS
metaData.links.id_EoL = '326575'; % Ency of Life
metaData.links.id_Wiki = 'Dasyprocta_leporina'; % Wikipedia
metaData.links.id_ADW = 'Dasyprocta_leporina'; % ADW
metaData.links.id_Taxo = '89501'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400233'; % MSW3
metaData.links.id_AnAge = 'Dasyprocta_leporina'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dasyprocta_leporina}}';
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
bibkey = 'MohaMoha2019'; type = 'Article'; bib = [ ... 
'doi = {10.18488/journal.68.2019.62.121.134}, ' ...
'author = {Riyadh Mohammed and Asad Mohammed and Letetia Addison and Isaac Dialsingh and Kavita Kameela Sant and Gary Wayne Garcia}, ' ... 
'year = {2019}, ' ...
'title = {COMPARING  POST-PARTUM  GROWTH  BY  BODY  WEIGHT  BETWEEN  SEX  AND LITTER  SIZE  OF  AGOUTI  (\emph{Dasyprocta  Leporina})  OFFSPRING  FROM  BIRTH  TO  360 DAYS OLD}, ' ...
'journal = {Current Research in Agricultural Sciences}, ' ...
'volume = {6(2)}, ' ...
'pages = {121-134}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FortFerr2013'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.anireprosci.2013.06.021}, ' ...
'author = {Eunice Anita de Moura Fortes and Ma\''{i}ra Soares Ferraz and Dayseanny Oliveira Bezerra  and Ar\''{i}ton Mendes Conde J\''{u}nior and Rosa Maria Cabral and Francisco das Chagas Ara\''{u}jo Sousa and Hatawa Melo Almeida and Gerson Tavares Pessoa and Danilo Jos \''{e}Ayres de Menezes and S\''{e}rgio Paulo Lima Guerra and Ivan Barbosa Machado Sampaio and Ant\^{o}nio Chaves Assis Neto and Maria Acelina Martins de Carvalho}, ' ... 
'year = {2013}, ' ...
'title = {Prenatal development of the agouti (\emph{Dasyprocta prymnolopha} {W}agler, 1831): External features and growth curves}, ' ...
'journal = {Animal Reproduction Science}, ' ...
'volume = {140(3-4)}, ' ...
'pages = {195–205}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Dasyprocta_leporina}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

