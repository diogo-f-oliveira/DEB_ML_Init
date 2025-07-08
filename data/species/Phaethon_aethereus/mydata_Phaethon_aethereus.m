function [data, auxData, metaData, txtData, weights] = mydata_Phaethon_aethereus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Phaethontiformes'; 
metaData.family     = 'Phaethontidae';
metaData.species    = 'Phaethon_aethereus'; 
metaData.species_en = 'Red-billed tropicbird'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MP', 'MI', 'MPE'};
metaData.ecoCode.habitat = {'xiMpe', '0xTd'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCvf', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 19];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 44;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 86;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Ston1962';   
  temp.tx = C2K(40.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temp from P. rubricauda';
data.tp = 258;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temp from P. rubricauda';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'wiki';
  temp.tR = C2K(40.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 17.6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 50;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Ston1962';
data.Wwi = 850;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Ston1962';
  comment.Wwi = 'asymptotic weight of nestling; adult weight 700 g (arkive) or 750 g (AnAge)';

data.Ri = 1/305; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
temp.Ri = C2K(40.9);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d) at  (d)
0.000	53.750
0.001	42.500
0.227	47.500
0.348	56.250
0.469	62.500
0.472	56.250
1.217	65.000
1.226	46.250
1.595	57.500
1.597	53.750
1.965	67.500
1.966	63.750
1.969	57.500
2.710	75.000
2.718	57.500
2.951	92.500
3.081	82.500
3.093	57.500
3.199	97.500
3.209	75.000
3.336	71.250
3.340	62.500
3.451	91.250
3.455	82.500
3.948	97.500
3.963	65.000
4.314	115.000
4.567	107.500
5.199	91.250
5.309	121.250
5.943	100.000
6.831	70.000
7.289	157.500
7.427	128.750
8.416	150.000
8.543	145.000
8.920	138.750
9.181	115.000
9.298	132.500
9.513	205.000
10.036	155.000
10.040	147.500
10.416	142.500
10.979	273.750
11.856	266.250
11.914	142.500
12.127	220.000
12.390	192.500
13.142	185.000
14.363	243.750
14.502	212.500
15.351	265.000
15.502	210.000
15.596	275.000
15.688	345.000
16.562	345.000
17.571	322.500
19.697	313.750
20.272	417.500
20.321	313.750
20.333	287.500
22.295	362.500
23.426	345.000
24.763	421.250
25.626	443.750
25.811	315.000
26.468	512.500
26.713	522.500
27.241	460.000
27.481	481.250
29.167	611.250
29.379	426.250
29.824	541.250
30.758	680.000
30.760	675.000
30.762	671.250
32.525	637.500
32.553	577.500
33.008	672.500
33.992	702.500
34.035	610.000
34.450	523.750
34.755	672.500
36.772	630.000
36.845	740.000
37.018	637.500
37.529	612.500
38.219	737.500
39.741	685.000
40.134	646.250
42.732	693.750
44.216	723.750
44.974	703.750
45.714	723.750
47.978	685.000
48.594	702.500
49.846	695.000
49.891	598.750
50.572	742.500
51.075	735.000
52.954	721.250
53.467	690.000
53.534	813.750
53.807	763.750
54.089	696.250
55.026	827.500
55.531	815.000
55.555	762.500
56.068	732.500
56.968	677.500
58.092	676.250
61.906	792.500
62.937	723.750
63.964	662.500
64.930	732.500
65.210	667.500
71.194	680.000
72.002	821.250
75.610	845.000
76.776	753.750
77.512	781.250
78.644	762.500
80.015	766.250
82.536	713.750
85.893	741.250];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Ston1962';
  
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

%% Links
metaData.links.id_CoL = '4FPZQ'; % Cat of Life
metaData.links.id_ITIS = '174673'; % ITIS
metaData.links.id_EoL = '45509040'; % Ency of Life
metaData.links.id_Wiki = 'Phaethon_aethereus'; % Wikipedia
metaData.links.id_ADW = 'Phaethon_aethereus'; % ADW
metaData.links.id_Taxo = '51637'; % Taxonomicon
metaData.links.id_WoRMS = '137177'; % WoRMS
metaData.links.id_avibase = '7EE005BD2701D129'; % avibase
metaData.links.id_birdlife = 'red-billed-tropicbird-phaethon-aethereus'; % birdlife
metaData.links.id_AnAge = 'Phaethon_aethereus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phaethon_aethereus}}';
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
bibkey = 'Ston1962'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1474-919X.1962.tb07242.x}, ' ...
'author = {B. Stonehouse}, ' ... 
'year = {1962}, ' ...
'title = {THE TROPIC BIRDS (GENUS \emph{Phaethon}) OF ASCENSION ISLAND}, ' ...
'journal = {Ibis}, ' ...
'volume = {76}, ' ...
'pages = {124-161}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/red-billed-tropicbird/phaethon-aethereus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Phaethon_aethereus}}';
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

