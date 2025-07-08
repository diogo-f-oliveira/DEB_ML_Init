function [data, auxData, metaData, txtData, weights] = mydata_Leuconotopicus_borealis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Piciformes'; 
metaData.family     = 'Picidae';
metaData.species    = 'Leuconotopicus_borealis'; 
metaData.species_en = 'Red-cockaded woodpecker'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTi', '0iTh'};
metaData.ecoCode.embryo  = {'Tnwfm', 'Tntfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii','biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.8); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 05];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 11;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '10-15 d'; 
data.tx = 25.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '22-29 d';
data.tp = 76.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '22-29 d';
data.tR = 0.7*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(41.8);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 17.1*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(41.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 4.3;  units.Ww0 = 'g'; label.Ww0 = 'initial wet weight';  bibkey.Ww0 = 'avibase';
data.Wwb = 3.3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Ligo1970';
data.Wwi = 48;   units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'avibase';

data.Ri  = 3.26/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-5 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW3 = [ ... % scaled time since birth (d), scaled wet weight (g)
0.000	3.292
2.947	12.285
5.957	22.749
9.012	34.965
12.982	41.935];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight', '3 helpers'};  
temp.tW3    = C2K(41.8);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3  = 'Ligo1970'; 
%
data.tW1 = [ ... % scaled time since birth (d), scaled wet weight (g)
0.000	3.292
0.969	5.332
1.914	7.512
2.944	9.203
3.932	11.943
4.943	15.455
6.963	21.847
8.897	27.749
10.961	34.492
11.993	38.494
13.986	39.632];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', '1 helper'};  
temp.tW1    = C2K(41.8);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'Ligo1970'; 
%
data.tW0 = [ ... % scaled time since birth (d), scaled wet weight (g)
0.000	3.292
1.934	5.971
3.953	11.103
5.973	17.706
7.972	23.537
10.016	32.312
10.940	35.472
11.970	37.373
12.935	38.082];
units.tW0   = {'d', 'g'};  label.tW0 = {'time since birth', 'wet weight', '0 helper'};  
temp.tW0    = C2K(41.8);  units.temp.tW0 = 'K'; label.temp.tW0 = 'temperature';
bibkey.tW0  = 'Ligo1970'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Ww0 = 0 * weights.Ww0;
weights.tW0 = weights.tW0 * 2;
weights.tW1 = weights.tW1 * 2;
weights.tW3 = weights.tW3 * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW3','tW1','tW0'}; subtitle1 = {'Data for 3,1,0 helpers'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Food availability varies and depends on the nuber of helpers';
D2 = 'mod_1: v is reduced';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '7VPRQ'; % Cat of Life
metaData.links.id_ITIS = '1145281'; % ITIS
metaData.links.id_EoL = '1047044'; % Ency of Life
metaData.links.id_Wiki = 'Leuconotopicus_borealis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5472311'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '0BFCAE7944494A64'; % avibase
metaData.links.id_birdlife = 'red-cockaded-woodpecker-leuconotopicus-borealis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leuconotopicus_borealis}}';
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
bibkey = 'Ligo1970'; type = 'article'; bib = [ ... 
'author = {J. David Ligon}, ' ... 
'year = {1970}, ' ...
'title = {Behavior and Breeding Biology of the Red-Cockaded Woodpecker}, ' ...
'journal = {The Auk}, ' ...
'volume = {87(2)}, ' ...
'pages = {255-278}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=0BFCAE7944494A64&sec=lifehistory}}';
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

