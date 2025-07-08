function [data, auxData, metaData, txtData, weights] = mydata_Brachyramphus_brevirostris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Alcidae';
metaData.species    = 'Brachyramphus_brevirostris'; 
metaData.species_en = 'Kittlitz''s murrelet'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'xiMcp', '0bTd'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 26];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 26];

%% set data
% zero-variate data

data.ab = 30;        units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'KaleKenn2010';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 25;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 75;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '';
data.tR = 730;         units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'Data for Brachyramphus marmoratus';
data.am = 10365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Data for Brachyramphus marmoratus';

data.Wwb = 19;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KaleKenn2010';
% data.Wwp = 120;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'KaleKenn2010';
data.Wwi = 224;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'KaleKenn2010';

data.Ri  = 1/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'KaleKenn2010';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
4.912	29.881
5.929	38.656
6.991	46.008
6.991	59.763
8.097	69.249
11.018	61.660
12.965	66.640
13.009	69.012
14.956	48.142
15.000	78.261
15.973	65.929
16.018	61.186
20.000	104.585
24.956	118.103
25.000	92.016
28.053	91.304
30.000	103.636
32.965	97.233];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'KaleKenn2010';
comment.tW = 'Data from Agattu Island';

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
D1 = 'mod_1: v is reduced';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Breeds on mountain tops. Not colonial. Looses down 12 h before fledging and flies to sea, possibly via rivers. No parental care after fledging';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'MYYJ'; % Cat of Life
metaData.links.id_ITIS = '176998'; % ITIS
metaData.links.id_EoL = '45509354'; % Ency of Life
metaData.links.id_Wiki = 'Brachyramphus_brevirostris'; % Wikipedia
metaData.links.id_ADW = 'Brachyramphus_brevirostris'; % ADW
metaData.links.id_Taxo = '53892'; % Taxonomicon
metaData.links.id_WoRMS = '254310'; % WoRMS
metaData.links.id_avibase = '7AD855E2377EBA1E'; % avibase
metaData.links.id_birdlife = 'kittlitzs-murrelet-brachyramphus-brevirostris'; % birdlife
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Brachyramphus_brevirostris}}';
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
bibkey = 'KaleKenn2010'; type = 'Techreport'; bib = [ ...  
'title = {Breeding biology of {K}ittlitz''s murrelet at {A}gattu {I}sland, {A}laska, in 2009}, ' ...
'institution = {U.S. Fish and Wildl. Serv.}, ' ...
'number = {AMNWR 2010/01}, ' ...
'year = {2010}, ' ...
'author = {Kaler, R. S. A. and L. A. Kenney and J. F. Piatt and J. C. Williams and G. V. Byrd}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Brachyramphus_marmoratus}}';
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

