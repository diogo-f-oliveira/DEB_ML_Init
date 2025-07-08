function [data, auxData, metaData, txtData, weights] = mydata_Cyclura_pinguis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Iguanidae';
metaData.species    = 'Cyclura_pinguis'; 
metaData.species_en = 'Anegada ground iguana'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTd', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 08 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 05]; 


%% set data
% zero-variate data

data.ab = 90;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'LemmStew2005';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '79 till 93 d';
data.ap = 3*365;     units.ap = 'd';    label.ap = 'age at puberty for female'; bibkey.ap = 'guess';
  temp.ap = C2K(30);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 30*365;     units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 50; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'LemmStew2005';
data.Wwi = 5.25e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'arkive';
data.Wwim = 7.75e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'arkive';

data.Ri  = 14/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(30);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time, length, weight
data.tW = [ ... % time since birth (d), weight (g)
15.431	54.708
42.126	52.648
73.899	48.613
73.943	62.304
99.328	48.514
100.631	58.289
101.971	79.799
131.220	81.642
131.258	93.378
131.332	116.849
163.106	112.814
188.436	81.420
188.448	85.331
188.479	95.111
191.177	144.001
192.368	118.568
218.988	93.037
219.044	110.640
219.124	136.068
219.143	141.936
248.293	112.483
248.405	147.690
249.701	155.509
249.751	171.157
275.043	128.027
278.982	167.131
279.038	184.735
307.041	194.406
307.066	202.230
308.213	163.106
338.653	139.516
338.703	155.163
338.833	196.239
338.995	247.094
339.800	100.391
369.441	225.460
369.497	243.063
369.597	274.359
370.632	200.027
394.839	215.581
398.703	231.214
400.180	295.756
400.199	301.624
430.496	233.046
430.701	297.593
458.430	221.202
458.499	242.718
458.747	320.956
518.275	248.353
518.375	279.649
518.549	334.416
546.353	281.496
547.861	355.818
550.273	314.733
551.482	295.168
606.204	310.603
606.329	349.723
606.428	381.018
637.043	412.195
637.173	453.270
638.065	333.952
666.224	392.522
666.267	406.214
666.292	414.038
666.429	457.069
725.021	490.093
725.052	499.873
726.274	484.220
728.587	411.840
783.527	495.734
784.810	499.641
784.897	527.024
875.083	499.290
875.127	512.982
876.324	489.505
901.952	551.997
1023.398 758.861];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(30);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LemmStew2005';
comment.tW = 'temperature between 16 and 31 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'ab is ignored, since, Like all pythons, this species is probably partially ovoviviparous: eggs start to develop, while still in the mother';
D2 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '32YTG'; % Cat of Life
metaData.links.id_ITIS = '202145'; % ITIS
metaData.links.id_EoL = '795185'; % Ency of Life
metaData.links.id_Wiki = 'Cyclura_pinguis'; % Wikipedia
metaData.links.id_ADW = 'Cyclura_pinguis'; % ADW
metaData.links.id_Taxo = '341615'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Cyclura&species=pinguis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyclura_pinguis}}';
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
bibkey = 'LemmStew2005'; type = 'Article'; bib = [ ... 
'author = {J. M. Lemm and S. W. Steward and T. F. Schmidt}, ' ... 
'year = {2005}, ' ...
'title = {Reproduction of the Critically Endangered {A}negada {I}sland iguana \emph{Cyclura pinguis} at {S}an {D}iego {Z}oo}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {39}, ' ...
'pages = {141-152}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/anegada-ground-iguana/cyclura-pinguis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
