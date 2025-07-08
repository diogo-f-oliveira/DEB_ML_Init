function [data, auxData, metaData, txtData, weights] = mydata_Sialia_mexicana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Turdidae';
metaData.species    = 'Sialia_mexicana'; 
metaData.species_en = 'Western bluebird'; 

metaData.ecoCode.climate = {'BW'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-pD'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 17];              
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

data.ab = 14;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 20;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'MockKhub1991';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 60;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 8.7*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.7;      units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MockKhub1991';
data.Wwi = 27.6;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MockKhub1991';
 
data.Ri  = 1.5*5/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 eggs/clutch, 1.5 clutch per yr';
  
% bi-variate data
% time-weight-FMR
data.tWp = [ ... % time since birth (d), wet weight (g), field metabolic rate (kJ/d)
 0  3.7  3.9
 1  5.3  6.3
 2  7.4  9.8
 3  9.9 14.5
 4 12.7 20.4
 5 15.6 27.3
 6 18.3 34.7
 7 20.7 41.7
 8 22.7 47.7
 9 24.2 52.6
10 25.3 56.3
11 26.0 58.9
12 26.6 60.7
13 26.9 62.2
14 27.2 63.1
15 27.3 63.7
16 27.4 64.0
17 27.5 64.3
18 27.6 64.3
19 27.6 64.6
20 27.6 64.6];
units.tWp   = {'d', 'g', 'kJ/d'};  label.tWp = {'time since birth', 'wet weight', 'field metabolic rate'}; 
treat.tWp = {1, {'weight', 'FMR'}}; 
temp.tWp    = C2K(41.6);  units.temp.tWp = 'K'; label.temp.tWp = 'temperature';
bibkey.tWp  = 'MockKhub1991';
comment.tWp = 'Growth data from a computed curve, combined with Myiarchus_cinerascens';

%% set weights for all real data
weights = setweights(data, []);
weights.tWp(:,1) = weights.tWp(:,1) * 2;

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
D1 = 'mod_1: v reduced, food availability varies for tW data; Ww0 data ignored due to inconsistency with Wwb data';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4X5FX'; % Cat of Life
metaData.links.id_ITIS = '179806'; % ITIS
metaData.links.id_EoL = '45510185'; % Ency of Life
metaData.links.id_Wiki = 'Sialia_mexicana'; % Wikipedia
metaData.links.id_ADW = 'Sialia_mexicana'; % ADW
metaData.links.id_Taxo = '84311'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'AC2B812A19A746DC'; % avibase
metaData.links.id_birdlife = 'western-bluebird-sialia-mexicana'; % birdlife
metaData.links.id_AnAge = 'Sialia_mexicana'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sialia_mexicana}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sialia_mexicana}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MockKhub1991'; type = 'article'; bib = [ ...  
'title = {ENERGETICS OF GROWTH AND MATURATION IN SYMPATRIC PASSERINES THAT FLEDGE AT DIFFERENT AGES}, ' ...
'journal = {The Auk}, ' ...
'year = {1991}, ' ...
'author = {Patrick J. Mock and Marina Khubesrian and Dee M. Larcheveque}, ' ...
'pages = {34-41}, ' ...
'volume = {108}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=AC2B812A19A746DC&sec=lifehistory}}';
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

