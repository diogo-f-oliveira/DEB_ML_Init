function [data, auxData, metaData, txtData, weights] = mydata_Troglodytes_musculus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Troglodytidae';
metaData.species    = 'Troglodytes_musculus'; 
metaData.species_en = 'Tropical wren'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 10];

%% set data
% zero-variate data

data.ab = 14;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Have1952';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Troglodytes aedon';
data.tx = 13;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Have1952';   
  temp.tx = C2K(41.6);   units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 39;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);   units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 320;         units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.6);   units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'based on Troglodytes aedon';
data.am = 9*365;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'Have1952';   
  temp.am = C2K(41.6);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Troglodytes aedon';

data.Wwb = 1.95;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Have1952';
data.Wwi = 14;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Have1952';

data.Ri  = 3.5*2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Have1952';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-4  eggs ber clutch, 2 clutches per yr assumed';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), 4 x wet weight (g)
 0  2.50  1.95  1.90  2.05
 1  2.93  2.73  2.20  2.70  
 2  4.25  3.92  3.38  3.72
 3  5.28  5.24  4.55  5.52
 4  7.16  6.95  6.20  6.82
 5  9.32  8.72  7.80  8.32
 6 10.52  9.95  9.07  9.95
 7 11.65 10.95 10.45 11.32
 8 12.72 11.92 11.52 12.82
 9 13.07 12.70 12.60 13.12
10 14.00 13.27 13.22 12.85
11 13.78 13.65 13.15 12.50
12 13.50 13.10 13.00 12.93
13 13.33 13.33 13.08 NaN];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
treat.tW = {1, {'ind 1','ind 2','ind 3','ind 4'}};
bibkey.tW  = 'Have1952';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: v is reduced';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '5LMNP'; % Cat of Life
metaData.links.id_ITIS = '917909'; % ITIS
metaData.links.id_EoL = '52233171'; % Ency of Life
metaData.links.id_Wiki = 'Troglodytes'; % Wikipedia
metaData.links.id_ADW = 'Troglodytes_aedon_musculus'; % ADW
metaData.links.id_Taxo = '56757'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'A41F13600803FC13'; % avibase
metaData.links.id_birdlife = 'house-wren-troglodytes-aedon'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Troglodytes}}';
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
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=A41F13600803FC13&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Have1952'; type = 'Article'; bib = [ ...  
'author = {Fr. Haverschmidt}, ' ...
'title = {Nesting Behavior of the Southern House Wren in {S}urinam}, ' ...
'journal = {The Condor}, ' ...
'year = {1952}, ' ...
'volume = {54(5)}, ' ...
'pages = {292-295}'];
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

