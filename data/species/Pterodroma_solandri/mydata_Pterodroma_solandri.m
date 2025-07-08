function [data, auxData, metaData, txtData, weights] = mydata_Pterodroma_solandri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Pterodroma_solandri'; 
metaData.species_en = 'Providence petrel';

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 20];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 55;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'EoL';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 109; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Brow2008';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'value for Pterodroma macroptera';
data.tp = 327; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'value for Pterodroma macroptera';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge: possibly longer than 30 yr';

data.Wwb = 50; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Brow2008';
  comment.Wwb = 'values for Pterodroma_macroptera';
data.Wwi = 610; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BindPrid2013';
  comment.Wwi = 'asymptote for nestling; mean adult weight is lower. AnAge 486 g';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
 0       55 % added value from Wwb
64.887	564.362
65.833	577.926
66.957	575.532
67.962	598.670
68.967	585.106
69.854	598.670
70.978	581.915
71.924	598.670
72.988	619.415
73.934	621.011
74.940	601.064
75.945	638.564
76.950	621.809
77.955	594.681
78.961	584.309
79.966	611.436
80.912	608.245
81.917	616.223
82.922	620.213
83.869	617.819
84.933	582.713
85.879	594.681
87.003	589.096
87.949	590.692
88.954	605.851
89.959	576.330
90.965	577.128
91.911	569.947
92.975	569.947
93.980	564.362
94.986	561.968
96.050	555.585
96.937	552.394
98.001	560.372
98.888	523.670
99.894	540.426
101.017	541.223
101.963	525.266
102.968	526.064
103.974	526.064
105.038	508.511
105.984	492.553
106.930	482.979
107.936	455.053
108.941	445.479];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'BindPrid2013';
comment.tW = 'BindPrid2013 gives time before fledging; tx and Wwb are assumed to hold';
  
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
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'Long tp cannot be captured by std model';
D3 = 'Body temperature is guessed';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '4PWL6'; % Cat of Life
metaData.links.id_ITIS = '174581'; % ITIS
metaData.links.id_EoL = '45511283'; % Ency of Life
metaData.links.id_Wiki = 'Pterodroma_solandri'; % Wikipedia
metaData.links.id_ADW = 'Pterodroma_solandri'; % ADW
metaData.links.id_Taxo = '51556'; % Taxonomicon
metaData.links.id_WoRMS = '343983'; % WoRMS
metaData.links.id_avibase = 'F654D59E67F122CD'; % avibase
metaData.links.id_birdlife = 'providence-petrel-pterodroma-solandri'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterodroma_solandri}}';
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
bibkey = 'BindPrid2013'; type = 'Article'; bib = [ ... 
'author = {Binder, D. and Priddel, D. and Carlile, N. and Kingsford, R. T.}, ' ... 
'doi = {10.1071/mu11051}, ' ...
'year = {2013}, ' ...
'title = {Emergence, growth, ageing and provisioning of {P}rovidence Petrel (\emph{Pterodroma solandri}) chicks: implications for translocation}, ' ...
'journal = {Emu - Austral Ornithology}, ' ...
'volume = {113}, ' ...
'number = {1}, ' ...
'pages = {33-44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Brow2008'; type = 'Article'; bib = [ ... 
'author = {Brown, C. R.}, ' ... 
'doi = {10.1111/j.1474-919x.1988.tb02718.x}, ' ...
'year = {2008}, ' ...
'title = {Energy requirements for growth of {S}alvin''s Prions \emph{Pachyptila vittata salvini}, Blue Petrels \emph{Halobaena caerulea} and Great-winged Petrels \emph{Pterodroma macroptera}}, ' ...
'journal = {Ibis}, ' ...
'volume = {130}, ' ...
'number = {6}, ' ...
'pages = {527-534}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049477/details}}';
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

