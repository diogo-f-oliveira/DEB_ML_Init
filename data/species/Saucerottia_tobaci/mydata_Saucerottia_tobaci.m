function [data, auxData, metaData, txtData, weights] = mydata_Saucerottia_tobaci

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Trochilidae';
metaData.species    = 'Saucerottia_tobaci'; 
metaData.species_en = 'Copper-rumped hummingbird'; 

metaData.ecoCode.climate = {'Aw','Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi', 'xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body Temperature 
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2022 09 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data;
data.ab = 16.5;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'egg temperature'; 
data.tx = 21;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase'; 
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 63;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess'; 
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;   units.tR = 'd';   label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(38.1);  units.temp.tR = 'K'; label.temp.tR = 'temperature';  
data.am = 10*365;  units.am = 'd';   label.am = 'life span';                     bibkey.am = 'guess'; 
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on for Archilochus_alexandri';

data.Ww0 = 0.52; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';          bibkey.Ww0 = 'avibase';
 comment.Ww0 = 'MuirButl2008 gives 0.486 g';
data.Wwb = 0.65; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'MuirButl2008';
data.Wwi = 4.9; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'avibase';   

data.Ri  = 2.5*2/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 2.5 clutches per yr';
 
% uni-variate data

% time-weight
data.tW = [... % time since birth (d), weight (grain)
0.108	7.172
1.213	9.611
2.062	11.906
3.025	15.635
4.100	19.508
4.976	24.385
6.022	29.693
7.153	35.143
8.026	43.607
9.018	45.758
10.121	51.066
11.087	50.492
12.129	60.676
13.063	63.545
14.030	61.393
15.077	65.123
16.014	65.697
17.043	57.090
17.998	68.566
19.050	66.844
20.017	64.836
21.039	64.836];
data.tW(:,2) = data.tW(:,2)*0.06479891; % convert grain to g
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(38.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MuirButl2008';
%
data.tW1 = [... % time since birth (d), weight (grain)
0.080	6.618
1.073	8.633
2.036	12.512
2.942	15.961
3.962	19.554
5.095	24.582
6.026	32.334
7.103	36.358
8.064	42.389
9.140	46.987
9.936	46.992
10.843	50.154
12.089	55.183
13.025	56.911
14.081	51.611
15.014	57.211
16.010	55.927
16.975	56.794
17.942	56.801
18.911	52.791
19.958	58.680];
data.tW1(:,2) = data.tW1(:,2)*0.06479891; % convert grain to g
units.tW1  = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1   = C2K(38.1);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'MuirButl2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = weights.tW1 * 2;
weights.tW = weights.tW * 2;
weights.Ww0 = weights.Ww0 * 0;

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
set1 = {'tW','tW1'}; subtitle1 = {'2 siblings in one nest'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Body temperature drops at night';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8KQBZ'; % Cat of Life
metaData.links.id_ITIS = '1150068'; % ITIS
metaData.links.id_EoL = '47191049'; % Ency of Life
metaData.links.id_Wiki = 'Saucerottia_tobaci'; % Wikipedia
metaData.links.id_ADW = 'Amazilia_tobaci'; % ADW
metaData.links.id_Taxo = '72413'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '8FBB6521BF7D1360'; % avibase
metaData.links.id_birdlife = 'copper-rumped-hummingbird-amazilia-tobaci'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Saucerottia_tobaci}},'...
'note = {Accessed : 2017-03-20}'];
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
bibkey = 'MuirButl2008'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1474-919X.1925.tb02946.x}, ' ...
'author = {Muir, A. and Butler, A. L.}, ' ... 
'year = {2008}, ' ...
'title = {The Nesting of the Emerald Humming-Bird (\emph{Saucerottea tobaci erythronota}) in {T}rinidad}, ' ...
'journal = {Ibis}, ' ...
'volume = {67(3)}, ' ...
'pages = {648–654}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = [ ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=8FBB6521BF7D1360&sec=lifehistory}}'];
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

