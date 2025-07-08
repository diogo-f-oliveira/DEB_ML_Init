function [data, auxData, metaData, txtData, weights] = mydata_Parus_major

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Paridae';
metaData.species    = 'Parus_major'; 
metaData.species_en = 'Great tit'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'THp', 'TPi'};
metaData.ecoCode.habitat = {'0iTf', '0iTh', '0iTi'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2010 09 16];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 10 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 17];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 12 02];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_4     = [2023 07 08];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 13.8;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'CramSimm2004';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from Rahn1991'; 
data.tx = 19;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SnowPerr1998';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temp from Bale1973, CareOers2004';
data.tp = 57;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temp from Bale1973, CareOers2004';
data.tR = 365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';bibkey.tR = 'TacuCrai2013';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 5475;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Rydz1978';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = {'CramSimm2004','Mert1977','Mert1987'};
data.Wwi = 17.9;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 19.05;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'avibase';

data.Ri = 16.8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'CramSimm2004';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki upto 18 eggs/clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1	2.154991241;
1	2.302207798;
1	2.098463895;
1	2.251083747;
1	2.411377323;
2	3.497308385;
2	2.432441909;
2	3.175423142;
2	3.688855564;
3	4.0962728;
3	4.729240225;
3	4.34720642;
3	5.089749482;
3	4.371196213;
3	4.713728981;
4	5.692693567;
4	4.99531704;
4	6.426961898;
4	5.391321003;
4	5.698438941;
5	8.59942749;
5	7.398750679;
5	7.057260655;
5	8.338042525;
5	7.571871122;
6	8.717242774;
6	8.494364645;
6	8.796891012;
6	8.54275027;
6	8.692428372;
7	11.45198071;
7	12.31302186;
7	10.45394901;
7	11.90514008;
7	11.32488249;
8	11.30095997;
8	11.0345496;
8	13.33357248;
8	11.45532116;
8	11.98836979;
8	11.23670945;
9	14.18594183;
9	13.35557549;
9	14.37995826;
9	14.97048225;
9	14.16494126;
10	14.26070069;
10	15.46607184;
10	13.21308958;
10	14.55903211;
10	13.60618369;
11	16.60473214;
11	15.23521343;
12	15.64921181;
12	16.36612522;
12	17.00893043;
12	14.53206733;
12	16.35957409;
13	17.30670395;
13	15.98832307;
13	17.3169551;
14	16.16670836;
14	16.72493159;
14	17.57177865;
15	17.13327597;
15	17.11441716;
15	17.80929946;
15	17.141114;
16	18.10017353;
16	16.69548936;
16	17.10668249;
16	17.11974801;
17	18.10756663;
17	16.94036276;
17	17.17923541;
17	17.90916313;
18	18.13340294;
19	17.92526777];
for i=2:size(data.tW,1); if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-8; end; end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Bale1973';
  
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
D1 = 'Males are assumed to differ from females by {p_Am} only'; 
D2 = 'mod_3: v is reduced; males taken different from females, WwR and Li removed';
D3 = 'mod_4: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '75SVV'; % Cat of Life
metaData.links.id_ITIS = '561864'; % ITIS
metaData.links.id_EoL = '45515267'; % Ency of Life
metaData.links.id_Wiki = 'Parus_major'; % Wikipedia
metaData.links.id_ADW = 'Parus_major'; % ADW
metaData.links.id_Taxo = '57713'; % Taxonomicon
metaData.links.id_WoRMS = '558568'; % WoRMS
metaData.links.id_avibase = '7296BC772F2643AD'; % avibase
metaData.links.id_birdlife = 'great-tit-parus-major'; % birdlife
metaData.links.id_AnAge = 'Parus_major'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parus_major}}';
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
bibkey = 'CramSimm2004'; type = 'Book'; bib = [ ... 
'author = {Cramp, S. and Simmons, K. E. L.}, ' ... 
'year = {2004}, ' ...
'title = {BWPi: Birds of the Western Palearctic interactive (DVD-ROM)}, ' ...
'howpublished = {DVD-ROM}, ' ...
'publisher = {BirdGuides Ltd}, '...
'address = {Sheffield}'];
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
bibkey = 'Rahn1991'; type = 'Incollection'; bib = [ ... 
'author = {Rahn, H.}, ' ... 
'year = {1991}, ' ...
'title = {Why birds lay eggs}, ' ...
'booktitle = {Egg incubation: its effects on embryonic development in birds and reptiles}, ' ...
'editor = {Deeming, D. C. and Fergunson, M. W. J.}, ' ...
'publisher = {Cambridge University Press}, '...
'address = {Cambridge}'];
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
bibkey = 'Rydz1978'; type = 'Article'; bib = [ ... 
'author = {Rydzewski, W.}, ' ... 
'year = {1978}, ' ...
'title = {The longevity of ringed birds}, ' ...
'journal = {Ring}, ' ...
'volume = {96}, ' ...
'pages = {218--262}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mert1987'; type = 'Article'; bib = [ ... 
'author = {Mertens, J. A. L.}, ' ... 
'year = {1987}, ' ...
'title = {The influence of temperature on the energy reserves of female great tits during the breeding-season}, ' ...
'journal = {ARDEA}, ' ...
'volume = {75}, ' ...
'pages = {73--80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mert1977'; type = 'Article'; bib = [ ... 
'author = {Mertens, J. A. L.}, ' ... 
'year = {1977}, ' ...
'title = {Thermal Conditions for Successful Breeding in Great Tits (\emph{Parus major} {L}.)}, ' ...
'journal = {Oecologia (Berl.)}, ' ...
'volume = {28}, ' ...
'pages = {1--29}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CramPerr1993'; type = 'Book'; bib = [ ... 
'author = {Cramp, S. and Perrins, C. M.}, ' ... 
'year = {1993}, ' ...
'title = {Flycatchers to Shrikes}, ' ...
'series = {Handbook of the Birds of Europe, the Middle East and North Africa, The Birds of the Western Palearctic}, ' ...
'volume = {VII}, ' ...
'publisher = {Oxford University Press}, '...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CareOer2004'; type = 'Article'; bib = [ ... 
'author = {Carere, C. and van Oers, K.}, ' ... 
'year = {2004}, ' ...
'title = {Shy and bold great tits (\emph{Parus major}): body temperatura and breath rate in response to handling stress}, ' ...
'journal = {Physiology \& Behavior}, ' ...
'volume = {82}, ' ...
'pages = {905--912}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bale1973'; type = 'Article'; bib = [ ... 
'author = {Balen, J.H. van}, ' ... 
'year = {1973}, ' ...
'title = {A comparative study of the breeding ecology of the great tit Parus major in different habitats}, ' ...
'journal = {Ardea}, ' ...
'volume = {61}, ' ...
'pages = {1--93}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=7296BC772F2643AD&sec=lifehistory}}';
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

