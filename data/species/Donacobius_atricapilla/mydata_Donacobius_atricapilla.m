function [data, auxData, metaData, txtData, weights] = mydata_Donacobius_atricapilla
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Donacobiidae';
metaData.species    = 'Donacobius_atricapilla'; 
metaData.species_en = 'Black-capped donacobius'; 

metaData.ecoCode.climate = {'A','Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 17;       units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Ragu1996';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '16-18 d';
data.tx = 17;       units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Ragu1996';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '16-18 d';
data.tp = 51;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '16-18 d';
data.tR = 365;      units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 7.3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Campylorhynchus brunneicapillus';

data.Ww0 = 3.6;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';           bibkey.Ww0 = 'avibase';
data.Wwb = 2.9;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on tW data';
data.Wwi = 36;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'avibase';
data.Wwim = 39;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 2.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Ragu1996';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-3 eggs/clutch, assumed: assumed: 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW2 = [ ... % time since birth (d), wet weight (g)
1.027	4.616
3.158	7.352
5.227	12.136
7.387	17.317
9.578	22.183
11.709	25.629
13.842	27.734
15.976	28.106];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', '2 nestlings'};  
temp.tW2    = C2K(41.6);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Ragu1996';
comment.tW2 = 'Broods of 2 nestlings';
%
data.tW3 = [ ... % time since birth (d), wet weight (g)
2.033	4.327
4.226	6.119
6.387	10.511
8.486	15.612
10.616	20.397
12.808	24.712
14.940	26.502
17.013	26.793];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight', '3 nestlings'};  
temp.tW3    = C2K(41.6);  units.temp.tW3 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW3 = 'Ragu1996';
comment.tW3 = 'Broods of 3 nestlings';

%% set weights for all real data
weights = setweights(data, []);
weights.tW2 = weights.tW2 * 2;
weights.tW3 = weights.tW3 * 2;

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
set1 = {'tW3','tW2'}; subtitle1 = {'Data for 3, 2 nestlings'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Scaled functional response varies in time';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Cooperative breeder';
metaData.bibkey.F1 = 'Ragu1996'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6DDT8'; % Cat of Life
metaData.links.id_ITIS = '726109'; % ITIS
metaData.links.id_EoL = '126685'; % Ency of Life
metaData.links.id_Wiki = 'Donacobius_atricapilla'; % Wikipedia
metaData.links.id_ADW = 'Donacobius_atricapilla'; % ADW
metaData.links.id_Taxo = '1126270'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '878C7D44D622C044'; % avibase
metaData.links.id_birdlife = 'donacobius-donacobius-atricapilla'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Donacobius_atricapilla}}';
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
bibkey = 'Ragu1996'; type = 'Article'; bib = [ ... 
'author = {Jod\''{e} Ragusa-Netto}, ' ... 
'year = {1996}, ' ...
'title = {Nestling development, size and juvenle survival in \emph{Donacobius atricapillus} {{P}asseriformes: {T}roglodytidae}}, ' ...
'journal = {Ararajuba}, ' ...
'volume = {4(2)}, ' ...
'pages = {81-85}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=878C7D44D622C044&sec=lifehistory}}';
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

