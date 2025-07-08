function [data, auxData, metaData, txtData, weights] = mydata_Gerbillus_pyramidum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Gerbillus_pyramidum'; 
metaData.species_en = 'Greater Egyptian gerbil'; 

metaData.ecoCode.climate = {'BWh', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 01 01];              

%% set data
% zero-variate data

data.tg = 21;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 21;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 74;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Data for Dipodomys ordii';
data.am = 8.2*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 2.5;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 11;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 37;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3.3*5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.3 pups per litter; 5 litters per yr';

  % univariate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
1.380	3.434
19.693	11.963
20.383	13.559
24.090	15.721
25.008	18.457
26.175	17.087
27.557	19.936
27.795	18.453
30.571	21.301
31.971	19.474
32.876	25.632
34.283	22.094
37.511	28.021
38.914	25.738
44.478	28.125
50.499	32.337
50.970	30.739
60.476	34.490
61.160	37.911
66.035	38.246
66.979	34.367
74.383	41.314
74.628	37.892
98.999	41.165
99.900	48.350
113.167	40.575
114.294	49.242
125.905	49.340
127.796	40.782
133.796	50.469
135.458	40.999
145.404	51.251];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(36.1);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'Happ1968';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 5 * weights.Wwb;

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
metaData.links.id_CoL = '7V4X4'; % Cat of Life
metaData.links.id_ITIS = '632963'; % ITIS
metaData.links.id_EoL = '1179741'; % Ency of Life
metaData.links.id_Wiki = 'Gerbillus_pyramidum'; % Wikipedia
metaData.links.id_ADW = 'Gerbillus_pyramidum'; % ADW
metaData.links.id_Taxo = '62814'; % Taxonomicon
metaData.links.id_MSW3 = '13001130'; % Mammal Spec World
metaData.links.id_AnAge = 'Gerbillus_pyramidum'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gerbillus_pyramidum}}';
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
bibkey = 'Happ1968'; type = 'Article'; bib = [ ... 
'doi = {10.1515/mamm.1968.32.1.44M}, ' ...
'author = {Happold, D. C. D.}, ' ... 
'year = {1968}, ' ...
'title = {OBSERVATIONS ON \emph{Gerbillus pyramidum} ({G}ERBILLINAE, {R}ODENTIA) AT {K}HARTOUM, {S}UDAN}, ' ...
'journal = {Mammalia}, ' ...
'volume = {32(1)}, ' ...
'pages = {198–208}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Gerbillus_pyramidum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

