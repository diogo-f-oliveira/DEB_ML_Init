function [data, auxData, metaData, txtData, weights] = mydata_Morus_serrator

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Suliformes'; 
metaData.family     = 'Sulidae';
metaData.species    = 'Morus_serrator'; 
metaData.species_en = 'Australasian gannet'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPW'};
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
metaData.date_subm = [2018 10 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 19];              
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

data.ab = 44;  units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'Wing1984';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Body temp from ShalWhit1973 as target, but varies considerably';
data.tx = 108; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wing1984';   
  temp.tx = C2K(40.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Data for S. sula, 91 till > 139 d';
data.tp = 324; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Data for S. sula, 91 till > 139 d';
data.tR = 730;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'Data for Murus bassanus, 2-3 yr';
data.am = 33*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(40.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 91; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Wing1984';
data.Wwi = 3500; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wing1984';
  comment.Wwi = 'asymptotic weight of nestling, adults are 2345 g (AnAge)';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.863	91.617
2.097	91.443
2.624	112.545
4.567	91.094
5.264	161.584
6.147	147.342
7.382	147.167
8.613	175.229
9.312	231.601
10.371	224.392
11.417	330.127
12.123	322.969
13.701	400.393
14.408	393.234
15.110	421.370
15.631	484.826
15.635	449.531
16.337	484.727
18.258	646.808
19.132	710.214
20.710	794.698
21.760	858.079
23.334	970.798
25.611	1111.653
26.835	1196.186
28.247	1188.928
29.826	1259.293
30.688	1428.583
32.442	1505.982
32.451	1435.393
34.373	1583.357
35.239	1724.411
36.490	1583.058
37.009	1667.691
38.422	1646.315
39.619	1970.851
41.050	1801.238
44.706	2203.074
49.959	2527.039
54.546	2512.273
59.467	2659.814
65.091	2828.432
70.030	2827.735
74.772	2996.477
84.649	2988.024
89.756	3057.891
94.516	3071.337];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Wing1984';
  
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
metaData.links.id_CoL = '6S36G'; % Cat of Life
metaData.links.id_ITIS = '561225'; % ITIS
metaData.links.id_EoL = '45512151'; % Ency of Life
metaData.links.id_Wiki = 'Morus_serrator'; % Wikipedia
metaData.links.id_ADW = 'Morus_serrator'; % ADW
metaData.links.id_Taxo = '51664'; % Taxonomicon
metaData.links.id_WoRMS = '343991'; % WoRMS
metaData.links.id_avibase = '136103448480BB9C'; % avibase
metaData.links.id_birdlife = 'australasian-gannet-morus-serrator'; % birdlife
metaData.links.id_AnAge = 'Morus_serrator'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Morus_serrator}}';
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
bibkey = 'Wing1984'; type = 'Article'; bib = [ ... 
'author = {Wingham, E.J.}, ' ... 
'year = {1984}, ' ...
'title = {Breeding biology of the {A}ustralasian Gannet \emph{Morus serrator} ({G}ray) at {M}otu {K}aramarama, {H}auraki {G}ulf, {N}ew {Z}ealand II. {B}reeding success and chick growth}, ' ...
'journal = {Emu}, ' ...
'volume = {84}, ' ...
'pages = {211--224}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Morus_serrator}}';
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

