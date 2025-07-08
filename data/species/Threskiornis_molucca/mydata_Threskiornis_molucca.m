function [data, auxData, metaData, txtData, weights] = mydata_Threskiornis_molucca
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Pelecaniformes'; 
metaData.family     = 'Threskiornithidae';
metaData.species    = 'Threskiornis_molucca'; 
metaData.species_en = 'Australian white ibis';

metaData.ecoCode.climate = {'BWk', 'BSk', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'TA','TPi'};
metaData.ecoCode.habitat = {'0iFm', '0iFe'};
metaData.ecoCode.embryo  = {'Tnpfm', 'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biCva'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 08 09];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 02];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 02];

%% set data
% zero-variate data

data.ab = 22;   units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'Wiki';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '21-23 d';
data.tx = 48;     units.tx = 'd';    label.tx = 'time since birth at fledging';  bibkey.tx = 'Wiki';   
  temp.tx = C2K(40.6);    units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 144;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1095;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';   bibkey.tR = 'Wiki';
  temp.tR = C2K(40.6);    units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 33.2*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40.6);    units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 48;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'OBriMcGi2019';
data.Wwi = 1605.9;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 2005.9; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 2.7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0.004	48.154
1.968	86.677
2.974	170.144
4.023	218.299
4.935	141.252
5.027	253.612
6.031	269.663
6.949	333.868
6.990	256.822
6.996	410.915
7.029	150.883
8.042	382.022
8.087	423.756
10.025	869.984
10.058	622.793
11.018	648.475
11.061	616.372
12.021	635.634
13.035	889.246
14.049	1152.488
14.075	747.994
17.010	1049.759
21.019	995.185
21.149	975.923
23.080	1252.006
25.037	1152.488
25.098	1531.300
26.081	1091.493
27.083	1075.441
27.146	1508.828
28.102	1431.782
28.105	1492.777
29.066	1550.562
29.073	1691.814
29.075	1752.809
30.110	1489.567
33.106	1191.011];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'OBriMcGi2019';
 
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
D2 = 'mod_1: v is reduced';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '7C9X4'; % Cat of Life
metaData.links.id_ITIS = '174945'; % ITIS
metaData.links.id_EoL = '1049649'; % Ency of Life
metaData.links.id_Wiki = 'Threskiornis_molucca'; % Wikipedia
metaData.links.id_ADW = 'Threskiornis_molucca'; % ADW
metaData.links.id_Taxo = '51939'; % Taxonomicon
metaData.links.id_WoRMS = '1550125'; % WoRMS
metaData.links.id_avibase = '8C461E3FC1E5C100'; % avibase
metaData.links.id_birdlife = 'australian-ibis-threskiornis-moluccus'; % birdlife
metaData.links.id_AnAge = 'Threskiornis_molucca'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Threskiornis_molucca}}';
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
bibkey = 'OBriMcGi2019'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s11273-019-09689-w}, ' ...
'author = {Lauren O''Brien and Heather M. McGinness}, ' ... 
'year = {2019}, ' ...
'title = {Ibis and spoonbill chick growth and energy requirements: implications for wetland and water management}, ' ...
'journal = {ArdeaWetlands Ecol Manage}, ' ...
'volume = {27}, ' ...
'pages = {725–742}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Threskiornis_molucca}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=8C461E3FC1E5C100&sec=lifehistory}}';
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

