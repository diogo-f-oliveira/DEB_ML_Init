function [data, auxData, metaData, txtData, weights] = mydata_Scyliorhinus_retifer
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Scyliorhinidae';
metaData.species    = 'Scyliorhinus_retifer'; 
metaData.species_en = 'Chain catshark';

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MANW','MAg'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Le'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2021 07 27];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1  = {'Bas Kooijman'};        
metaData.date_mod_1    = [2024 10 25];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1 = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 25];

%% set data
% zero-variate data;
data.ab = 256;    units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'CastBubu1988';    
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365; units.am = 'd';       label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Scyliorhinus_canicula ';

data.Lb  = 10.6;    units.Lb  = 'cm';    label.Lb  = 'total length at birth';   bibkey.Lb  = 'CastBubu1988';
data.Lp  = 52;   units.Lp  = 'cm';    label.Lp  = 'total length at puberty'; bibkey.Lp  = 'CastBubu1988';
data.Lpm  = 50;   units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty'; bibkey.Lpm  = 'CastBubu1988';
  comment.Lpm = 'Wiki gives 37-50 cm';
data.Li  = 59;   units.Li  = 'cm';    label.Li  = 'ultimate total length';   bibkey.Li  = 'CastBubu1988';

data.Wwi = 700;  units.Wwi = 'g';     label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'CastBubu1988';
  comment.Wwi = 'AnAge 726 g';

data.Ri  = 1/14.1; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'CastBubu1988';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'For TL 44 cm';

% uni-variate data at f
% length - weight
data.LWw = [ ... total length (cm), weight (g)
10.813	3.308
12.771	5.300
13.231	5.987
13.926	6.764
14.388	7.337
14.725	9.211
14.845	8.702
15.193	9.137
16.005	10.240
16.226	12.545
16.685	14.521
17.376	17.084
18.181	21.449
19.227	23.844
19.686	27.376
20.150	28.747
20.487	36.382
20.964	31.185
23.853	54.208
24.199	58.798
24.320	55.551
25.241	69.748
27.563	91.236
27.793	98.159
28.270	84.138
29.767	122.283
29.771	115.528
30.816	129.471
32.456	125.390
33.260	157.430
35.230	210.989
35.925	236.432
35.933	205.951
37.096	230.816
37.100	216.301
37.212	234.602
37.917	219.890
38.026	252.443
38.259	256.592
38.719	287.516
38.724	267.256
38.731	236.612
39.193	260.858
39.650	309.390
39.999	322.239
40.135	236.702
40.246	258.823
40.467	319.674
40.693	364.042
40.930	343.951
41.057	292.408
41.511	367.091
41.520	319.765
41.757	304.581
41.775	227.386
41.865	346.843
42.690	314.714
42.809	307.151
42.915	364.261
42.917	352.621
43.736	352.700
43.845	398.391
44.313	395.220
44.550	379.521
45.714	415.107
45.717	392.173
45.825	453.900
46.189	367.556
46.886	395.495
47.924	500.634
50.143	530.229
54.347	585.156
54.924	666.434
54.938	535.246
55.509	666.539
57.263	666.856
57.845	694.594
58.546	700.389];
units.LWw = {'cm', 'g'};     label.LWw = {'total length', 'wet weight'};
bibkey.LWw = 'CastBubu1988';

data.tLe = [ ... % time since birth (d), embryonal total length (cm)
9.952	0.313
22.654	0.523
25.751	0.350
34.338	0.317
43.609	0.387
71.750	1.189
75.835	2.472
77.189	3.166
96.108	2.163
98.841	2.684
107.062	3.448
111.842	4.454
118.368	4.455
120.768	4.594
122.502	4.005
122.504	3.935
129.005	4.803
129.016	4.422
137.966	3.729
143.055	5.915
144.107	5.152
152.714	4.425
158.534	5.085
167.464	5.086
168.447	6.751
185.963	6.788
193.840	7.552
200.366	7.553
226.419	9.290
230.194	9.395
248.703	10.750
249.725	11.027
251.119	10.334
252.484	10.646
253.844	11.132
255.922	10.508];
units.tLe = {'d', 'cm'};     label.tLe = {'age', 'total length'};  
temp.tLe = C2K(12); units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'CastBubu1988';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 5 * weights.Lb;
weights.Lp = 5 * weights.Lp;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by E_Hp only';
D2 = 'mod_1: error in Ri repaired, p_M reduced';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4W57K'; % Cat of Life
metaData.links.id_ITIS = '160060'; % ITIS
metaData.links.id_EoL = '46559874'; % Ency of Life
metaData.links.id_Wiki = 'Scyliorhinus_retifer'; % Wikipedia
metaData.links.id_ADW = 'Scyliorhinus_retifer'; % ADW
metaData.links.id_Taxo = '106405'; % Taxonomicon
metaData.links.id_WoRMS = '158516'; % WoRMS
metaData.links.id_fishbase = 'Scyliorhinus-retifer.html'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Scyliorhinus_retifer}}';
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
bibkey = 'CastBubu1988'; type = 'Article'; bib = [ ...
'author = {Jos\''{e} I. Castro and Patricia M. Bubucis and Neal A. Overstrom}, ' ...
'year = {1988}, ' ...
'title  = {The Reproductive Biology of the Chain Dogfish, \emph{Scyliorhinus retifer}}, ' ...
'journal = {Copeia}, ' ...
'number = {3}, ', ...
'volume = {1988}, ' ...
'pages = {740-746}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Scyliorhinus_canicula/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Scyliorhinus-retifer.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  