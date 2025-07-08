function [data, auxData, metaData, txtData, weights] = mydata_Megascops_choliba

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Strigiformes'; 
metaData.family     = 'Strigidae';
metaData.species    = 'Megascops_choliba'; 
metaData.species_en = 'Tropical screech owl'; 

metaData.ecoCode.climate = {'A', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 26;        units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Megascops_asio';
data.tx = 30;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'GuilSouz2017';   
  temp.tx = C2K(40.2); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 90;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';bibkey.tR = 'guess';
  temp.tR = C2K(40.2); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'based on Megascops_asio';
data.am = 20.7*365;    units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(40.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Megascops_asio';
  
data.Ww0 = 16.6;  units.Ww0 = 'g';   label.Ww0 = 'initial weight';           bibkey.Ww0 = 'avibase';
  comment.Ww0 = 'GuilSouz2017 give 15g  pm 1 g';
data.Wwb = 12;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'guess';
data.Wwi = 148;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 138;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 2.25/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'GuilSouz2017';   
  temp.Ri = C2K(40.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-3 eggs per clutch, 1 clutch per yr'; 
  
% uni-variate data
% time-weight
data.tW1 = [ ... % time (d), wet weight (g)
0.000	32.926
1.915	47.704
3.959	57.037
7.009	78.815
11.028	98.000
13.900	98.259
14.002	92.815
18.121	98.259
20.998	116.148
23.005	118.222
24.872	110.444];  
data.tW1(:,1) = data.tW1(:,1) + 3; % set origin at hatch
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'ind 1'};  
temp.tW1    = C2K(40.2);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'GuilSouz2017';
%
data.tW2 = [ ... % time (d), wet weight (g)
0.075	21.778
1.980	30.074
3.887	48.222
7.073	57.815
8.946	77.259
11.094	87.630
13.897	88.407
14.002	93.074
17.983	97.741
21.169	108.889
22.901	117.185
24.802	109.926];  
data.tW2(:,1) = data.tW2(:,1) + 2; % set origin at hatch
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'ind 2'};  
temp.tW2    = C2K(40.2);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'GuilSouz2017';
%
data.tW3 = [ ... % time (d), wet weight (g)
0.073	14.000
2.151	21.000
4.265	34.741
7.141	53.926
9.014	72.074
11.230	78.037
14.071	90.222
18.190	98.259
20.994	100.852
22.867	117.963
24.664	111.222];  
data.tW3(:,1) = data.tW3(:,1) + 1; % set origin at hatch
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight', 'ind 3'};  
temp.tW3   = C2K(40.2);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'GuilSouz2017';

%% set weights for all real data
weights = setweights(data, []);weights.tp = 0.1;
weights.tW1 = 2 * weights.tW1; 
weights.tW2 = 2 * weights.tW2; 
weights.tW3 = 2 * weights.tW3; 

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
set1 = {'tW1','tW2','tW3'}; subtitle1 = {'Data for individuals 1,2,3'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Body temperature is guessed';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '72W6Z'; % Cat of Life
metaData.links.id_ITIS = '686663'; % ITIS
metaData.links.id_EoL = '45511576'; % Ency of Life
metaData.links.id_Wiki = 'Megascops_choliba'; % Wikipedia
metaData.links.id_ADW = 'Otus_choliba'; % ADW
metaData.links.id_Taxo = '1683917'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'E2B40A6E68F699C4'; % avibase
metaData.links.id_birdlife = 'tropical-screech-owl-megascops-choliba'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Megascops_choliba}}';
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
bibkey = 'GuilSouz2017'; type = 'Article'; bib = [ ... 
'doi = {10.1590/1809-4392}, ' ...
'author = {Edson Guilherme and Izabele Rodrigues de Souza}, ' ... 
'year = {2017}, ' ...
'title = {Nestling development of the tropical screech-owl (\emph{Megascops choliba}): a successful case report from the southwestern {A}mazon}, ' ...
'journal = {Acta Amazonica}, ' ...
'volume = {47(3)}, ' ...
'pages = {269-272}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=E2B40A6E68F699C4&sec=lifehistory}}';
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

