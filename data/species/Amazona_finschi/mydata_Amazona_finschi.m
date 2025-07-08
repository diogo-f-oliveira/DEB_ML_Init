function [data, auxData, metaData, txtData, weights] = mydata_Amazona_finschi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittacidae';
metaData.species    = 'Amazona_finschi'; 
metaData.species_en = 'Lilac-crowned parrot'; 

metaData.ecoCode.climate = {'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 20];              
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

data.ab = 28;    units.ab = 'd';    label.ab = 'age at birth';                        bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 60;    units.tx = 'd';    label.tx = 'time since birth at fledging';        bibkey.tx = 'Wiki';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 180;    units.tp = 'd';    label.tp = 'time since birth at puberty';        bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'EoL';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'Data for Amazona aestiva';
data.am = 25.8*365;    units.am = 'd';    label.am = 'life span';                       bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 15;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'Rent2002';
data.Wwi = 400;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';              bibkey.Wwi = 'Rent2002';
  comment.Wwi = 'asymptote of nesting, adults are typically smaller: 302 g (AnAg8)';

data.Ri = 3/365; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';           bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 till 4 eggs/clutch; breeds once per 1 yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.158	11.644
2.049	17.470
2.050	13.592
2.495	21.998
2.941	20.709
3.922	27.182
3.923	20.718
4.992	31.069
6.062	37.543
6.064	30.433
6.507	42.071
8.025	42.085
8.376	66.002
9.361	58.255
9.985	60.846
10.071	74.420
11.052	77.014
12.832	100.944
12.835	87.372
13.987	126.161
14.877	134.572
15.063	105.489
16.036	144.277
16.390	157.207
17.110	132.007
17.826	125.551
18.431	206.992
18.972	185.669
18.989	117.805
19.784	149.482
20.924	234.807
21.281	236.749
22.083	243.220
22.897	198.632
23.166	196.049
24.139	232.898
24.233	213.509
24.937	252.295
24.943	230.320
25.917	260.706
25.924	235.500
26.987	267.179
27.082	245.205
27.794	252.968
28.146	276.238
28.947	284.002
29.139	229.712
29.936	258.158
31.988	262.701
34.031	307.962
34.210	306.671
35.102	309.265
36.887	309.928
37.783	297.010
38.227	309.940
39.026	326.105
39.745	307.369
40.995	309.966
41.707	317.082
41.709	309.972
43.047	314.509
43.133	326.790
43.851	313.870
44.115	328.738
45.993	315.182
46.971	331.349
46.978	304.850
47.600	315.197
47.687	325.539
48.578	333.949
48.759	322.317
49.923	311.341
49.925	302.939
51.708	315.235
51.887	312.651
52.599	322.353
52.692	304.257
53.584	308.789
54.656	307.506
55.993	315.921
56.974	320.454
56.980	297.187
57.782	303.011
58.673	310.775
59.928	290.751
60.100	315.959
60.819	297.869
63.857	287.555
66.894	284.352];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Rent2002';
  
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
D1 = 'Body temperatures are guessed';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Female breeds, both parents feed young; nest in tree cavities';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5TZSD'; % Cat of Life
metaData.links.id_ITIS = '554925'; % ITIS
metaData.links.id_EoL = '45510871'; % Ency of Life
metaData.links.id_Wiki = 'Amazona_finschi'; % Wikipedia
metaData.links.id_ADW = 'Amazona_finschi'; % ADW
metaData.links.id_Taxo = '107781'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '66C32CC9A92F6633'; % avibase
metaData.links.id_birdlife = 'lilac-crowned-amazon-amazona-finschi'; % birdlife
metaData.links.id_AnAge = 'Amazona_finschi'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amazona_finschi}}';
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
bibkey = 'Rent2002'; type = 'Article'; bib = [ ... 
'author = {K. Renton}, ' ... 
'doi = {10.1046/j.1474-919X.2002.00015.x}, ' ...
'year = {2002}, ' ...
'title = {Influence of environmental variability on the growth of Lilac?crowned Parrot nestlings}, ' ...
'journal = {Ibis}, ' ...
'volume = {144}, ' ...
'pages = {331--339}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Amazona_finschi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Amazona_aestiva/}}';
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

