function [data, auxData, metaData, txtData, weights] = mydata_Oreoscoptes_montanus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Mimidae';
metaData.species    = 'Oreoscoptes_montanus'; 
metaData.species_en = 'Sage thrasher'; 

metaData.ecoCode.climate = {'BWh','BSh','Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tnpf','Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2022 11 24];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 10];

%% set data
% zero-variate data

data.ab = 15;       units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Toxostoma curvirostre';
data.tx = 11;       units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Kill1970';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'value for Toxostoma rufum';
data.tp = 33;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'value for Toxostoma rufum';
data.tR = 330;      units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 20*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Kill1970';
data.Wwi = 37.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Kill1970';

data.Ri  = 4*2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-7 eggs/clutches, 2 clutches per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0  3.2
1  4.6
2  7.4
3 10.9
4 15.1
5 19.0
5.1 19.4
6 23.7
7 27.5
8 30.2
9 31.6
10 33.1
11 33.0];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'unparasiticed'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Kill1970';

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
D1 = 'Scaled functional response varies in time in tW data';
D2 = 'mod_1: v reduced';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '6STZ9'; % Cat of Life
metaData.links.id_ITIS = '178654'; % ITIS
metaData.links.id_EoL = '45510154'; % Ency of Life
metaData.links.id_Wiki = 'Oreoscoptes_montanus'; % Wikipedia
metaData.links.id_ADW = 'Oreoscoptes_montanus'; % ADW
metaData.links.id_Taxo = '56795'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'F6DF700B33402E74'; % avibase
metaData.links.id_birdlife = 'sage-thrasher-oreoscoptes-montanus'; % birdlife
metaData.links.id_AnAge = 'Oreoscoptes_montanus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oreoscoptes_montanus}}';
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
bibkey = 'Kill1970'; type = 'Article'; bib = [ ... 
'author = {Killpack, M. L.}, ' ... 
'year = {1970}, ' ...
'title = {Notes on sage thrasher nestlings in Colorado}, ' ...
'journal = {Condor}, ' ...
'volume = {72}, ' ...
'pages = {486-488}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Oreoscoptes_montanus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=F6DF700B33402E74&sec=lifehistory}}';
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

