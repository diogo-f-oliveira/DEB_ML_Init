function [data, auxData, metaData, txtData, weights] = mydata_Morus_bassanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Suliformes'; 
metaData.family     = 'Sulidae';
metaData.species    = 'Morus_bassanus'; 
metaData.species_en = 'Northern gannet'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 01 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 22];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 02];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 02];

%% set data
% zero-variate data

data.ab = 43;  units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Body temp from ShalWhit1973 as target, but varies considerably';
data.tx = 100; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ADW';   
  temp.tx = C2K(40.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Data for S. sula, 91 till > 139 d';
data.tp = 300; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Data for S. sula, 91 till > 139 d';
data.tR = 730;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'Data for S. sula, 2-3 yr';
data.am = 37.4*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(40.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 80; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwi = 4000; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'MontRick1984';
  comment.Wwi = 'asymptotic weight of nestling, adults are 3300 g (MontRick1984)';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'AnAge: 1 clutch/yr';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
2.813	99.382
4.570	142.061
4.746	99.685
5.449	113.930
6.152	121.108
6.328	170.605
6.504	227.170
7.031	170.716
7.559	227.335
7.734	234.430
8.262	255.714
8.789	319.402
9.141	284.121
9.492	404.318
9.844	361.970
9.845	390.239
10.547	439.819
11.777	411.744
11.778	383.475
12.656	489.620
13.359	581.603
13.711	475.652
14.063	553.445
14.766	737.301
14.767	800.905
14.941	666.657
15.469	822.217
15.645	532.492
15.996	567.883
16.875	921.378
17.227	836.628
17.930	759.000
18.105	1020.511
18.808	737.936
18.809	1055.957
18.984	1020.649
19.160	1084.281
19.161	1140.818
19.863	1225.734
20.039	1140.956
20.742	1225.872
21.973	1289.670
22.500	1042.403
22.852	1537.158
24.434	1742.353
25.313	1389.134
26.016	1841.542
26.895	2004.224
27.949	1841.845
29.004	1728.937
30.234	2195.561
30.586	2428.832
30.938	2075.530
31.992	1906.084
32.344	2266.564
33.750	2295.053
36.035	2295.412
37.266	2656.029
38.320	2656.195
40.430	3002.816
40.781	3123.012
42.188	2607.332
43.770	3045.743
43.945	3314.322
47.813	3413.869
48.516	3922.814
49.219	3089.002
50.801	3795.964
52.031	3096.511
54.141	3782.354
54.316	3351.286
56.426	3634.303
56.953	3203.291
59.063	3394.435
60.469	3988.295
61.172	3741.056
65.215	3536.744
67.500	3685.512
69.082	4152.192
70.664	4124.172
72.246	3792.265
74.355	3728.992
78.926	3800.381
80.332	4761.733
81.563	3595.848
86.133	4621.301
86.660	3716.790
89.824	3717.287];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'MontRick1984';
  
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
D2 = 'Long tp cannot be captured by std model';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '7436N'; % Cat of Life
metaData.links.id_ITIS = '174712'; % ITIS
metaData.links.id_EoL = '45509065'; % Ency of Life
metaData.links.id_Wiki = 'Morus_bassanus'; % Wikipedia
metaData.links.id_ADW = 'Morus_bassanus'; % ADW
metaData.links.id_Taxo = '51654'; % Taxonomicon
metaData.links.id_WoRMS = '148776'; % WoRMS
metaData.links.id_avibase = '534FB490884C6D33'; % avibase
metaData.links.id_birdlife = 'northern-gannet-morus-bassanus'; % birdlife
metaData.links.id_AnAge = 'Morus_bassanus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Morus_bassanus}}';
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
bibkey = 'MontRick1984'; type = 'Article'; bib = [ ... 
'author = {W. A. Montevecchi and R. E. Ricklefs and I. R. Kirkham and D. Gabaldon}, ' ... 
'year = {1984}, ' ...
'title = {Growth energetics of nestling northern gannets (\emph{Sula bassanus})}, ' ...
'journal = {The Auk}, ' ...
'volume = {101}, ' ...
'pages = {334--341}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Morus_bassanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Sula_sula/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShalWhit1973'; type = 'Article'; bib = [ ... 
'author = {R. J. Shallenberger and G. C. Whittow and R. M. Smith }, ' ... 
'year = {1973}, ' ...
'title = {BODY TEMPERATURE OF THE NESTING RED-FOOTED BOOBY (\emph{Sula sula}) }, ' ...
'journal = {Can. Wildl. Serv. Rept. Ser.}, ' ...
'volume = {17}, ' ...
'pages = {36}'];
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

