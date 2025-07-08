function [data, auxData, metaData, txtData, weights] = mydata_Tringa_totanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Scolopacidae';
metaData.species    = 'Tringa_totanus'; 
metaData.species_en = 'Redshrank'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg', '0iThh'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 07 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 21];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 26];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 26];

%% set data
% zero-variate data

data.ab = 24;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'CervEsse2011';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 28;      units.tx = 'd';     label.tx = 'time since birth at fledging'; bibkey.tx = 'ThomMcCa1990';   
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 84;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 26.9*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'ADW gives 4.7 yr';

data.Wwb = 14;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ThomMcCa1990';
data.Wwi = 149;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'AnAge';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 3-5 eggs per clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.077	15.782
0.880	14.630
1.836	12.526
1.837	16.140
1.952	14.046
2.870	17.268
3.176	16.883
3.634	14.215
3.635	13.645
3.636	12.503
4.401	18.389
4.783	19.335
4.860	23.708
4.898	17.812
5.051	26.749
5.434	26.363
5.587	18.374
5.893	17.990
6.161	21.980
6.926	15.124
8.610	32.789
8.839	25.369
9.068	24.225
9.069	25.937
9.106	35.065
9.107	38.868
9.108	45.334
9.145	31.261
9.681	38.671
9.872	30.111
11.134	32.757
11.135	35.039
11.403	54.434
11.594	44.542
12.207	47.387
12.628	51.375
12.895	53.654
12.934	55.936
14.196	44.129
14.885	59.334
15.995	67.688
16.607	59.312
16.874	55.125
16.875	60.450
16.913	60.449
17.181	67.102
17.832	66.143
18.903	67.651
18.940	69.362
18.941	70.313
19.133	73.543
19.974	69.729
20.166	79.806
21.848	83.017
21.849	85.109
21.964	94.617
22.117	99.559
22.920	83.574
22.921	84.525
22.922	88.519
22.923	100.310
23.189	87.565
23.227	103.158
23.838	84.323
23.839	94.403
23.878	92.691
24.605	95.534
24.872	82.789
24.949	84.119
25.064	97.430
25.102	112.263
25.179	91.533
28.163	96.440];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'ThomMcCa1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: v is reduced and food availability taken variable in tW data';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '58VJH'; % Cat of Life
metaData.links.id_ITIS = '176622'; % ITIS
metaData.links.id_EoL = '45509200'; % Ency of Life
metaData.links.id_Wiki = 'Tringa_totanus'; % Wikipedia
metaData.links.id_ADW = 'Tringa_totanus'; % ADW
metaData.links.id_Taxo = '53680'; % Taxonomicon
metaData.links.id_WoRMS = '158970'; % WoRMS
metaData.links.id_avibase = 'D6BFC73A3E067711'; % avibase
metaData.links.id_birdlife = 'common-redshank-tringa-totanus'; % birdlife
metaData.links.id_AnAge = 'Tringa_totanus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tringa_totanus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tringa_totanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ThomMcCa1990'; type = 'Article'; bib = [ ...  
'title = {Does Growth Rate Determine the Rate of Metabolism in Shorebird Chicks Living in the {A}rctic?}, ' ...
'journal = {Ringing \& Migration}, ' ...
'year = {1990}, ' ...
'author = {Thompson, P. S. and McCarty, C. and Hale, W. G.}, ' ...
'volume = {11}, ' ...
'pages = {57-64}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Tringa_totanus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CervEsse2011'; type = 'Article'; bib = [ ...  
'title = {Can differences in incubation patterns of Common Redshanks \emph{Tringa totanus} be explained by variations in predation risk?}, ' ...
'journal = {J. Ornithol.}, ' ...
'year = {2011}, ' ...
'author = {A. Cervencl and W. Esser and M. Maier and N. Oberdiek and S. Thyen and A. Wellbrock and K.-M. Exo}, ' ...
'doi = {0.1007/s10336-011-0696-z}'];
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

