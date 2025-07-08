function [data, auxData, metaData, txtData, weights] = mydata_Sarcoramphus_papa

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Cathartiformes'; 
metaData.family     = 'Cathartidae';
metaData.species    = 'Sarcoramphus_papa'; 
metaData.species_en = 'King vulture'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biSvm', 'biSvb'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 08 31];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1      = {'Bas Kooijman'};    
metaData.date_mod_1        = [2022 09 09];              
metaData.email_mod_1       = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1     = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 04];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 57;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 93;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 279;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 4*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'wiki';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 40*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 195;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 123;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ZwarLouw1980';
data.Wwi = 4e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 2.7 till 4.5 kg';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.288	122.905
14.259	284.916
22.325	631.285
39.897	1631.285];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'hand-reared'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ZwarLouw1980';
%
data.tW1 = [ ... % time since birth (d), wet weight (g)
    31.5  650
    33   1000
    41   1350
    50   1960
    53   2420
    60.5 3090
    72.7 3490];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'wild'};  
temp.tW1    = C2K(40);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'MendFilh2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Ww0 = 0 * weights.Ww0;

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
set1 = {'tW','tW1'}; subtitle1 = {'Data for hand-reared, wild'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'body temperature is guessed';
D2 = 'males are assumed not to differ from females';
D3 = 'mod_1: data added: tW1, Ww0';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Facts
F1= 'uses urohidrosis, defecating on its legs, to lower its body temperature; lacks a voice box';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XMVS'; % Cat of Life
metaData.links.id_ITIS = '175277'; % ITIS
metaData.links.id_EoL = '45511523'; % Ency of Life
metaData.links.id_Wiki = 'Sarcoramphus_papa'; % Wikipedia
metaData.links.id_ADW = 'Sarcoramphus_papa'; % ADW
metaData.links.id_Taxo = '52311'; % Taxonomicon
metaData.links.id_WoRMS = '1466597'; % WoRMS
metaData.links.id_avibase = '9306DA2F3B23E74C'; % avibase
metaData.links.id_birdlife = 'king-vulture-sarcoramphus-papa'; % birdlife
metaData.links.id_AnAge = 'Sarcoramphus_papa'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sarcoramphus_papa}}';
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
bibkey = 'ZwarLouw1980'; type = 'Article'; bib = [ ... 
'author = {Zwart, P. and Louwman, J. W. W}, ' ... 
'doi = {10.1111/j.1748-1090.1980.tb00993.x}, ' ...
'year = {1980}, ' ...
'title = {Feeding a hand-reared {A}ndean condor and King vulture at {W}assenaar {Z}oo }, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {20}, ' ...
'pages = {276-277}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MendFilh2004'; type = 'Article'; bib = [ ... 
'author = {Eduardo Pio Mendes de Carvalho Filho and Giancarlo Zorzin and Gustav V. A. Specht}, ' ... 
'year = {2004}, ' ...
'title = {BREEDING BIOLOGY OF THE KING VULTURE (\emph{Sarcoramphus papa}) IN SOUTHEASTERN {B}RAZIL}, ' ...
'journal = {Ornitologia Neotropical}, ' ...
'volume = {15}, ' ...
'pages = {219–224}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sarcoramphus_papa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=9306DA2F3B23E74C&sec=lifehistory}}';
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

