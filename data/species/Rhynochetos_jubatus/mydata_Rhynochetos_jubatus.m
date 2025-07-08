function [data, auxData, metaData, txtData, weights] = mydata_Rhynochetos_jubatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Eurypygiformes'; 
metaData.family     = 'Rhynochetidae';
metaData.species    = 'Rhynochetos_jubatus'; 
metaData.species_en = 'Kagu'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 35;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Diego2012';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from Lore2012';
data.tx = 109;   units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = {'Diego2012','Hunt1997'};   
  temp.tx = C2K(40.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temp from BechNico1999; DawsWhit1999; KortBrig2001';
data.tp = 327;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temp from BechNico1999; DawsWhit1999; KortBrig2001';
data.tR = 730;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Diego2012';
  temp.tR = C2K(40.4);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10950; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Diego2012';   
  temp.am = C2K(40.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 60;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Diego2012';

data.Wwb = 60.72; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Breg1987';
data.Wwi = 1000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Breg1987';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = {'Hunt1997','Diego2012'};   
temp.Ri = C2K(40.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ...
0 60.71612938;
4	81.50967253;
7	104.702906;
10	127.2517483;
12	149.7617815;
14	171.0606503;
16	195.9800761;
17	219.0633507;
18	242.7651439;
20	267.059583;
21	292.5781229;
23	311.4190879;
24	332.6759135;
25	357.5727008;
26	381.8768421;
28	403.1369019;
29	421.3852209;
31	442.059103;
33	464.5691362;
34	484.038322;
36	504.1227922;
38	521.7849335;
40	541.2735238;
42	558.3300828;
44	576.0051605;
46	591.251441;
48	603.4730445;
50	616.2840598;
51	630.3062396;
53	644.3251852;
56	657.1750095;
58	673.648625;
60	688.3248982;
63	701.7641343;
65	713.3866237;
67	727.428208;
69	740.8739123;
72	755.5534196;
74	768.9991239;
76	782.4415941;
79	794.0673176;
81	807.5162559;
83	821.5740106;
86	835.0455875;
88	849.1065763;
91	861.3669888;
94	871.1824338;
96	881.0108151;
99	890.8456646;
101	900.0619955;
104	906.8851042;
108	913.7308515;
111	922.3998137;
116	928.0829079;
118	930.6572387;
121	937.4771134;
124	945.5016843;
127	952.9077367;
130	959.7373136;
133	971.4147825;
136	977.6484794;
139	984.4360132;
142	991.2655901;
146	996.938982;
149	999.5294833;
152	1003.340851;
155	1005.322536;
158	1006.083355;
161	1006.853875;
164	1006.986473;
166	1004.667634;
169	1000.583795];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Breg1987';
  
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
D1 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '6X862'; % Cat of Life
metaData.links.id_ITIS = '176405'; % ITIS
metaData.links.id_EoL = '1045974'; % Ency of Life
metaData.links.id_Wiki = 'Rhynochetos_jubatus'; % Wikipedia
metaData.links.id_ADW = 'Rhynochetos_jubatus'; % ADW
metaData.links.id_Taxo = '53431'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '227D77FBFA6E408A'; % avibase
metaData.links.id_birdlife = 'kagu-rhynochetos-jubatus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhynochetos_jubatus}}';
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
bibkey = 'Hunt1997'; type = 'Book'; bib = [ ... 
'author = {Hunt, G. R.}, ' ... 
'year = {1997}, ' ...
'title = {Ecology and Conservation of the Kagu \emph{Rhynochetos jubatus} of {N}ew {C}aledonia}, ' ...
'publisher = {Massey University}, ' ...
'address = {Massey}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Breg1987'; type = 'Article'; bib = [ ... 
'author = {Bregulla, H.}, ' ... 
'year = {1987}, ' ...
'title = {La biologie du Cagou, \emph{Rhinochetos jubatus}}, ' ...
'journal = {Der Zoologische Garten}, ' ...
'volume = {57}, ' ...
'pages = {349--365}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lore2012'; type = 'Misc'; bib = [ ...
'author = {Lorenzo, A.}, ' ...
'note = {Personal communication}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Diego2012'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sandiegozoo.org/animalbytes/t-kagu.html}}';
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

