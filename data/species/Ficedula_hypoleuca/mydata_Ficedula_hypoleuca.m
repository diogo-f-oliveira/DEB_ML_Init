function [data, auxData, metaData, txtData, weights] = mydata_Ficedula_hypoleuca

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Muscicapidae';
metaData.species    = 'Ficedula_hypoleuca'; 
metaData.species_en = 'European pied flycatcher'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd', '0iThh', '0iTg'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 08 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 12 02];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 10];

%% set data
% zero-variate data

data.ab = 13;   units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'EoL';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 14;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'EoL';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 42;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'EoL';
  comment.Wwb = 'based on egg weight: 1.7 g';
data.Wwi = 15.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Siik1996';
  comment.Wwi = 'EoL: 13 g';

data.Ri  = 5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 to 10 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ % time since birth (d), wet weight  (g)
0       1.5 % added from EoL
3.983	6.098
3.984	6.274
4.021	6.588
4.057	6.156
6.961	10.471
6.963	11.353
6.964	11.824
6.998	10.961
6.999	11.118
7.017	10.823
9.898	12.530
9.901	14.059
9.919	13.687
9.920	14.628
9.972	12.745
12.908	14.648
12.909	14.942
12.945	14.785
12.961	13.588];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'Siik1996'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Siik1996';
%
data.tW1 = [ % time since birth (d), wet weight (g)
 0	1.804
 1	2.547
 2	3.794
 3	5.201
 4	7.058
 5	9.313
 6	10.932
 7	12.949
 8	13.161
 9	14.143
10	14.461
11	14.779
12	14.355
13	13.745
14	13.930
15	13.665];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'Haar1954'};  
temp.tW1    = C2K(41.6);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Haar1954';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = weights.tW1 * 2;
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
D1 = 'Body temperature is guessed';
D2 = 'mod_1: tW1 data added and food rather than temp variable';
D3 = 'mod_2: v is reduced';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data of Siik1996, Haar1954'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '6HWGP'; % Cat of Life
metaData.links.id_ITIS = '560081'; % ITIS
metaData.links.id_EoL = '45513708'; % Ency of Life
metaData.links.id_Wiki = 'Ficedula_hypoleuca'; % Wikipedia
metaData.links.id_ADW = 'Ficedula_hypoleuca'; % ADW
metaData.links.id_Taxo = '168169'; % Taxonomicon
metaData.links.id_WoRMS = '1534793'; % WoRMS
metaData.links.id_avibase = '6E352E1870A195B7'; % avibase
metaData.links.id_birdlife = 'european-pied-flycatcher-ficedula-hypoleuca'; % birdlife
metaData.links.id_AnAge = 'Ficedula_hypoleuca'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ficedula_hypoleuca}}';
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
bibkey = 'Siik1996'; type = 'Article'; bib = [ ... 
'author = {P. Siikam\"{a}ki}, ' ... 
'doi = {j.1474-919X.1996.tb08067.x}, ' ...
'year = {1996}, ' ...
'title = {Nestling growth and mortality of Pied Flycatchers \emph{Ficedula hypoleuca} in relation to weather and breeding effort}, ' ...
'journal = {Ibis}, ' ...
'volume = {138}, ' ...
'pages = {471-478}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haar1954'; type = 'Article'; bib = [ ... 
'author = {Haartman, L. Von}, ' ... 
'year = {1954}, ' ...
'title = {Der {T}rauerfiegenschnapper. {I}{I}{I}. {D}ie {N}ahrungsbiologie}, ' ...
'journal = {Acta zool. fenn.}, ' ...
'volume = {83}, ' ...
'pages = {1-92}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ficedula_hypoleuca}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1051410/details}}';
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

