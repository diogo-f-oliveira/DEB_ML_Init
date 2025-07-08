function [data, auxData, metaData, txtData, weights] = mydata_Mustela_frenata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Mustelidae';
metaData.species    = 'Mustela_frenata'; 
metaData.species_en = 'Long-tailed weasel'; 

metaData.ecoCode.climate = {'A','BSk', 'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 25;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(39);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 37;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(39);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 162;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(39);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 8.8*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(39);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.1;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwx = 34.6; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';       bibkey.Wwx = 'AnAge';
data.Wwi = 290;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Wwim and tWw_f versus tWw_m data';
data.Wwim = 450; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'ADW';
 comment.Wwim = 'Wiki: 85-267 g, males being about twice as heavy as females';

data.Ri  = 6.2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6.2 pups per litter, 1 litters per yr';
 
% uni-variate data
% time-weight
data.tWw_f = [..., % time since birth (d), body weight (g) 
35.013	83.148
36.440	94.220
37.381	97.125
38.407	103.008
40.216	110.316
41.305	109.477
42.414	117.591
43.200	120.509
44.151	127.891
45.239	126.306
45.886	137.445
47.440	135.073
48.770	137.199
49.643	144.587
51.384	156.379
55.205	193.366
56.259	176.112
57.519	181.975
58.363	175.933
59.698	180.296
60.337	187.705
61.107	183.161
61.487	178.651
62.526	190.503
64.536	182.869
72.890	225.440
79.995	230.804
87.434	210.020
95.010	216.837
102.719	213.194];
units.tWw_f = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f  = C2K(39);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Sand1949';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [..., % time since birth (d), body weight (g) 
35.140	106.272
36.010	112.167
37.335	112.054
38.447	121.661
40.256	128.970
41.205	135.605
42.165	146.717
43.186	150.361
44.058	157.003
45.152	158.403
46.124	175.484
48.223	173.066
49.192	188.655
50.355	185.571
56.293	228.348
57.316	232.738
58.245	229.674
59.450	246.735
60.554	252.611
61.699	241.320
62.678	261.386
65.900	273.797
67.095	285.636
72.554	323.230
74.215	334.282
77.469	325.049
79.503	328.607
81.236	336.668
83.335	334.251
85.175	319.915
85.955	319.848
91.967	324.559
98.886	315.760];
units.tWw_m = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m  = C2K(39);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Sand1949';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '44QWP'; % Cat of Life
metaData.links.id_ITIS = '180556'; % ITIS
metaData.links.id_EoL = '328589'; % Ency of Life
metaData.links.id_Wiki = 'Mustela_frenata'; % Wikipedia
metaData.links.id_ADW = 'Mustela_frenata'; % ADW
metaData.links.id_Taxo = '66694'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14001381'; % MSW3
metaData.links.id_AnAge = 'Mustela_frenata'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mustela_frenata}}';
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
bibkey = 'Sand1949'; type = 'article'; bib = [ ... 
'doi = {10.2307/1375219}, ' ...
'author = {Sanderson, G. C.}, ' ... 
'year = {1949}, ' ...
'title = {Growth and Behavior of a Litter of Captive Long-Tailed Weasels}, ' ...
'journal = {Journal of Mammalogy}, ', ...
'volume = {30(4)}, ' ...
'pages = {412-415}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Mustela_frenata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

