function [data, auxData, metaData, txtData, weights] = mydata_Larus_argentatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Larus_argentatus'; 
metaData.species_en = 'European herring gull'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFe', '0iMm', 'biMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf', 'biCi', 'biSi', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Wwe'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 01 13];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 09 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 25];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 08 29];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_4     = [2023 06 27];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 29;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'SnowPerr1998';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care.';
data.tx = 37.5;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SnowPerr1998';   
  temp.tx = C2K(40.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 112.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1095;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'CramSimm1983';
  temp.tR = C2K(40.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 17885; units.am = 'd';    label.am = 'life span';                bibkey.am = 'TacuCrai2013';   
  temp.am = C2K(40.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 59.5; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SnowPerr1998';

data.Wwb = 67.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ADW';
data.Wwi = 1015; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
data.Wwim = 1147; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 0.008219178; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'SnowPerr1998';   
  temp.Ri = C2K(40.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1 69.52696712;
2	68.94893897;
3	83.30680947;
4	98.93510338;
5	122.4443155;
6	144.9109669;
7	170.243817;
8	192.9461391;
9	224.13983;
10	248.0227674;
11	280.5893911;
12	313.3400295;
13	344.1940895;
14	375.5806676;
15	416.7607423;
16	452.0594168;
17	486.4754281;
18	521.6820331;
19	552.322882;
20	586.7062324;
21	607.4576326;
22	645.4833918;
23	672.5593136;
24	702.9649507;
25	734.9824264;
26	756.0352026;
27	805.123087;
28	836.8619267;
29	858.9499035;
30	883.2174462;
31	911.7646603;
32	929.8729861;
34	973.1895902;
35	987.1032051;
36	991.8646933;
37	984.7886083;
38	1011.792411;
39	1012.46694;
40	1017.84917;
41	1010.664395;
42	1020.7128];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Spaa1971';

% time-embryo weight
data.tWe = [ ... % age (d), embryo weight (g)
6.928	2.141
7.401	1.681
7.868	2.264
7.873	1.568
8.864	2.851
9.785	5.871
9.809	2.279
10.245	7.497
10.799	3.793
11.103	2.289
11.917	3.686
12.871	10.531
13.734	4.627
14.799	12.516
14.926	11.126
15.846	5.570
15.928	10.786
16.881	9.055
16.908	13.807
17.677	13.118
17.768	34.559
17.803	11.960
18.017	15.090
18.476	16.832
18.808	19.964
18.877	18.342
18.960	14.750
19.006	16.721
19.758	18.581
19.931	27.854
20.699	18.588
20.701	27.164
20.849	31.337
22.711	34.365
22.808	37.379
22.854	39.350
22.872	27.876
23.350	35.529
23.693	37.038
24.724	41.218
26.795	56.880
27.664	67.665
27.775	59.785];
units.tWe   = {'d', 'g'};  label.tWe = {'age', 'embryo wet weight'};  
temp.tWe    = temp.ab;  units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'Harr1964';
comment.tWe = 'Mean temp is guessed and equal to ab';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tWe = weights.tWe * 2;
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
D1 = 'Feeding is slightly reduced towards end of nestling period';
D2 = 'Long tp cannot be captured by std model';
D3 = 'males are assumed to differ from females by {p_Am} only';
D4 = 'mod_3: tWw and Wwim data added, males different from females';
D5 = 'mod_4: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '3SBPN'; % Cat of Life
metaData.links.id_ITIS = '176824'; % ITIS
metaData.links.id_EoL = '45509300'; % Ency of Life
metaData.links.id_Wiki = 'Larus_argentatus'; % Wikipedia
metaData.links.id_ADW = 'Larus_argentatus'; % ADW
metaData.links.id_Taxo = '53781'; % Taxonomicon
metaData.links.id_WoRMS = '137138'; % WoRMS
metaData.links.id_avibase = 'F002188E226DF09C'; % avibase
metaData.links.id_birdlife = 'european-herring-gull-larus-argentatus'; % birdlife
metaData.links.id_AnAge = 'Larus_argentatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Larus_argentatus}}';
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
bibkey = 'SnowPerr1998'; type = 'Book'; bib = [ ... 
'author = {Snow, D. W. and Perrins, C. M.}, ' ... 
'year = {1998}, ' ...
'title = {The Birds of the Western Palearctic, Concise Edition}, ' ...
'publisher = {Oxford University Press}, ' ...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TacuCrai2013'; type = 'Article'; bib = [ ... 
'author = {Tacutu, R. and Craig, T. and Budovsky, A. and Wuttke, D. and Lehmann, G. and Taranukha, D. and Costa, J. and Fraifeld, V. E. and de Magalh\~{a}es, J. P.}, ' ... 
'year = {2013}, ' ...
'title = {Human Ageing Genomic Resources: Integrated databases and tools for the biology and genetics of ageing}, ' ...
'journal = {Nucleic Acids Research}, ' ...
'volume = {41}, ' ...
'pages = {D1027--D1033}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CramSimm1983'; type = 'Incollection'; bib = [ ... 
'author = {Cramp, S. and Simmons, K. E. L.}, ' ... 
'year = {1983}, ' ...
'title = {Waders to Gulls}, ' ...
'booktitle = {Handbook of the Birds of Europe, the Middle East and North Africa, The Birds of the Western Palearctic}, ' ...
'volume = {III}, ' ...
'publisher = {Oxford University Press}, '...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Spaa1971'; type = 'Article'; bib = [ ... 
'author = {Spaans, A. L.}, ' ... 
'year = {1971}, ' ...
'title = {On the feeding ecology of the Herring Gull \emph{Larus argentatus} {P}ont, in the Northern part of the {N}etherlands}, ' ...
'journal = {Ardea}, ' ...
'volume = {59}, ' ...
'pages = {98--188}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rahn1991'; type = 'Incollection'; bib = [ ... 
'author = {Rahn, H.}, ' ... 
'year = {1991}, ' ...
'title = {Why birds lay eggs}, ' ...
'booktitle = {Egg incubation: its effects on embryonic development in birds and reptiles}, ' ...
'editor = {Deeming, D. C. and Fergunson, M. W. J.}, ' ...
'publisher = {Cambridge University Press}, '...
'pages = {345--360}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Larus_argentatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harr1964'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1474-919X.1964.tb03725.x }, ' ...
'author = {M. P. Harris}, ' ... 
'year = {1964}, ' ...
'title = {ASPECTS OF THE BREEDING BIOLOGY OF THE GULLS \emph{Larus argentatus}, \emph{L. fuscus} and \emph{L. marinus}}, ' ...
'journal = {Ibis}, ' ...
'volume = {106}, ' ...
'pages = {432-456}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\urlhttps://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=F002188E226DF09C&sec=lifehistory}}';
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

