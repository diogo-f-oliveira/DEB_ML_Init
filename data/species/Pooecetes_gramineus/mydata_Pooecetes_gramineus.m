function [data, auxData, metaData, txtData, weights] = mydata_Pooecetes_gramineus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Passerellidae';
metaData.species    = 'Pooecetes_gramineus'; 
metaData.species_en = 'Vesper  sparrow'; 

metaData.ecoCode.climate = {'BSh','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tnpf', 'Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 12];

%% set data
% zero-variate data

data.ab = 12;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '11-13 d';
data.tx = 10;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'DawsEvan1960';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 30;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 7.9*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.3;      units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'DawsEvan1960';
data.Wwi = 25.15;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
 
data.Ri  = 4/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-6 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)-0.015	2.161
0.000	2.065
0.009	2.340
0.021	2.606
0.021	2.606
0.022	2.490
0.022	2.380
0.022	2.380
0.022	2.211
0.022	2.211
0.022	2.211
0.023	1.782
0.023	1.782
0.048	1.985
0.048	1.985
0.996	3.917
1.009	3.267
1.009	3.267
1.010	3.070
1.010	3.070
1.010	3.018
1.010	3.018
1.010	2.984
1.021	3.701
1.021	3.701
1.022	3.477
1.022	3.477
1.048	2.649
1.996	5.139
1.997	4.435
1.997	4.435
1.997	4.435
1.997	4.435
1.997	4.073
1.998	3.849
2.009	5.110
2.009	4.747
2.009	4.747
2.009	4.747
2.021	5.921
2.033	6.126
2.035	3.982
2.035	3.982
2.983	9.857
3.021	7.813
3.023	5.224
3.046	7.424
3.046	7.424
3.046	7.424
3.047	6.857
3.047	6.516
3.047	6.516
3.060	6.122
3.060	6.122
3.060	6.019
3.983	12.859
3.983	11.945
3.983	11.546
3.984	11.160
3.984	10.135
3.984	10.135
3.984	10.135
3.997	9.361
3.997	9.256
4.022	8.647
4.984	14.152
4.984	13.372
4.984	13.372
4.984	13.372
4.997	12.779
4.997	12.779
4.997	12.779
4.997	12.282
4.997	12.282
4.997	12.282
4.998	10.659
4.998	10.479
5.997	17.643
6.010	13.670
6.023	15.139
6.023	15.139
6.023	15.139
6.023	15.139
6.023	14.305
6.023	14.305
6.035	17.247
6.035	16.576
6.997	21.260
6.998	18.661
6.998	17.733
6.999	14.708
7.011	17.043
7.011	16.567
7.011	16.567
7.011	16.473
7.011	15.832
7.011	15.477
7.987	18.757
7.987	18.336
7.987	17.623
7.987	16.842
8.988	18.746
9.001	17.316
9.001	17.316
9.001	17.316
9.001	15.199
9.989	19.057
9.989	18.524];
n = size(data.tW,1); for i=2:n; if data.tW(i,1)<= data.tW(i-1,1); data.tW(i,1) = data.tW(i-1,1)+1e-4; end; end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'DawsEvan1960';

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
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '6VVTQ'; % Cat of Life
metaData.links.id_ITIS = '179366'; % ITIS
metaData.links.id_EoL = '45511216'; % Ency of Life
metaData.links.id_Wiki = 'Pooecetes_gramineus'; % Wikipedia
metaData.links.id_ADW = 'Pooecetes_gramineus'; % ADW
metaData.links.id_Taxo = '85912'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '3647E146F88AE943'; % avibase
metaData.links.id_birdlife = 'vesper-sparrow-pooecetes-gramineus'; % birdlife
metaData.links.id_AnAge = 'Pooecetes_gramineus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zonotrichia_capensis}}';
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
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=3647E146F88AE943&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Pooecetes_gramineus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DawsEvan1960'; type = 'article'; bib = [ ...  
'title = {Relation of Growth and Development to Temperature Regulation in Nestling Vesper Sparrows}, ' ...
'journal = {The Condor}, ' ...
'year = {1960}, ' ...
'author = {William R. Dawson and Francis C. Evans}, ' ...
'volume = {62(5)}, ' ...
'pages = {329-340}'];
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

