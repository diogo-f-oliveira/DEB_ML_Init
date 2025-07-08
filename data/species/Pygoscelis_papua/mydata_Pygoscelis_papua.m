function [data, auxData, metaData, txtData, weights] = mydata_Pygoscelis_papua

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Sphenisciformes'; 
metaData.family     = 'Spheniscidae';
metaData.species    = 'Pygoscelis_papua'; 
metaData.species_en = 'Gentoo penguin'; 

metaData.ecoCode.climate = {'ME', 'MC'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCic', 'biCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author         = {'Bas Kooijman'};    
metaData.date_subm      = [2017 09 05];              
metaData.email          = {'bas.kooijman@vu.nl'};            
metaData.address        = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 35;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from P. adeliae';
data.tx = 75;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ADW';   
  temp.tx = C2K(38.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temps from P. adeliae';
data.tp = 225;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temps from P. adeliae';
data.tR = 730;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(38.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 13*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(38.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 127;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'VolkTriv1980';
data.Wwi = 5715;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'VolkTriv1980';

data.Ri  = 2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(38.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d) weight as fraction of max of 5715 g
3.686	0.022
9.710	0.088
15.733	0.216
21.667	0.371
27.690	0.453
33.534	0.557
39.647	0.632
45.581	0.842
52.683	0.919
59.336	0.992
63.292	1.000];
data.tW(:,2) = data.tW(:,2) * 5715; % convert fraction to g
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'VolkTriv1980';
  
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
D1 = 'Embryo energy conducyance is probably much less than the juvenile value';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '78R2P'; % Cat of Life
metaData.links.id_ITIS = '174447'; % ITIS
metaData.links.id_EoL = '45512076'; % Ency of Life
metaData.links.id_Wiki = 'Pygoscelis_papua'; % Wikipedia
metaData.links.id_ADW = 'Pygoscelis_papua'; % ADW
metaData.links.id_Taxo = '51415'; % Taxonomicon
metaData.links.id_WoRMS = '225777'; % WoRMS
metaData.links.id_avibase = 'F2B3BF2A1B6D05F6'; % avibase
metaData.links.id_birdlife = 'gentoo-penguin-pygoscelis-papua'; % birdlife
metaData.links.id_AnAge = 'Pygoscelis_papua'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pygoscelis_adeliae}}';
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
bibkey = 'VolkTriv1980'; type = 'Article'; bib = [ ... 
'author = {N. J. Volkman and W. Trivelpiece}, ' ... 
'year = {1980}, ' ...
'title = {Growth in pygoscelid penguin chicks}, ' ...
'journal = {J. Zool. Lond.}, ' ...
'volume = {191}, ' ...
'pages = {521--530}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Pygoscelis_papua/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pygoscelis_papua}}';
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

