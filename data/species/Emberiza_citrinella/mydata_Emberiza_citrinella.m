function [data, auxData, metaData, txtData, weights] = mydata_Emberiza_citrinella

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Emberizidae';
metaData.species    = 'Emberiza_citrinella'; 
metaData.species_en = 'Yellowhammer'; 

metaData.ecoCode.climate = {'Cfb', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 12];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 12];

%% set data
% zero-variate data

data.ab = 13;   units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '12 to 14 d';
data.tx = 12;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '11 to 13 d';
data.tp = 36;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '11 to 13 d';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 13.2*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'MaclPari2005';
  comment.Wwb = 'Harr1975: Egg length 2.16 cm, width 1.53 cm, weight: pi/6*2.16*1.53^2=2.6 g';
data.Wwi = 29.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'AnAge';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 to 5 eggs per clutch; 1 clutch per yr';
  
% uni-variate data

% time-weight
data.tW_B = [ % time since birth (d), wet weight  (g)
0.003	2.483
1.009	3.399
1.944	4.965
2.976	7.257
4.032	10.045
5.016	11.802
5.976	14.896
7.008	17.149
8.016	19.288
9.045	19.288];
units.tW_B   = {'d', 'g'};  label.tW_B = {'time since birth', 'wet weight', 'Britain'};  
temp.tW_B    = C2K(41.6);  units.temp.tW_B = 'K'; label.temp.tW_B = 'temperature';
bibkey.tW_B = 'MaclPari2005';
comment.tW_B = 'data for Britain';
%
data.tW_N = [ % time since birth (d), wet mass (g)
0.003	3.094
0.986	4.469
1.993	6.035
3.002	8.708
3.962	11.038
5.018	13.941
6.025	15.774
7.009	17.646
8.066	21.656
9.045	19.021];
units.tW_N   = {'d', 'g'};  label.tW_N = {'time since birth', 'wet weight', 'New Zealand'};  
temp.tW_N    = C2K(41.6);  units.temp.tW_N = 'K'; label.temp.tW_N = 'temperature';
bibkey.tW_N = 'MaclPari2005';
comment.tW_N = 'data for New Zealand';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_N = weights.tW_N * 2;
weights.tW_B = weights.tW_B * 2;

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
set1 = {'tW_B','tW_N'}; subtitle1 = {'Data for Britain, New Zealand'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'mod_1: v is reduced, food availability is taken variable in tW data';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '39FSZ'; % Cat of Life
metaData.links.id_ITIS = '179537'; % ITIS
metaData.links.id_EoL = '45515756'; % Ency of Life
metaData.links.id_Wiki = 'Emberiza_citrinella'; % Wikipedia
metaData.links.id_ADW = 'Emberiza_citrinella'; % ADW
metaData.links.id_Taxo = '58057'; % Taxonomicon
metaData.links.id_WoRMS = '1534790'; % WoRMS
metaData.links.id_avibase = '56FB47C05CB7275F'; % avibase
metaData.links.id_birdlife = 'yellowhammer-emberiza-citrinella'; % birdlife
metaData.links.id_AnAge = 'Emberiza_citrinella'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Emberiza_citrinella}}';
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
bibkey = 'MaclPari2005'; type = 'Article'; bib = [ ... 
'author = {C. J. Macleod and D. M. B. Parish and R. P. Duncan and S. Moreby and S. F. Hubbard}, ' ... 
'year = {2005}, ' ...
'title = {Importance of niche quality for Yellowhammer \emph{Emberiza citrinella} nestling survival, development and body condition in its native and exotic ranges: the role of diet}, ' ...
'journal = {Ibis}, ' ...
'volume = {147}, ' ...
'pages = {270--282}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Emberiza_citrinella}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1046716/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harr1975'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {C. Harrison}, ' ...
'year = {1975}, ' ...
'title  = {A field guide to the nests, eggs and nestlings of British and European birds}, ' ...
'publisher = {Collins, London}'];
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

