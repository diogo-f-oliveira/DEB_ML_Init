function [data, auxData, metaData, txtData, weights] = mydata_Platalea_leucorodia
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Pelecaniformes'; 
metaData.family     = 'Threskiornithidae';
metaData.species    = 'Platalea_leucorodia'; 
metaData.species_en = 'Eurasian spoonbill';

metaData.ecoCode.climate = {'BWk', 'BSk', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFe'};
metaData.ecoCode.embryo  = {'Tnpfm', 'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biCva'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 11 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 02];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 02];

%% set data
% zero-variate data

data.ab = 24;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'arkive';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from OberVerk1998; Sedg2011';
data.tx = 37;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'LokOver2014';   
  temp.tx = C2K(40.6);    units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 111;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1095;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';   bibkey.tR = 'AnAge';
  temp.tR = C2K(40.6);    units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 30.1*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40.6);    units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 56.6;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'LokOver2014';
data.Wwi = 1467;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'LokOver2014';
data.Wwim = 1729; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'LokOver2014';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'Wiki_NL';   
  temp.Ri = C2K(40.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
16.042	1274.789
18.006	1190.154
18.968	1166.886
19.970	1223.118
21.012	1214.750
21.974	1242.828
22.936	1340.471
23.978	1317.196
25.020	1320.422
25.982	1381.626
26.944	1461.050
27.906	1396.374
29.028	1404.562
29.990	1336.574
30.992	1404.400
31.954	1422.540
32.956	1419.144
33.998	1427.339
35.000	1503.447
35.922	1470.244
36.884	1498.322];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(40.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'LokOver2014';
comment.tW_f = 'Data for females';
% males
data.tW_m = [ ... % time since birth (d), weight (g)
15.962	1198.605
16.884	1047.804
17.926	1238.194
19.008	1243.073
20.010	1342.369
20.972	1357.196
21.934	1396.868
22.936	1423.286
23.898	1497.741
24.980	1527.465
25.942	1553.886
26.944	1558.772
27.986	1613.344
28.988	1598.355
29.950	1580.055
30.952	1594.879
31.914	1692.522
32.916	1624.530
33.958	1697.322
34.960	1481.918
36.042	1635.866
36.964	1750.075];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(40.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'LokOver2014';
comment.tW_m = 'Data for males';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = weights.tW_f * 2;
weights.tW_m = weights.tW_m * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '4JMRD'; % Cat of Life
metaData.links.id_ITIS = '174933'; % ITIS
metaData.links.id_EoL = '45512149'; % Ency of Life
metaData.links.id_Wiki = 'Platalea_leucorodia'; % Wikipedia
metaData.links.id_ADW = 'Platalea_leucorodia'; % ADW
metaData.links.id_Taxo = '51947'; % Taxonomicon
metaData.links.id_WoRMS = '416678'; % WoRMS
metaData.links.id_avibase = 'A0A584C1E7D786FE'; % avibase
metaData.links.id_birdlife = 'eurasian-spoonbill-platalea-leucorodia'; % birdlife
metaData.links.id_AnAge = 'Platalea_leucorodia'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Platalea_leucorodia}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_NL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://nl.wikipedia.org/wiki/Lepelaar}}';
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
bibkey = 'LokOver2014'; type = 'Article'; bib = [ ... 
'author = {T. Lok and O. Overdijk and T. Piersma}, ' ... 
'year = {2014}, ' ...
'title = {Interpreting variation in growth of {E}urasian Spoonbill chicks: disentangling the effects of age, sex and environment}, ' ...
'journal = {Ardea}, ' ...
'volume = {10}, ' ...
'number = {2}, ' ...
'pages = {181--196}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Platalea_leucorodia}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/eurasian-spoonbill/platalea-leucorodia/}}';
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

