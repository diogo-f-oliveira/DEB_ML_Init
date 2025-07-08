function [data, auxData, metaData, txtData, weights] = mydata_Ciconia_ciconia

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Ciconiiformes'; 
metaData.family     = 'Ciconiidae';
metaData.species    = 'Ciconia_ciconia'; 
metaData.species_en = 'European white Stork'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg', '0iTs', 'xiFm'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCva', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.5); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2011 01 16];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};  

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 10 09];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};  

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 32;    units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'CramSimm2004';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'tamp from Rahn1991';
data.tx = 61;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'CramSimm2004';   
  temp.tx = C2K(40.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temps from TortCast2003';
data.tp = 183;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temps from TortCast2003';
data.tR = 1460;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'CramSimm2004';
  temp.tR = C2K(40.5);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 14235; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'TacuCrai2013';   
  temp.am = C2K(40.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 112.5; units.Li  = 'cm'; label.Li  = 'ultimate total length';       bibkey.Li  = 'CramSimm2004';

data.Wwb = 72.5;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';         bibkey.Wwb = {'CramSimm2004','MichZorn2002'};
data.Wwi = 3296.25; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = {'SnowPerr1998','MichZorn2002'};

data.Ri  = 4.8/265; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'CramSimm2004';   
  temp.Ri = C2K(40.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
0 79.15069698;
1	90.73370856;
1	171.8147896;
2	192.0850599;
2	87.83795567;
3	174.7105425;
4	250.0001178;
4	192.0850599;
5	221.0425889;
5	278.9576468;
5	333.9769518;
5	383.204751;
6	302.12367;
6	241.3128591;
6	490.3476082;
7	310.8109286;
7	357.142975;
7	432.4325503;
7	267.3746352;
8	386.1005039;
8	481.6603495;
9	594.5947124;
9	527.9923958;
10	530.8881487;
10	574.3244422;
10	640.9267588;
10	669.8842877;
11	533.7839016;
11	556.9499248;
11	727.7993456;
11	788.6101564;
12	519.3051371;
12	611.9692298;
12	687.2588051;
12	797.2974151;
12	866.7954846;
12	1049.227917;
13	1075.289693;
13	652.5097703;
13	973.9383418;
14	1020.270388;
14	924.7105425;
15	1075.289693;
15	1133.204751;
15	713.3205812;
15	820.4634383;
16	1072.39394;
16	1138.996257;
16	1205.598573;
17	1220.077338;
17	1312.741431;
18	1081.081199;
18	1327.220195;
18	1443.050311;
18	1553.088921;
18	1596.525214;
18	1668.919037;
19	1524.131392;
19	1920.849539;
19	1419.884288;
19	1625.482743;
20	1718.146836;
20	1781.8534;
20	1666.023284;
21	1518.339886;
21	1674.710543;
22	1758.687377;
22	2129.343747;
22	1813.706682;
22	1857.142975;
23	1619.691238;
23	1952.702821;
23	1868.725987;
23	2161.197029;
23	2250.965369;
23	2288.610156;
24	2277.027145;
24	1871.621739;
24	2077.220195;
24	2369.691238;
24	2436.293554;
25	2022.20089;
25	2277.027145;
26	2369.691238;
26	2433.397801;
26	2172.780041;
26	2242.27811;
27	2682.43255;
27	2775.096643;
27	2019.305137;
28	2375.482743;
28	2528.957647;
28	2740.347608;
28	2682.43255;
28	2882.2395;
29	2806.949925;
29	2317.567685;
29	2387.065755;
30	2876.447994;
30	2630.308998;
30	3082.04645;
31	2977.799346;
31	2523.166141;
31	2873.552241;
31	3032.818651;
32	2578.185446;
32	2870.656488;
33	2870.656488;
33	2931.467299;
34	2925.675794;
34	2992.27811;
35	3348.455716;
35	2676.641044;
35	3206.563824;
35	3296.332164;
36	2734.556102;
36	2885.135253;
36	2980.695099;
37	2879.343747;
37	3082.04645;
37	3166.023284;
38	2937.258805;
38	3235.521353;
39	3432.43255;
40	2925.675794;
40	3151.544519;
41	3194.980813;
41	3244.208612;
42	3102.31672;
42	3212.35533;
43	3189.189307;
43	3296.332164;
44	3302.12367;
44	3484.556102;
45	3197.876566;
46	3186.293554;
47	3258.687377;
47	3354.247222;
48	3276.061894;
48	3371.621739;
49	3166.023284;
49	3328.185446;
50	3429.536797;
50	3244.208612;
51	3406.370774;
51	3192.08506];
n=size(data.tW,1);for i=2:n; if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-3;end;end  
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'TsacLior2005';
  
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
D1 = 'mod_2: v reduced to better match reality, WwR removed, food variable';
D2 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '5Z5T3'; % Cat of Life
metaData.links.id_ITIS = '174907'; % ITIS
metaData.links.id_EoL = '45513558'; % Ency of Life
metaData.links.id_Wiki = 'Ciconia_ciconia'; % Wikipedia
metaData.links.id_ADW = 'Ciconia_ciconia'; % ADW
metaData.links.id_Taxo = '51849'; % Taxonomicon
metaData.links.id_WoRMS = '1037305'; % WoRMS
metaData.links.id_avibase = '28825494A08AFE5A'; % avibase
metaData.links.id_birdlife = 'white-stork-ciconia-ciconia'; % birdlife
metaData.links.id_AnAge = 'Ciconia_ciconia'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ciconia_ciconia}}';
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
bibkey = 'TacuCrai2013'; type = 'Article'; bib = [ ... 
'author = {Tacutu, R. and Craig, T. and Budovsky, A. and Wuttke, D. and Lehmann, G. and Taranukha, D. and Costa, J. and Fraifeld, V. E. and de Magalh\~{a}es, J. P.}, ' ... 
'year = {2013}, ' ...
'title = {Human Ageing Genomic Resources: Integrated databases and tools for the biology and genetics of ageing}, ' ...
'journal = {Nucleic Acids Research}, ' ...
'volume = {41}, ' ...
'pages = {D1027--D1033}'];
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
bibkey = 'MichZorn2002'; type = 'Article'; bib = [ ... 
'author = {Michard-Picamelot, D. and Zorn, T. and Gendner, J.-P. and Mata, A. J. and Le Maho, Y.}, ' ... 
'year = {2002}, ' ...
'title = {Body protein does not vary despite seasonal changes in fat in the White Stork \emph{Ciconia ciconia}}, ' ...
'journal = {Ibis}, ' ...
'volume = {144}, ' ...
'pages = {E1--E10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rahn1991'; type = 'Incollection'; bib = [ ... 
'author = {Rahn, H.}, ' ... 
'year = {1991}, ' ...
'title = {Why birds lay eggs.}, ' ...
'booktitle = {Egg incubation: its effects on embryonic development in birds and reptiles}, ' ...
'editor = {Deeming, D. C. and Fergunson, M. W. J}, ' ...
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
bibkey = 'TsacLior2005'; type = 'Article'; bib = [ ... 
'author = {Tsachalidis, E. P. and Liordos, V. and Goutner, V.}, ' ... 
'year = {2005}, ' ...
'title = {Growth of White Stork \emph{Ciconia ciconia} nestlings}, ' ...
'journal = {Ardea}, ' ...
'volume = {93}, ' ...
'pages = {133--137}'];
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

