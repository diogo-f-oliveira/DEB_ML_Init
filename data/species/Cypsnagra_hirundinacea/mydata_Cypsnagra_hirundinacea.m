function [data, auxData, metaData, txtData, weights] = mydata_Cypsnagra_hirundinacea
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Thraupidae';
metaData.species    = 'Cypsnagra_hirundinacea'; 
metaData.species_en = 'White-rumped tanager'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tnpf', 'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 12];

%% set data
% zero-variate data

data.ab = 16;   units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'TrueBurn2020';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 12.1;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'TrueBurn2020';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 36.3;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 4.8*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 3.0; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';     bibkey.Ww0 = 'TrueBurn2020';
data.Wwb = 2.7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'TrueBurn2020';
data.Wwi = 31.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'TrueBurn2020';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'TrueBurn2020';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 eggs per clutch; assumed 1 clutch per yr';

% uni-variate data
% time-weight
data.tW1 = [ ... % time since birth (d), wet weight  (g)
1.943	 7.442
1.971	 5.698
1.983	 8.256
1.983	 8.081
1.983	 7.616
2.009	 8.779
3.977	14.666
3.977	14.607
3.977	14.142
3.977	13.387
3.978	12.514
3.978	11.759
5.959	18.575
5.959	18.285
5.972	19.041
5.973	15.843
5.986	17.180
5.986	16.657
7.927	22.136
7.953	22.776
7.953	22.427
7.968	20.334
9.962	25.814
9.962	25.058];
n = size(data.tW1,1); for i=2:n; if data.tW1(i,1)<=data.tW1(i-1,1);data.tW1(i,1)=data.tW1(i-1,1)+1e-4;end;end
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'helpers present'};  
temp.tW1    = C2K(41.6);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Sant2008'; 
comment.tW1 = 'helpers present';
%
data.tW0 = [ ... % time since birth (d), wet weight  (g)
1.999	 2.675
2.010	 6.977
2.011	 6.163
2.011	 5.233
2.012	 3.489
2.025	 4.593
2.038	 4.012
3.966	 9.549
3.967	 7.049
3.967	 6.700
3.967	 6.468
3.967	 5.945
3.993	 8.561
5.948	12.354
5.975	11.366
7.942	17.601
7.942	17.311
7.957	15.102
9.952	18.895
9.964	20.116
9.966	17.732];    
n = size(data.tW0,1); for i=2:n; if data.tW0(i,1)<=data.tW0(i-1,1);data.tW0(i,1)=data.tW0(i-1,1)+1e-4;end;end
units.tW0   = {'d', 'g'};  label.tW0 = {'time since birth', 'wet weight', 'helpers absent'};  
temp.tW0    = C2K(41.6);  units.temp.tW0 = 'K'; label.temp.tW0 = 'temperature';
bibkey.tW0 = 'Sant2008'; 
comment.tW0 = 'helpers absent';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Ww0 = weights.Ww0 * 0;
weights.tW0 = weights.tW0 * 2;
weights.tW1 = weights.tW1 * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW0'}; subtitle1 = {'Data for presence and absence of helpers'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6C8HZ'; % Cat of Life
metaData.links.id_ITIS = '559674'; % ITIS
metaData.links.id_EoL = '921583'; % Ency of Life
metaData.links.id_Wiki = 'Cypsnagra_hirundinacea'; % Wikipedia
metaData.links.id_ADW = 'Cypsnagra_hirundinacea'; % ADW
metaData.links.id_Taxo = '86330'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '1CB32C4800B34D65'; % avibase
metaData.links.id_birdlife = 'common-diuca-finch-diuca-diuca'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cypsnagra_hirundinacea}}';
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
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=1CB32C4800B34D65&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TrueBurn2020'; type = 'misc'; bib = [ ... 
'doi = {10.2173/bow.whrtan1.01}, ' ...
'author = {True, A. and K. J. Burns}, ' ... 
'year = {2020}, ' ...
'title =  {White-rumped Tanager (\emph{Cypsnagra hirundinacea}), version 1.0. In Birds of the World (T. S. Schulenberg, Editor). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sant2008'; type = 'phdthesis'; bib = [ ... 
'author = {Santos, L. R. dos}, ' ... 
'year = {2008}, ' ...
'title =  {Biologia reprodutiva e comportamento cooperativo em ninhos de \emph{Cypsnagra hirundinacea}}, ' ...
'school = {Universidade de Brasília, Brasília}'];
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

