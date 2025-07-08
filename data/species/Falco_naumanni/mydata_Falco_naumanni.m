function [data, auxData, metaData, txtData, weights] = mydata_Falco_naumanni

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Falconiformes'; 
metaData.family     = 'Falconidae';
metaData.species    = 'Falco_naumanni'; 
metaData.species_en = 'Lesser kestrel'; 

metaData.ecoCode.climate = {'BSk', 'BWk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTg', '0iTa'};
metaData.ecoCode.embryo  = {'Tnwfm', 'Tncfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira';'Bas Kooijman'};    
metaData.date_subm = [2011 08 20];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 11 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 05];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 28.5;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'SnowPerr1998';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from SchwWeav1977'; 
data.tx = 28;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SnowPerr1998';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temperature from DaanMasm1991,DawsWhit1999';
data.tp = 84;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temperature from DaanMasm1991,DawsWhit1999';
data.tR = 365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'CramSimm1980';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 3979;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'TacuCrai2013';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 10.3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = {'DaanMasm1991','CatrFran2011'};
data.Wwi = 170; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 133; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'CramSimm2004';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1 10.29519317;
1 12.41061959;
1 15.87215805;
1 14.33373832;
2 15.58637209;
2 17.60564467;
2 18.75949082;
2 20.29795236;
3 20.49297745;
3 19.62763464;
3 21.45455771;
3 26.35840387;
3 30.30071156;
3 22.89690721;
3 24.05075337;
3 28.0892149;
3 32.70459952;
3 18.57002594;
4 41.55338714;
4 40.97650587;
4 28.18808614;
4 30.01500922;
4 34.91885537;
4 26.26505102;
4 28.95735872;
4 31.45735872;
4 32.61124668;
5 40.017643;
5 38.09464969;
5 35.21007611;
5 36.74853765;
5 41.55622995;
5 43.76776842;
5 45.11392226;
5 46.36392226;
5 52.61392226;
5 42.99857945;
6 47.80890554;
6 53.86663965;
6 55.98206607;
6 64.82821992;
6 44.05903096;
6 62.71287711;
7 55.88858781;
7 70.79243397;
7 58.48478347;
7 58.9655527;
7 64.44632193;
7 65.50401424;
7 69.15786039;
7 54.1579022;
7 68.00405604;
8 69.92980855;
8 71.94908112;
8 74.06446574;
8 75.41061959;
8 77.5260042;
8 85.79523497;
8 63.9683537;
8 74.64143062;
8 87.23758447;
8 91.37219985;
9 90.99021825;
9 92.52867979;
9 64.35564467;
9 73.5864139;
9 65.79799417;
9 76.47107109;
9 79.83645571;
9 89.74030186;
9 96.18260955;
10 95.60836206;
10 109.06990052;
10 76.76225002;
10 84.74301925;
10 93.20455771;
10 96.66609618;
10 107.43532694;
10 89.35844567;
10 115.41613798;
11 108.88035203;
11 114.16881357;
11 121.18804434;
11 88.3996246;
11 91.95731691;
11 94.74577845;
11 98.88039383;
11 105.03423999;
11 110.80347076;
11 116.28423999;
12 97.63311123;
12 136.09464969;
12 140.03695738;
12 92.44084534;
12 105.22930688;
12 108.69084534;
12 111.28699919;
12 117.44084534;
12 118.59469149;
12 119.07546072;
12 137.82546072;
13 100.61663965;
13 106.67433196;
13 114.27048581;
13 124.84740888;
13 104.55898915;
13 127.155143;
13 129.46283531;
13 136.09745069;
13 141.38591223;
14 139.75397243;
14 101.10016808;
14 102.44632193;
14 126.86939885;
14 128.79247577;
14 133.98478347;
14 139.273245;
14 143.40786039;
14 148.31170654;
15 101.00673163;
15 106.48750086;
15 107.25673163;
15 125.81442393;
15 113.79523497;
15 119.56446574;
15 120.81446574;
15 130.33369651;
15 136.87215805;
15 138.50677343;
15 139.37215805;
15 129.17989216;
16 145.1440644;
16 142.54795236;
16 144.18256775;
16 147.16333698;
16 150.81722494;
16 152.93260955;
17 119.66605437;
17 134.08913129;
17 110.91609618;
17 121.20455771;
17 136.68532694;
17 154.76225002;
17 101.01229183;
17 116.20459952;
17 126.49306106;
17 137.8392149;
17 142.8392149;
17 146.10844567;
17 171.49306106;
18 104.09189049;
18 157.55342895;
18 119.86116306;
18 143.13039383;
18 147.26500922;
18 150.82270153;
18 152.8419323;
18 156.5919323;
19 159.86383865;
19 145.15234199;
19 150.34464969;
19 159.47926507;
19 118.51776842;
19 126.21007611;
19 138.99853765;
19 141.69084534;
19 147.74853765;
19 148.13315303;
19 116.21011791;
19 122.17165638;
19 137.36396407;
20 148.13582862;
20 148.71275169;
20 149.96275169;
20 154.19352092;
20 124.86663965;
20 145.15510119;
20 153.42433196;
20 157.55894735;
20 160.05898915;
21 130.92704935;
21 156.11935704;
21 176.40781858;
21 129.38862962;
21 131.98478347;
21 134.48478347;
21 146.40786039;
21 160.35016808;
21 163.81170654;
21 142.4655945;
22 122.17980855;
22 137.75673163;
22 150.16057778;
22 133.23754266;
22 142.2760042;
22 154.67985036;
22 106.31450755;
22 162.56450755;
23 140.6440644;
23 141.99021825;
23 148.72098748;
23 143.72102929;
23 144.87487544;
23 154.10568648;
23 154.7787634;
23 161.31722494;
24 141.41605437;
24 142.66605437;
24 152.47374668;
24 158.62759283;
24 121.89686541;
24 127.28148079;
24 135.06994233;
24 144.10840387;
24 148.3391731;
24 160.06994233;
24 129.97383029;
24 145.16613798;
24 150.74306106;
24 123.5315644;
25 153.43800253;
25 165.07261791;
25 133.82265972;
25 154.2072751;
25 155.74573664;
25 161.61112126;
25 167.28419818;
25 137.47654768;
26 127.47926507;
26 141.90234199;
26 147.28695738;
26 149.69080353;
26 153.72926507;
26 161.32541892;
26 107.09469149;
26 135.26776842;
26 156.32546072;
27 161.42429016;
27 133.25125504;
27 135.36663965;
27 147.38587042;
27 170.65510119;
27 137.48206607;
27 138.92437377;
27 158.34745069;
28 151.13858781;
28 147.00401424;
28 156.61939885;
28 162.48478347;
28 164.40786039;
28 167.00401424;
28 116.13867143;
28 135.4655945;
28 141.81174835;
29 159.50668982;
29 139.60288547;
29 142.00673163;
29 157.10288547;
29 175.37211624;
29 129.0260042;
29 134.31446574;
29 140.46831189;
29 144.41061959;
29 148.73754266;
29 150.66061959;
30 132.39410621;
30 137.29795236;
30 154.60564467;
30 174.02872159;
30 144.99030186;
30 151.24030186;
30 152.68260955;
30 156.5287634;
30 158.35568648;
31 149.70455771;
31 155.85840387;
31 163.74301925;
31 135.66613798;
31 139.80075337;
31 146.62767644;
31 136.72387209;
32 161.82265972;
32 144.22654768;
32 146.1496246;
32 149.22654768;
32 148.16889718;
32 149.99582026;
32 159.70735872;
33 129.9023838;
33 130.19084534;
33 133.07546072;
33 135.76781022;
34 130.48202427];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-8; end; end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'CatrFran2011';
  
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
D2 = 'mod_2: v is reduced';
D3 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3DTGF'; % Cat of Life
metaData.links.id_ITIS = '175646'; % ITIS
metaData.links.id_EoL = '45514151'; % Ency of Life
metaData.links.id_Wiki = 'Falco_naumanni'; % Wikipedia
metaData.links.id_ADW = 'Falco_naumanni'; % ADW
metaData.links.id_Taxo = '52830'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'BECA271F14F77BEE'; % avibase
metaData.links.id_birdlife = 'lesser-kestrel-falco-naumanni'; % birdlife
metaData.links.id_AnAge = 'Falco_naumanni'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Falco_naumanni}}';
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
bibkey = 'DaanMasm1991'; type = 'Article'; bib = [ ... 
'author = {Daan, S. and Masman, D. and Strijkstra, A. and Verhulst, S.}, ' ... 
'year = {1991}, ' ...
'title = {Intraspecific Allometry of Basal Metabolic Rate: Relations with Body Size, Temperature, Composition, and Circadian Phase in the Kestrel, \emph{Falco tinnunculus}}, ' ...
'journal = {Journal of Biological Rhythms}, ' ...
'volume = {4}, ' ...
'pages = {267--283}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DawsWhit1999'; type = 'Incollection'; bib = [ ... 
'author = {Dawson, W. R. and Whittow, G.C.}, ' ... 
'year = {1999}, ' ...
'title = {Regulation of Body Temperature}, ' ...
'booktitle = {Sturkie''s Avian Physiology, Fifth Edition.}, ' ...
'editor = {Whittow, G. C.}, ' ...
'publisher = {Academic Press}, ' ...
'address = {San Diego}'];
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
bibkey = 'CatrFran2011'; type = 'Article'; bib = [ ... 
'author = {Catry, I. and Franco, A. M. A. and Sutherland, W. J.}, ' ... 
'year = {2011}, ' ...
'title = {Adapting conservation efforts to face climate change: Modifying nest-site provisioning for lesser kestrels}, ' ...
'journal = {Biological Conservation}, ' ...
'volume = {144}, ' ...
'pages = {1111--1119}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CramSimm1980'; type = 'Book'; bib = [ ... 
'author = {Cramp, S. and Simmons, K. E. L.}, ' ... 
'year = {1977}, ' ...
'title = {Hawks to Bustards.}, ' ...
'series = {Handbook of the Birds of Europe, the Middle East and North Africa, The Birds of the Western Palearctic}, ' ...
'volume = {II}, ' ...
'publisher = {Oxford University Press}, '...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SchwWeav1977'; type = 'Article'; bib = [ ... 
'author = {Schwartz, A. and Weaver, J. D. and Scott, N. R. and Cade, T. J.}, ' ... 
'year = {1977}, ' ...
'title = {Measuring the temperature of eggs during incubation under captive falcons}, ' ...
'journal = {Journal of Wildlife Management}, ' ...
'volume = {41}, ' ...
'pages = {12--17}'];
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

