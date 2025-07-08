function [data, auxData, metaData, txtData, weights] = mydata_Himantopus_mexicanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Recurvirostridae';
metaData.species    = 'Himantopus_mexicanus'; 
metaData.species_en = 'Black-necked stilt'; 

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'THn', 'TN'};
metaData.ecoCode.habitat = {'0xTs', 'xiFm', 'xiFe'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 18];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 28];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 28];

%% set data
% zero-variate data

data.ab = 25;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care';
data.tx = 28;      units.tx = 'd';     label.tx = 'time since birth at fledging'; bibkey.tx = 'ReedGray1999';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 84;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 19.1*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 13.6;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 186;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'AnAge';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.207	15.725
1.183	16.225
2.099	16.973
2.893	17.722
4.116	20.218
5.035	23.214
6.138	26.708
7.116	28.206
8.097	31.700
9.078	34.945
10.183	40.187
11.043	44.431
12.210	49.672
13.195	55.913
14.117	60.905
15.159	64.150
16.084	71.388
17.007	76.880
18.174	81.872
19.158	87.863
20.142	92.855
21.129	100.593
22.114	106.583
23.154	109.080
24.076	114.072
25.057	117.317
26.096	119.064
27.016	122.309
28.180	125.803
28.981	131.794
30.021	133.791
31.000	136.037
31.982	140.031
32.898	141.279
34.182	143.276
34.977	144.774
36.079	147.769
37.054	147.520
37.973	150.016
39.134	152.012
39.992	154.758
40.971	157.005];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'ReedGray1999';
comment.tW = 'Data concern captive Hawaiian stilt H. m. knudseni';

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
D1 = 'mod_1: v is reduced; food availability variable fot tW data';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6LWTY'; % Cat of Life
metaData.links.id_ITIS = '176726'; % ITIS
metaData.links.id_EoL = '45510681'; % Ency of Life
metaData.links.id_Wiki = 'Himantopus_mexicanus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '158876'; % Taxonomicon
metaData.links.id_WoRMS = '159131'; % WoRMS
metaData.links.id_avibase = 'C1D4E1DD9ABDEF3C'; % avibase
metaData.links.id_birdlife = 'black-winged-stilt-himantopus-himantopus'; % birdlife
metaData.links.id_AnAge = 'Himantopus_mexicanus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Himantopus_mexicanus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Himantopus_mexicanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReedGray1999'; type = 'Article'; bib = [ ...  
'title = {Growth patterns of {H}awaiien stilt chicks}, ' ...
'journal = {Wilson Bull}, ' ...
'volume = {111}, ' ...
'year = {1999}, ' ...
'author = {Reed, J. M. and Gray, E. M. and Lewis, D. and Oring, L. W. and Coleman, R. and Burr, T. and Luscombm P.}, ' ...
'pages = {478--487}'];
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

