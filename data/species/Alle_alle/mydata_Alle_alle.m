function [data, auxData, metaData, txtData, weights] = mydata_Alle_alle
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Alcidae';
metaData.species    = 'Alle_alle'; 
metaData.species_en = 'Little auk'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'xiMcp', '0bTd'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'; 'Starrlight Augustine'};    
metaData.date_subm = [2016 11 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 27];              
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

data.ab = 29;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'NettBirk1985';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 27.5;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'NettBirk1985';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 82.5;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 730;       units.tR = 'd';    label.tR = 'time since birth at first egg laying';  bibkey.tR = 'guess';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'Guess is based on Cassins auklet';
data.am = 16.2*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Guess is based on Cassins auklet';

data.Ww0 = 31.6;       units.Ww0 = 'g';   label.Ww0 = 'egg weight';              bibkey.Ww0 = 'NettBirk1985';
data.Wwb = 21.5;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'NettBirk1985';
% data.Wwx = 140;        units.Wwx = 'g';   label.Wwx = 'wet weight at fledging'; bibkey.Wwx = 'NettBirk1985';
data.Wwi = 163.5;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'NettBirk1985';

data.Ri  = 1/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'NettBirk1985';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0       21.5 % added from Wwb
0.957	25.681
1.951	32.675
2.945	39.669
3.973	46.663
4.933	54.047
5.926	67.660
6.921	72.319
7.948	77.366
8.941	90.200
8.974	92.535
9.968	98.362
10.003	93.300
10.995	106.913
10.997	98.738
11.924	107.679
11.990	111.571
12.984	121.291
12.985	118.177
14.011	127.506
14.012	124.781
14.972	136.448
14.973	132.165
16.000	138.770
16.001	134.488
16.995	143.039
16.996	139.536
17.990	143.026
17.991	139.912
18.985	146.517
19.982	139.886
20.014	145.725
21.011	140.652
21.043	146.491
22.006	142.585
23.035	141.015
23.999	134.773
24.993	137.875
24.994	133.593
25.991	126.962
25.992	122.290
26.988	119.163];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'Franz Josef Land 2013'};  
temp.tW    = C2K(40.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'GremFort2015';
comment.tW = 'Data from Franz Josef Land 2013';
%
data.tW1 = [ ... % time since birth (d), wet weight (% of adult weight)
0       21.5/1.635 % added from Wwb
3.950	21.066
4.797	24.251
5.997	29.207
7.057	31.857
7.832	36.641
8.820	40.890
9.949	45.847
10.867	48.676
11.996	54.166
12.915	56.108
13.974	60.710
14.891	64.960
16.021	68.142
17.011	69.905
17.999	73.621
18.919	73.611
19.979	74.663
20.969	76.071
21.961	74.640
23.023	73.562
24.013	73.550
24.933	73.539
25.924	72.463
26.845	71.209];
data.tW1(:,2) = data.tW1(:,2) * 1.635; % convert % to weight
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'Svalbard 1963/1964'};  
temp.tW1    = C2K(40.7);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'Verm1987';
comment.tW1 = 'Data from Svalbard 1963/1964';

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
set1 = {'tW','tW1'}; subtitle1 = {'Data from Franz Josef Land 2013, Svalbard 1963/4'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Peak weight before fledging is only 75% of adult weight, which causes poor fit of tW data if f is assumed to be constant';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'BTFY'; % Cat of Life
metaData.links.id_ITIS = '176982'; % ITIS
metaData.links.id_EoL = '45509340'; % Ency of Life
metaData.links.id_Wiki = 'Alle_alle'; % Wikipedia
metaData.links.id_ADW = 'Alle_alle'; % ADW
metaData.links.id_Taxo = '53890'; % Taxonomicon
metaData.links.id_WoRMS = '137129'; % WoRMS
metaData.links.id_avibase = 'B0932D89F1F74318'; % avibase
metaData.links.id_birdlife = 'little-auk-alle-alle'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alle_alle}}';
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
bibkey = 'GremFort2015'; type = 'Article'; bib = [ ...  
'title = {Arctic warming: nonlinear impacts of sea-ice and glacier melt on seabird foraging.}, ' ...
'journal = {Global Change Biology}, ' ...
'volume = {21}, ' ...
'pages = {1116-1123}, ' ...
'year = {2015}, ' ...
'author = {D. Gremillet and J. Fort and F. A. Ineau and E. Zakharova and T. Le Bot and E. Sala and M. Gavrilo}, ' ...
'doi = {doi: 10.1111/gcb.12811}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NettBirk1985'; type = 'Book'; bib = [ ...  
'title = {The Atlantic Alcidae. The evolution, distribution and biology of the auks inhabiting the Atlantic Ocean and adjacent water areas.}, ' ...
'publisher = {Academic Press}, ' ...
'year = {1985}, ' ...
'author = {Nettleship, D. N. and Birkhead, T. R.}, ' ...
'address = {London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Verm1987'; type = 'Techreport'; bib = [ ...  
'title = {GROWTH AND NESTLING PERIODS OF CASSINS AUKLETS: ADAPTATIONS OF PLANKTIVOROUS AUKLETS TO BREEDING AT NORTHERN LATITUDES}, ' ...
'institution = {Canadian technial report of hydrography and ocean sciences}, ' ...
'volume = {93}, ' ...
'year = {1987}, ' ...
'author = {K. Vermeer}'];
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

