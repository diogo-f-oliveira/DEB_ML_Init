function [data, auxData, metaData, txtData, weights] = mydata_Falco_biarmicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Falconiformes'; 
metaData.family     = 'Falconidae';
metaData.species    = 'Falco_biarmicus'; 
metaData.species_en = 'Lanner falcon'; 

metaData.ecoCode.climate = {'A','BWh', 'BSh', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh', '0iTg', '0iTa'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-JX'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 22];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 05];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 32.75;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 41;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 123;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 24*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 48;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 31; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwi = 740.5; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'avibase';
data.Wwim = 510.5; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'avibase';

data.Ri  = 3.75/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.75 eggs per clutch; 1 clutches/yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
2.443	45.369
4.275	52.930
7.634	77.127
9.160	149.716
11.298	217.769
13.130	282.798
14.962	344.802
17.099	403.781
18.321	456.711
20.458	517.202
22.901	565.595
23.206	607.940
24.427	609.452
26.870	669.943
28.092	669.943
29.618	706.238
31.145	697.164
32.672	704.726
32.977	674.480
34.198	669.943
35.420	657.845
37.252	666.919
40.305	666.919
41.527	668.431
42.748	635.161
45.802	601.890
51.298	589.792
54.046	577.694
54.962	565.595
55.878	570.132
58.626	576.181
61.069	586.767
65.344	579.206
68.702	573.157
69.618	582.231
70.840	582.231
76.947	617.013
78.168	604.915
79.389	618.526
80.000	610.964
82.137	615.501
83.664	612.476
84.885	613.989
87.328	601.890
91.298	615.501
93.130	613.989
94.962	617.013
95.878	609.452
98.321	618.526
101.069	609.452
102.595	615.501
103.817	609.452
105.649	609.452
106.260	606.427
108.702	623.062
109.313	613.989
110.534	612.476
112.366	617.013
114.198	613.989
114.809	620.038
117.252	607.940
120.916	618.526
133.130	626.087
134.962	624.575
136.489	626.087
138.015	613.989
141.679	626.087
143.511	626.087
145.954	612.476];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Kemp1975';

% time-weight-feeding rate
data.tWJX = [ ... % time since birth (d), wet weight (g), feeding rate (g/d)
    4  58.2 14.1
    5  64.6 20.6
   54 577.6 33.5
   55 563.1 63.0
   58 578.0 54.5];
units.tWJX   = {'d', 'g', 'g/d'};  label.tWJX = {'time since birth', 'wet weight', 'feeding rate'};  
temp.tWJX    = C2K(40);  units.temp.tWJX = 'K'; label.temp.tWJX = 'temperature';
bibkey.tWJX  = 'Kemp1975'; treat.tWJX = {1, {'weight',' feeding rate'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.tWJX = weights.tWJX * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Scaled functional response varies in time';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '3DTFS'; % Cat of Life
metaData.links.id_ITIS = '175631'; % ITIS
metaData.links.id_EoL = '45514167'; % Ency of Life
metaData.links.id_Wiki = 'Falco_biarmicus'; % Wikipedia
metaData.links.id_ADW = 'Falco_biarmicus'; % ADW
metaData.links.id_Taxo = '52810'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '3D3808E38BB61165'; % avibase
metaData.links.id_birdlife = 'lanner-falcon-falco-biarmicus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Falco_biarmicus}}';
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
bibkey = 'Kemp1975'; type = 'Article'; bib = [ ... 
'author = {A. C. Kemp}, ' ... 
'year = {1975}, ' ...
'title = {THE DEVELOPMENT OF A LANNER FALCON CHICK, \emph{Falco biarmicus} {T}EMMINCK ({A}VES: {F}ALCONIDAE)}, ' ...
'journal = {Anale van die Transvaal Museum}, ' ...
'volume = {29(11)}, ' ...
'pages = {191-197}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=3D3808E38BB61165&sec=lifehistory}}';
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

