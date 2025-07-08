function [data, auxData, metaData, txtData, weights] = mydata_Myiozetetes_similis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Tyrannidae';
metaData.species    = 'Myiozetetes_similis'; 
metaData.species_en = 'Social flycatcher'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTi'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab', 'ap', 'aR', 'am', 'Ww0', 'Wwb', 'Wwi', 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 07];

%% set data
% zero-variate data

data.ab = 15.5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 21;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 63;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';   
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 11.1*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for Tyrannus_tyrannus in AnAge';

data.Ww0 = 3.07;  units.Ww0 = 'g';   label.Ww0 = 'initial weight';       bibkey.Ww0 = 'avibase';
data.Wwb = 2.3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'Rick2008';
  comment.Wwb = 'base on tW data';
data.Wwi = 27.1;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'avibase';
data.Wwim = 28; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 eggs per clutch, 1 clutch per year';
 
% uni-variate data
% time-weight
data.tW1 = [ ... % time since birth (d), ln wet weight (ln g)
1	3.421
2	4.777
5	8.548
6	9.699];  
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'sibling 1'};  
temp.tW1    = C2K(41.6);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Rick2008';
%
data.tW2 = [ ... % time since birth (d), ln wet weight (ln g)
1	3.260
2	4.181
5	6.484
6	6.648];  
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'sibling 2'};  
temp.tW2    = C2K(41.6);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Rick2008';
%
data.tW3 = [ ... % time (d), ln wet weight (ln g)
1	2.710
2	3.791
5	5.429
6	5.776]; 
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight', 'sibling 3'};  
temp.tW3   = C2K(41.6);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'Rick2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tW3 = weights.tW3 * 2;
weights.tW2 = weights.tW2 * 2;
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

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Group plots
set1 = {'tW1','tW2','tW3'}; subtitle1 = {'Data for siblings 1,2,3'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '4533Q'; % Cat of Life
metaData.links.id_ITIS = '561364'; % ITIS
metaData.links.id_EoL = '45510914'; % Ency of Life
metaData.links.id_Wiki = 'Myiozetetes_similis'; % Wikipedia
metaData.links.id_ADW = 'Myiozetetes_similis'; % ADW
metaData.links.id_Taxo = '56156'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '468B520CCD1A02F7'; % avibase
metaData.links.id_birdlife = 'social-flycatcher-myiozetetes-similis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myiozetetes_similis}}';
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
bibkey = 'Rick2008'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1474-919X.1976.tb03065.x}, ' ...
'author = {Ricklefs, R. E.}, ' ... 
'year = {2008}, ' ...
'title = {GROWTH RATES OF BIRDS IN THE HUMID NEW WORLD TROPICS}, ' ...
'journal = {Ibis}, ' ...
'volume = {118(2)}, ' ...
'pages = {179–207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=468B520CCD1A02F7&sec=lifehistory}}';
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

