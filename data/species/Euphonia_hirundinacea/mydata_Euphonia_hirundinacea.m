function [data, auxData, metaData, txtData, weights] = mydata_Euphonia_hirundinacea
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Fringillidae';
metaData.species    = 'Euphonia_hirundinacea'; 
metaData.species_en = 'Yellow-throated euphonia';

metaData.ecoCode.climate = {'A','Cwa'};
metaData.ecoCode.ecozone = {'THn','TN'};
metaData.ecoCode.habitat = {'0iTht', '0iThh'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 11];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 11];

%% set data
% zero-variate data

data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Sarg1993';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 19;        units.tp = 'd';    label.tp = 'time since birth at fledging'; bibkey.tp = 'Sarg1993';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 1.48;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 1.1;      units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Sarg1993';
data.Wwi = 15.2;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
 
data.Ri  = 1.25*4.6/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Sarg1993';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'avibase 4.6 eggs per clutch; 1 clutch per yr, possibly 2';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.044	1.393
0.095	1.288
0.095	1.130
0.949	2.026
0.950	1.868
0.951	1.527
1.904	2.817
1.955	2.633
1.957	2.292
2.981	4.344
2.982	4.266
3.011	3.504
3.012	3.215
3.013	2.978
3.015	2.611
3.963	4.873
4.045	3.691
4.967	5.953
4.969	5.533
4.971	5.244
4.971	5.113
4.972	4.903
4.975	4.298
4.976	4.193
5.957	4.853
5.957	4.853
5.975	6.298
5.975	6.193
5.976	5.983
6.958	6.459
6.980	7.037
6.995	9.139
7.004	7.352
7.024	8.403
7.053	7.668
7.069	9.428
7.961	7.697
7.970	10.981
7.971	10.823
7.974	10.140
7.991	6.804
8.029	9.326
8.031	8.932
8.955	10.879
8.975	11.798
8.978	11.194
8.981	10.695
8.983	10.354
8.988	9.303
9.923	9.069
9.958	12.117
9.974	14.008
9.981	12.616
9.986	11.618
9.987	11.408
9.988	11.145
10.957	14.090
10.975	10.649
10.987	13.302
10.988	12.935
10.990	12.567
10.991	12.383
10.992	12.304
11.924	12.517
11.971	13.253
11.973	12.806
11.994	13.673
11.995	13.542
12.933	12.705
12.950	14.255
12.951	14.097
12.959	12.521
12.961	12.074
13.986	14.100
13.986	14.021
13.991	13.050
13.996	12.156
15.021	14.025
15.026	12.922
16.003	14.370
16.010	13.030];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-4;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Sarg1993';

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
D1 = 'food availability is taken variable in tW data';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '6GZCP'; % Cat of Life
metaData.links.id_ITIS = '560021'; % ITIS
metaData.links.id_EoL = '45510368'; % Ency of Life
metaData.links.id_Wiki = 'Euphonia_hirundinacea'; % Wikipedia
metaData.links.id_ADW = 'Euphonia_hirundinacea'; % ADW
metaData.links.id_Taxo = '87161'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '3CD68A81E992C246'; % avibase
metaData.links.id_birdlife = 'yellow-throated-euphonia-euphonia-hirundinacea'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Euphonia_hirundinacea}}';
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
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=3CD68A81E992C246&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sarg1993'; type = 'article'; bib = [ ...  
'title = {NESTING BIOLOGY OF THE YELLOW-THROATED EUPHONIA: {L}ARGE CLUTCH SIZE IN A NEOTROPICAL FRUGIVORE}, ' ...
'journal = {Wilson Bull.}, ' ...
'year = {1993}, ' ...
'author = {Sarah Sargent}, ' ...
'volume = {105(2)}, ' ...
'pages = {285-300}'];
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

