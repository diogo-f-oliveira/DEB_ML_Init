function [data, auxData, metaData, txtData, weights] = mydata_Milvus_milvus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Milvus_milvus'; 
metaData.species_en = 'Red kite'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iTh'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvb', 'biCvm', 'biCva', 'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 22];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 03];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 31.5;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'EoL';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Varyies between 31 and 32 d';
data.tx = 44;       units.tx = 'd';     label.tx = 'time since birth at fledging';  bibkey.tx = 'MougBret2006';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 132;       units.tp = 'd';     label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1095;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 38*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 52;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MougBret2006';
data.Wwi = 1150;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'MougBret2006';
  comment.Wwi = '1000 to 1300 g';  
data.Wwim = 1000;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'MougBret2006';
  comment.Wwim = '800 to 1200 g';  

data.Ri  = 2.4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'MougBret2006';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 1-5 eggs/clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.004	52.651
0.870	59.232
0.871	54.845
1.569	57.038
1.832	54.845
2.444	52.651
2.620	41.682
2.967	72.395
3.143	54.845
3.144	41.682
3.840	87.751
4.015	81.170
4.016	70.201
4.017	52.651
4.975	94.333
4.976	92.139
4.977	74.589
4.979	54.845
5.853	54.845
5.935	120.658
5.938	92.139
6.026	76.782
6.724	94.333
6.979	190.859
6.980	179.890
7.770	129.433
9.075	217.185
10.991	311.517
11.078	329.068
11.869	258.867
12.039	324.680
12.918	263.254
13.788	320.292
13.872	366.362
14.835	346.618
15.872	511.152
15.874	480.439
15.877	445.338
15.958	533.090
17.802	414.625
19.804	535.283
20.847	614.260
20.849	587.934
22.850	712.980
23.896	759.049
23.907	612.066
24.948	712.980
24.956	605.484
25.812	851.188
26.003	638.391
26.865	796.344
26.869	745.887
26.965	623.035
27.822	862.157
28.870	873.126
28.873	831.444
29.829	906.033
30.887	789.762
30.960	978.428
31.845	833.638
32.887	923.583
32.983	811.700
33.845	980.622
34.024	921.389
35.777	853.382
37.869	932.358
38.904	1129.799
38.912	1020.110
40.833	1053.016
41.002	1125.411
41.884	1020.110
43.979	1063.985];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'MougBret2006';

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
D1 = 'body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: v is reduced and food availability in tW data taken variable';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = '43DZJ'; % Cat of Life
metaData.links.id_ITIS = '175470'; % ITIS
metaData.links.id_EoL = '45515827'; % Ency of Life
metaData.links.id_Wiki = 'Milvus_milvus'; % Wikipedia
metaData.links.id_ADW = 'Milvus_milvus'; % ADW
metaData.links.id_Taxo = '52442'; % Taxonomicon
metaData.links.id_WoRMS = '1037320'; % WoRMS
metaData.links.id_avibase = '4E76C8C0085794FE'; % avibase
metaData.links.id_birdlife = 'red-kite-milvus-milvus'; % birdlife
metaData.links.id_AnAge = 'Milvus_milvus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Milvus_milvus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Milvus_milvus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/914570/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MougBret2006'; type = 'Article'; bib = [ ...  
'title = {Breeding biology of the Red Kite \emph{Milvus milvus} in {C}orsica}, ' ...
'author = {F. Mougeot and V. Bretagnolle}, ' ...
'journal = {Ibis}, ' ...
'year = {2006}, ' ...
'volume = {148}, ' ...
'pages = {436--448}'];
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

