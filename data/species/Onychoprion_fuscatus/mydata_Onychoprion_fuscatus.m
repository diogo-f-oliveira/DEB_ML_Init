function [data, auxData, metaData, txtData, weights] = mydata_Onychoprion_fuscatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Onychoprion_fuscatus'; 
metaData.species_en = 'Sooty tern'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'biMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 28;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 56;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Ashm1963';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 168;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 1460;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 35.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 23.4;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 200;       units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Ashm1963';

data.Ri  = 1/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.149	23.221
0.948	23.594
1.814	24.752
2.748	26.696
3.549	29.037
3.884	32.572
4.818	34.909
5.753	38.822
6.687	42.341
7.355	45.079
7.955	45.457
8.825	51.733
9.559	53.683
10.825	56.012
11.826	58.348
12.965	68.554
13.960	62.622
15.087	56.293
15.883	51.548
17.219	57.419
18.023	64.878
18.955	64.066
20.158	70.334
20.961	75.824
22.153	67.132
22.494	78.540
22.699	86.409
22.837	93.098
23.905	96.613
24.763	86.354
25.768	94.596
27.100	94.561
27.892	84.304
28.962	90.969
29.968	101.572
30.902	104.697
32.177	118.837
32.838	111.339
33.766	105.803
34.968	109.709
35.705	117.563
36.911	128.162
38.779	132.443
40.184	142.249
40.977	133.173
41.918	146.140
42.324	156.366
43.064	167.370
44.128	165.374
44.999	173.225
46.917	153.096
48.059	169.208
48.523	166.046
48.720	160.922
49.784	158.926
52.060	176.583
54.057	176.137
55.062	184.378
55.923	177.663
56.997	191.020
57.930	191.783
58.920	177.584];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Ashm1963';

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
%txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Food availability taken variable in tW data';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '74M8M'; % Cat of Life
metaData.links.id_ITIS = '824105'; % ITIS
metaData.links.id_EoL = '45509324'; % Ency of Life
metaData.links.id_Wiki = 'Onychoprion_fuscatus'; % Wikipedia
metaData.links.id_ADW = 'Sterna_fuscata'; % ADW
metaData.links.id_Taxo = '2682385'; % Taxonomicon
metaData.links.id_WoRMS = '567827'; % WoRMS
metaData.links.id_avibase = '3E7F825D03C0DC3E'; % avibase
metaData.links.id_birdlife = 'sooty-tern-onychoprion-fuscatus'; % birdlife
metaData.links.id_AnAge = 'Onychoprion_fuscatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Onychoprion_fuscatus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Onychoprion_fuscatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ashm1963'; type = 'Article'; bib = [ ... 
'author = {N.P. Ashmole}, ' ... 
'doi = {10.1111/j.1474-919X.1963.tb06757.x}, ' ...
'year = {1963}, ' ...
'title = {The biology of the wideawake or sooty tern \emph{Sterna fuscata} on {A}scension {I}sland}, ' ...
'journal = {Ibis}, ' ...
'volume = {103b}, ' ...
'pages = {297--362}'];
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

