function [data, auxData, metaData, txtData, weights] = mydata_Ardeotis_kori

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Otidiformes'; 
metaData.family     = 'Otididae';
metaData.species    = 'Ardeotis_kori'; 
metaData.species_en = 'Kori bustard'; 

metaData.ecoCode.climate = {'BSh', 'BWh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTg'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.25); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 11 06];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'}; 

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 06 25];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 23;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'AZA2009';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 31.5;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ADW';   
  temp.tx = C2K(40.25);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 94.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '';
data.tR = 3*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(40.25);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 11680; units.am = 'd';    label.am = 'life span';                  bibkey.am = 'AZA2009';   
  temp.am = C2K(40.25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 116.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'ADW';

data.Ww0 = 158;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 99;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AZA2009';
data.Wwi = 5890;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 10870;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'avibase';

data.Ri  = 0.004164384; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AZA2009';   
  temp.Ri = C2K(40.25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
0   99.7;
1	93.4;
2	98.7;
3	102;
4	110.8;
5	123;
6	130.3;
7	145.8;
8	157.3;
9	175;
10	192.5;
11	217.8;
12	240;
13	253.5;
14	287.5;
15	316.3;
16	338.8;
17	358.5;
18	390;
19	418.8;
20	444.5;
21	475;
22	513.3;
23	560.8;
24	596.5;
25	631.3;
26	665.3;
27	700;
28	743;
29	786.3;
30	825.8];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.25);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'AZA2009';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Ww0 = weights.Ww0 * 0;
weights.Wwb = weights.Wwb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D0 = 'mod_2: Wwim and Ww0 dat added, tR data revised';
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Ww0 data ignored due to inconsistency with Wwb data';
D3 = 'The high age at first reproduction cannot be captured by the std model';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D0',D0, 'D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = 'GCMR'; % Cat of Life
metaData.links.id_ITIS = '176429'; % ITIS
metaData.links.id_EoL = '45513862'; % Ency of Life
metaData.links.id_Wiki = 'Ardeotis_kori'; % Wikipedia
metaData.links.id_ADW = 'Ardeotis_kori'; % ADW
metaData.links.id_Taxo = '53450'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '4FC41CA0DC1B12AF'; % avibase
metaData.links.id_birdlife = 'kori-bustard-ardeotis-kori'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ardeotis_kori}}';
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
bibkey = 'TielWill2002'; type = 'Article'; bib = [ ... 
'author = {Tieleman, B. I. and Williams, J. B. and LaCroix, F. and Paillat, P.}, ' ... 
'year = {2002}, ' ...
'title = {Physiological responses of Houbara bustards to high ambient temperatures}, ' ...
'journal = {The Journal of Experimental Biology}, ' ...
'volume = {205}, ' ...
'pages = {503--511}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AZA2009'; type = 'Techreport'; bib = [ ... 
'author = {Tieleman, B. I. and Williams, J. B. and LaCroix, F. and Paillat, P.}, ' ... 
'year = {2009}, ' ...
'title = {Gruiformes TAG; Kori Bustard (\emph{Ardeotis kori}) Care Manual}, ' ...
'institution = {Association of Zoos and Aquariums, Silver Spring, MD}, ' ...
'pages = {113}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Ardeotis_kori/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ARKive'; type = 'Misc'; bib = ...
'howpublished = {\url{www.arkive.org}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=4FC41CA0DC1B12AF&sec=lifehistory}}';
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

