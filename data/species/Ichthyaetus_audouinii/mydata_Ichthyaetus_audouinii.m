function [data, auxData, metaData, txtData, weights] = mydata_Ichthyaetus_audouinii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Ichthyaetus_audouinii'; 
metaData.species_en = 'Audouin''s gull'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm', 'MAE'};
metaData.ecoCode.habitat = {'biMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 10 22];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 28.5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Witt1977';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '26 to 33 d. Temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care. ';
data.tx = 29;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Witt1977';   
  temp.tx = C2K(40.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 87;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1095;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'based on other Larus species';
data.am = 20.9*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 40; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Witt1977';
  comment.Wwb = 'egg weight: 84 to 92 g';
data.Wwi = 770; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Witt1977';
  comment.Wwi = 'asymptotic weight of nesting, adult 660 g (EoL)';

data.Ri  = 2.3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.039	43.936
0.041	40.500
0.245	48.258
1.078	51.802
1.081	47.507
1.083	45.789
1.085	42.353
1.086	40.635
1.088	38.058
1.996	34.738
2.046	63.095
2.049	59.659
2.051	56.223
2.055	50.210
2.060	43.338
2.062	39.901
2.816	58.899
2.817	56.322
2.834	32.269
2.895	44.304
2.948	69.225
2.951	64.071
3.737	36.681
3.854	69.342
3.858	63.329
3.860	59.893
3.933	55.606
4.683	79.758
4.690	69.450
4.694	63.436
4.942	108.142
5.792	87.633
5.917	108.268
5.922	101.395
6.896	104.098
6.902	95.508
8.042	159.229
8.873	167.068
8.877	161.055
8.879	157.618
9.218	70.892
10.065	156.053
10.169	206.754
10.999	215.452
11.002	212.016
11.006	205.143
12.188	109.935
13.163	210.576
15.052	300.166
16.021	309.741
16.088	312.327
16.215	331.244
17.824	322.001
19.162	401.212
19.281	330.780
20.161	368.694
22.012	412.747
22.076	320.831
24.071	457.686
25.024	489.596
25.152	505.935
26.056	509.488
26.399	516.405
27.017	430.574
28.270	432.454
29.125	404.214];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Witt1977';
  
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
D1 = 'Feeding is reduced just after hatch';
D2 = 'Long tp cannot be captured by std model';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '6N5PM'; % Cat of Life
metaData.links.id_ITIS = '824066'; % ITIS
metaData.links.id_EoL = '45513590'; % Ency of Life
metaData.links.id_Wiki = 'Ichthyaetus_audouinii'; % Wikipedia
metaData.links.id_ADW = 'Larus_audouinii'; % ADW
metaData.links.id_Taxo = '2682275'; % Taxonomicon
metaData.links.id_WoRMS = '137139'; % WoRMS
metaData.links.id_avibase = 'F7B9355E42C3F987'; % avibase
metaData.links.id_birdlife = 'audouins-gull-larus-audouinii'; % birdlife
metaData.links.id_AnAge = 'Ichthyaetus_audouinii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ichthyaetus_audouinii}}';
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
bibkey = 'Witt1977'; type = 'Article'; bib = [ ... 
'author = {H. Witt}, ' ... 
'year = {1977}, ' ...
'title = {Zur {B}iologie der {K}orallenm\"{o}we \emph{Larus audouinii} {B}rut und {E}rn\"{a}hrung}, ' ...
'journal = {J. Ornithol.}, ' ...
'volume = {118}, ' ...
'pages = {134--155}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049301/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ichthyaetus_audouinii}}';
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

