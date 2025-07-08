function [data, auxData, metaData, txtData, weights] = mydata_Enhydra_lutris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Mustelidae';
metaData.species    = 'Enhydra_lutris'; 
metaData.species_en = 'Sea otter'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 01 21]; 

%% set data
% zero-variate data

data.tg = 140;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 175;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 974;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'for females';
data.am = 27*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1868;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwx = 13425; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';      bibkey.Wwx = 'AnAge';
data.Wwi = 25850; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: till 27.2 kg';

data.Ri  = 1/548;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [..., % time since birth (yr), standard length
0.435	110.718
0.453	126.538
0.454	123.553
0.454	120.867
0.457	100.270
0.476	105.642
1.945	132.445
2.911	150.911
2.952	143.447
2.953	138.969
2.954	131.506
3.959	154.449
3.960	149.374
3.962	136.836
4.950	140.078
4.969	147.241
5.959	133.766
6.945	154.321
6.945	151.933
7.974	151.591
8.964	142.295
8.983	151.846
10.959	152.956
14.009	130.736];
units.tL = {'yr', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL  = C2K(37.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HutcAtki2015';
comment.tL = 'Standard length was measured from the tip of the nose to the tip of the tail along a flat surface with the sea otter on its back; Data concern E. l. kenyoni';

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

%% Links
metaData.links.id_CoL = '39TWB'; % Cat of Life
metaData.links.id_ITIS = '180547'; % ITIS
metaData.links.id_EoL = '46559130'; % Ency of Life
metaData.links.id_Wiki = 'Enhydra_lutris'; % Wikipedia
metaData.links.id_ADW = 'Enhydra_lutris'; % ADW
metaData.links.id_Taxo = '66804'; % Taxonomicon
metaData.links.id_WoRMS = '242598'; % WoRMS
metaData.links.id_MSW3 = '14001090'; % MSW3
metaData.links.id_AnAge = 'Enhydra_lutris'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Enhydra_lutris}}';
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
bibkey = 'HutcAtki2015'; type = 'Article'; bib = [ ... 
'author = {E. Hutchinson and S. Atkinson and K. B. Huntington}, ' ... 
'year = {2015}, ' ...
'title = {Growth and sexual maturation in male northern sea otters (\emph{Enhydra lutris kenyoni}) from {G}ustavus, {A}laska}, ' ...
'journal = {J. Mammal.}, ' ...
'volume = {96}, ' ...
'number = {5}, '...
'pages = {1045--1054}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Enhydra_lutris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Enhydra_lutris/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

