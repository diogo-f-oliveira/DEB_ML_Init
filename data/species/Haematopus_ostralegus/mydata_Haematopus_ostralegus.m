function [data, auxData, metaData, txtData, weights] = mydata_Haematopus_ostralegus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Haematopodidae';
metaData.species    = 'Haematopus_ostralegus'; 
metaData.species_en = 'Eurasian oystercatcher'; 

metaData.ecoCode.climate = {'Cfb', 'Dfa', 'Dfb', 'Dwa', 'Dwb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0xTs', 'xiFm', 'xiFe'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCim'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 10 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 28];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 28];

%% set data
% zero-variate data

data.ab = 25.5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'EoL';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '24 till 27 d';
data.tx = 35;      units.tx = 'd';     label.tx = 'time since birth at fledging'; bibkey.tx = 'KersBren1995';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 105;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1095;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.am = 'Data for H. bachmani';
data.am = 43.3*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 32;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KersBren1995';
data.Wwi = 480;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'AnAge';
  
data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 to 4 eggs per clutch; 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.140	32.974
5.002	74.871
9.614	131.762
14.358	198.393
19.865	259.017
24.856	306.158
29.963	319.572];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'fledge at 27-30 d'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'KersBren1995';
comment.tW = 'fledge at 27-30 d';
%
data.tW1 = [ ... % time since birth (d), wet weight (g)
0.394	29.973
4.997	60.632
9.987	104.775
14.855	162.411
19.977	215.546
25.094	258.939
29.828	297.090
35.194	323.241];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'fledge at 31-37 d'};  
temp.tW1    = C2K(40.9);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'KersBren1995';
comment.tW1 = 'fledge at 31-37 d';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
0.011	29.978
5.632	53.877
9.726	88.291
14.842	127.187
19.958	164.583
24.817	198.236
29.931	231.136
35.298	258.786
39.889	254.220
44.989	248.897];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'fledge at 38-53 d'};  
temp.tW2    = C2K(40.9);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'KersBren1995';
comment.tW2 = 'fledge at 38-53 d';

%% set weights for all real data
weights = setweights(data, []);
weights.tW2 = weights.tW2 * 2;
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

%% Group plots
set1 = {'tW','tW1','tW2'}; subtitle1 = {'Data for fledge at 28, 34, 44 d'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: v is reduced, food availavility taken variable in tW data';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3J8XQ'; % Cat of Life
metaData.links.id_ITIS = '176469'; % ITIS
metaData.links.id_EoL = '45509143'; % Ency of Life
metaData.links.id_Wiki = 'Haematopus_ostralegus'; % Wikipedia
metaData.links.id_ADW = 'Haematopus_ostralegus'; % ADW
metaData.links.id_Taxo = '53505'; % Taxonomicon
metaData.links.id_WoRMS = '147436'; % WoRMS
metaData.links.id_avibase = 'ED66316522B99A30'; % avibase
metaData.links.id_birdlife = 'eurasian-oystercatcher-haematopus-ostralegus'; % birdlife
metaData.links.id_AnAge = 'Haematopus_ostralegus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Haematopus_ostralegus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Haematopus_ostralegus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KersBren1995'; type = 'Article'; bib = [ ...  
'title = {Growth, fledging success and post-fledging survival of juvenile Oystercatchers \emph{Haematopus ostralegus}}, ' ...
'journal = {Ibis}, ' ...
'volume = {137}, ' ...
'year = {1995}, ' ...
'author = {M. Kersten and A. Brenninkmeijer}, ' ...
'pages = {396-404}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049333/details}}';
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

