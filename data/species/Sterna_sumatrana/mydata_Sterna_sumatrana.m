function [data, auxData, metaData, txtData, weights] = mydata_Sterna_sumatrana
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Sterna_sumatrana'; 
metaData.species_en = 'Black-naped tern'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 22;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'HulsSmit1988';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '21 to 23 d';
data.tx = 24;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'HulsSmit1988';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 72;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 1095;        units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25.7*365;      units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 7.1;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'HulsSmit1988';
  comment.Wwb = 'AnAge actually gives 1.25 g';
data.Wwi = 112;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'HulsSmit1988';

data.Ri  = 1.5/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'HulsSmit1988';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.932	7.398
0.932	12.245
0.932	13.520
0.932	15.051
0.979	9.439
0.979	10.204
1.911	10.204
1.911	12.245
1.911	14.286
1.911	15.561
1.911	18.112
2.004	9.439
2.004	13.010
2.004	13.776
2.796	20.408
2.843	19.898
2.936	11.480
2.936	14.286
2.936	15.306
2.936	21.684
2.936	25.000
2.983	18.367
3.821	16.327
3.821	21.939
3.821	23.980
3.915	16.837
3.915	18.367
3.915	20.408
3.915	26.276
3.915	28.316
4.847	30.612
4.893	19.898
4.893	20.663
4.893	21.429
4.986	26.531
5.033	15.561
5.033	23.724
5.872	27.551
5.872	28.061
5.872	29.847
5.918	24.235
5.918	25.255
5.918	31.633
5.918	32.653
5.918	34.949
5.918	36.735
5.918	38.776
5.965	13.520
5.965	17.602
5.965	20.918
5.965	30.612
6.850	19.133
6.850	28.571
6.850	31.633
6.897	32.653
6.897	33.673
6.897	37.245
6.897	43.878
7.922	35.714
7.922	37.755
7.969	29.337
8.016	46.684
8.901	45.153
8.901	45.918
8.901	47.959
8.901	49.490
8.948	34.694
8.948	39.031
8.948	42.857
9.880	28.571
9.880	33.163
9.926	52.551
10.812	43.367
10.812	46.173
10.951	47.704
10.998	58.418
12.862	44.898
12.862	56.888
13.049	72.704
13.981	53.061
13.981	55.102
13.981	68.112
14.866	79.592
14.866	63.265
14.913	84.694
15.984	65.306
16.031	80.612
16.963	64.031
16.963	76.531
17.056	88.265
17.942	56.888
17.942	84.439
18.874	92.602
20.085	81.122
20.085	96.429
21.996	82.398
22.928	84.694
22.928	98.214
23.860	86.480
24.047	101.786
24.839	89.286];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'HulsSmit1988';

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
D1 = 'Body temperature guessed';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '6ZSDL'; % Cat of Life
metaData.links.id_ITIS = '176917'; % ITIS
metaData.links.id_EoL = '45516176'; % Ency of Life
metaData.links.id_Wiki = 'Sterna_sumatrana'; % Wikipedia
metaData.links.id_ADW = 'Sterna_sumatrana'; % ADW
metaData.links.id_Taxo = '70339'; % Taxonomicon
metaData.links.id_WoRMS = '212608'; % WoRMS
metaData.links.id_avibase = '9D6704AC5D349A16'; % avibase
metaData.links.id_birdlife = 'black-naped-tern-sterna-sumatrana'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sterna_sumatrana}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sterna_hirundo}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HulsSmit1988'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MU9880234}, ' ...
'author = {K. Hulsman and G. Smith}, ' ... 
'year = {1988}, ' ...
'title = {Biology and Growth of the Blacknaped Tern \emph{Sterna Sumatrana}: An Hypothesis to Explain the Relative Growth Rates of Inshore, Offshore and Pelagic Feeders}, ' ...
'journal = {Emu}, ' ...
'volume = {88}, ' ...
'pages = {234-242}'];
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

