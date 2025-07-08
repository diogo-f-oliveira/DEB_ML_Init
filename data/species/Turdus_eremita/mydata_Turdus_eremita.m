function [data, auxData, metaData, txtData, weights] = mydata_Turdus_eremita
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Turdidae';
metaData.species    = 'Turdus_eremita'; 
metaData.species_en = 'Tristan thrush';

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 10];

%% set data
% zero-variate data

data.ab = 13.5;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'FrasRyan1994: incubation time is unknown'; 
data.tx = 20;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'FrasRyan1994';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 60;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.am = 'value for T. philomelos';
data.am = 17.5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'value for T. philomelos';

data.Wwb = 4.6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'FrasRyan1994';
  comment.Wwb = 'egg length 3.14 cm, width 2.19 cm, weight: pi/9*3.14*2.19^2=5.27 g';
data.Wwi = 88; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'FrasRyan1994';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 to 3 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % scaled time since birth (d), scaled wet weight (g)
1.942	15.121
1.944	18.997
2.429	20.104
2.509	17.197
2.915	21.765
2.953	16.367
3.239	22.734
3.403	28.408
3.886	24.671
3.889	29.792
4.455	31.176
4.457	35.467
4.862	37.128
4.981	32.284
5.349	40.311
5.352	47.785
5.836	45.017
5.955	41.142
6.486	52.353
6.606	50.830
6.848	48.616
6.971	53.599
7.377	57.336
7.423	66.886
7.903	57.751
7.905	62.734
8.431	63.979
8.473	67.439
8.916	63.979
8.957	65.502
9.443	67.301
9.444	67.855
9.887	65.502
9.888	66.471
10.537	73.945
10.580	78.789
11.021	70.761
11.022	71.315
11.344	70.900
11.991	71.453
11.992	72.976
12.477	74.498
12.478	77.405
12.922	75.467
12.961	73.253
13.446	73.806
13.449	79.204
14.498	76.021
14.580	78.097
14.903	77.405
15.108	84.048
15.348	79.896
15.466	73.806
15.915	82.111
15.992	73.806
16.517	73.253
16.922	74.775
16.923	76.298
17.325	72.976
17.411	84.048
17.812	78.235
17.977	85.156
18.504	87.647
18.581	80.311
18.944	78.789];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'FrasRyan1994';
  
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
metaData.links.id_CoL = '477K2'; % Cat of Life
metaData.links.id_ITIS = '561597'; % ITIS
metaData.links.id_EoL = '40582837'; % Ency of Life
metaData.links.id_Wiki = 'Turdus_eremita'; % Wikipedia
metaData.links.id_ADW = 'Nesocichla_eremita'; % ADW
metaData.links.id_Taxo = '4918593'; % Taxonomicon
metaData.links.id_avibase = 'C740512DF96766B1'; % Avibase
metaData.links.id_birdlife = 'tristan-thrush-turdus-eremita'; % Birdlife

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Turdus_eremita}}';
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
bibkey = 'FrasRyan1994'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00306525.1994.9632673}, ' ...
'author = {M. W. Fraser and P. G. Ryan and W. R.J. Dean and D. J. Briggs and C. L. Moloney}, ' ... 
'year = {1994}, ' ...
'title = {BIOLOGY OF THE {T}RISTAN THRUSH \emph{Nesocichla eremita}}, ' ...
'journal = {Ostrich}, ' ...
'volume = {65}, ' ...
'pages = {14-25}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Turdus_philomelos}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1052828/details}}';
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

