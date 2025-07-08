function [data, auxData, metaData, txtData, weights] = mydata_Ardenna_tenuirostris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Ardenna_tenuirostris'; 
metaData.species_en = 'Short-tailed shearwater'; 

metaData.ecoCode.climate = {'M'};
metaData.ecoCode.ecozone = {'MS', 'MA', 'MI'};
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

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 09 14];              
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
% zero-variate data

data.ab = 53;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '52 till 58';
data.tx = 82; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SaffBrad2000';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 246; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 5*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'value for Puffinus puffinus';
data.am = 39.9*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 77; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SaffBrad2000';
data.Wwi = 700; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'SaffBrad2000';
  comment.Wwi = 'Asymptotic mass prior to fledging, mean adult mass 499.4 g (AnAge)';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% titme-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.000	77.037
0.340	100.741
1.394	91.852
2.222	103.704
3.056	108.148
4.097	117.037
4.277	154.074
5.701	207.407
6.725	237.037
7.758	254.815
8.371	274.074
9.196	290.370
10.660	293.333
11.521	263.704
12.790	247.407
14.269	231.111
15.955	217.778
17.013	202.963
17.973	314.074
18.145	361.481
19.793	397.037
20.661	358.519
21.305	337.778
22.788	317.037
24.057	300.741
24.824	391.111
25.184	465.185
26.361	567.407
27.234	521.481
28.739	472.593
29.179	445.926
30.666	419.259
31.522	395.556
32.790	380.741
33.354	462.222
34.363	511.111
35.350	588.148
35.812	533.333
37.312	488.889
38.163	472.593
39.230	447.407
40.291	429.630
41.431	577.778
42.243	610.370
43.273	632.593
44.560	594.074
45.636	557.037
46.490	536.296
47.971	517.037
48.192	502.222
48.949	604.444
50.187	628.148
51.604	690.370
52.061	642.963
53.130	614.815
54.825	589.630
55.255	574.815
56.811	727.407
57.453	709.630
59.046	814.815
59.059	798.519
59.927	760.000
60.994	734.815
62.484	703.704
63.136	674.074
64.612	660.741
65.678	637.037
66.425	752.593
66.812	792.593
68.887	817.778
69.556	765.926
70.628	733.333
71.282	700.741
72.140	675.556
73.408	660.741
74.055	637.037
75.532	622.222
76.802	605.926
77.987	696.296
78.780	754.074
79.860	711.111
80.093	681.481
81.368	657.778
82.425	645.926];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'SaffBrad2000';
  
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
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4QFY6'; % Cat of Life
metaData.links.id_ITIS = '174554'; % ITIS
metaData.links.id_EoL = '1047365'; % Ency of Life
metaData.links.id_Wiki = 'Ardenna_tenuirostris'; % Wikipedia
metaData.links.id_Taxo = '4974671'; % Taxonomicon
metaData.links.id_WoRMS = '225770'; % WoRMS
metaData.links.id_avibase = '60825BF601060350'; % Avibase
metaData.links.id_birdlife = 'short-tailed-shearwater-ardenna-tenuirostris'; % Birdlife
metaData.links.id_AnAge = 'Puffinus_tenuirostris'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Puffinus_tenuirostris}}';
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
bibkey = 'SaffBrad2000'; type = 'Article'; bib = [ ... 
'author = {V. M. Saffer and J. S. Bradley and R.D. Wooller and C. E. Meathrel}, ' ... 
'year = {2000}, ' ...
'title = {Patterns of Growth in Nestling Short-tailed Shearwaters \emph{Puffinus tenuirostris}}, ' ...
'journal = {Emu}, ' ...
'volume = {100}, ' ...
'pages = {42-48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1047353/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Puffinus_tenuirostris}}';
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

