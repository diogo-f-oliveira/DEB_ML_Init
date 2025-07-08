function [data, auxData, metaData, txtData, weights] = mydata_Bulweria_bulwerii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Bulweria_bulwerii'; 
metaData.species_en = 'Bulwer''s petrel'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 17];              
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

data.ab = 45.2;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Whit1994';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '55 to 65 d';
data.tx = 62; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Whit1994';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 186; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 17; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Whit1994';
  comment.Wwb = 'mean egg weight: 19.3 g; time zero in tW data is probably 0.5 to 1 d after hatching';
data.Wwi = 190; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Whit1994';
  comment.Wwi = 'asymptote for nestling; mean adult weight is lower: 92.8 g';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since 1 July  (d), wet weight (g)
-1.213  17 % added from Wwb
 0.787	20.832
 7.528	69.511
13.708	75.719
21.011	140.662
28.034	141.610
34.354	155.816
38.989	159.575
42.781	150.940
49.522	160.170
56.545	122.498
61.461	105.286];
data.tW(:,1) = data.tW(:,1) - data.tW(1,1); % hatch ot origin
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'Hatch at 1 July'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Whit1994';
comment.tW = 'Hatch at 1 July';
%
data.tW1 = [ ... % time (d), wet weight (g)
 8.758  17 % added from Wwb
10.758	21.991
18.062	40.865
20.871	75.561
28.315	90.845
34.354	100.091
38.427	124.002
42.360	133.570
49.522	140.033
56.966	117.248
62.022	119.343
68.764	116.436];
data.tW1(:,1) = data.tW1(:,1) - data.tW1(1,1); % hatch ot origin
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'Hatch at 20 July'};  
temp.tW1    = C2K(39.4);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'Whit1994';
comment.tW1 = 'Hatch at 20 July';
%
data.tW2 = [ ... % time (d), wet weight (g)
23.927  17 % added from Wwb
25.927	25.519
28.034	41.196
34.213	60.646
39.129	91.434
42.079	99.369
47.556	140.628
49.522	157.136
56.685	159.461
61.882	159.898
68.483	148.166
74.944	122.920
78.876	130.005];
data.tW2(:,1) = data.tW2(:,1) - data.tW2(1,1); % hatch ot origin
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'Hatch at 25 July'};  
temp.tW2    = C2K(39.4);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'Whit1994';
comment.tW2 = 'Hatch at 25 July';

%% set weights for all real data
weights = setweights(data, []);
weights.tW2 = weights.tW2 * 2;
weights.tW1 = weights.tW1 * 2;
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

%% Group plots
set1 = {'tW', 'tW1', 'tW2'}; subtitle1 = {'Hatch at 1, 20, 25 July'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'Body temperature is guessed';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '5X484'; % Cat of Life
metaData.links.id_ITIS = '554144'; % ITIS
metaData.links.id_EoL = '45511317'; % Ency of Life
metaData.links.id_Wiki = 'Bulweria_bulwerii'; % Wikipedia
metaData.links.id_ADW = 'Bulweria_bulwerii'; % ADW
metaData.links.id_Taxo = '51516'; % Taxonomicon
metaData.links.id_WoRMS = '137193'; % WoRMS
metaData.links.id_avibase = '058773E4925D5D2E'; % avibase
metaData.links.id_birdlife = 'bulwers-petrel-bulweria-bulwerii'; % birdlife
metaData.links.id_AnAge = 'Bulweria_bulwerii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bulweria_bulwerii}}';
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
bibkey = 'Whit1994'; type = 'Article'; bib = [ ... 
'author = {G. C. Whittow}, ' ... 
'year = {1994}, ' ...
'title = {Incubation Biology and Nestling Growth of {B}ulwer''s Petrels on {M}anana {I}sland, {O}ahu, {H}awaii}, ' ...
'journal = {Pacific Science}, ' ...
'volume = {48}, ' ...
'pages = {136-144}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1178495/overview}}';
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

