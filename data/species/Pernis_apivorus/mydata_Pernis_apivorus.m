function [data, auxData, metaData, txtData, weights] = mydata_Pernis_apivorus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Pernis_apivorus'; 
metaData.species_en = 'European honey buzzard'; 

metaData.ecoCode.climate = {'Cfb','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tncf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi','biHn','biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 32.5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'OrtaKirw2020';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '30-35 d';
data.tx = 42;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'OrtaKirw2020';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '40-44 d';
data.tp = 126;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '40-44 d';
data.tR = 3*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 29*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 37.7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BijlMane1997';
data.Wwi = 758; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
data.Wwim = 758; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'guess';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
 0.000	 37.640
 1.692	 35.244
 3.949	 69.274
 5.719	134.859
 7.892	196.808
 9.826	236.903
10.627	295.187
12.964	338.930
13.605	391.141
14.812	428.795
15.780	438.523
17.862	608.514
19.151	634.029
19.875	664.391
21.005	668.052
23.099	717.861
23.737	799.208
24.871	766.450
25.839	771.323
26.801	835.679
28.018	781.072
29.228	793.233
30.838	836.963
31.807	834.552
32.694	851.563
33.662	858.864
34.873	857.671
35.840	873.469
36.814	822.500
38.745	890.515
39.715	877.178
40.764	888.122
41.976	878.431
42.700	899.081
43.588	901.524];
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BijlMane1997';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4F6YZ'; % Cat of Life
metaData.links.id_ITIS = '175454'; % ITIS
metaData.links.id_EoL = '45515790'; % Ency of Life
metaData.links.id_Wiki = 'Pernis_apivorus'; % Wikipedia
metaData.links.id_ADW = 'Pernis_apivorus'; % ADW
metaData.links.id_Taxo = '52404'; % Taxonomicon
metaData.links.id_WoRMS = '558573'; % WoRMS
metaData.links.id_avibase = 'ED5A7E8F6EDBB78E'; % avibase
metaData.links.id_birdlife = 'european-honey-buzzard-pernis-apivorus'; % birdlife
metaData.links.id_AnAge = 'Pernis_apivorus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pernis_apivorus}}';
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
bibkey = 'BijlMane1997'; type = 'article'; bib = [ ... 
'author = {Rob G. Bijlsma and Willem van Manen and Henk Jan Ottens}, ' ... 
'year = {1997}, ' ...
'title = {Groei van hongerende Wespendieven \emph{Pernis apivorus}}, ' ...
'journal = {De Takkeling}, ' ...
'volume = {5(3)}, ' ...
'pages = {20–30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OrtaKirw2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.euhbuz1.01}, ' ...
'author = {Orta, J. and G. M. Kirwan and E. F. J. Garcia}, ' ...
'year = {2020}, ' ...
'title = {European Honey-buzzard (\emph{Pernis apivorus}), version 1.0. In Birds of the World (J. del Hoyo, A. Elliott, J. Sargatal, D. A. Christie, and E. de Juana, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Pernis_apivorus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

